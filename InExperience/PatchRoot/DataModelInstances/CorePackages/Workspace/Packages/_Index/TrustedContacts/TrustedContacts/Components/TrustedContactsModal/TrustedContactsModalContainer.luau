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
local _ = require(trustedContacts.Common.Types)
local trustedConnectionsLearnMoreLink = game:DefineFastString("TrustedConnectionsLearnMoreLink", "https://help.roblox.com/hc/articles/37725513985812")
local list = {
	trustedConnectionStatus.Friends,
	trustedConnectionStatus.RequestReceived,
	trustedConnectionStatus.TrustedFriends
}

local function _(p0) --[[ line: 51 | named "normalizeModalOverride" ]]
	-- upvalues: sources (ref), trustedConnectionStatus (ref), fFlagTFNonFriendsPermittedModule (ref)
	return if p0 == sources.ShareLinkSender then trustedConnectionStatus.Friends elseif p0 == sources.ShareLinkReceiver then trustedConnectionStatus.RequestReceived elseif p0 == trustedConnectionStatus.RequestIgnored then trustedConnectionStatus.RequestReceived elseif p0 == trustedConnectionStatus.NotFriends and fFlagTFNonFriendsPermittedModule then trustedConnectionStatus.Friends else p0
end

return function(p1) --[[ line: 64 ]]
	-- upvalues: fFlagTFWithActionsCheck (ref), reactModule (ref), normalizeTFActionsEnumToModalVariantModule (ref), sources (ref), trustedConnectionStatus (ref), fFlagTFNonFriendsPermittedModule (ref), getTCStatusModule (ref), useTCAnalytics (ref), fFlagTFUpdateAnalyticsModule (ref), eventNames (ref), useLocalization (ref), fFlagTCLearnMoreLinkModule (ref), list (ref), roactUtilsModule (ref), useModalTextsModule (ref), useModalButtonActionsModule (ref), fFlagTrustedFriendsUseEnumCTA (ref), trustedConnectionsLearnMoreLink (ref), trustedContactsModalModule (ref)
	local var14
	local _ = nil
	local _ = nil
	local tfActionsEnum = nil
	
	if fFlagTFWithActionsCheck then
		tfActionsEnum = p1.tfActionsEnum
		var14 = reactModule.useMemo(function() --[[ line: 69 ]]
			-- upvalues: tfActionsEnum (write), normalizeTFActionsEnumToModalVariantModule (copy)
			return if tfActionsEnum then normalizeTFActionsEnumToModalVariantModule(tfActionsEnum) else nil
		end, { tfActionsEnum })
	else
		local var15, var16 = reactModule.useState(nil)
		var14 = var15
		local var17 = var16
		reactModule.useEffect(function() --[[ line: 78 ]]
			-- upvalues: p1 (ref), var17 (write), sources (copy), trustedConnectionStatus (copy), fFlagTFNonFriendsPermittedModule (copy), getTCStatusModule (copy)
			if not p1.modalVariantOverride then
				getTCStatusModule(p1.userId):andThen(function(p2) --[[ line: 85 ]]
					-- upvalues: var17 (copy), sources (copy), trustedConnectionStatus (copy), fFlagTFNonFriendsPermittedModule (copy)
					var17(if p2 == sources.ShareLinkSender then trustedConnectionStatus.Friends elseif p2 == sources.ShareLinkReceiver then trustedConnectionStatus.RequestReceived elseif p2 == trustedConnectionStatus.RequestIgnored then trustedConnectionStatus.RequestReceived elseif p2 == trustedConnectionStatus.NotFriends and fFlagTFNonFriendsPermittedModule then trustedConnectionStatus.Friends else p2)
				end):catch(function() --[[ line: 88 ]]
					-- upvalues: var17 (copy), trustedConnectionStatus (copy)
					var17(trustedConnectionStatus.Friends)
				end)
				
				return
			end
			local modalVariantOverride = p1.modalVariantOverride
			var17(if modalVariantOverride == sources.ShareLinkSender then trustedConnectionStatus.Friends elseif modalVariantOverride == sources.ShareLinkReceiver then trustedConnectionStatus.RequestReceived elseif modalVariantOverride == trustedConnectionStatus.RequestIgnored then trustedConnectionStatus.RequestReceived elseif modalVariantOverride == trustedConnectionStatus.NotFriends and fFlagTFNonFriendsPermittedModule then trustedConnectionStatus.Friends else modalVariantOverride)
		end, { p1.userId, p1.modalVariantOverride })
	end
	local fireAnalyticsEvent = useTCAnalytics({
		friendId = p1.userId,
		modalVariant = var14,
		source = p1.source,
		tfActionsEnum = if fFlagTFUpdateAnalyticsModule then tfActionsEnum else nil
	}).fireAnalyticsEvent
	local var18 = reactModule.useCallback(function() --[[ line: 106 ]]
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref)
		fireAnalyticsEvent(eventNames.TCUpsellCloseClicked)
		p1.externalNavigation.closeModal()
	end, { fireAnalyticsEvent, p1.externalNavigation })
	local var19 = useLocalization({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		learnMoreText = if fFlagTCLearnMoreLinkModule then "Feature.Friends.LinkText.LearnMore" else nil
	})
	reactModule.useEffect(function() --[[ line: 117 ]]
		-- upvalues: var14 (write), fireAnalyticsEvent (ref), eventNames (copy)
		if var14 then
			fireAnalyticsEvent(eventNames.TCUpsellModalSeen)
		end
	end, { var14, fireAnalyticsEvent })
	local var20 = reactModule.useCallback(function() --[[ line: 123 ]]
		-- upvalues: p1 (ref), var19 (ref)
		p1.externalNavigation.showToast(var19.somethingIsWrongToast)
	end, { var19.somethingIsWrongToast, p1.externalNavigation })
	
	if fFlagTFWithActionsCheck then
		roactUtilsModule.Hooks.useEffectOnce(function() --[[ line: 130 ]]
			-- upvalues: fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var18 (ref), var20 (ref)
			if fFlagTFUpdateAnalyticsModule then
				fireAnalyticsEvent(eventNames.TCUpsellInvalidTrustedFriendState)
			end
			var18()
			var20()
		end, not (var14 and table.find(list, var14)))
	else
		reactModule.useEffect(function() --[[ line: 138 ]]
			-- upvalues: var14 (write), list (copy), fFlagTFUpdateAnalyticsModule (copy), fireAnalyticsEvent (ref), eventNames (copy), var18 (ref), var20 (ref)
			if var14 and not table.find(list, var14) then
				if fFlagTFUpdateAnalyticsModule then
					fireAnalyticsEvent(eventNames.TCUpsellInvalidTrustedFriendState)
				end
				var18()
				var20()
			end
		end, { var18, var14 })
	end
	local var21 = useModalTextsModule(var14)
	
	return var14 and (table.find(list, var14) and reactModule.createElement(trustedContactsModalModule, {
		isVerticallyConstrained = p1.isVerticallyConstrained,
		userId = p1.userId,
		source = p1.source,
		headerText = var21.header,
		descriptionText = var21.description,
		modalButtonActions = useModalButtonActionsModule(p1.userId, p1.source, if fFlagTFWithActionsCheck then tfActionsEnum else var14, {
			closeModal = var18,
			onRequestSent = p1.onRequestSent,
			onRequestAccepted = p1.onRequestAccepted,
			onAcknowledged = p1.onAcknowledged,
			sentFromQrCode = p1.sentFromQrCode,
			tokens = p1.tokens,
			showGenericErrorModal = var20,
			isShareLinkSender = p1.modalVariantOverride == sources.ShareLinkSender,
			showToast = p1.externalNavigation.showToast,
			shareUrl = p1.externalNavigation.shareUrl,
			fireAnalyticsEvent = if fFlagTrustedFriendsUseEnumCTA then fireAnalyticsEvent else nil
		}),
		onCloseModal = var18,
		learnMoreText = if fFlagTCLearnMoreLinkModule then var19.learnMoreText else nil,
		onLearnMoreClick = if fFlagTCLearnMoreLinkModule then if fFlagTCLearnMoreLinkModule then reactModule.useCallback(function() --[[ line: 171 ]]
			-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), p1 (ref), trustedConnectionsLearnMoreLink (copy)
			fireAnalyticsEvent(eventNames.TCUpsellLearnMoreClicked)
			p1.externalNavigation.openWebView(trustedConnectionsLearnMoreLink, "")
		end, { fireAnalyticsEvent, p1.externalNavigation }) else nil else nil
	}))
end