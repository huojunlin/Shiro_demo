package com.yesway.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.yesway.entity.Account;
import com.yesway.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	public Account findByUsername(String userName) {
		Account account = null;
		if ("admin".equals(userName)) {
			account = new Account();
			account.setUsername(userName);
			account.setPassword("admin");
			account.setIsEnabled(true);
			account.setIsLocked(false);
			
			account.setRoleName("admin");
			
			List<String> permissionList = new ArrayList<String>();
			permissionList.add("account:add");
			permissionList.add("account:update");
			permissionList.add("account:delete");
			permissionList.add("account:ajax");
			
			account.setPermissionList(permissionList);
		} else if ("user".equals(userName)) {
			account = new Account();
			account.setUsername(userName);
			account.setPassword("user");
			account.setIsEnabled(true);
			account.setIsLocked(false);
			
			account.setRoleName("user");
			
			List<String> permissionList = new ArrayList<String>();
			permissionList.add("account:add");
			permissionList.add("account:update");
			
			account.setPermissionList(permissionList);
		}
		return account;
	}
}
