local HttpService = game:GetService("HttpService")
local SubscriptionId = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Http.UrlBuilder).fromString("apis:developer-subscriptions/v1/subscriptions/{subscriptionId}")

return function(Callback, SubscriptionId1, IsAutoRenewing)
	-- upvalues: SubscriptionId (copy), HttpService (copy)
	return Callback(SubscriptionId({ subscriptionId = SubscriptionId1 }), "PATCH", {
		postBody = HttpService:JSONEncode({ isAutoRenewing = IsAutoRenewing })
	})
end