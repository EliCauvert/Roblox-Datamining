local BuyRobuxRoutingModule = require(script.Parent.BuyRobuxRouting)

return {
	openBuyRobux = function(p1, Callback: (any) -> (), p2)
		-- upvalues: BuyRobuxRoutingModule (copy)
		BuyRobuxRoutingModule.logBuyRobuxRoutingCallsite(p2)
		local ResolveAndLogDestinationResult = BuyRobuxRoutingModule.resolveAndLogDestination(p1)
		
		if ResolveAndLogDestinationResult.kind == "web" then
			Callback(ResolveAndLogDestinationResult.url)
			
			return
		else
			Callback(BuyRobuxRoutingModule.fallbackWebUrl(p1))
		end
	end,
	["jest.config"] = script["jest.config"]
}