local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local TCBannerImpressionCacheModule = require(script.Parent.TCBannerImpressionCache)
local FIntAddFriendsTrustedContactsImpressionCapModule = require(script.Parent.FIntAddFriendsTrustedContactsImpressionCap)
local AmpApiProvider = require(Parent.AmpUpsell).AmpApiProvider
local AmpEnums = require(Parent.AmpUpsell).AmpEnums
local FStringCanAccessTrustedContactsAmpFeature = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature
local FStringCanAccessTrustedContactsAmpNameSpace = require(Parent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace

local function isBannerHiddenInitState(): boolean
	-- upvalues: TCBannerImpressionCacheModule (copy), FIntAddFriendsTrustedContactsImpressionCapModule (copy)
	local Value: number = TCBannerImpressionCacheModule.getValue()
	
	return Value < 0 or FIntAddFriendsTrustedContactsImpressionCapModule <= Value
end

return function()
	-- upvalues: ReactModule (copy), isBannerHiddenInitState (copy), AmpApiProvider (copy), FStringCanAccessTrustedContactsAmpFeature (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), AmpEnums (copy), TCBannerImpressionCacheModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(isBannerHiddenInitState)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: AmpApiProvider (upval), FStringCanAccessTrustedContactsAmpFeature (upval), FStringCanAccessTrustedContactsAmpNameSpace (upval), AmpEnums (upval), UseStateResult2_1 (copy)
		if AmpApiProvider.upsellFeatureAccess(FStringCanAccessTrustedContactsAmpFeature, {}, FStringCanAccessTrustedContactsAmpNameSpace).access == AmpEnums.AccessResponseEnum.Granted then
			UseStateResult2_1(true)
		end
	end, {})
	
	return not UseStateResult and UseStateResult1, ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), TCBannerImpressionCacheModule (upval)
		UseStateResult2(true)
		TCBannerImpressionCacheModule.dismissValue()
	end, { UseStateResult2 }), (ReactModule.useCallback(function()
		-- upvalues: TCBannerImpressionCacheModule (upval)
		TCBannerImpressionCacheModule.incrementValue()
	end, {}))
end