local PromiseModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.Promise)
local MarketplaceService = game:GetService("MarketplaceService")

return function(_, SubscriptionId) --[[ Line: 6 | Named "getUserSubscriptionDetails" ]]
	-- upvalues: PromiseModule (copy), MarketplaceService (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ()) --[[ Line: 7 ]]
		-- upvalues: MarketplaceService (upval), SubscriptionId (copy)
		local Success, Result = pcall(function() --[[ Line: 8 ]]
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