local Url = require(script:FindFirstAncestor("CrossPlay").Parent.Http).Url
local FStringDebugOverrideCrossPlayApiUrlModule = require(script.Parent.FStringDebugOverrideCrossPlayApiUrl)

return function(p1)
	-- upvalues: FStringDebugOverrideCrossPlayApiUrlModule (copy), Url (copy)
	return p1.roduxNetworking.POST(script.Name, function(Callback, p2, CrossPlaySettingsKey, CrossPlayValue, p3)
		-- upvalues: FStringDebugOverrideCrossPlayApiUrlModule (upval), Url (upval)
		local UserSettings = Callback(if FStringDebugOverrideCrossPlayApiUrlModule == "" then Url.APIS_URL else FStringDebugOverrideCrossPlayApiUrlModule, {
			crossPlaySettingsKey = CrossPlaySettingsKey,
			crossPlayValue = CrossPlayValue
		}):path("user-settings-api"):path("v1"):path("user-settings")
		
		if not p3 then
			UserSettings = UserSettings:path("platform")
		end
		return UserSettings:body({ [p2] = CrossPlayValue })
	end)
end