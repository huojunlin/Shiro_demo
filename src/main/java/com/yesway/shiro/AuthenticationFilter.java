package com.yesway.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

public class AuthenticationFilter extends FormAuthenticationFilter {

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
		// ajax访问，可修改为返回自定义json数据
		String s = httpServletRequest.getHeader("X-Requested-With");
		if (s != null && s.equalsIgnoreCase("XMLHttpRequest")) {
			httpServletResponse.addHeader("loginStatus", "accessDenied");
			httpServletResponse.sendError(403);
			return false;
		} else {
			return super.onAccessDenied(request, response);
		}
	}
}
