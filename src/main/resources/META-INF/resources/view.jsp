<%@ page import="com.liferay.portal.kernel.model.Phone" %>
<%@ page import="java.util.List" %>
<%@ page import="com.liferay.portal.kernel.model.Organization" %>
<%@ page import="com.liferay.portal.kernel.exception.PortalException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="/init.jsp" %>
<% SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy"); %>

<liferay-ui:search-container
		total="<%= userLocalService.getUsersCount() %>"
>
	<liferay-ui:search-container-results
			results="<%= userLocalService.getUsers(0,userLocalService.getUsersCount()) %>"
	/>
	<liferay-ui:search-container-row
			className="com.liferay.portal.kernel.model.User"
			escapedModel="true"
			modelVar="user"
	>
		<liferay-ui:search-container-column-text property="userId" name="id: " />
		<liferay-ui:search-container-column-text property="fullName" name="Full Name" />
		<liferay-ui:search-container-column-text property="emailAddress" name="email:" />
		<liferay-ui:search-container-column-text property="jobTitle" name="job title:" />
		<liferay-ui:search-container-column-text name="birthday:"  value="<%= dateFormat.format(user.getBirthday()) %>" />
		<liferay-ui:search-container-column-text name="organizations:">
			<% List<Organization> organizations = null;
				try {
					organizations = user.getOrganizations();
				} catch (PortalException e) {
					e.printStackTrace();
				} %>
			<% for (Organization organization : organizations) { %>
			<%=organization.getName() %>
			<br />
			<% } %>
		</liferay-ui:search-container-column-text>

		<liferay-ui:search-container-column-text name="phones:">
			<% List<Phone> phones = user.getPhones(); %>
			<% for (Phone phone : phones) { %>
			<%=phone.getNumber() %>
			<br/>
			<% } %>
		</liferay-ui:search-container-column-text>
	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>
