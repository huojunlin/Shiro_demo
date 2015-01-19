package com.yesway.service;

import com.yesway.entity.Account;

public interface AccountService {
	
	public abstract Account findByUsername(String userName);
}
