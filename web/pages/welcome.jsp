<jsp:include page="templates/header.jsp"/>
<% 
    String targetPage = (String) request.getAttribute("jspPage"); 
%>
<jsp:include page="<%= targetPage %>"/>
<jsp:include page="templates/footer.jsp"/>




