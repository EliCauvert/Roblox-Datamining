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
local var1 = if chatSecurity then chatSecurity.assetId else nil
local fFlagAddFriendsPageFAEUpsell = sharedFlagsModule.FFlagAddFriendsPageFAEUpsell
local fFlagAddFriendsPageUpdateAmpRules = sharedFlagsModule.FFlagAddFriendsPageUpdateAmpRules
local fFlagMakeVPCFAECheckMoreGeneric = sharedFlagsModule.FFlagMakeVPCFAECheckMoreGeneric
local var2 = nil

if fFlagAddFriendsPageFAEUpsell then
	preloadAsset("pictograms/lock_closed")
	local lockClosed = assets["pictograms/lock_closed"]
	var2 = if lockClosed then lockClosed.assetId else nil
end
local useSocialUpsellOverlayControllerModule = require(socialUpsell.Hooks.useSocialUpsellOverlayController)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagEnableAEGIS2CommsFAEUpsell = sharedFlagsModule.FFlagEnableAEGIS2CommsFAEUpsell
local AEGISPhase2ShowImageOnFAEOverlay = game:DefineFastFlag("AEGISPhase2ShowImageOnFAEOverlay", false)
local forceAegisPhase2Modal = game:DefineFastFlag("ForceAegisPhase2Modal", false)
local fFlagTFWithActionsCheck = require(parent.SharedFlags).FFlagTFWithActionsCheck

return function(p1)
	-- upvalues: useDispatch (ref), useSocialUpsellOverlayControllerModule (ref), useLocalization (ref), fFlagAddFriendsPageFAEUpsell (ref), fFlagEnableAEGIS2CommsFAEUpsell (ref), fFlagTFWithActionsCheck (ref), reactModule (ref), forceAegisPhase2Modal (ref), upsellEntrySurfaceTypeModule (ref), upsellComponentModule (ref), fFlagSupportVPCModule (ref), fFlagMakeVPCFAECheckMoreGeneric (ref), fFlagAddFriendsPageUpdateAmpRules (ref), socialUpsellTypeModule (ref), openAmpWizardContainer (ref), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (ref), accessResponseEnum (ref), fStringCoreContentAmpNameSpace (ref), startFacialAgeEstimationModule (ref), fFlagEnableCountdownBadgeModule (ref), fIntCommsFAELockTimestampModule (ref), upsellOverlayModule (ref), createCommonOverlayPropsModule (ref), var2 (write), AEGISPhase2ShowImageOnFAEOverlay (ref), var1 (ref)
	p1 = p1 or {}
	local var3 = useDispatch()
	local var4 = useSocialUpsellOverlayControllerModule(p1.isInExperience)
	local var5 = useLocalization({
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
	local var6 = reactModule.useRef(false)
	local var7, var8 = reactModule.useMemo(function()
		-- upvalues: fFlagEnableAEGIS2CommsFAEUpsell (copy), forceAegisPhase2Modal (copy), p1 (ref), var5 (ref), upsellEntrySurfaceTypeModule (copy), upsellComponentModule (copy), fFlagAddFriendsPageFAEUpsell (copy), fFlagTFWithActionsCheck (copy)
		if fFlagEnableAEGIS2CommsFAEUpsell and (forceAegisPhase2Modal or p1.isPhase2) then
			return var5.LetsCheckYourAgeSoYouCanUseChat, var5.ThisHelpsYouToChatSafelyItOnlyTakesAMoment
		elseif p1.upsellEntrySurface == upsellEntrySurfaceTypeModule.Homepage and p1.upsellEntryComponent == upsellComponentModule.Modal or p1.upsellEntrySurface == upsellEntrySurfaceTypeModule.NotifPush then
			return var5.YourSafetyMattersLetsCheckYourAge, var5.YouNeedAnAgeCheckToUseChatThisMakesChatSafer
		elseif fFlagAddFriendsPageFAEUpsell and p1.upsellEntrySurface == upsellEntrySurfaceTypeModule.AddFriendsPage then
			return var5.ChatWithFriends, var5.GetASecureAgeCheckToUnlockChatAndAddTrustedFriends
		elseif fFlagTFWithActionsCheck and (p1.upsellEntrySurface == upsellEntrySurfaceTypeModule.TrustedFriends or p1.upsellEntrySurface == upsellEntrySurfaceTypeModule.TrustedFriendsInExperience) then
			return var5.LetsCheckYourAge, var5.ToAddTrustedFriendDoAgeCheck
		end
		return var5.LetsCheckYourAgeSoYouCanUseChat, var5.ModalBodyInAppV3
	end, {
		if fFlagEnableAEGIS2CommsFAEUpsell then p1.isPhase2 else nil,
		p1.upsellEntrySurface,
		var5,
		if fFlagAddFriendsPageFAEUpsell then p1.upsellEntryComponent else nil
	})
	local useCallback = reactModule.useCallback
	useCallback = useCallback(function()
		-- upvalues: var4 (ref), p1 (ref), fFlagSupportVPCModule (copy), fFlagMakeVPCFAECheckMoreGeneric (copy), fFlagAddFriendsPageUpdateAmpRules (copy), socialUpsellTypeModule (copy), var3 (ref), openAmpWizardContainer (copy), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (copy), accessResponseEnum (copy), fStringCoreContentAmpNameSpace (copy), upsellEntrySurfaceTypeModule (copy), fFlagEnableAEGIS2CommsFAEUpsell (copy), startFacialAgeEstimationModule (copy)
		var4.closeSocialOverlay()
		
		if p1.onAccept then
			p1.onAccept()
		end
		if not fFlagSupportVPCModule then
			if fFlagMakeVPCFAECheckMoreGeneric then
				if fFlagAddFriendsPageUpdateAmpRules and p1.shouldIncludeVPC then
					var3(openAmpWizardContainer(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, function(p2, _)
						-- upvalues: accessResponseEnum (copy), p1 (copy)
						if p2 == accessResponseEnum.Granted then
							if p1.onSuccess then
								p1.onSuccess()
								
								return
							end
						elseif p1.onFailure then
							p1.onFailure()
						end
					end, nil, p1.entryPointEventCtx or socialUpsellTypeModule.FacialAgeEstimation .. (p1.upsellEntrySurface or ""), nil, fStringCoreContentAmpNameSpace))
					
					return
				elseif game.JobId ~= "" and not fFlagEnableAEGIS2CommsFAEUpsell then return end
				var3(startFacialAgeEstimationModule(if fFlagSupportVPCModule and p1.shouldIncludeVPC then p1.entryPointEventCtx or socialUpsellTypeModule.FacialAgeEstimation .. (p1.upsellEntrySurface or "") else p1.entryPointEventCtx, p1.onSuccess, p1.onFailure, p1.upsellEntrySurface, if fFlagEnableAEGIS2CommsFAEUpsell then p1.isInExperience else nil, if fFlagSupportVPCModule then p1.shouldIncludeVPC else nil))
				
				return
			elseif fFlagAddFriendsPageUpdateAmpRules and p1.upsellEntrySurface == upsellEntrySurfaceTypeModule.AddFriendsPage then
				var3(openAmpWizardContainer(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, function(p2, _)
					-- upvalues: accessResponseEnum (copy), p1 (copy)
					if p2 == accessResponseEnum.Granted then
						if p1.onSuccess then
							p1.onSuccess()
							
							return
						end
					elseif p1.onFailure then
						p1.onFailure()
					end
				end, nil, p1.entryPointEventCtx or socialUpsellTypeModule.FacialAgeEstimation .. upsellEntrySurfaceTypeModule.AddFriendsPage, nil, fStringCoreContentAmpNameSpace, nil, nil, nil, true))
				
				return
			end
		end
	end, {
		var3, var4.closeSocialOverlay, p1.upsellEntrySurface, p1.entryPointEventCtx,
		p1.onAccept, p1.onSuccess, p1.onFailure, p1.isInExperience,
		if fFlagSupportVPCModule or fFlagMakeVPCFAECheckMoreGeneric then p1.shouldIncludeVPC else nil
	})
	local var9 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onDismiss then
			p1.onDismiss()
		end
	end, { p1.onDismiss })
	local var10 = reactModule.useMemo(function()
		-- upvalues: fFlagEnableCountdownBadgeModule (copy), p1 (ref), fIntCommsFAELockTimestampModule (copy)
		return if fFlagEnableCountdownBadgeModule and p1.countDownBadgeText then {
			text = p1.countDownBadgeText,
			deadlineUtcTimestamp = fIntCommsFAELockTimestampModule
		} else nil
	end, { p1.countDownBadgeText })
	local var11 = reactModule.useMemo(function()
		-- upvalues: fFlagAddFriendsPageFAEUpsell (copy), p1 (ref), upsellEntrySurfaceTypeModule (copy), var5 (ref), fFlagEnableAEGIS2CommsFAEUpsell (copy), forceAegisPhase2Modal (copy), useCallback (ref)
		return {
			text = if fFlagAddFriendsPageFAEUpsell and p1.upsellEntrySurface == upsellEntrySurfaceTypeModule.AddFriendsPage then var5.Unlock elseif fFlagEnableAEGIS2CommsFAEUpsell and (forceAegisPhase2Modal or p1.isPhase2) and not p1.isInExperience then var5.UnlockChat else var5.Continue,
			onActivated = useCallback
		}
	end, {
		if fFlagEnableAEGIS2CommsFAEUpsell then p1.isPhase2 else nil,
		p1.isInExperience,
		var5,
		useCallback,
		if fFlagAddFriendsPageFAEUpsell then p1.upsellEntrySurface else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), p1 (ref)
		if not var6.current and p1.onMounted then
			p1.onMounted()
		end
		var6.current = true
	end, { p1.onMounted })
	
	return reactModule.createElement(upsellOverlayModule, createCommonOverlayPropsModule({
		onClose = var9,
		countDownBadge = var10,
		bodyText = var8,
		title = var7,
		imageId = if fFlagAddFriendsPageFAEUpsell and p1.upsellEntrySurface == upsellEntrySurfaceTypeModule.AddFriendsPage then var2 elseif fFlagEnableAEGIS2CommsFAEUpsell and (forceAegisPhase2Modal or p1.isPhase2) and (if AEGISPhase2ShowImageOnFAEOverlay then false else p1.isInExperience) then nil else var1,
		primaryAction = var11,
		impressionId = p1.impressionId,
		upsellEntryComponent = p1.upsellEntryComponent,
		upsellEntrySurface = p1.upsellEntrySurface,
		upsellPurpose = socialUpsellTypeModule.FacialAgeEstimation,
		containerRef = p1.containerRef
	}, p1))
end