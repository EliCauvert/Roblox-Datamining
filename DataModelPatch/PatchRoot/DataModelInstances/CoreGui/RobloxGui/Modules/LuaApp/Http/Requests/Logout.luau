local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.Http)
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)
local FFlagEnableLogoutV3 = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLogoutV3
local HttpService = game:GetService("HttpService")

return function(Callback, LogoutReason, Url, UserId)
	-- upvalues: UrlModule (copy), FFlagEnableLogoutV3 (copy), HttpService (copy)
	local Formatted = string.format("%sv1/logout", UrlModule.AUTH_URL)
	
	if not FFlagEnableLogoutV3 then
		return Callback(Formatted, "POST", { postBody = "", maxRetryCount = 0 })
	end
	Formatted = string.format("%sv3/logout", UrlModule.AUTH_URL)
	local Input = {}
	
	if LogoutReason then
		Input.logoutReason = LogoutReason
	end
	if Url then
		Input.url = Url
	end
	if UserId then
		Input.userId = UserId
	end
	return Callback(Formatted, "POST", {
		maxRetryCount = 0,
		postBody = HttpService:JSONEncode(Input)
	})
end