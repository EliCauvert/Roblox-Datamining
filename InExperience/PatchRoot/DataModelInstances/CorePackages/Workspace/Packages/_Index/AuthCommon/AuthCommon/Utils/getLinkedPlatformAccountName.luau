return function(p1)
	local PlatformAccountName = p1.getPlatformAccountName()
	
	return if PlatformAccountName and p1.getUseSingleSignOn() then PlatformAccountName else nil
end