<%@ page import="com.liferay.portal.kernel.model.Phone" %>
<%@ page import="java.util.List" %>
<%@ page import="com.liferay.portal.kernel.model.Organization" %>
<%@ page import="com.liferay.portal.kernel.exception.PortalException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="/init.jsp" %>
<% SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); %>

<%
    String redirect = ParamUtil.getString(request, "redirect");
    long userId = ParamUtil.getLong(request, "userId");
    User currentUser = null;
    if (userId > 0) {
        try {
            currentUser = userLocalService.getUser(userId);
        } catch (PortalException e) {
            e.printStackTrace();
        }
    }
%>

<%= "user id: " + user.getUserId() %>
<br />
<%= "Full name: " + user.getFullName() %>
<br />
<%= "Email : " + user.getEmailAddress() %>
<br />
<%= "Job title : " + user.getJobTitle() %>
<br />
<%= "Birthday : " + dateFormat.format(user.getBirthday()) %>
<br />
<%= "organizations : "%>
<br />
<% List<Organization> organizations = null;
    try {
        organizations = user.getOrganizations();
    } catch (PortalException e) {
        e.printStackTrace();
    } %>
<% for (Organization organization : organizations) { %>
    <%= "   " + organization.getName() %>
    <br />
<% } %>
<%= "phones : "%>
<br />
<% List<Phone> phones = user.getPhones(); %>
<% for (Phone phone : phones) { %>
    <%= "   " + phone.getNumber() %>
    <br/>
<% } %>

<aui:button-row>
    <aui:button
            href="<%= redirect %>"
            value="Back"
    />
</aui:button-row>