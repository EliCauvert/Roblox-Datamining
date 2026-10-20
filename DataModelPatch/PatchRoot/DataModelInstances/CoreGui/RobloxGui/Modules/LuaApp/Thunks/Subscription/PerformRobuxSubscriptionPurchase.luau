local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local PurchaseSubscriptionWithRobuxModule = require(Modules.LuaApp.Http.Requests.SubscriptionsApi.PurchaseSubscriptionWithRobux)

return function(p1, p2, p3)
	-- upvalues: PurchaseSubscriptionWithRobuxModule (copy), PromiseModule (copy)
	return PurchaseSubscriptionWithRobuxModule(p1, p2, p3):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(Result.responseBody)
	end, function(p4)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p4)
	end)
end