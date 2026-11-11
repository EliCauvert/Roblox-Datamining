local ApiFetchIAPProductsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.ApiFetchIAPProducts)

return function(p1, _)
	-- upvalues: ApiFetchIAPProductsModule (copy)
	local Subscriptions = p1.IAPProducts.Subscriptions
	
	return {
		screenSize = p1.ScreenSize,
		subscriptionProduct = Subscriptions and Subscriptions[1] or nil,
		iapProductsFetchingStatus = ApiFetchIAPProductsModule.GetFetchingStatus(p1)
	}
end