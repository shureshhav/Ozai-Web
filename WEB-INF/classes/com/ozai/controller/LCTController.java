package com.ozai.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ozai.beans.Residents;
import com.ozai.model.Admin;
import com.ozai.model.B2B_Details;
import com.ozai.model.B2C_Details;
import com.ozai.model.B2C_Rents;
import com.ozai.model.Badges;
import com.ozai.model.ClientUser;
import com.ozai.model.ClientWorkSites;
import com.ozai.model.Event;
import com.ozai.model.PG;
import com.ozai.model.UserComplaints;
import com.ozai.model.Ticket;
import com.ozai.model.User;
import com.ozai.service.AdminService;
import com.ozai.service.B2BService;
import com.ozai.service.B2CService;
import com.ozai.service.BadgeService;
import com.ozai.service.ClientService;
import com.ozai.service.OzaiService;
import com.ozai.service.PaymentService;
import com.ozai.service.PropertyService;
import com.ozai.service.UserService;
import com.ozai.util.OzaiUtil;
import com.ozai.model.Notice;
import com.ozai.beans.ResidentsData;
import com.ozai.beans.TicketsData;
import com.ozai.dto.CreatePaymentResponse;
import com.ozai.dto.VerifyPaymentResponse;

@Controller
public class LCTController {

	@Autowired
	private ServletContext servletContext;

	@Autowired
	private ClientService clientService;

	@Autowired
	private OzaiService ozaiService;

	@Autowired
	private PropertyService propertyService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private B2BService b2bService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private B2CService b2cService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BadgeService badgeService;

		
	@ResponseBody
	@RequestMapping(value = "/restoreSession/{user}", method = {RequestMethod.GET, RequestMethod.POST})
	public String restoreSession(@PathVariable String user,
			HttpSession session) {

		//ModelAndView modelAndView = new ModelAndView();
		ClientUser client = clientService.getClientUserByUsername(user);
		//validate(client, null, null, session, user);
		session.setAttribute("ClientUser", client);
		//modelAndView.setViewName("redirect:/"+next);
		
		//modelAndView.setViewName("redirect:" + next);
		return "success";
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/residents-count", method = RequestMethod.GET)
	public String totalResidents(HttpSession session) {
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		Integer strength = clientService.getResidentsCountByClient(admin.getClient_code());
		if (strength > 0) {
			return strength.toString();
		} else
			return "N/A";
	}

	@ResponseBody
	@RequestMapping(value = "/lct/properties-count", method = RequestMethod.GET)
	public String totalProperties(HttpSession session) {
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		Integer strength = clientService.getPropertiesCountByClient(admin.getClient_code());
		if (strength > 0) {
			return strength.toString();
		} else
			return "N/A";
	}

	@ResponseBody
	@RequestMapping(value = "/lct/tickets-count", method = RequestMethod.GET)
	public String totalTickets(HttpSession session) {
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		Integer strength = clientService.getTicketsCountByClient(admin.getClient_code());
		if (strength > 0) {
			return strength.toString();
		} else
			return "N/A";
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/notifications-count", method = RequestMethod.GET)
	public String totalNotifications(HttpSession session) {
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		Integer strength = clientService.getNotificationsCountByClient(admin.getClient_code());
		if (strength > 0) {
			return strength.toString();
		} else
			return "N/A";
	}

	@RequestMapping(value = "/lctlogin", method = RequestMethod.GET)
	public ModelAndView lctLogin(HttpSession session) {

		ClientUser userData = (ClientUser) session.getAttribute("ClientUser");
		if (userData != null) {
			return new ModelAndView("/lct/index");
		} else
			return new ModelAndView("/lct/login", "admin", new ClientUser());
	}

	@RequestMapping(value = "/lct", method = RequestMethod.GET)
	public ModelAndView ozaiClientUser(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");
		List<ResidentsData> residentsData = clientService.getPropertyWiseResidentsDataByClient(adminData.getClient_code());
		//String residentsChartData = OzaiUtil.buildResidentsDataForChart(residentsData);
		String residentsPrData = OzaiUtil.buildResidentsPropertyDataForChart(residentsData);
		modelAndView.addObject("residentsPrData", residentsPrData);		
		String residentsBothData = OzaiUtil.buildResidentsBothForChart(residentsData);
		modelAndView.addObject("residentsBothData", residentsBothData);
		//modelAndView.addObject("residentsChartData", residentsChartData);
		List<Ticket> tickets = clientService.getRecentTicketsByClient(adminData.getClient_code(), 3);
		modelAndView.addObject("tickets", tickets);
		List<PG> pgs = propertyService.getClientPropertiesList(adminData.getClient_code());
		modelAndView.addObject("pgs", pgs);
		List<Event> events = ozaiService.getEventsByClient(adminData.getClient_code());
		modelAndView.addObject("events", events);
		List<Notice> notification = clientService.getNoticeByClient(adminData.getClient_code(), 0);
		modelAndView.addObject("notification", notification);
		List<ClientWorkSites> worksites = clientService.getClientWorkSites(adminData.getClient_code());
		modelAndView.addObject("worksites", worksites);
		modelAndView.setViewName("/lct/index");
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct-register", method = RequestMethod.GET)
	public ModelAndView register(HttpSession session) {

		ClientUser userData = (ClientUser) session.getAttribute("ClientUser");
		if (userData != null) {
			return new ModelAndView("/lct/register");
		} else
			return new ModelAndView("/lct/register", "admin", new ClientUser());
	}
	
	@ResponseBody	
	@RequestMapping(value = "/registerLCTUser", method = RequestMethod.GET)
	public String registerClientUser(@ModelAttribute("admin") ClientUser admin, HttpSession session) throws IOException {

		Random rand = new Random();
		int otp = rand.nextInt(900000) + 100000;
		String password = String.valueOf(otp);
		System.out.println("Password" + password);

		//admin.setPassword(password);
		admin.setUsername(admin.getMobile());
		admin.setActive(0);

		Integer id = clientService.addClientUser(admin);

		if (id != 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@ResponseBody	
	@RequestMapping(value = "/registerLCTUserOTPLess", method = RequestMethod.GET)
	public String registerLCTUserOTPLess(@RequestParam String name, @RequestParam String mobile, HttpSession session) throws IOException {

		Random rand = new Random();
		int otp = rand.nextInt(900000) + 100000;
		String password = String.valueOf(otp);
		System.out.println("Password" + password);

		ClientUser client = new ClientUser();//admin.setPassword(password);
		client.setUsername(mobile);
		client.setName(name);
		client.setPassword(password);
		client.setActive(1);
		if(clientService.isClientUserExist(mobile)) {
			ClientUser userData = clientService.getClientUserRoleByMobile(mobile);
			session.setAttribute("ClientUser", userData);
			return "exist";
		} else {
		Integer id = clientService.addClientUser(client);

			if (id != 0) {
				ClientUser userData = clientService.getClientUserRoleById(id);
				session.setAttribute("ClientUser", userData);
				return "success";
			} else {
				return "fail";
			}
		}
	}

	@RequestMapping(value = "/lct/index", method = RequestMethod.GET)
	public ModelAndView tikaanaClientUserIndex() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/lct/index");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/services", method = RequestMethod.GET)
	public ModelAndView clientServices(HttpSession session) {
		ClientUser user = (ClientUser) session.getAttribute("ClientUser");
		String message = "You have logged out.";
		//ozaiService.sendNotificationToDevice(user.getToken().getDeviceId(), message);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/lct/services");
		return modelAndView;
	}

	@RequestMapping(value = "/validateClientUserLogin", method = RequestMethod.GET)
	public ModelAndView validateLogin(HttpSession session) {

		ModelAndView modelAndView = new ModelAndView();
		ClientUser userData = (ClientUser) session.getAttribute("ClientUser");
		if (userData != null) {
			modelAndView.setViewName("redirect:/lct");
			//return new ModelAndView("/lct/index");
		} else
			modelAndView.setViewName("redirect:/lct");
			//return new ModelAndView("/adminlogin", "admin", new ClientUser());
		return modelAndView;
	}

	@RequestMapping(value = "/validateClientUserLogin", method = RequestMethod.POST)
	public ModelAndView validate(@ModelAttribute("user") ClientUser user, BindingResult result,
			RedirectAttributes redirectAttributes, HttpSession session,
			@RequestParam(value = "next", required = false) String next) {
		// userValidator.validate(user, result);

		if (user.getUsername() != null && !user.getUsername().isEmpty() && user.getPassword() != null
				&& !user.getPassword().isEmpty()) {
			ModelAndView modelAndView = new ModelAndView();
			String username = user.getUsername();
			String password = user.getPassword();
			System.out.println("in submit" + username + "password " + password);
			ClientUser userData = clientService.validateClientUser(username, password);

			if (userData != null) {
				session.setAttribute("ClientUser", userData);
				modelAndView.addObject("sessionUser", userData.getUsername());
				if (next != null && !next.isEmpty()) {
					modelAndView.setViewName("redirect:" + next);
				} else {
					modelAndView.setViewName("redirect:/lct");
				}
				return modelAndView;

			} else {
				modelAndView.getModel().put("AuthError", "Invalid UserName / Password");
				modelAndView.setViewName("/lct/login");
				return modelAndView;
			}
		} else {
			return new ModelAndView("/lct/login");
		}

	}

	@RequestMapping(value = "/lct/adminlogout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {

		ClientUser user = (ClientUser) session.getAttribute("ClientUser");
		ozaiService.deleteToken(user.getUsername(), "LCT");
		session.removeAttribute("ClientUser");
		session.invalidate();
		return new ModelAndView("/lct/login");
	}

	private void uploadFile(String filename, MultipartFile image, String type) {
		File image_path = new File(servletContext.getRealPath("/") + "uploaded_files/DOC/" + type + "/" + filename);
		image_path.getParentFile().mkdirs();
		try {
			FileUtils.writeByteArrayToFile(image_path, image.getBytes());

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	//@RequestMapping(value = "/lct/profile-admin/image/{id}", method = RequestMethod.GET, produces = MediaType.IMAGE_PNG_VALUE)
	//@ResponseBody
	//public byte[] getClientUserProfileImage(@PathVariable int id) {

		//return clientService.getClientUserRoleById(id).getImage();

	//}
	
	/* ClientUser roles controller starts */
	
	@RequestMapping(value = "/lct/roles/add", method = RequestMethod.GET)
	public ModelAndView addClientUserRoleToClient(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");
		List<PG> pgs = propertyService.getClientPropertiesList(adminData.getClient_code());
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/lct/roles/add");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/registerClientUserRoleAction", method = RequestMethod.POST)
	public ModelAndView submitB2BClientUserToClient(@ModelAttribute("admin") ClientUser admin, HttpSession session) throws IOException {

		Random rand = new Random();
		int otp = rand.nextInt(900000) + 100000;
		String password = String.valueOf(otp);
		System.out.println("Password" + password);

		admin.setPassword(password);
		String filename = null;
		ModelAndView modelAndView = new ModelAndView();
		admin.setUsername(admin.getUsername());

		Integer id = clientService.addClientUser(admin);

		if (id != 0) {
			//sendSMS(user.getName(), user.getMobile(), password);
			//uploadFile(filename, id_file, "USER");
			modelAndView.addObject("success", true);
			modelAndView.addObject("username", admin.getUsername());
			modelAndView.addObject("password", admin.getPassword());
			

			modelAndView.setViewName("/lct/roles/add");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/lct/roles/add");
		}
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping(value = "/lct/checkClientUserNameAction", method = RequestMethod.POST)
	public String CheckClientUserName(@RequestParam String username, HttpSession session) {

		if (clientService.isClientUserExist(username)) {
			System.out.println("Exist");
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "/lct/roles/list", method = RequestMethod.GET)
	public ModelAndView allB2BClientUserListForClient(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");

		if (adminData != null) {

			List<ClientUser> tenants = clientService.getAllClientUsers();

			modelAndView.addObject("tenants", tenants);
			modelAndView.addObject("organization", adminData.getClient());

			modelAndView.setViewName("/lct/roles/list");

		} else {
			modelAndView.setViewName("/lct/roles/list" + "?client=no" + "");
		}

		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/roles/edit/{id}", method = RequestMethod.GET)
	public ModelAndView getTenatDetails(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");
		List<PG> pgs = propertyService.getClientPropertiesList(adminData.getClient_code());
		modelAndView.addObject("pgs", pgs);

		ClientUser admin = clientService.getClientUserRoleById(id);

		modelAndView.addObject("admin", admin);

		modelAndView.setViewName("/lct/roles/edit");
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/roles/update-role", method = RequestMethod.GET)
	public String getUpdateClientUserRole(@ModelAttribute("admin") ClientUser admin, HttpSession session) {
		
		if (clientService.updateClientUserRole(admin)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
	/* ----------------------ClientUser roles controller Ends------------------------ */
	
	/* -------------------Residents Controller Starts----------------- */
	
	@RequestMapping(value = "/lct/residents/add", method = RequestMethod.GET)
	public ModelAndView addTenant(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/lct/residents/add");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/lct/residents/add-b2b", method = RequestMethod.GET)
	public ModelAndView addB2BTenanttoClient(HttpSession session) {
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		ModelAndView modelAndView = new ModelAndView();
		List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/lct/residents/add-b2b");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/addResidentAction", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("residents") Residents residents, BindingResult result,
			HttpSession session) throws IOException {
		//registerValidator.validate(user, result);
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		ModelAndView modelAndView = new ModelAndView();
		Random rand = new Random();	
		int otp = rand.nextInt(900000) + 100000;
		String password = String.valueOf(otp);
		
		User user = new User();
		B2B_Details details = new B2B_Details();
		System.out.println("Password" +password);
		user.setUsername(residents.getMobile());
		user.setPassword(password);
		user.setName(residents.getName());
		user.setEmail(residents.getEmail());
		user.setReg_date(OzaiUtil.getCurrentDate());
		user.setMobile(residents.getMobile());
		user.setResident_type("B2C");
		user.setIs_resident("YES");
		
		user.setLanguage(residents.getLanguage());
		user.setHometown(residents.getHome_town());
		user.setDob(residents.getDob());
		user.setFood_preferences(residents.getFood_preferences());
			
		if(userService.isMobileExist(user.getMobile())) {
			User userD = userService.getUserDetails(residents.getMobile());
			modelAndView.addObject("userD", userD);
			List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
			modelAndView.addObject("pgs", pgs);
			modelAndView.setViewName("/lct/residents/details-b2b");
		} else {
				
			Integer isStudentSaved = userService.saveUser(user);
			System.out.println("student saved");
			if (isStudentSaved!=0) {
				
				details.setJoining_date(residents.getJoining_date());
				details.setProperty_id(residents.getProperty_id());
				details.setRoom_id(residents.getRoom_id());
				details.setBed_id(residents.getBed_id());
				details.setSharing(residents.getSharing());
				details.setUser_id(isStudentSaved);
				details.setClient_code(admin.getClient_code());
				
				b2bService.addUserAsResident(details);
				userService.updateUserRentalCreditScore(isStudentSaved, 300, 1);
				propertyService.updateBedStatus(residents.getBed_id(), "Occupied");
				sendSMS(user.getName(), user.getMobile(), password);
				modelAndView.setViewName("redirect:/lct/residents/list");
			} else {
				modelAndView.setViewName("/lct/residents/add");
			}
		} 	
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/addUserAsResidentAction", method = RequestMethod.POST)
	public ModelAndView register(@ModelAttribute("details") B2B_Details details, BindingResult result,
			HttpSession session) throws IOException {
		
			ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
			ModelAndView modelAndView = new ModelAndView();			
	
			details.setClient_code(admin.getClient_code());
			User user = userService.getUserDetailsById(details.getUser_id());
			user.setIs_resident("YES");
			user.setResident_type("B2B");
			userService.updateUser(user);		
			if(b2bService.addUserAsResident(details)) {
				userService.updateUserRentalCreditScore(user.getId(), 300, 1);
				sendSMS(user.getName(), user.getMobile(), user.getPassword());
				modelAndView.setViewName("redirect:/lct/residents/list");
			} else {
				modelAndView.setViewName("/lct/residents/add");
			} 	
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/add-b2c", method = RequestMethod.GET)
	public ModelAndView addB2BtoClient(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/lct/residents/add-b2c");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/addB2CResidentAction", method = {RequestMethod.POST, RequestMethod.GET} )
	public ModelAndView b2cregister(@ModelAttribute("residents") Residents residents, BindingResult result,
			HttpSession session) throws IOException {
		//registerValidator.validate(user, result);
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		ModelAndView modelAndView = new ModelAndView();
		Random rand = new Random();	
		int otp = rand.nextInt(900000) + 100000;
		String password = String.valueOf(otp);
		
		User user = new User();
		B2C_Details details = new B2C_Details();
		System.out.println("Password" +password);
		user.setUsername(residents.getMobile());
		user.setPassword(password);
		user.setName(residents.getName());
		user.setEmail(residents.getEmail());
		user.setReg_date(OzaiUtil.getCurrentDate());
		user.setMobile(residents.getMobile());
		user.setResident_type("B2C");
		user.setIs_resident("YES");
			
		if(userService.isMobileExist(user.getMobile())) {
			User userD = userService.getUserDetails(residents.getMobile());
			modelAndView.addObject("userD", userD);
			List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
			modelAndView.addObject("pgs", pgs);
			modelAndView.setViewName("/lct/residents/details-b2c");
		} else {
				
			Integer isStudentSaved = userService.saveUser(user);
			System.out.println("student saved");
			if (isStudentSaved!=0) {
				
				details.setJoining_date(residents.getJoining_date());
				details.setProperty_id(residents.getProperty_id());
				details.setRent(residents.getRent());
				details.setRoom_id(residents.getRoom_id());
				details.setBed_id(residents.getBed_id());
				details.setSharing(residents.getSharing());
				details.setUser_id(isStudentSaved);
				details.setClient_code(admin.getClient_code());
				details.setAdmin_id(0);
				
				B2C_Rents rent = new B2C_Rents();
				String thisDay = details.getJoining_date().toString();
				String thisMonth = thisDay.substring(0, 7);
				String theDate = thisDay.substring(Math.max(thisDay.length() - 2, 0));
				int daysLeft = Integer.parseInt(theDate);
			    System.out.println("Monthly Rent:"+details.getRent()+"Days Left"+daysLeft);
				rent.setAmount((details.getRent()/30)*daysLeft);
				rent.setUser_id(user.getId());
				rent.setClient_code(admin.getClient_code());
				rent.setAdmin_id(0);
				rent.setService_month(thisMonth);
				rent.setStatus("Due");
				rent.setProperty_id(details.getProperty_id());
				rent.setRaised_date(OzaiUtil.getCurrentDate());
				
				b2cService.addUserAsResident(details);
				b2cService.generateResidentRent(rent);
				userService.updateUserRentalCreditScore(isStudentSaved, 300, 1);
				propertyService.updateBedStatus(residents.getBed_id(), "Occupied");
				sendSMS(user.getName(), user.getMobile(), password);
				modelAndView.setViewName("redirect:/lct/residents/list");
			} else {
				modelAndView.setViewName("/lct/residents/add");
			}
		} 	
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/addUserAsB2CResidentAction", method = { RequestMethod.POST, RequestMethod.GET})
	public ModelAndView register(@ModelAttribute("details") B2C_Details details, BindingResult result,
			HttpSession session) throws IOException {
		
			ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
			ModelAndView modelAndView = new ModelAndView();			
	
			details.setClient_code(admin.getClient_code());
			details.setAdmin_id(0);
			User user = userService.getUserDetailsById(details.getUser_id());
			user.setIs_resident("YES");
			user.setResident_type("B2C");
			userService.updateUser(user);
			
			
			B2C_Rents rent = new B2C_Rents();
			String thisDay = details.getJoining_date().toString();
			String thisMonth = thisDay.substring(0, 7);
			String theDate = thisDay.substring(Math.max(thisDay.length() - 2, 0));
			int daysLeft = Integer.parseInt(theDate);
			
		    System.out.println("Monthly Rent:"+details.getRent()+"Days Left"+daysLeft);
			rent.setAmount((details.getRent()/30)*daysLeft);
			rent.setUser_id(user.getId());
			rent.setAdmin_id(0);
			rent.setClient_code(admin.getClient_code());
			rent.setService_month(thisMonth);
			rent.setStatus("Due");
			rent.setProperty_id(details.getProperty_id());
			rent.setRaised_date(OzaiUtil.getCurrentDate());
			
			
			if(b2cService.addUserAsResident(details)) {
				b2cService.generateResidentRent(rent);
				userService.updateUserRentalCreditScore(user.getId(), 300, 1);
				propertyService.updateBedStatus(details.getBed_id(), "Occupied");
				sendSMS(user.getName(), user.getMobile(), user.getPassword());
				modelAndView.setViewName("redirect:/lct/residents/list");
			} else {
				modelAndView.setViewName("/lct/residents/add");
			} 	
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/list", method = RequestMethod.GET)
	public ModelAndView allB2BResidentsList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");

		if (adminData != null) {
			List<PG> properties = propertyService.getClientPropertiesList(adminData.getClient_code());
			List<B2B_Details> tenants = clientService.getActiveResidentsByClient(adminData.getClient_code());
			List<B2C_Details> residents = clientService.getB2CResidentsByClient(adminData.getClient_code());
			List<Badges> badgesList=badgeService.getBadgeList();
			System.out.println("badgesList:"+badgesList.size()); 
			modelAndView.addObject("tenants", tenants);
			modelAndView.addObject("residents", residents);
			modelAndView.addObject("properties", properties);
			modelAndView.addObject("badgesList", badgesList);
			
			modelAndView.setViewName("/lct/residents/list");

		} else {
			modelAndView.setViewName("/lct/residents/list" + "?client=no" + "");
		}

		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/residents/by-property", method = RequestMethod.POST)
	public ModelAndView allB2BResidentsList(@RequestParam int property_id, HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");

		if (adminData != null) {
			List<PG> properties = propertyService.getClientPropertiesList(adminData.getClient_code());
			List<B2B_Details> tenants = clientService.getActiveResidentsByProperty(property_id);
			modelAndView.addObject("tenants", tenants);
			modelAndView.addObject("properties", properties);
			modelAndView.setViewName("/lct/residents/list");
		} else {
			modelAndView.setViewName("/lct/residents/list" + "?client=no" + "");
		}
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/residents/all-list", method = RequestMethod.GET)
	public ModelAndView allClientResidentsList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();

		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");

		if (adminData != null) {

			List<B2B_Details> tenants = clientService.getAllResidentsByClient(adminData.getClient_code());

			modelAndView.addObject("tenants", tenants);

			modelAndView.setViewName("/lct/residents/all-list");

		} else {
			modelAndView.setViewName("/lct/residents/all-list" + "?client=no" + "");
		}

		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/getUserRating/{user_id}", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String getResidentRating(@PathVariable int user_id, HttpSession session) {
		int rating = userService.getUserRating(user_id);
		System.out.println("Rating :" +rating);
		String rate = String.valueOf(rating);
		if(rate!=null) {
			return rate;
		} else {
			return "0.0";
		}
	}
	
	@RequestMapping(value = "/lct/residents/edit/{id}", method = RequestMethod.GET)
	public ModelAndView residentEditDetails(HttpSession session, @PathVariable int id) {
		
		ModelAndView modelAndView = new ModelAndView();

		B2B_Details details = clientService.getResidentDetails(id);
		
		modelAndView.addObject("details", details);

		modelAndView.setViewName("/lct/residents/edit");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/residents/move-out", method = RequestMethod.GET)
	public String tenantMovedOut(@RequestParam int id, @RequestParam Date moveout,
			HttpSession session) {

		System.out.println("Controller"+id+ "\n Date" +moveout);
		
		boolean save = clientService.updateResidentStatus(id, moveout);
		if (save) {
			return "success";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/lct/residents/generate-rent/{id}", method = RequestMethod.GET)
	public ModelAndView generateRental(HttpSession session, @PathVariable int id) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		Date currentDate = OzaiUtil.getCurrentDate();
		String cDate = currentDate.toString();
		String month = cDate.substring(0, 7);
		B2C_Details details = adminService.getB2CResidentDetails(id);
		
		B2C_Rents rents = new B2C_Rents();
		rents.setService_month(month);
		rents.setAmount(details.getRent());
		rents.setUser_id(id);
		rents.setStatus("Due");
		rents.setProperty_id(details.getProperty_id());
		rents.setClient_code(details.getClient_code());
		if(b2cService.isRentGenerated(id, month)) {
			modelAndView.setViewName("redirect:/lct/residents/list?success=exist");
		} else {
			boolean status = b2cService.generateResidentRent(rents);
			if(status) {
				modelAndView.setViewName("redirect:/lct/residents/list?success=yes");
			} else {
				modelAndView.setViewName("redirect:/lct/residents/list?success=no");
			}
		}
		return modelAndView;

	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/residents/b2cmove-out", method = RequestMethod.GET)
	public String b2cMoveOut(@RequestParam int id, @RequestParam Date moveout,
			HttpSession session) {

		//SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
		//Date moveOut = TikaanaUtil.convertStringToSqlDate(moveout);
		System.out.println("Controller"+id+ "\n Date" +moveout);
		B2C_Details details = adminService.getB2CResidentDetails(id);
		boolean save = adminService.updateResidentStatus(id, moveout);
		if (save) {
			propertyService.updateBedStatus(details.getBed_id(), "Available");
			return "success";
		} else {
			return "error";
		}
	}
	

	
	@ResponseBody
	@RequestMapping(value = "/lct/residents/update-resident", method = RequestMethod.GET)
	public String getTenantRentStatus(@ModelAttribute("user") User user, HttpSession session) {
		
		if (userService.updateUser(user)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
	public boolean sendSMS(String name, String mobile, String password) {

		System.out.println("In sms 1");
		try {
			String message = "Dear "+name+ ", your username is " + mobile + " and password is " + password 
					+ " Please login to the app using the above credentials! From " + 
					"Team Tikaana";
			String requestUrl = "https://smsapi.24x7sms.com/api_2.0/SendSMS.aspx?" + "APIKEY=" + "zkpwwwufKbl"
					+ "&MobileNo=" + mobile + "&SenderID=" + "TKNAPG" + "&Message="
					+ URLEncoder.encode(message, "UTF-8") + "&ServiceName=" + "TEMPLATE_BASED";
			System.out.println("In sms 2");
			URL url = new URL(requestUrl);
			HttpsURLConnection httpsCon = (HttpsURLConnection) url.openConnection();
			httpsCon.setRequestMethod("GET");
			httpsCon.setConnectTimeout(10000);
			int intresult = httpsCon.getResponseCode();
			String strresult = httpsCon.getResponseMessage();
			BufferedReader in = new BufferedReader(new InputStreamReader(httpsCon.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);

				System.out.println("inputLine" + strresult);
			}
			System.out.println("Sent" + response);
			in.close();
			httpsCon.disconnect();
			return true;

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("error");
			return false;
		} catch (MalformedURLException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}
	
	/* -----------------------------           Residents Controller Ends       ----------------------------- */
	
	/* Tikcets Controller Starts */
	
	@RequestMapping(value = "/lct/tickets/list", method = RequestMethod.GET)
	public ModelAndView showTickets(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		if (admin != null) {
			List<Ticket> tickets = clientService.getTicketsListByClient(admin.getClient_code());
			modelAndView.addObject("tickets", tickets);
			List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
			modelAndView.addObject("properties", properties);
			List<TicketsData> ticketsData = clientService.getStatusWiseTicketsDataByClient(admin.getClient_code());
			String ticketsChartData = OzaiUtil.buildTicketsDataForChart(ticketsData);
			modelAndView.addObject("ticketsChartData", ticketsChartData);
			List<TicketsData> ticketsData2 = clientService.getCategoryWiseTicketsDataByClient(admin.getClient_code());
			String ticketsChartData2 = OzaiUtil.buildTicketsDataForChart2(ticketsData2);
			modelAndView.addObject("ticketsChartData2", ticketsChartData2);
			modelAndView.setViewName("/lct/tickets/list");
		} else {
			modelAndView.setViewName("/lct/tickets/list");
		}

		return modelAndView;
	}
	
	@RequestMapping(value="/lct/tickets/view/{id}",method=RequestMethod.GET)
	public ModelAndView showTicket(@PathVariable int id, HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		Ticket ticket=ozaiService.getTicketDetails(id);
		modelAndView.addObject("ticket", ticket);
		
		if(ticket.getStatus().equalsIgnoreCase("Closed")) {
			String timeTaken =	OzaiUtil.getTimeTaken(ticket.getRaised_date(), ticket.getClosed_on());
			modelAndView.addObject("timeTaken", timeTaken);
		}
		
		modelAndView.setViewName("/lct/tickets/view");
		return modelAndView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/tickets/update-status/{id}/{status}", method = RequestMethod.GET)
	public String getTenantRentStatus(@PathVariable int id, @PathVariable String status, HttpSession session) {

		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");
		if (clientService.updateTicketStatus(id, status, adminData.getName())) {
			return "Paid";
		} else {
			return "Due";
		}

	}
	
	@ResponseBody
	@RequestMapping(value = "/lct/tickets/add-comments", method = RequestMethod.GET)
	public String getTenantRentStatus(@RequestParam String comments, @RequestParam String status, 
			@RequestParam int id, HttpSession session) {
		
		ClientUser adminData = (ClientUser) session.getAttribute("ClientUser");
		clientService.updateTicketStatus(id, status, adminData.getName());
		if (clientService.addCommentsToTicket(comments, id)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
	@RequestMapping(value = "/lct/tickets/month-property", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView showTicketsByMonthAndProperty(HttpSession session, @RequestParam int property_id,
			@RequestParam String month) throws ParseException {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		
		if (admin != null) {
			List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
			modelAndView.addObject("properties", properties);
			List<Ticket> tickets = clientService.getTicketsOfMonthAndPropertyByClient(admin.getClient_code(), property_id, month);
			modelAndView.addObject("tickets", tickets);
			List<TicketsData> ticketsData2 = clientService.getCategoryWiseTicketsDataByClientOnFilter(admin.getClient_code(), month, property_id);
			String ticketsChartData2 = OzaiUtil.buildTicketsDataForChart2(ticketsData2);
			modelAndView.addObject("ticketsChartData2", ticketsChartData2);
			modelAndView.setViewName("/lct/tickets/list");
		} else {
			modelAndView.setViewName("/lct/tickets/list");
		}

		return modelAndView;
	}
	
	/* Tikcets Controller Ends */
	
	@ResponseBody
	@RequestMapping(value = "/lct/saveNotice", method = RequestMethod.POST)
	public String saveNotice(@ModelAttribute("notice") Notice notice, HttpSession session) {
		Timestamp time = Timestamp.from(Instant.now());
		notice.setPost_time(time);
		if (clientService.saveNotice(notice)) {
			return "success";
		} else {
			return "failed";
		}

	}
	
	@RequestMapping(value = "/lct/notifications/list", method = RequestMethod.GET)
	public ModelAndView notifications(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		if (admin != null) {
			List<Notice> notification = clientService.getNoticeByClient(admin.getClient_code(), 0);
			modelAndView.addObject("notification", notification);
			modelAndView.setViewName("/lct/notifications/list");
		} else {
			modelAndView.setViewName("/lct/notifications/list");
		}

		return modelAndView;
	}
	
	@RequestMapping(value="/lct/notifications/view/{id}",method=RequestMethod.GET)
	public ModelAndView showNotifications(@PathVariable int id, HttpSession session){
		ModelAndView modelAndView=new ModelAndView();
		//Notice notification=ozaiService.getNotice(id);
		//modelAndView.addObject("notification", notification);
		
		modelAndView.setViewName("/lct/notifications/view");
		return modelAndView;
	}
	
	@RequestMapping(value = "/make-payment/{id}", method = RequestMethod.GET)
	public ModelAndView makeUserPayment(HttpSession session, 
			@PathVariable int id) {
		
  		ModelAndView modelAndView=new ModelAndView();
		B2C_Rents rent =  b2cService.getB2CRentDetails(id);
		
		try {
			CreatePaymentResponse cpr = paymentService.sendUserData(rent);
			if (cpr.isSuccess()) {
				String paymentUrl = paymentService.pullLongUrl(cpr.getPayment_request().getId());
				modelAndView.setViewName("redirect:" + paymentUrl);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//modelAndView.setViewName("/mobile/talent/entry");
		return modelAndView;
		
	}
  	
  	@RequestMapping(value = "/payment-success/{id}", method = RequestMethod.GET)
	public ModelAndView paymentUserSuccess(@RequestParam String payment_id, @RequestParam String payment_status,
			@RequestParam String payment_request_id, HttpSession session, @PathVariable int id, HttpServletRequest request) {
		ModelAndView modelAndView=new ModelAndView();
		final VerifyPaymentResponse verifiedPayment = paymentService.verifyPayment(payment_request_id, payment_id);
		if (verifiedPayment.isValid()) {
			modelAndView.addObject("success", true);
			//B2C_Rents payment = b2cService.getB2CRentDetails(id);
			//payment.setPaid_date(OzaiUtil.getCurrentDate());
			//payment.setStatus("PAID");
			//payment.setPayment_id(payment_id);
			//payment.setPayment_request_id(payment_request_id);
			//b2cService.updateRentPayment(payment);
			modelAndView.setViewName("/lct/payment-success");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("/lct/payment-success");
		}
		return modelAndView;
		
		
	}
  	
  	@RequestMapping(value = "/lct/events/updates", method = RequestMethod.GET)
	public ModelAndView updates(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/lct/events/updates");
		return modelAndView;
	}
  	
  	@RequestMapping(value = "/lct/events/send-update", method = RequestMethod.GET)
	public ModelAndView sendUpdates(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/lct/events/send-update");
		return modelAndView;
	}
  	
  	@RequestMapping(value = "/lct/events/add", method = RequestMethod.GET)
	public ModelAndView addEvent(HttpSession session) {
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		ModelAndView modelAndView = new ModelAndView();
		List<PG> pgs = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("pgs", pgs);
		modelAndView.setViewName("/lct/events/add");
		return modelAndView;
	}

	@RequestMapping(value = "/lct/events/list", method = RequestMethod.GET)
	public ModelAndView eventsList(HttpSession session) {
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		ModelAndView modelAndView = new ModelAndView();
		List<Event> events = ozaiService.getEventsByClient(admin.getClient_code());
		modelAndView.addObject("events", events);
		modelAndView.setViewName("/lct/events/list");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/events/view/{id}", method = RequestMethod.GET)
	public ModelAndView eventDetails(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		Event event = ozaiService.getEventDetails(id);
		modelAndView.addObject("event", event);
		modelAndView.setViewName("/lct/events/view");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/saveEvent", method = {RequestMethod.POST})
	public ModelAndView saveNotice(HttpSession session, @ModelAttribute("event") Event event, 
			@RequestParam(value = "event_file", required = true) MultipartFile event_file) {
		
		ModelAndView modelAndView = new ModelAndView();
		event.setStatus("Open");
		Integer maxId = ozaiService.getEventMaxId();
		Integer code = maxId+1;
		String filename = null;
		if (!event_file.isEmpty()) {
			filename = code + "." + event_file.getOriginalFilename().split("\\.")[1];
		}
		event.setFilename(filename);
		if (ozaiService.saveEvent(event)) {
			uploadFile(filename, event_file, "EVENTS");
			modelAndView.addObject("success", true);
			modelAndView.setViewName("redirect:/lct/events/add");
		} else {

			modelAndView.addObject("success", false);
			modelAndView.setViewName("redirect:/lct/events/add");
		}
		
		return modelAndView;

	}
	
	@RequestMapping(value = "/lct/residents/pending-rents", method = RequestMethod.GET)
	public ModelAndView pendingRents(HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<B2C_Rents> rents = b2cService.getClientB2CRentsList(admin.getClient_code(), "Due", 0);
		modelAndView.addObject("rents", rents);
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/lct/residents/pending-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/month/pending-rents", method = RequestMethod.POST)
	public ModelAndView pendingRentsByMonth(HttpSession session, @RequestParam String month) {
		
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<B2C_Rents> rents = b2cService.getClientB2CRentsListByMonth(admin.getClient_code(), "Due", month, 0);
		modelAndView.addObject("rents", rents);
		modelAndView.addObject("month", month);
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/lct/residents/pending-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/property/pending-rents", method = RequestMethod.POST)
	public ModelAndView pendingRentsByProperty(HttpSession session, @RequestParam int property) {
		
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<B2C_Rents> rents = b2cService.getClientB2CRentsListByProperty(admin.getClient_code(), "Due", property, 0);
		modelAndView.addObject("rents", rents);
		PG pg = propertyService.getPropertyDetails(property);
		modelAndView.addObject("pg", pg.getName());
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/lct/residents/pending-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/month-property/pending-rents", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView pendingRentsByPropertyAndMonth(HttpSession session, @RequestParam int property, 
			@RequestParam String month) {
		
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<B2C_Rents> rents = b2cService.getClientB2CRentsListByMonthAndProperty(admin.getClient_code(), "Due", month, property, 0);
		modelAndView.addObject("rents", rents);
		PG pg = propertyService.getPropertyDetails(property);
		if(property==0) {
			modelAndView.addObject("pg", "All");
		} else {
			modelAndView.addObject("pg", pg.getName());
		}
		modelAndView.addObject("month", month);
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/lct/residents/pending-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/update-rent-payment/{id}", method = RequestMethod.GET)
	public ModelAndView addSDELec(HttpSession session, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView();
		ClientUser userData = (ClientUser) session.getAttribute("ClientUser");
		B2C_Rents rent = b2cService.getB2CRentDetails(id);
		modelAndView.addObject("rent", rent);
		modelAndView.setViewName("/lct/residents/update-rent-payment");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/updatePayment", method = RequestMethod.POST)
	public ModelAndView paymentUserSuccess(@ModelAttribute B2C_Rents payment, HttpSession session, @RequestParam String on_time) {
		
		ModelAndView modelAndView=new ModelAndView();
		B2C_Rents rent = b2cService.getB2CRentDetails(payment.getId());
		rent.setPayment_id(payment.getPayment_id());
		rent.setPayment_method(payment.getPayment_method());
		rent.setPaid_date(payment.getPaid_date());
		rent.setStatus("Paid");
		
		boolean save = b2cService.updateRentPayment(rent);
		if(save) {
			System.out.println("On time : " +on_time);
			if(on_time.equalsIgnoreCase("YES")) {
				userService.updateUserRentalCreditScore(rent.getUser_id(), 10, 1);
			} else {
				userService.updateUserRentalCreditScore(rent.getUser_id(), 5, 0);
			}
			modelAndView.addObject("success", true);
			modelAndView.setViewName("redirect:/lct/residents/pending-rents");
		} else {
			modelAndView.addObject("success", false);
			modelAndView.setViewName("redirect:/lct/residents/pending-rents");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/paid-rents", method = RequestMethod.GET)
	public ModelAndView paidRents(HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<B2C_Rents> rents = b2cService.getClientB2CRentsList(admin.getClient_code(), "Paid", 10);
		modelAndView.addObject("rents", rents);
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/lct/residents/paid-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/month/paid-rents", method = RequestMethod.POST)
	public ModelAndView paidRentsByMonth(HttpSession session, @RequestParam String month) {
		
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<B2C_Rents> rents = b2cService.getClientB2CRentsListByMonth(admin.getClient_code(), "Paid", month, 0);
		modelAndView.addObject("rents", rents);
		modelAndView.addObject("month", month);
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/lct/residents/paid-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/property/paid-rents", method = RequestMethod.POST)
	public ModelAndView paidRentsByProperty(HttpSession session, @RequestParam int property) {
		
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<B2C_Rents> rents = b2cService.getClientB2CRentsListByProperty(admin.getClient_code(), "Paid", property, 0);
		modelAndView.addObject("rents", rents);
		PG pg = propertyService.getPropertyDetails(property);
		modelAndView.addObject("pg", pg.getName());
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/lct/residents/paid-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/month-property/paid-rents", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView paidRentsByMonthByProperty(HttpSession session, @RequestParam int property,
			 @RequestParam String month) {
		
		ModelAndView modelAndView = new ModelAndView();
		ClientUser admin = (ClientUser) session.getAttribute("ClientUser");
		List<B2C_Rents> rents = b2cService.getClientB2CRentsListByMonthAndProperty(admin.getClient_code(), "Paid", month, property, 0);
		modelAndView.addObject("rents", rents);
		PG pg = propertyService.getPropertyDetails(property);
		if(property==0) {
			modelAndView.addObject("pg", "All");
		} else {
			modelAndView.addObject("pg", pg.getName());
		}
		modelAndView.addObject("month", month);
		List<PG> properties = propertyService.getClientPropertiesList(admin.getClient_code());
		modelAndView.addObject("properties", properties);
		modelAndView.setViewName("/lct/residents/paid-rents");
		return modelAndView;
	}
	
	@RequestMapping(value = "/lct/residents/assignBadge/{userid_badgeId}", method = RequestMethod.GET)
	public ModelAndView assignBadgeToResident(HttpSession session, @PathVariable String userid_badgeId) {
		System.out.println("userid_badgeId:"+userid_badgeId);
		
		int userid=Integer.valueOf(userid_badgeId.split("__")[0]);
		int badgeid=Integer.valueOf(userid_badgeId.split("__")[1]);
		
		ModelAndView modelAndView = new ModelAndView();
		User userObj=userService.getUserDetailsById(userid);
		userObj.setBadge(badgeid);		
		userService.updateUser(userObj);

		modelAndView.setViewName("redirect:/lct/residents/list");
		return modelAndView;
	}

}
