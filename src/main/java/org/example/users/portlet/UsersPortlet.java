package org.example.users.portlet;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.model.Phone;
import com.liferay.portal.kernel.model.User;
import com.liferay.portal.kernel.service.UserLocalService;
import org.example.users.constants.UsersPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.*;

import org.osgi.service.component.annotations.Component;
import org.osgi.service.component.annotations.Reference;

import java.io.IOException;
import java.util.List;

/**
 * @author ilya
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=Users portlet",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=Users",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + UsersPortletKeys.USERS,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class UsersPortlet extends MVCPortlet {
	@Reference
	private volatile UserLocalService _userLocalService;

	public UserLocalService getUserLocalService() {
		return _userLocalService;
	}

	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		renderRequest.setAttribute("userLocalService", getUserLocalService());
		super.render(renderRequest, renderResponse);
	}
}