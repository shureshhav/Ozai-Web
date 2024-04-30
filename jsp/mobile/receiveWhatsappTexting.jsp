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
    <title>Whatsapp Messaging Replies | Ozai</title>
    <style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
</head>
<body>
	<div >
    <h1>Receiving <span style="color:lightgreen;">Whatsapp</span> Messages</h1>
    <form action="<%=request.getContextPath()%>/mobile/sendWhatsAppMessages" modelAttribute="MESSAGES" method="post" role="form"  id="ticket-form" class="php-email-form">
    
    
    <p>Here are the list of whatsapp message Sent/Received.</p>
    <table width="100%">
    <caption></caption>
    	<tr >
    		<td>Message Time</td>
    		<td>From</td>
    		<td>To</td>
    		<td>Message</td>
    		<td>Status</td>
    	</tr>
    	<c:forEach items="${messagesList}" var="messageObj">
    	<tr>
    		<td>${messageObj.messageTime}</td>
    		<td>${messageObj.from}</td>
    		<td>${messageObj.to}</td>
    		<td>${messageObj.message}</td>
    		<td>${messageObj.status}</td>
    	</tr>
    	</c:forEach>
    	
    	
    	
    </table>
    <br />
    
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
