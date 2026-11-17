local PromiseModule = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Promise)

return function()
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve()
end