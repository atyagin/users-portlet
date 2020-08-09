<%@ include file="/init.jsp" %>

<liferay-ui:search-container
		emptyResultsMessage="Users not found"
		total="<%= userLocalService.getUsersCount() %>"
>
	<liferay-ui:search-container-results
			results="<%= userLocalService.getUsers(searchContainer.getStart(), searchContainer.getEnd()) %>"
	/>
	<liferay-ui:search-container-row
			className="com.liferay.portal.kernel.model.User"
			escapedModel="true"
			modelVar="user"
	>
		<liferay-ui:search-container-column-text name="Full name:">
			<aui:button-row>
				<portlet:renderURL var="detailPage">
					<portlet:param name="mvcPath" value="/detail.jsp" />
					<portlet:param name="redirect" value="<%= currentURL %>" />
					<portlet:param name="userId" value="<%= String.valueOf(user.getUserId()) %>" />
				</portlet:renderURL>

				<aui:button
						href="<%= detailPage %>"
						value='<%= user.getFullName().equals("") ? "Users name is not filled " : user.getFullName() %>'
				/>
			</aui:button-row>
		</liferay-ui:search-container-column-text>

	</liferay-ui:search-container-row>
	<liferay-ui:search-iterator />
</liferay-ui:search-container>
