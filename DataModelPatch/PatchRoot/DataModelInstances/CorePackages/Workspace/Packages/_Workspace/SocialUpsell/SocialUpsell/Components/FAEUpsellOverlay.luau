local SocialUpsell = script:FindFirstAncestor("SocialUpsell")
local Parent = SocialUpsell.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local FIntCommsFAELockTimestampModule = require(SocialUpsell.Flag.FIntCommsFAELockTimestamp)
local UpsellOverlayModule = require(SocialUpsell.Components.UpsellOverlay)
local CreateCommonOverlayPropsModule = require(SocialUpsell.Utils.createCommonOverlayProps)
local StartFacialAgeEstimationModule = require(SocialUpsell.Thunks.startFacialAgeEstimation)
local UpsellEntrySurfaceTypeModule = require(SocialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local SocialUpsellTypeModule = require(SocialUpsell.Enum.SocialUpsellType)
local UpsellComponentModule = require(SocialUpsell.Analytics.Enum.UpsellComponent)
local FFlagEnableCountdownBadgeModule = require(SocialUpsell.Flag.FFlagEnableCountdownBadge)
local FFlagSupportVPCModule = require(SocialUpsell.Flag.FFlagSupportVPC)
local Assets = FoundationCloudAssetsModule.Assets
local PreloadAssetFunction: (any) -> () = FoundationCloudAssetsModule.preloadAsset
local AmpUpsellModule = require(Parent.AmpUpsell)
local OpenAmpWizardContainerFunction = AmpUpsellModule.OpenAmpWizardContainer
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature = SharedFlagsModule.FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature
local FStringCoreContentAmpNameSpace = SharedFlagsModule.FStringCoreContentAmpNameSpace
PreloadAssetFunction("pictograms/chat_security")
local PictogramsChatSecurity = Assets["pictograms/chat_security"]
local AssetId = PictogramsChatSecurity and PictogramsChatSecurity.assetId or nil
local FFlagAddFriendsPageFAEUpsell = SharedFlagsModule.FFlagAddFriendsPageFAEUpsell
local FFlagAddFriendsPageUpdateAmpRules = SharedFlagsModule.FFlagAddFriendsPageUpdateAmpRules
local FFlagMakeVPCFAECheckMoreGeneric = SharedFlagsModule.FFlagMakeVPCFAECheckMoreGeneric
local AssetId1 = nil

if FFlagAddFriendsPageFAEUpsell then
	PreloadAssetFunction("pictograms/lock_closed")
	local PictogramsLockClosed = Assets["pictograms/lock_closed"]
	AssetId1 = PictogramsLockClosed and PictogramsLockClosed.assetId or nil
end
local UseSocialUpsellOverlayControllerModule = require(SocialUpsell.Hooks.useSocialUpsellOverlayController)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagEnableAEGIS2CommsFAEUpsell = SharedFlagsModule.FFlagEnableAEGIS2CommsFAEUpsell
local AEGISPhase2ShowImageOnFAEOverlay = game:DefineFastFlag("AEGISPhase2ShowImageOnFAEOverlay", false)
local ForceAegisPhase2Modal = game:DefineFastFlag("ForceAegisPhase2Modal", false)
local FFlagTFWithActionsCheck = require(Parent.SharedFlags).FFlagTFWithActionsCheck

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSocialUpsellOverlayControllerModule (copy), UseLocalizationFunction (copy), FFlagAddFriendsPageFAEUpsell (copy), FFlagEnableAEGIS2CommsFAEUpsell (copy), FFlagTFWithActionsCheck (copy), ReactModule (copy), ForceAegisPhase2Modal (copy), UpsellEntrySurfaceTypeModule (copy), UpsellComponentModule (copy), FFlagSupportVPCModule (copy), FFlagMakeVPCFAECheckMoreGeneric (copy), FFlagAddFriendsPageUpdateAmpRules (copy), SocialUpsellTypeModule (copy), OpenAmpWizardContainerFunction (copy), FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (copy), AccessResponseEnum (copy), FStringCoreContentAmpNameSpace (copy), StartFacialAgeEstimationModule (copy), FFlagEnableCountdownBadgeModule (copy), FIntCommsFAELockTimestampModule (copy), UpsellOverlayModule (copy), CreateCommonOverlayPropsModule (copy), AssetId1 (ref), AEGISPhase2ShowImageOnFAEOverlay (copy), AssetId (copy)
	local P0 = p1 or {}
	local UseDispatchResult = UseDispatchFunction()
	local UseSocialUpsellOverlayControllerModuleResult = UseSocialUpsellOverlayControllerModule(P0.isInExperience)
	local UseLocalizationResult = UseLocalizationFunction({
		ToKeepChattingLetsCheckYourAge = "Feature.FAE.Label.ToKeepChattingLetsCheckYourAge",
		ModalBodyInApp = "Feature.FAE.Label.ModalBodyInApp",
		LetsCheckYourAgeSoYouCanUseChat = "Feature.FAE.Label.LetsCheckYourAgeSoYouCanUseChat",
		ModalBodyInAppV3 = "Feature.FAE.Label.ModalBodyInAppV3",
		YourSafetyMattersLetsCheckYourAge = "Feature.FAE.Label.YourSafetyMattersLetsCheckYourAge",
		YouNeedAnAgeCheckToUseChatThisMakesChatSafer = "Feature.FAE.Label.YouNeedAnAgeCheckToUseChatThisMakesChatSafer",
		Continue = "Feature.FAE.Action.Continue",
		ThisHelpsYouToChatSafelyItOnlyTakesAMoment = "Feature.FAE.Label.ThisHelpsYouToChatSafelyItOnlyTakesAMoment",
		ChatWithFriends = if FFlagAddFriendsPageFAEUpsell then "Feature.FAE.Label.ChatWithFriends" else nil,
		GetASecureAgeCheckToUnlockChatAndAddTrustedFriends = if FFlagAddFriendsPageFAEUpsell then "Feature.FAE.Label.GetASecureAgeCheckToUnlockChatAndAddTrustedFriends" else nil,
		Unlock = if FFlagAddFriendsPageFAEUpsell then "Feature.FAE.Action.Unlock" else nil,
		ThisAllowsYouToChatSafelyItOnlyTakesAMoment = if FFlagEnableAEGIS2CommsFAEUpsell then "Feature.FAE.Label.ThisAllowsYouToChatSafelyItOnlyTakesAMoment" else nil,
		UnlockChat = if FFlagEnableAEGIS2CommsFAEUpsell then "Feature.FAE.Action.UnlockChat" else nil,
		LetsCheckYourAge = if FFlagTFWithActionsCheck then "Feature.FAE.Label.LetsCheckYourAge" else nil,
		ToAddTrustedFriendDoAgeCheck = if FFlagTFWithActionsCheck then "Feature.FAE.Label.ModalBodyTFUnlock" else nil
	})
	local UseRefResult = ReactModule.useRef(false)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: FFlagEnableAEGIS2CommsFAEUpsell (upval), ForceAegisPhase2Modal (upval), P0 (copy), UseLocalizationResult (copy), UpsellEntrySurfaceTypeModule (upval), UpsellComponentModule (upval), FFlagAddFriendsPageFAEUpsell (upval), FFlagTFWithActionsCheck (upval)
		if FFlagEnableAEGIS2CommsFAEUpsell and (ForceAegisPhase2Modal or P0.isPhase2) then
			return UseLocalizationResult.LetsCheckYourAgeSoYouCanUseChat, UseLocalizationResult.ThisHelpsYouToChatSafelyItOnlyTakesAMoment
		elseif P0.upsellEntrySurface == UpsellEntrySurfaceTypeModule.Homepage and P0.upsellEntryComponent == UpsellComponentModule.Modal or P0.upsellEntrySurface == UpsellEntrySurfaceTypeModule.NotifPush then
			return UseLocalizationResult.YourSafetyMattersLetsCheckYourAge, UseLocalizationResult.YouNeedAnAgeCheckToUseChatThisMakesChatSafer
		elseif FFlagAddFriendsPageFAEUpsell and P0.upsellEntrySurface == UpsellEntrySurfaceTypeModule.AddFriendsPage then
			return UseLocalizationResult.ChatWithFriends, UseLocalizationResult.GetASecureAgeCheckToUnlockChatAndAddTrustedFriends
		elseif FFlagTFWithActionsCheck and (P0.upsellEntrySurface == UpsellEntrySurfaceTypeModule.TrustedFriends or P0.upsellEntrySurface == UpsellEntrySurfaceTypeModule.TrustedFriendsInExperience) then
			return UseLocalizationResult.LetsCheckYourAge, UseLocalizationResult.ToAddTrustedFriendDoAgeCheck
		else
			return UseLocalizationResult.LetsCheckYourAgeSoYouCanUseChat, UseLocalizationResult.ModalBodyInAppV3
		end
	end, {
		if FFlagEnableAEGIS2CommsFAEUpsell then P0.isPhase2 else nil,
		P0.upsellEntrySurface,
		UseLocalizationResult,
		if FFlagAddFriendsPageFAEUpsell then P0.upsellEntryComponent else nil
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSocialUpsellOverlayControllerModuleResult (copy), P0 (copy), FFlagSupportVPCModule (upval), FFlagMakeVPCFAECheckMoreGeneric (upval), FFlagAddFriendsPageUpdateAmpRules (upval), SocialUpsellTypeModule (upval), UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval), FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (upval), AccessResponseEnum (upval), FStringCoreContentAmpNameSpace (upval), UpsellEntrySurfaceTypeModule (upval), FFlagEnableAEGIS2CommsFAEUpsell (upval), StartFacialAgeEstimationModule (upval)
		UseSocialUpsellOverlayControllerModuleResult.closeSocialOverlay()
		
		if P0.onAccept then
			P0.onAccept()
		end
		if not FFlagSupportVPCModule then
			if FFlagMakeVPCFAECheckMoreGeneric then
				if FFlagAddFriendsPageUpdateAmpRules and P0.shouldIncludeVPC then
					UseDispatchResult(OpenAmpWizardContainerFunction(FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, function(Granted, _)
						-- upvalues: AccessResponseEnum (upval), P0 (upval)
						if Granted == AccessResponseEnum.Granted then
							if P0.onSuccess then
								P0.onSuccess()
								
								return
							end
						elseif P0.onFailure then
							P0.onFailure()
						end
					end, nil, P0.entryPointEventCtx or SocialUpsellTypeModule.FacialAgeEstimation .. (P0.upsellEntrySurface or ""), nil, FStringCoreContentAmpNameSpace))
					
					return
				end
			elseif FFlagAddFriendsPageUpdateAmpRules and P0.upsellEntrySurface == UpsellEntrySurfaceTypeModule.AddFriendsPage then
				UseDispatchResult(OpenAmpWizardContainerFunction(FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, function(Granted, _)
					-- upvalues: AccessResponseEnum (upval), P0 (upval)
					if Granted == AccessResponseEnum.Granted then
						if P0.onSuccess then
							P0.onSuccess()
							
							return
						end
					elseif P0.onFailure then
						P0.onFailure()
					end
				end, nil, P0.entryPointEventCtx or SocialUpsellTypeModule.FacialAgeEstimation .. UpsellEntrySurfaceTypeModule.AddFriendsPage, nil, FStringCoreContentAmpNameSpace, nil, nil, nil, true))
				
				return
			end
		end
		if game.JobId == "" or FFlagEnableAEGIS2CommsFAEUpsell then
			UseDispatchResult(StartFacialAgeEstimationModule(if FFlagSupportVPCModule and P0.shouldIncludeVPC then P0.entryPointEventCtx or SocialUpsellTypeModule.FacialAgeEstimation .. (P0.upsellEntrySurface or "") else P0.entryPointEventCtx, P0.onSuccess, P0.onFailure, P0.upsellEntrySurface, if FFlagEnableAEGIS2CommsFAEUpsell then P0.isInExperience else nil, if FFlagSupportVPCModule then P0.shouldIncludeVPC else nil))
			
			return
		end
	end, {
		UseDispatchResult,
		UseSocialUpsellOverlayControllerModuleResult.closeSocialOverlay,
		P0.upsellEntrySurface, P0.entryPointEventCtx, P0.onAccept, P0.onSuccess,
		P0.onFailure, P0.isInExperience,
		if FFlagSupportVPCModule or FFlagMakeVPCFAECheckMoreGeneric then P0.shouldIncludeVPC else nil
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: P0 (copy)
		if P0.onDismiss then
			P0.onDismiss()
		end
	end, { P0.onDismiss })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FFlagEnableCountdownBadgeModule (upval), P0 (copy), FIntCommsFAELockTimestampModule (upval)
		return if FFlagEnableCountdownBadgeModule and P0.countDownBadgeText then {
			text = P0.countDownBadgeText,
			deadlineUtcTimestamp = FIntCommsFAELockTimestampModule
		} else nil
	end, { P0.countDownBadgeText })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: FFlagAddFriendsPageFAEUpsell (upval), P0 (copy), UpsellEntrySurfaceTypeModule (upval), UseLocalizationResult (copy), FFlagEnableAEGIS2CommsFAEUpsell (upval), ForceAegisPhase2Modal (upval), UseResult (copy)
		return {
			text = if FFlagAddFriendsPageFAEUpsell and P0.upsellEntrySurface == UpsellEntrySurfaceTypeModule.AddFriendsPage then UseLocalizationResult.Unlock elseif FFlagEnableAEGIS2CommsFAEUpsell and (ForceAegisPhase2Modal or P0.isPhase2) then if P0.isInExperience then UseLocalizationResult.Continue else UseLocalizationResult.UnlockChat else UseLocalizationResult.Continue,
			onActivated = UseResult
		}
	end, {
		if FFlagEnableAEGIS2CommsFAEUpsell then P0.isPhase2 else nil,
		P0.isInExperience,
		UseLocalizationResult,
		UseResult,
		if FFlagAddFriendsPageFAEUpsell then P0.upsellEntrySurface else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), P0 (copy)
		if not UseRefResult.current and P0.onMounted then
			P0.onMounted()
		end
		UseRefResult.current = true
	end, { P0.onMounted })
	
	return ReactModule.createElement(UpsellOverlayModule, CreateCommonOverlayPropsModule({
		onClose = UseResult1,
		countDownBadge = UseMemoResult1,
		bodyText = UseMemoResult2,
		title = UseMemoResult,
		imageId = if FFlagAddFriendsPageFAEUpsell and P0.upsellEntrySurface == UpsellEntrySurfaceTypeModule.AddFriendsPage then AssetId1 elseif FFlagEnableAEGIS2CommsFAEUpsell and (ForceAegisPhase2Modal or P0.isPhase2) and (not AEGISPhase2ShowImageOnFAEOverlay and P0.isInExperience) then nil else AssetId,
		primaryAction = UseMemoResult3,
		impressionId = P0.impressionId,
		upsellEntryComponent = P0.upsellEntryComponent,
		upsellEntrySurface = P0.upsellEntrySurface,
		upsellPurpose = SocialUpsellTypeModule.FacialAgeEstimation,
		containerRef = P0.containerRef
	}, P0))
end