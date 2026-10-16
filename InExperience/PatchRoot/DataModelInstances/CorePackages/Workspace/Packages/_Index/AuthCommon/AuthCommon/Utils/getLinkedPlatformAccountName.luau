return function(p1) --[[ Line: 8 | Named "getLinkedPlatformAccountName" ]]
	local PlatformAccountName = p1.getPlatformAccountName()
	
	return if PlatformAccountName and p1.getUseSingleSignOn() then PlatformAccountName else nil
end