local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local reactModule = require(robloxSubscriptionPurchaseApp.Parent.React)
local robloxPlusUnifiedBuyModalBannerImpressionModule = require(robloxSubscriptionPurchaseApp.Storage.RobloxPlusUnifiedBuyModalBannerImpression)
local fIntNewBadgeMaximumImpressionCountModule = require(robloxSubscriptionPurchaseApp.Flags.FIntNewBadgeMaximumImpressionCount)

return function(p0) --[[ line: 24 | named "useRobloxPlusUpsellBannerNewBadgeInteraction" ]]
	-- upvalues: reactModule (ref), robloxPlusUnifiedBuyModalBannerImpressionModule (ref), fIntNewBadgeMaximumImpressionCountModule (ref)
	local var4 = reactModule.useState(function() --[[ line: 27 ]]
		-- upvalues: robloxPlusUnifiedBuyModalBannerImpressionModule (copy)
		return robloxPlusUnifiedBuyModalBannerImpressionModule.getImpressionCount()
	end) < fIntNewBadgeMaximumImpressionCountModule
	
	return {
		shouldShowNewBadge = var4,
		onActivated = reactModule.useCallback(function() --[[ line: 33 ]]
			-- upvalues: var4 (ref), robloxPlusUnifiedBuyModalBannerImpressionModule (copy), p0 (ref)
			if var4 then
				robloxPlusUnifiedBuyModalBannerImpressionModule.incrementImpressionCount()
			end
			p0()
		end, { var4, p0 })
	}
end