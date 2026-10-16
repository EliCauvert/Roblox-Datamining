local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local ReactModule = require(RobloxSubscriptionPurchaseApp.Parent.React)
local RobloxPlusUnifiedBuyModalBannerImpressionModule = require(RobloxSubscriptionPurchaseApp.Storage.RobloxPlusUnifiedBuyModalBannerImpression)
local FIntNewBadgeMaximumImpressionCountModule = require(RobloxSubscriptionPurchaseApp.Flags.FIntNewBadgeMaximumImpressionCount)

return function(Callback) --[[ Line: 24 | Named "useRobloxPlusUpsellBannerNewBadgeInteraction" ]]
	-- upvalues: ReactModule (copy), RobloxPlusUnifiedBuyModalBannerImpressionModule (copy), FIntNewBadgeMaximumImpressionCountModule (copy)
	local IsUseStateResultBelow = ReactModule.useState(function() --[[ Line: 27 ]]
		-- upvalues: RobloxPlusUnifiedBuyModalBannerImpressionModule (upval)
		return RobloxPlusUnifiedBuyModalBannerImpressionModule.getImpressionCount()
	end) < FIntNewBadgeMaximumImpressionCountModule
	
	return {
		shouldShowNewBadge = IsUseStateResultBelow,
		onActivated = ReactModule.useCallback(function() --[[ Line: 33 ]]
			-- upvalues: IsUseStateResultBelow (copy), RobloxPlusUnifiedBuyModalBannerImpressionModule (upval), Callback (copy)
			if IsUseStateResultBelow then
				RobloxPlusUnifiedBuyModalBannerImpressionModule.incrementImpressionCount()
			end
			Callback()
		end, { IsUseStateResultBelow, Callback })
	}
end