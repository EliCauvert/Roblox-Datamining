local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, Minutes)
	-- upvalues: UrlModule (copy), HttpService (copy)
	return Callback(UrlModule.APIS_URL .. "parental-controls-api/v1/parental-controls/add-temporary-screentime", "POST", { postBody = HttpService:JSONEncode({ minutes = Minutes }) })
end