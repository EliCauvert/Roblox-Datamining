local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sources = require(parent.SocialLuaAnalytics).Analytics.Enums.Sources
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
local fFlagTFUpdateAnalyticsModule = require(trustedContacts.Flags.FFlagTFUpdateAnalytics)
local fFlagEnableTrustedFriendsWizardVPCPrologueModule = require(trustedContacts.Flags.FFlagEnableTrustedFriendsWizardVPCPrologue)
local _ = require(trustedContacts.Common.Types)
local trustedConnectionsLearnMoreLink = game:DefineFastString("TrustedConnectionsLearnMoreLink", "https://help.roblox.com/hc/articles/37725513985812")
local list = {
	trustedConnectionStatus.Friends,
	trustedConnectionStatus.RequestReceived,
	trustedConnectionStatus.TrustedFriends
}

return function(p1)
	-- upvalues: reactModule (ref), normalizeTFActionsEnumToModalVariantModule (ref), useTCAnalytics (ref), fFlagTFUpdateAnalyticsModule (ref), eventNames (ref), useLocalization (ref), fFlagTCLearnMoreLinkModule (ref), list (ref), roactUtilsModule (ref), useModalTextsModule (ref), useModalButtonActionsModule (ref), sources (ref), fFlagEnableTrustedFriendsWizardVPCPrologueModule (ref), trustedConnectionsLearnMoreLink (ref), trustedContactsModalModule (ref)
	local _ = nil
	local _ = nil
	local tfActionsEnum = p1.tfActionsEnum
	local var1 = reactModule.useMemo(function()
		-- upvalues: tfActionsEnum (write), normalizeTFActionsEnumToModalVariantModule (copy)
		return if tfActionsEnum then normalizeTFActionsEnumToModalVariantModule(tfActionsEnum) else nil
	end, { tfActionsEnum })
	local fireAnalyticsEvent = useTCAnalytics({
		friendId = p1.userId,
		modalVariant = var1,
		source = p1.source,
		tfActionsEnum = if fFlagTFUpdateAnalyticsModule then tfActionsEnum else nil
	}).fireAnalyticsEvent
	local var2 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellCloseClicked)
		p1.externalNavigation.closeModal()
	end, { fireAnalyticsEvent, p1.externalNavigation })
	local var3 = useLocalization({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		learnMoreText = if fFlagTCLearnMoreLinkModule then "Feature.Friends.LinkText.LearnMore" else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var1 (write), fireAnalyticsEvent (ref), eventNames (copy)
		if var1 then
			fireAnalyticsEvent(eventNames.TCUpsellModalSeen)
		end
	end, { var1, fireAnalyticsEvent })
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var3 (ref)
		p1.externalNavigation.showToast(var3.somethingIsWrongToast)
	end, { var3.somethingIsWrongToast, p1.externalNavigation })
	roactUtilsModule.Hooks.useEffectOnce(function()
		-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var2 (ref), var4 (ref)
		if fFlagTFUpdateAnalyticsModule then
			fireAnalyticsEvent(eventNames.TCUpsellInvalidTrustedFriendState)
		end
		var2()
		var4()
	end, not (var1 and table.find(list, var1)))
	local var5 = useModalTextsModule(var1)
	
	return var1 and (table.find(list, var1) and reactModule.createElement(trustedContactsModalModule, {
		isVerticallyConstrained = p1.isVerticallyConstrained,
		userId = p1.userId,
		source = p1.source,
		headerText = var5.header,
		descriptionText = var5.description,
		modalButtonActions = useModalButtonActionsModule(p1.userId, p1.source, tfActionsEnum, {
			closeModal = var2,
			onRequestSent = p1.onRequestSent,
			onRequestAccepted = p1.onRequestAccepted,
			onAcknowledged = p1.onAcknowledged,
			sentFromQrCode = p1.sentFromQrCode,
			tokens = p1.tokens,
			showGenericErrorModal = var4,
			isShareLinkSender = p1.modalVariantOverride == sources.ShareLinkSender,
			showToast = p1.externalNavigation.showToast,
			shareUrl = p1.externalNavigation.shareUrl,
			openAmpWizard = if fFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.externalNavigation.openAmpWizard else nil,
			dismissModal = if fFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.externalNavigation.closeModal else nil,
			fireAnalyticsEvent = fireAnalyticsEvent
		}),
		onCloseModal = var2,
		learnMoreText = if fFlagTCLearnMoreLinkModule then var3.learnMoreText else nil,
		onLearnMoreClick = if fFlagTCLearnMoreLinkModule then if fFlagTCLearnMoreLinkModule then reactModule.useCallback(function()
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref), trustedConnectionsLearnMoreLink (copy)
			fireAnalyticsEvent(eventNames.TCUpsellLearnMoreClicked)
			p1.externalNavigation.openWebView(trustedConnectionsLearnMoreLink, "")
		end, { fireAnalyticsEvent, p1.externalNavigation }) else nil else nil
	}))
end