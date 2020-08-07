<%@ page import="com.liferay.portal.kernel.model.Phone" %>
<%@ page import="java.util.List" %>
<%@ page import="com.liferay.portal.kernel.model.Organization" %>
<%@ page import="com.liferay.portal.kernel.exception.PortalException" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.ZoneId" %>
<%@ include file="/init.jsp" %>
<% SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); %>
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

    String dateString = dateFormat.format(user.getBirthday());
    LocalDate date = LocalDate.parse(dateString, DateTimeFormatter.ofPattern("yyyy-MM-dd"));

%>

<%= "user id: " + user.getUserId() %>
<br />
<%= "Full name: " + user.getFullName() %>
<br />
<%= "Email : " + user.getEmailAddress() %>
<br />
<%= "Job title : " + user.getJobTitle() %>
<br />
<%= "Birthday : " + date.format(DateTimeFormatter.ofPattern("dd MMMM yyyy", new Locale("ru"))) %>
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
