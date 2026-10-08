return function(p1)
	local platformAccountName = p1.getPlatformAccountName()
	
	return if platformAccountName and p1.getUseSingleSignOn() then platformAccountName else nil
end