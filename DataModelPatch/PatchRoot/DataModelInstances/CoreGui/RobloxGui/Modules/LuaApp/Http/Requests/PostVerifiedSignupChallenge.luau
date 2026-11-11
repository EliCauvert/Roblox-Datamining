local HttpService = game:GetService("HttpService")
local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, DeliveryTarget)
	-- upvalues: UrlModule (copy), HttpService (copy)
	assert(type(DeliveryTarget) == "string", "invalid delivery target")
	
	return Callback(string.format("%sv1/verified-signup/challenge", UrlModule.AUTH_URL), "POST", {
		postBody = HttpService:JSONEncode({ deliveryMethod = 0, deliveryTarget = DeliveryTarget })
	})
end