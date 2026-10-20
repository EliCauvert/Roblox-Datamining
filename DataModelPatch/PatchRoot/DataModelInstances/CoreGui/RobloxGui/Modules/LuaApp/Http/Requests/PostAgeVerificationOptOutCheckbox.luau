local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)
local HttpService = game:GetService("HttpService")
local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)

return function(Callback, ShowOverlay)
	-- upvalues: ArgCheckModule (copy), UrlModule (copy), HttpService (copy)
	ArgCheckModule.isType(ShowOverlay, "boolean", "PostAgeVerificationOptOutCheckbox request expects showOverlay to be a boolean")
	
	return Callback(string.format("%s/v1/settings/verify/show-overlay", UrlModule.VOICE_URL), "POST", {
		postBody = HttpService:JSONEncode({ showOverlay = ShowOverlay })
	})
end