local appStorageService = game:GetService("AppStorageService")
game:DefineFastFlag("EnableContactInvitesForNonPhoneVerifiedForAll", false)
game:DefineFastInt("EnableContactInvitesForNonPhoneVerifiedRollout", 0)

return function(p0)
	-- upvalues: appStorageService (ref)
	local appInstallationIdItem = (p0 or appStorageService):GetItem("AppInstallationId")
	local var2 = typeof(appInstallationIdItem)
	
	return if var2 == "number" then appInstallationIdItem elseif var2 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil
end