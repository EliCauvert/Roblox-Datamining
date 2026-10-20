local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local ReactModule = require(Parent.React)
local UseFireAnalyticsEventModule = require(AddFriends.Analytics.useFireAnalyticsEvent)
local EventNamesModule = require(AddFriends.Analytics.EventNames)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagAddFriendsPageUpdateAmpRules = SharedFlagsModule.FFlagAddFriendsPageUpdateAmpRules
local FFlagMakeVPCFAECheckMoreGeneric = SharedFlagsModule.FFlagMakeVPCFAECheckMoreGeneric
local FStringEligibleToAgeVerifyAmpFeature = SharedFlagsModule.FStringEligibleToAgeVerifyAmpFeature
local FStringEligibleForFacialAgeEstimationAmpFeature = SharedFlagsModule.FStringEligibleForFacialAgeEstimationAmpFeature
local FStringAgeCheckAmpNameSpace = SharedFlagsModule.FStringAgeCheckAmpNameSpace
local AmpUpsellModule = require(Parent.AmpUpsell)
local AmpApiProvider = AmpUpsellModule.AmpApiProvider
local AmpEnums = AmpUpsellModule.AmpEnums
local AutoPromptStatus = require(Parent.ContactImporter).Signals.autoPromptStatus
local SocialUpsellModule = require(Parent.SocialUpsell)
local UseSocialUpsellOverlayControllerFunction = SocialUpsellModule.Hooks.useSocialUpsellOverlayController
local SocialUpsellType = SocialUpsellModule.Enums.SocialUpsellType
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local UpsellComponent = SocialUpsellModule.Analytics.Enum.UpsellComponent
local FAEUpsellOnAfpImpressionCacheModule = require(script.Parent.FAEUpsellOnAfpImpressionCache)
local FAEUpsellOnAfpImpressionCap = game:DefineFastInt("FAEUpsellOnAfpImpressionCap", 1)

local function isAlreadyShownInitState(): boolean
	-- upvalues: FAEUpsellOnAfpImpressionCacheModule (copy), FAEUpsellOnAfpImpressionCap (copy)
	local Value: number = FAEUpsellOnAfpImpressionCacheModule.getValue()
	
	return Value < 0 or FAEUpsellOnAfpImpressionCap <= Value
end

return function()
	-- upvalues: UseFireAnalyticsEventModule (copy), ReactModule (copy), isAlreadyShownInitState (copy), UseSocialUpsellOverlayControllerFunction (copy), FAEUpsellOnAfpImpressionCacheModule (copy), EventNamesModule (copy), SocialUpsellType (copy), UpsellEntrySurfaceType (copy), UpsellComponent (copy), FFlagMakeVPCFAECheckMoreGeneric (copy), FFlagAddFriendsPageUpdateAmpRules (copy), AmpApiProvider (copy), FStringEligibleToAgeVerifyAmpFeature (copy), FStringEligibleForFacialAgeEstimationAmpFeature (copy), FStringAgeCheckAmpNameSpace (copy), AmpEnums (copy), AutoPromptStatus (copy)
	local UseFireAnalyticsEventModuleResult = UseFireAnalyticsEventModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(isAlreadyShownInitState)
	local UseSocialUpsellOverlayControllerResult = UseSocialUpsellOverlayControllerFunction(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), FAEUpsellOnAfpImpressionCacheModule (upval), UseFireAnalyticsEventModuleResult (copy), EventNamesModule (upval), UseSocialUpsellOverlayControllerResult (copy), SocialUpsellType (upval), UpsellEntrySurfaceType (upval), UpsellComponent (upval), FFlagMakeVPCFAECheckMoreGeneric (upval), FFlagAddFriendsPageUpdateAmpRules (upval)
		UseStateResult2(true)
		FAEUpsellOnAfpImpressionCacheModule.incrementValue()
		UseFireAnalyticsEventModuleResult(EventNamesModule.FAEModalImpression)
		UseSocialUpsellOverlayControllerResult.openSocialOverlay(SocialUpsellType.FacialAgeEstimation, {
			upsellEntrySurface = UpsellEntrySurfaceType.AddFriendsPage,
			upsellEntryComponent = UpsellComponent.Modal,
			entryPointEventCtx = SocialUpsellType.FacialAgeEstimation .. UpsellEntrySurfaceType.AddFriendsPage,
			shouldIncludeVPC = if FFlagMakeVPCFAECheckMoreGeneric and FFlagAddFriendsPageUpdateAmpRules then true else nil
		})
	end, {
		UseFireAnalyticsEventModuleResult,
		UseSocialUpsellOverlayControllerResult.openSocialOverlay
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), AmpApiProvider (upval), FFlagAddFriendsPageUpdateAmpRules (upval), FStringEligibleToAgeVerifyAmpFeature (upval), FStringEligibleForFacialAgeEstimationAmpFeature (upval), FStringAgeCheckAmpNameSpace (upval), AmpEnums (upval), UseResult (copy), AutoPromptStatus (upval)
		if UseStateResult then return end
		local Flag = false
		
		local function tryDispatchFAEUpsell(Status)
			-- upvalues: Flag (ref), AmpApiProvider (upval), FFlagAddFriendsPageUpdateAmpRules (upval), FStringEligibleToAgeVerifyAmpFeature (upval), FStringEligibleForFacialAgeEstimationAmpFeature (upval), FStringAgeCheckAmpNameSpace (upval), AmpEnums (upval), UseResult (upval)
			if Flag then return end
			if Status == nil or Status then return end
			if AmpApiProvider.upsellFeatureAccess(if FFlagAddFriendsPageUpdateAmpRules then FStringEligibleToAgeVerifyAmpFeature else FStringEligibleForFacialAgeEstimationAmpFeature, {}, FStringAgeCheckAmpNameSpace).access == AmpEnums.AccessResponseEnum.Granted then
				Flag = true
				UseResult()
				
				return
			end
		end
		
		local StatusChangedConnection = AutoPromptStatus.statusChanged:connect(tryDispatchFAEUpsell)
		tryDispatchFAEUpsell(AutoPromptStatus.getStatus())
		
		return function()
			-- upvalues: StatusChangedConnection (copy)
			StatusChangedConnection:disconnect()
		end
	end, { UseStateResult, UseStateResult2, UseResult })
end