local MarketplaceService = game:GetService("MarketplaceService")
local PromiseModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise)

return function(SubscriptionId, p1)
	-- upvalues: PromiseModule (copy), MarketplaceService (copy)
	local P1 = p1 or ""
	
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
		-- upvalues: MarketplaceService (upval), SubscriptionId (copy), P1 (copy)
		local Success, Result = pcall(function()
			-- upvalues: MarketplaceService (upval), SubscriptionId (upval), P1 (upval)
			MarketplaceService:PerformSubscriptionPurchaseV2(SubscriptionId, P1)
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1(Result)
		end
	end)
end