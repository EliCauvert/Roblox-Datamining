local Url = require(script:FindFirstAncestor("CrossPlay").Parent.Http).Url
local FStringDebugOverrideCrossPlayApiUrlModule = require(script.Parent.FStringDebugOverrideCrossPlayApiUrl)

return function(p1)
	-- upvalues: FStringDebugOverrideCrossPlayApiUrlModule (copy), Url (copy)
	return p1.roduxNetworking.GET(script.Name, function(Callback, p2, CrossPlaySettingsKey, p3)
		-- upvalues: FStringDebugOverrideCrossPlayApiUrlModule (upval), Url (upval)
		local UserSettings = Callback(if FStringDebugOverrideCrossPlayApiUrlModule == "" then Url.APIS_URL else FStringDebugOverrideCrossPlayApiUrlModule, { crossPlaySettingsKey = CrossPlaySettingsKey }):path("user-settings-api"):path("v1"):path("user-settings")
		
		if not p3 then
			UserSettings = UserSettings:path("platform")
		end
		return UserSettings:queryArgs({
			[if p3 then "requestedUserSettings" else "requestedPlatformSettings"] = p2
		})
	end)
end