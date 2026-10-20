local PromiseModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Promise)
local MarketplaceService = game:GetService("MarketplaceService")

return function(_, SubscriptionId)
	-- upvalues: PromiseModule (copy), MarketplaceService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
		-- upvalues: MarketplaceService (upval), SubscriptionId (copy)
		local Success, Result = pcall(function()
			-- upvalues: MarketplaceService (upval), SubscriptionId (upval)
			return MarketplaceService:GetUserSubscriptionDetailsInternalAsync(SubscriptionId)
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1(Result)
		end
	end)
end