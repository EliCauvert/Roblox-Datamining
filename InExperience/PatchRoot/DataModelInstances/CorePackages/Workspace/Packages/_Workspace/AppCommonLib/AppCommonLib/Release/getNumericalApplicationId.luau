local appStorageService = game:GetService("AppStorageService")
game:DefineFastFlag("EnableContactInvitesForNonPhoneVerifiedForAll", false)
game:DefineFastInt("EnableContactInvitesForNonPhoneVerifiedRollout", 0)

return function(p1)
	-- upvalues: appStorageService (ref)
	local appInstallationIdItem = (p1 or appStorageService):GetItem("AppInstallationId")
	local var1 = typeof(appInstallationIdItem)
	
	return if var1 == "number" then appInstallationIdItem elseif var1 == "string" then if string.len(appInstallationIdItem) <= 0 then nil else tonumber(string.sub(appInstallationIdItem, -2)) else nil
end