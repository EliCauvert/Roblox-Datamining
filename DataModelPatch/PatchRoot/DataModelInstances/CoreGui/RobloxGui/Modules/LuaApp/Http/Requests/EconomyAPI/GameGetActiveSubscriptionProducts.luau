local UrlModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.Url)

return function(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%sv1/subscriptions/active-subscription-products?subscriptionProductType=1&subscriptionProviderId=%s", UrlModule.APIS_URL, p1), "GET")
end