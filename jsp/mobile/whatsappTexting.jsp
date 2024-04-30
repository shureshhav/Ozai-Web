<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Whatsapp Messaging | Ozai</title>
    <style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
</head>
<body>
	<div >
    <h1>Send <span style="color:lightgreen;">Whatsapp</span> Message</h1>
    <form action="<%=request.getContextPath()%>/mobile/sendWhatsAppMessages" modelAttribute="MESSAGES" method="post" role="form"  id="ticket-form" class="php-email-form">
    Enter Message<br />
    <textarea rows="5" cols="100" name="message"></textarea>
    <br />
    <p>Select below Contacts to send whatsapp message</p>
    <table width="80%">
    <caption></caption>
    	<tr >
    		<td>Select</td>
    		<td>Name</td>
    		<td>Phone Number</td>
    		<td>Email</td>
    		<td>Company</td>
    	</tr>
    	<c:forEach items="${userList}" var="userObj">
    	<tr>
    		<td><input type="checkbox" onclick="setRecipients()" name="recipient" value=${userObj.mobile} /></td>
    		<td>${userObj.name}</td>
    		<td>${userObj.mobile}</td>
    		<td>${userObj.email}</td>
    		<td>${userObj.company}</td>
    	</tr>
    	</c:forEach>
    	
    	
    	
    </table>
    <br />
    <input type="hidden" id="recipients" name="status" />
    <button type="button" onclick="submitForm()">Send Message</button>
    </form>
    </div>

    <!-- Import JSTL Core Library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstl/1.2/jstl.min.js"></script>
    <script>
    	function setRecipients(){
    		let checkboxes =
                document.getElementsByName('recipient');
            let result = "";
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    result += checkboxes[i].value
                        + ";";
                }
            }
            console.log("recipients:"+result);
            document.getElementById("recipients").value=result;            
    	}
    	
        function submitForm() {
            var form = document.getElementById('ticket-form');
            var formData = new FormData(form);
            console.log("formData:"+JSON.stringify(formData));
            var xhr = new XMLHttpRequest();
            console.log("1");
            xhr.open('POST', '<%=request.getContextPath()%>/mobile/sendWhatsAppMessages', true);
            console.log("2");
            xhr.onload = function () {
            	 console.log("3");
                if (xhr.status === 200) {
                    // Handle success response
                    console.log(xhr.responseText);
                } else {
                    // Handle error response
                    console.error('Error:', xhr.statusText);
                }
            };
            console.log("4");
            xhr.onerror = function () {
                console.error('Request failed');
            };
            console.log("5");
            xhr.send(formData);
        }
    </script>
</body>
</html>
