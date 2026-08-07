local socialUpsell = script:FindFirstAncestor("SocialUpsell")
local parent = socialUpsell.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local foundationCloudAssetsModule = require(parent.FoundationCloudAssets)
local fIntCommsFAELockTimestampModule = require(socialUpsell.Flag.FIntCommsFAELockTimestamp)
local upsellOverlayModule = require(socialUpsell.Components.UpsellOverlay)
local createCommonOverlayPropsModule = require(socialUpsell.Utils.createCommonOverlayProps)
local startFacialAgeEstimationModule = require(socialUpsell.Thunks.startFacialAgeEstimation)
local upsellEntrySurfaceTypeModule = require(socialUpsell.Analytics.Enum.UpsellEntrySurfaceType)
local socialUpsellTypeModule = require(socialUpsell.Enum.SocialUpsellType)
local upsellComponentModule = require(socialUpsell.Analytics.Enum.UpsellComponent)
local fFlagEnableCountdownBadgeModule = require(socialUpsell.Flag.FFlagEnableCountdownBadge)
local fFlagSupportVPCModule = require(socialUpsell.Flag.FFlagSupportVPC)
local assets = foundationCloudAssetsModule.Assets
local preloadAsset = foundationCloudAssetsModule.preloadAsset
local ampUpsellModule = require(parent.AmpUpsell)
local openAmpWizardContainer = ampUpsellModule.OpenAmpWizardContainer
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature = sharedFlagsModule.FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature
local fStringCoreContentAmpNameSpace = sharedFlagsModule.FStringCoreContentAmpNameSpace
preloadAsset("pictograms/chat_security")
local chatSecurity = assets["pictograms/chat_security"]
local var14 = if chatSecurity then chatSecurity.assetId else nil
local fFlagAddFriendsPageFAEUpsell = sharedFlagsModule.FFlagAddFriendsPageFAEUpsell
local fFlagAddFriendsPageUpdateAmpRules = sharedFlagsModule.FFlagAddFriendsPageUpdateAmpRules
local fFlagMakeVPCFAECheckMoreGeneric = sharedFlagsModule.FFlagMakeVPCFAECheckMoreGeneric
local var15 = nil

if fFlagAddFriendsPageFAEUpsell then
	preloadAsset("pictograms/lock_closed")
	local lockClosed = assets["pictograms/lock_closed"]
	var15 = if lockClosed then lockClosed.assetId else nil
end
local useSocialUpsellOverlayControllerModule = require(socialUpsell.Hooks.useSocialUpsellOverlayController)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagEnableAEGIS2CommsFAEUpsell = sharedFlagsModule.FFlagEnableAEGIS2CommsFAEUpsell
local AEGISPhase2ShowImageOnFAEOverlay = game:DefineFastFlag("AEGISPhase2ShowImageOnFAEOverlay", false)
local forceAegisPhase2Modal = game:DefineFastFlag("ForceAegisPhase2Modal", false)
local fFlagTFWithActionsCheck = require(parent.SharedFlags).FFlagTFWithActionsCheck

return function(p0) --[[ line: 76 ]]
	-- upvalues: useDispatch (ref), useSocialUpsellOverlayControllerModule (ref), useLocalization (ref), fFlagAddFriendsPageFAEUpsell (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), fFlagTFWithActionsCheck (ref), reactModule (ref), forceAegisPhase2Modal (ref), upsellEntrySurfaceTypeModule (ref), upsellComponentModule (ref), fFlagSupportVPCModule (ref), fFlagMakeVPCFAECheckMoreGeneric (ref), fFlagAddFriendsPageUpdateAmpRules (ref), socialUpsellTypeModule (ref), openAmpWizardContainer (ref), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (ref), accessResponseEnum (ref), fStringCoreContentAmpNameSpace (ref), startFacialAgeEstimationModule (ref), fFlagEnableCountdownBadgeModule (ref), fIntCommsFAELockTimestampModule (ref), upsellOverlayModule (ref), createCommonOverlayPropsModule (ref), var15 (write), AEGISPhase2ShowImageOnFAEOverlay (ref), var14 (ref)
	p0 = p0 or {}
	local var20 = useDispatch()
	local var21 = useSocialUpsellOverlayControllerModule(p0.isInExperience)
	local var22 = useLocalization({
		ToKeepChattingLetsCheckYourAge = "Feature.FAE.Label.ToKeepChattingLetsCheckYourAge",
		ModalBodyInApp = "Feature.FAE.Label.ModalBodyInApp",
		LetsCheckYourAgeSoYouCanUseChat = "Feature.FAE.Label.LetsCheckYourAgeSoYouCanUseChat",
		ModalBodyInAppV3 = "Feature.FAE.Label.ModalBodyInAppV3",
		YourSafetyMattersLetsCheckYourAge = "Feature.FAE.Label.YourSafetyMattersLetsCheckYourAge",
		YouNeedAnAgeCheckToUseChatThisMakesChatSafer = "Feature.FAE.Label.YouNeedAnAgeCheckToUseChatThisMakesChatSafer",
		Continue = "Feature.FAE.Action.Continue",
		ThisHelpsYouToChatSafelyItOnlyTakesAMoment = "Feature.FAE.Label.ThisHelpsYouToChatSafelyItOnlyTakesAMoment",
		ChatWithFriends = if fFlagAddFriendsPageFAEUpsell then "Feature.FAE.Label.ChatWithFriends" else nil,
		GetASecureAgeCheckToUnlockChatAndAddTrustedFriends = if fFlagAddFriendsPageFAEUpsell then "Feature.FAE.Label.GetASecureAgeCheckToUnlockChatAndAddTrustedFriends" else nil,
		Unlock = if fFlagAddFriendsPageFAEUpsell then "Feature.FAE.Action.Unlock" else nil,
		ThisAllowsYouToChatSafelyItOnlyTakesAMoment = if fFlagEnableAEGIS2CommsFAEUpsell then "Feature.FAE.Label.ThisAllowsYouToChatSafelyItOnlyTakesAMoment" else nil,
		UnlockChat = if fFlagEnableAEGIS2CommsFAEUpsell then "Feature.FAE.Action.UnlockChat" else nil,
		LetsCheckYourAge = if fFlagTFWithActionsCheck then "Feature.FAE.Label.LetsCheckYourAge" else nil,
		ToAddTrustedFriendDoAgeCheck = if fFlagTFWithActionsCheck then "Feature.FAE.Label.ModalBodyTFUnlock" else nil
	})
	local var23 = reactModule.useRef(false)
	local var24, var25 = reactModule.useMemo(function() --[[ line: 105 ]]
		-- upvalues: fFlagEnableAEGIS2CommsFAEUpsell (copy), forceAegisPhase2Modal (copy), p0 (ref), var22 (ref), upsellEntrySurfaceTypeModule (copy), upsellComponentModule (copy), fFlagAddFriendsPageFAEUpsell (copy), fFlagTFWithActionsCheck (copy)
		if fFlagEnableAEGIS2CommsFAEUpsell and (forceAegisPhase2Modal or p0.isPhase2) then
			return var22.LetsCheckYourAgeSoYouCanUseChat, var22.ThisHelpsYouToChatSafelyItOnlyTakesAMoment
		elseif p0.upsellEntrySurface == upsellEntrySurfaceTypeModule.Homepage and p0.upsellEntryComponent == upsellComponentModule.Modal or p0.upsellEntrySurface == upsellEntrySurfaceTypeModule.NotifPush then
			return var22.YourSafetyMattersLetsCheckYourAge, var22.YouNeedAnAgeCheckToUseChatThisMakesChatSafer
		elseif fFlagAddFriendsPageFAEUpsell and p0.upsellEntrySurface == upsellEntrySurfaceTypeModule.AddFriendsPage then
			return var22.ChatWithFriends, var22.GetASecureAgeCheckToUnlockChatAndAddTrustedFriends
		elseif fFlagTFWithActionsCheck and (p0.upsellEntrySurface == upsellEntrySurfaceTypeModule.TrustedFriends or p0.upsellEntrySurface == upsellEntrySurfaceTypeModule.TrustedFriendsInExperience) then
			return var22.LetsCheckYourAge, var22.ToAddTrustedFriendDoAgeCheck
		end
		return var22.LetsCheckYourAgeSoYouCanUseChat, var22.ModalBodyInAppV3
	end, {
		if fFlagEnableAEGIS2CommsFAEUpsell then p0.isPhase2 else nil,
		p0.upsellEntrySurface,
		var22,
		if fFlagAddFriendsPageFAEUpsell then p0.upsellEntryComponent else nil
	})
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function() --[[ line: 144 ]]
		-- upvalues: var21 (ref), p0 (ref), fFlagSupportVPCModule (copy), fFlagMakeVPCFAECheckMoreGeneric (copy), fFlagAddFriendsPageUpdateAmpRules (copy), socialUpsellTypeModule (copy), var20 (ref), openAmpWizardContainer (copy), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (copy), accessResponseEnum (copy), fStringCoreContentAmpNameSpace (copy), upsellEntrySurfaceTypeModule (copy), fFlagEnableAEGIS2CommsFAEUpsell (copy), startFacialAgeEstimationModule (copy)
		var21.closeSocialOverlay()
		
		if p0.onAccept then
			p0.onAccept()
		end
		if not fFlagSupportVPCModule then
			if fFlagMakeVPCFAECheckMoreGeneric then
				if fFlagAddFriendsPageUpdateAmpRules and p0.shouldIncludeVPC then
					var20(openAmpWizardContainer(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, function(p1, _) --[[ line: 162 ]]
						-- upvalues: accessResponseEnum (copy), p0 (copy)
						if p1 == accessResponseEnum.Granted then
							if p0.onSuccess then
								p0.onSuccess()
								
								return
							end
						elseif p0.onFailure then
							p0.onFailure()
						end
					end, nil, p0.entryPointEventCtx or socialUpsellTypeModule.FacialAgeEstimation .. (p0.upsellEntrySurface or ""), nil, fStringCoreContentAmpNameSpace))
					
					return
				elseif game.JobId ~= "" and not fFlagEnableAEGIS2CommsFAEUpsell then return end
				var20(startFacialAgeEstimationModule(if fFlagSupportVPCModule and p0.shouldIncludeVPC then p0.entryPointEventCtx or socialUpsellTypeModule.FacialAgeEstimation .. (p0.upsellEntrySurface or "") else p0.entryPointEventCtx, p0.onSuccess, p0.onFailure, p0.upsellEntrySurface, if fFlagEnableAEGIS2CommsFAEUpsell then p0.isInExperience else nil, if fFlagSupportVPCModule then p0.shouldIncludeVPC else nil))
				
				return
			elseif fFlagAddFriendsPageUpdateAmpRules and p0.upsellEntrySurface == upsellEntrySurfaceTypeModule.AddFriendsPage then
				var20(openAmpWizardContainer(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, function(p2, _) --[[ line: 193 ]]
					-- upvalues: accessResponseEnum (copy), p0 (copy)
					if p2 == accessResponseEnum.Granted then
						if p0.onSuccess then
							p0.onSuccess()
							
							return
						end
					elseif p0.onFailure then
						p0.onFailure()
					end
				end, nil, p0.entryPointEventCtx or socialUpsellTypeModule.FacialAgeEstimation .. upsellEntrySurfaceTypeModule.AddFriendsPage, nil, fStringCoreContentAmpNameSpace, nil, nil, nil, true))
				
				return
			end
		end
	end, {
		var20, var21.closeSocialOverlay, p0.upsellEntrySurface, p0.entryPointEventCtx,
		p0.onAccept, p0.onSuccess, p0.onFailure, p0.isInExperience,
		if fFlagSupportVPCModule or fFlagMakeVPCFAECheckMoreGeneric then p0.shouldIncludeVPC else nil
	})
	local var26 = reactModule.useCallback(function() --[[ line: 252 ]]
		-- upvalues: p0 (ref)
		if p0.onDismiss then
			p0.onDismiss()
		end
	end, { p0.onDismiss })
	local var27 = reactModule.useMemo(function() --[[ line: 258 ]]
		-- upvalues: fFlagEnableCountdownBadgeModule (copy), p0 (ref), fIntCommsFAELockTimestampModule (copy)
		return if fFlagEnableCountdownBadgeModule and p0.countDownBadgeText then {
			text = p0.countDownBadgeText,
			deadlineUtcTimestamp = fIntCommsFAELockTimestampModule
		} else nil
	end, { p0.countDownBadgeText })
	local var28 = reactModule.useMemo(function() --[[ line: 268 ]]
		-- upvalues: fFlagAddFriendsPageFAEUpsell (copy), p0 (ref), upsellEntrySurfaceTypeModule (copy), var22 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), forceAegisPhase2Modal (copy), useCallback (ref)
		return {
			text = if fFlagAddFriendsPageFAEUpsell and p0.upsellEntrySurface == upsellEntrySurfaceTypeModule.AddFriendsPage then var22.Unlock elseif fFlagEnableAEGIS2CommsFAEUpsell and (forceAegisPhase2Modal or p0.isPhase2) and not p0.isInExperience then var22.UnlockChat else var22.Continue,
			onActivated = useCallback
		}
	end, {
		if fFlagEnableAEGIS2CommsFAEUpsell then p0.isPhase2 else nil,
		p0.isInExperience,
		var22,
		useCallback,
		if fFlagAddFriendsPageFAEUpsell then p0.upsellEntrySurface else nil
	})
	reactModule.useEffect(function() --[[ line: 292 ]]
		-- upvalues: var23 (ref), p0 (ref)
		if not var23.current and p0.onMounted then
			p0.onMounted()
		end
		var23.current = true
	end, { p0.onMounted })
	
	return reactModule.createElement(upsellOverlayModule, createCommonOverlayPropsModule({
		onClose = var26,
		countDownBadge = var27,
		bodyText = var25,
		title = var24,
		imageId = if fFlagAddFriendsPageFAEUpsell and p0.upsellEntrySurface == upsellEntrySurfaceTypeModule.AddFriendsPage then var15 elseif fFlagEnableAEGIS2CommsFAEUpsell and (forceAegisPhase2Modal or p0.isPhase2) and (if AEGISPhase2ShowImageOnFAEOverlay then false else p0.isInExperience) then nil else var14,
		primaryAction = var28,
		impressionId = p0.impressionId,
		upsellEntryComponent = p0.upsellEntryComponent,
		upsellEntrySurface = p0.upsellEntrySurface,
		upsellPurpose = socialUpsellTypeModule.FacialAgeEstimation,
		containerRef = p0.containerRef
	}, p0))
end