local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sources = require(parent.SocialLuaAnalytics).Analytics.Enums.Sources
local getTCStatusModule = require(trustedContacts.Requests.getTCStatus)
local trustedConnectionStatus = require(trustedContacts.Enums).TrustedConnectionStatus
local useModalTextsModule = require(script.Parent.useModalTexts)
local useModalButtonActionsModule = require(script.Parent.useModalButtonActions)
local _ = require(trustedContacts.TrustedFriendActions.TFActionsEnum)
local analyticsModule = require(script.Parent.Parent.Parent.Analytics)
local useTCAnalytics = analyticsModule.useTCAnalytics
local eventNames = analyticsModule.EventNames
local trustedContactsModalModule = require(script.Parent.TrustedContactsModal)
local normalizeTFActionsEnumToModalVariantModule = require(trustedContacts.TrustedFriendActions.normalizeTFActionsEnumToModalVariant)
local fFlagTCLearnMoreLinkModule = require(trustedContacts.Flags.FFlagTCLearnMoreLink)
local fFlagTFWithActionsCheck = require(parent.SharedFlags).FFlagTFWithActionsCheck
local fFlagTrustedFriendsUseEnumCTA = require(parent.SharedFlags).FFlagTrustedFriendsUseEnumCTA
local fFlagTFUpdateAnalyticsModule = require(trustedContacts.Flags.FFlagTFUpdateAnalytics)
local fFlagTFNonFriendsPermittedModule = require(trustedContacts.Flags.FFlagTFNonFriendsPermitted)
local fFlagEnableTrustedFriendsWizardVPCPrologueModule = require(trustedContacts.Flags.FFlagEnableTrustedFriendsWizardVPCPrologue)
local _ = require(trustedContacts.Common.Types)
local trustedConnectionsLearnMoreLink = game:DefineFastString("TrustedConnectionsLearnMoreLink", "https://help.roblox.com/hc/articles/37725513985812")
local list = {
	trustedConnectionStatus.Friends,
	trustedConnectionStatus.RequestReceived,
	trustedConnectionStatus.TrustedFriends
}

local function _(p0) --[[ line: 53 | named "normalizeModalOverride" ]]
	-- upvalues: sources (ref), trustedConnectionStatus (ref), fFlagTFNonFriendsPermittedModule (ref)
	return if p0 == sources.ShareLinkSender then trustedConnectionStatus.Friends elseif p0 == sources.ShareLinkReceiver then trustedConnectionStatus.RequestReceived elseif p0 == trustedConnectionStatus.RequestIgnored then trustedConnectionStatus.RequestReceived elseif p0 == trustedConnectionStatus.NotFriends and fFlagTFNonFriendsPermittedModule then trustedConnectionStatus.Friends else p0
end

return function(p1) --[[ line: 66 ]]
	-- upvalues: fFlagTFWithActionsCheck (ref), reactModule (ref), normalizeTFActionsEnumToModalVariantModule (ref), sources (ref), trustedConnectionStatus (ref), fFlagTFNonFriendsPermittedModule (ref), getTCStatusModule (ref), useTCAnalytics (ref), fFlagTFUpdateAnalyticsModule (ref), eventNames (ref), useLocalization (ref), fFlagTCLearnMoreLinkModule (ref), list (ref), roactUtilsModule (ref), useModalTextsModule (ref), useModalButtonActionsModule (ref), fFlagEnableTrustedFriendsWizardVPCPrologueModule (ref), fFlagTrustedFriendsUseEnumCTA (ref), trustedConnectionsLearnMoreLink (ref), trustedContactsModalModule (ref)
	local var15
	local _ = nil
	local _ = nil
	local tfActionsEnum = nil
	
	if fFlagTFWithActionsCheck then
		tfActionsEnum = p1.tfActionsEnum
		var15 = reactModule.useMemo(function() --[[ line: 71 ]]
			-- upvalues: tfActionsEnum (write), normalizeTFActionsEnumToModalVariantModule (copy)
			return if tfActionsEnum then normalizeTFActionsEnumToModalVariantModule(tfActionsEnum) else nil
		end, { tfActionsEnum })
	else
		local var16, var17 = reactModule.useState(nil)
		var15 = var16
		local var18 = var17
		reactModule.useEffect(function() --[[ line: 80 ]]
			-- upvalues: p1 (ref), var18 (write), sources (copy), trustedConnectionStatus (copy), fFlagTFNonFriendsPermittedModule (copy), getTCStatusModule (copy)
			if not p1.modalVariantOverride then
				getTCStatusModule(p1.userId):andThen(function(p2) --[[ line: 87 ]]
					-- upvalues: var18 (copy), sources (copy), trustedConnectionStatus (copy), fFlagTFNonFriendsPermittedModule (copy)
					var18(if p2 == sources.ShareLinkSender then trustedConnectionStatus.Friends elseif p2 == sources.ShareLinkReceiver then trustedConnectionStatus.RequestReceived elseif p2 == trustedConnectionStatus.RequestIgnored then trustedConnectionStatus.RequestReceived elseif p2 == trustedConnectionStatus.NotFriends and fFlagTFNonFriendsPermittedModule then trustedConnectionStatus.Friends else p2)
				end):catch(function() --[[ line: 90 ]]
					-- upvalues: var18 (copy), trustedConnectionStatus (copy)
					var18(trustedConnectionStatus.Friends)
				end)
				
				return
			end
			local modalVariantOverride = p1.modalVariantOverride
			var18(if modalVariantOverride == sources.ShareLinkSender then trustedConnectionStatus.Friends elseif modalVariantOverride == sources.ShareLinkReceiver then trustedConnectionStatus.RequestReceived elseif modalVariantOverride == trustedConnectionStatus.RequestIgnored then trustedConnectionStatus.RequestReceived elseif modalVariantOverride == trustedConnectionStatus.NotFriends and fFlagTFNonFriendsPermittedModule then trustedConnectionStatus.Friends else modalVariantOverride)
		end, { p1.userId, p1.modalVariantOverride })
	end
	local fireAnalyticsEvent = useTCAnalytics({
		friendId = p1.userId,
		modalVariant = var15,
		source = p1.source,
		tfActionsEnum = if fFlagTFUpdateAnalyticsModule then tfActionsEnum else nil
	}).fireAnalyticsEvent
	local var19 = reactModule.useCallback(function() --[[ line: 108 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellCloseClicked)
		p1.externalNavigation.closeModal()
	end, { fireAnalyticsEvent, p1.externalNavigation })
	local var20 = useLocalization({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		learnMoreText = if fFlagTCLearnMoreLinkModule then "Feature.Friends.LinkText.LearnMore" else nil
	})
	reactModule.useEffect(function() --[[ line: 119 ]]
		-- upvalues: var15 (write), fireAnalyticsEvent (ref), eventNames (copy)
		if var15 then
			fireAnalyticsEvent(eventNames.TCUpsellModalSeen)
		end
	end, { var15, fireAnalyticsEvent })
	local var21 = reactModule.useCallback(function() --[[ line: 125 ]]
		-- upvalues: p1 (ref), var20 (ref)
		p1.externalNavigation.showToast(var20.somethingIsWrongToast)
	end, { var20.somethingIsWrongToast, p1.externalNavigation })
	
	if fFlagTFWithActionsCheck then
		roactUtilsModule.Hooks.useEffectOnce(function() --[[ line: 132 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var19 (ref), var21 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellInvalidTrustedFriendState)
			end
			var19()
			var21()
		end, not (var15 and table.find(list, var15)))
	else
		reactModule.useEffect(function() --[[ line: 140 ]]
			-- upvalues: var15 (write), list (copy), fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var19 (ref), var21 (ref)
			if var15 and not table.find(list, var15) then
				if fFlagTFUpdateAnalyticsModule then
					fireAnalyticsEvent(eventNames.TCUpsellInvalidTrustedFriendState)
				end
				var19()
				var21()
			end
		end, { var19, var15 })
	end
	local var22 = useModalTextsModule(var15)
	
	return var15 and (table.find(list, var15) and reactModule.createElement(trustedContactsModalModule, {
		isVerticallyConstrained = p1.isVerticallyConstrained,
		userId = p1.userId,
		source = p1.source,
		headerText = var22.header,
		descriptionText = var22.description,
		modalButtonActions = useModalButtonActionsModule(p1.userId, p1.source, if fFlagTFWithActionsCheck then tfActionsEnum else var15, {
			closeModal = var19,
			onRequestSent = p1.onRequestSent,
			onRequestAccepted = p1.onRequestAccepted,
			onAcknowledged = p1.onAcknowledged,
			sentFromQrCode = p1.sentFromQrCode,
			tokens = p1.tokens,
			showGenericErrorModal = var21,
			isShareLinkSender = p1.modalVariantOverride == sources.ShareLinkSender,
			showToast = p1.externalNavigation.showToast,
			shareUrl = p1.externalNavigation.shareUrl,
			openAmpWizard = if fFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.externalNavigation.openAmpWizard else nil,
			dismissModal = if fFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.externalNavigation.closeModal else nil,
			fireAnalyticsEvent = if fFlagTrustedFriendsUseEnumCTA then fireAnalyticsEvent else nil
		}),
		onCloseModal = var19,
		learnMoreText = if fFlagTCLearnMoreLinkModule then var20.learnMoreText else nil,
		onLearnMoreClick = if fFlagTCLearnMoreLinkModule then if fFlagTCLearnMoreLinkModule then reactModule.useCallback(function() --[[ line: 179 ]]
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref), trustedConnectionsLearnMoreLink (copy)
			fireAnalyticsEvent(eventNames.TCUpsellLearnMoreClicked)
			p1.externalNavigation.openWebView(trustedConnectionsLearnMoreLink, "")
		end, { fireAnalyticsEvent, p1.externalNavigation }) else nil else nil
	}))
end