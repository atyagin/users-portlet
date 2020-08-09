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

<aui:container cssClass='super-awesome-container'>
    <aui:row>
        <aui:col md="4" sm="6">
            <p>user id:</p>
        </aui:col>

        <aui:col md="8" sm="6">
            <p>
                <%= currentUser.getUserId() %>
            </p>
        </aui:col>
    </aui:row>

    <aui:row>
        <aui:col md="4" sm="6">
            <p>Full name:</p>
        </aui:col>

        <aui:col md="8" sm="6">
            <p>
                <%= currentUser.getFullName() %>
            </p>
        </aui:col>
    </aui:row>

    <aui:row>
        <aui:col md="4" sm="6">
            <p>Email:</p>
        </aui:col>

        <aui:col md="8" sm="6">
            <p>
                <%= currentUser.getEmailAddress() %>
            </p>
        </aui:col>
    </aui:row>

    <aui:row>
        <aui:col md="4" sm="6">
            <p>Job title :</p>
        </aui:col>

        <aui:col md="8" sm="6">
            <p>
                <%= currentUser.getJobTitle() %>
            </p>
        </aui:col>
    </aui:row>

    <aui:row>
        <aui:col md="4" sm="6">
            <p>Birthday :</p>
        </aui:col>

        <aui:col md="8" sm="6">
            <p>
                <%= date.format(DateTimeFormatter.ofPattern("dd MMMM yyyy", new Locale("ru"))) %>
            </p>
        </aui:col>
    </aui:row>

    <aui:row>
        <aui:col md="4" sm="6">
            <p>organizations :</p>
        </aui:col>

        <aui:col md="8" sm="6">
            <% List<Organization> organizations = null;
                try {
                    organizations = currentUser.getOrganizations();
                } catch (PortalException e) {
                    e.printStackTrace();
                } %>
            <% for (Organization organization : organizations) { %>
                <p>
                    <%= organization.getName() %>
                </p>
            <% } %>
        </aui:col>
    </aui:row>

    <aui:row>
        <aui:col md="4" sm="6">
            <p>phones :</p>
        </aui:col>

        <aui:col md="8" sm="6">
            <% List<Phone> phones = currentUser.getPhones(); %>
            <% for (Phone phone : phones) { %>
                <p>
                    <%= phone.getNumber() %>
                </p>
            <% } %>
        </aui:col>
    </aui:row>
</aui:container>


<aui:button-row>
    <aui:button
            href="<%= redirect %>"
            value="Back"
    />
</aui:button-row>