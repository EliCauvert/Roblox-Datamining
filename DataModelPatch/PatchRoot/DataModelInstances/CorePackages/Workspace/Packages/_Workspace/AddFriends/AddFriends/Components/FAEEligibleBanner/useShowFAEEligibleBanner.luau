local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local FAEUpsellBannerDismissalCacheModule = require(script.Parent.FAEUpsellBannerDismissalCache)
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AmpEnums = require(Parent.AmpUpsell).AmpEnums
local SharedFlagsModule = require(Parent.SharedFlags)
local FStringEligibleToAgeVerifyAmpFeature = if SharedFlagsModule.FFlagAddFriendsPageUpdateAmpRules then SharedFlagsModule.FStringEligibleToAgeVerifyAmpFeature else SharedFlagsModule.FStringEligibleForFacialAgeEstimationAmpFeature
local FStringAgeCheckAmpNameSpace = SharedFlagsModule.FStringAgeCheckAmpNameSpace

return function()
	-- upvalues: ReactModule (copy), FAEUpsellBannerDismissalCacheModule (copy), AmpApiProvider (copy), FStringEligibleToAgeVerifyAmpFeature (copy), FStringAgeCheckAmpNameSpace (copy), AmpEnums (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(FAEUpsellBannerDismissalCacheModule.isDismissed)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: AmpApiProvider (upval), FStringEligibleToAgeVerifyAmpFeature (upval), FStringAgeCheckAmpNameSpace (upval), AmpEnums (upval), UseStateResult2_1 (copy)
		if AmpApiProvider.upsellFeatureAccess(FStringEligibleToAgeVerifyAmpFeature, {}, FStringAgeCheckAmpNameSpace).access == AmpEnums.AccessResponseEnum.Granted then
			UseStateResult2_1(true)
		end
	end, {})
	
	return not UseStateResult and UseStateResult1, (ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), FAEUpsellBannerDismissalCacheModule (upval)
		UseStateResult2(true)
		FAEUpsellBannerDismissalCacheModule.markDismissed()
	end, { UseStateResult2 }))
end