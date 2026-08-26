local robloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local reactModule = require(robloxSubscriptionPurchaseApp.Parent.React)
local robloxPlusUnifiedBuyModalBannerImpressionModule = require(robloxSubscriptionPurchaseApp.Storage.RobloxPlusUnifiedBuyModalBannerImpression)
local fIntNewBadgeMaximumImpressionCountModule = require(robloxSubscriptionPurchaseApp.Flags.FIntNewBadgeMaximumImpressionCount)

return function(p1)
	-- upvalues: reactModule (ref), robloxPlusUnifiedBuyModalBannerImpressionModule (ref), fIntNewBadgeMaximumImpressionCountModule (ref)
	local var1 = reactModule.useState(function()
		-- upvalues: robloxPlusUnifiedBuyModalBannerImpressionModule (copy)
		return robloxPlusUnifiedBuyModalBannerImpressionModule.getImpressionCount()
	end) < fIntNewBadgeMaximumImpressionCountModule
	
	return {
		shouldShowNewBadge = var1,
		onActivated = reactModule.useCallback(function()
			-- upvalues: var1 (ref), robloxPlusUnifiedBuyModalBannerImpressionModule (copy), p1 (ref)
			if var1 then
				robloxPlusUnifiedBuyModalBannerImpressionModule.incrementImpressionCount()
			end
			p1()
		end, { var1, p1 })
	}
end