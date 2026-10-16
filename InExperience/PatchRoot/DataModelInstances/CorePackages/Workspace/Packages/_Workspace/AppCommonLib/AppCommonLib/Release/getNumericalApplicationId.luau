local AppStorageService = game:GetService("AppStorageService")
game:DefineFastFlag("EnableContactInvitesForNonPhoneVerifiedForAll", false)
game:DefineFastInt("EnableContactInvitesForNonPhoneVerifiedRollout", 0)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: AppStorageService (copy)
	local AppInstallationIdItem: string = (if p1 then p1 else AppStorageService):GetItem("AppInstallationId")
	local ValueType = typeof(AppInstallationIdItem)
	
	return if ValueType == "number" then AppInstallationIdItem elseif ValueType == "string" then if string.len(AppInstallationIdItem) <= 0 then nil else tonumber((string.sub(AppInstallationIdItem, -2))) else nil
end