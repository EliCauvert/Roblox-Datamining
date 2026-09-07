local robloxSubscriptionPurchaseAppModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.RobloxSubscriptionPurchaseApp)
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local robloxSubscriptionFlowCompleteReason = robloxSubscriptionPurchaseAppModule.RobloxSubscriptionFlowCompleteReason

return function(p1)
	-- upvalues: robloxSubscriptionPurchaseAppModule (ref), robloxSubscriptionFlowCompleteReason (ref), surfaceName (ref), surfaceContext (ref)
	robloxSubscriptionPurchaseAppModule.initiateRobloxSubscriptionPurchase({ showBackButton = true }, {
		onFlowComplete = function(p2)
			-- upvalues: robloxSubscriptionFlowCompleteReason (copy), p1 (ref)
			if p2 == robloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
				p1.onPurchaseSucceeded()
			end
		end
	}, nil, surfaceName.BulkPurchasePrompt, surfaceContext.InGame, nil, nil)
end