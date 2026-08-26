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

local function _(p1)
	-- upvalues: sources (ref), trustedConnectionStatus (ref), fFlagTFNonFriendsPermittedModule (ref)
	return if p1 == sources.ShareLinkSender then trustedConnectionStatus.Friends elseif p1 == sources.ShareLinkReceiver then trustedConnectionStatus.RequestReceived elseif p1 == trustedConnectionStatus.RequestIgnored then trustedConnectionStatus.RequestReceived elseif p1 == trustedConnectionStatus.NotFriends and fFlagTFNonFriendsPermittedModule then trustedConnectionStatus.Friends else p1
end

return function(p1)
	-- upvalues: fFlagTFWithActionsCheck (ref), reactModule (ref), normalizeTFActionsEnumToModalVariantModule (ref), sources (ref), trustedConnectionStatus (ref), fFlagTFNonFriendsPermittedModule (ref), getTCStatusModule (ref), useTCAnalytics (ref), fFlagTFUpdateAnalyticsModule (ref), eventNames (ref), useLocalization (ref), fFlagTCLearnMoreLinkModule (ref), list (ref), roactUtilsModule (ref), useModalTextsModule (ref), useModalButtonActionsModule (ref), fFlagEnableTrustedFriendsWizardVPCPrologueModule (ref), fFlagTrustedFriendsUseEnumCTA (ref), trustedConnectionsLearnMoreLink (ref), trustedContactsModalModule (ref)
	local var1
	local _ = nil
	local _ = nil
	local tfActionsEnum = nil
	
	if fFlagTFWithActionsCheck then
		tfActionsEnum = p1.tfActionsEnum
		var1 = reactModule.useMemo(function()
			-- upvalues: tfActionsEnum (write), normalizeTFActionsEnumToModalVariantModule (copy)
			return if tfActionsEnum then normalizeTFActionsEnumToModalVariantModule(tfActionsEnum) else nil
		end, { tfActionsEnum })
	else
		local var2, var3 = reactModule.useState(nil)
		var1 = var2
		local var4 = var3
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var4 (write), sources (copy), trustedConnectionStatus (copy), fFlagTFNonFriendsPermittedModule (copy), getTCStatusModule (copy)
			if not p1.modalVariantOverride then
				getTCStatusModule(p1.userId):andThen(function(p2)
					-- upvalues: var4 (copy), sources (copy), trustedConnectionStatus (copy), fFlagTFNonFriendsPermittedModule (copy)
					var4(if p2 == sources.ShareLinkSender then trustedConnectionStatus.Friends elseif p2 == sources.ShareLinkReceiver then trustedConnectionStatus.RequestReceived elseif p2 == trustedConnectionStatus.RequestIgnored then trustedConnectionStatus.RequestReceived elseif p2 == trustedConnectionStatus.NotFriends and fFlagTFNonFriendsPermittedModule then trustedConnectionStatus.Friends else p2)
				end):catch(function()
					-- upvalues: var4 (copy), trustedConnectionStatus (copy)
					var4(trustedConnectionStatus.Friends)
				end)
				
				return
			end
			local modalVariantOverride = p1.modalVariantOverride
			var4(if modalVariantOverride == sources.ShareLinkSender then trustedConnectionStatus.Friends elseif modalVariantOverride == sources.ShareLinkReceiver then trustedConnectionStatus.RequestReceived elseif modalVariantOverride == trustedConnectionStatus.RequestIgnored then trustedConnectionStatus.RequestReceived elseif modalVariantOverride == trustedConnectionStatus.NotFriends and fFlagTFNonFriendsPermittedModule then trustedConnectionStatus.Friends else modalVariantOverride)
		end, { p1.userId, p1.modalVariantOverride })
	end
	local fireAnalyticsEvent = useTCAnalytics({
		friendId = p1.userId,
		modalVariant = var1,
		source = p1.source,
		tfActionsEnum = if fFlagTFUpdateAnalyticsModule then tfActionsEnum else nil
	}).fireAnalyticsEvent
	local var5 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellCloseClicked)
		p1.externalNavigation.closeModal()
	end, { fireAnalyticsEvent, p1.externalNavigation })
	local var6 = useLocalization({
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
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var6 (ref)
		p1.externalNavigation.showToast(var6.somethingIsWrongToast)
	end, { var6.somethingIsWrongToast, p1.externalNavigation })
	
	if fFlagTFWithActionsCheck then
		roactUtilsModule.Hooks.useEffectOnce(function()
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var5 (ref), var7 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellInvalidTrustedFriendState)
			end
			var5()
			var7()
		end, not (var1 and table.find(list, var1)))
	else
		reactModule.useEffect(function()
			-- upvalues: var1 (write), list (copy), fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var5 (ref), var7 (ref)
			if var1 and not table.find(list, var1) then
				if fFlagTFUpdateAnalyticsModule then
					fireAnalyticsEvent(eventNames.TCUpsellInvalidTrustedFriendState)
				end
				var5()
				var7()
			end
		end, { var5, var1 })
	end
	local var8 = useModalTextsModule(var1)
	
	return var1 and (table.find(list, var1) and reactModule.createElement(trustedContactsModalModule, {
		isVerticallyConstrained = p1.isVerticallyConstrained,
		userId = p1.userId,
		source = p1.source,
		headerText = var8.header,
		descriptionText = var8.description,
		modalButtonActions = useModalButtonActionsModule(p1.userId, p1.source, if fFlagTFWithActionsCheck then tfActionsEnum else var1, {
			closeModal = var5,
			onRequestSent = p1.onRequestSent,
			onRequestAccepted = p1.onRequestAccepted,
			onAcknowledged = p1.onAcknowledged,
			sentFromQrCode = p1.sentFromQrCode,
			tokens = p1.tokens,
			showGenericErrorModal = var7,
			isShareLinkSender = p1.modalVariantOverride == sources.ShareLinkSender,
			showToast = p1.externalNavigation.showToast,
			shareUrl = p1.externalNavigation.shareUrl,
			openAmpWizard = if fFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.externalNavigation.openAmpWizard else nil,
			dismissModal = if fFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.externalNavigation.closeModal else nil,
			fireAnalyticsEvent = if fFlagTrustedFriendsUseEnumCTA then fireAnalyticsEvent else nil
		}),
		onCloseModal = var5,
		learnMoreText = if fFlagTCLearnMoreLinkModule then var6.learnMoreText else nil,
		onLearnMoreClick = if fFlagTCLearnMoreLinkModule then if fFlagTCLearnMoreLinkModule then reactModule.useCallback(function()
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref), trustedConnectionsLearnMoreLink (copy)
			fireAnalyticsEvent(eventNames.TCUpsellLearnMoreClicked)
			p1.externalNavigation.openWebView(trustedConnectionsLearnMoreLink, "")
		end, { fireAnalyticsEvent, p1.externalNavigation }) else nil else nil
	}))
end