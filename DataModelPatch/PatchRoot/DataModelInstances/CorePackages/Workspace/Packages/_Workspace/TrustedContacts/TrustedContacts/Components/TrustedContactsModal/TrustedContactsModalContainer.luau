local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
local GetTCStatusModule = require(TrustedContacts.Requests.getTCStatus)
local TrustedConnectionStatus = require(TrustedContacts.Enums).TrustedConnectionStatus
local UseModalTextsModule = require(script.Parent.useModalTexts)
local UseModalButtonActionsModule = require(script.Parent.useModalButtonActions)
local _ = require(TrustedContacts.TrustedFriendActions.TFActionsEnum)
local AnalyticsModule = require(script.Parent.Parent.Parent.Analytics)
local UseTCAnalyticsFunction = AnalyticsModule.useTCAnalytics
local EventNames = AnalyticsModule.EventNames
local TrustedContactsModalModule = require(script.Parent.TrustedContactsModal)
local NormalizeTFActionsEnumToModalVariantModule = require(TrustedContacts.TrustedFriendActions.normalizeTFActionsEnumToModalVariant)
local FFlagTCLearnMoreLinkModule = require(TrustedContacts.Flags.FFlagTCLearnMoreLink)
local FFlagTFWithActionsCheck = require(Parent.SharedFlags).FFlagTFWithActionsCheck
local FFlagTrustedFriendsUseEnumCTA = require(Parent.SharedFlags).FFlagTrustedFriendsUseEnumCTA
local FFlagTFUpdateAnalyticsModule = require(TrustedContacts.Flags.FFlagTFUpdateAnalytics)
local FFlagTFNonFriendsPermittedModule = require(TrustedContacts.Flags.FFlagTFNonFriendsPermitted)
local _ = require(TrustedContacts.Common.Types)
local TrustedConnectionsLearnMoreLink = game:DefineFastString("TrustedConnectionsLearnMoreLink", "https://help.roblox.com/hc/articles/37725513985812")
local List = {
	TrustedConnectionStatus.Friends,
	TrustedConnectionStatus.RequestReceived,
	TrustedConnectionStatus.TrustedFriends
}

local function _(NotFriends)
	-- upvalues: Sources (copy), TrustedConnectionStatus (copy), FFlagTFNonFriendsPermittedModule (copy)
	return if NotFriends == Sources.ShareLinkSender then TrustedConnectionStatus.Friends elseif NotFriends == Sources.ShareLinkReceiver then TrustedConnectionStatus.RequestReceived elseif NotFriends == TrustedConnectionStatus.RequestIgnored then TrustedConnectionStatus.RequestReceived elseif NotFriends == TrustedConnectionStatus.NotFriends and FFlagTFNonFriendsPermittedModule then TrustedConnectionStatus.Friends else NotFriends
end

return function(p1)
	-- upvalues: FFlagTFWithActionsCheck (copy), ReactModule (copy), NormalizeTFActionsEnumToModalVariantModule (copy), Sources (copy), TrustedConnectionStatus (copy), FFlagTFNonFriendsPermittedModule (copy), GetTCStatusModule (copy), UseTCAnalyticsFunction (copy), FFlagTFUpdateAnalyticsModule (copy), EventNames (copy), UseLocalizationFunction (copy), FFlagTCLearnMoreLinkModule (copy), List (copy), RoactUtilsModule (copy), UseModalTextsModule (copy), UseModalButtonActionsModule (copy), FFlagTrustedFriendsUseEnumCTA (copy), TrustedConnectionsLearnMoreLink (copy), TrustedContactsModalModule (copy)
	local UseMemoResult = nil
	local UseStateResult2 = nil
	local TfActionsEnum = nil
	
	if FFlagTFWithActionsCheck then
		TfActionsEnum = p1.tfActionsEnum
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: TfActionsEnum (ref), NormalizeTFActionsEnumToModalVariantModule (upval)
			return if TfActionsEnum then NormalizeTFActionsEnumToModalVariantModule(TfActionsEnum) else nil
		end, { TfActionsEnum })
	else
		UseMemoResult, UseStateResult2 = ReactModule.useState(nil)
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseStateResult2 (ref), Sources (upval), TrustedConnectionStatus (upval), FFlagTFNonFriendsPermittedModule (upval), GetTCStatusModule (upval)
			if p1.modalVariantOverride then
				local ModalVariantOverride = p1.modalVariantOverride
				UseStateResult2(if ModalVariantOverride == Sources.ShareLinkSender then TrustedConnectionStatus.Friends elseif ModalVariantOverride == Sources.ShareLinkReceiver then TrustedConnectionStatus.RequestReceived elseif ModalVariantOverride == TrustedConnectionStatus.RequestIgnored then TrustedConnectionStatus.RequestReceived elseif ModalVariantOverride == TrustedConnectionStatus.NotFriends and FFlagTFNonFriendsPermittedModule then TrustedConnectionStatus.Friends else ModalVariantOverride)
				
				return
			else
				GetTCStatusModule(p1.userId):andThen(function(Result)
					-- upvalues: UseStateResult2 (upval), Sources (upval), TrustedConnectionStatus (upval), FFlagTFNonFriendsPermittedModule (upval)
					UseStateResult2(if Result == Sources.ShareLinkSender then TrustedConnectionStatus.Friends elseif Result == Sources.ShareLinkReceiver then TrustedConnectionStatus.RequestReceived elseif Result == TrustedConnectionStatus.RequestIgnored then TrustedConnectionStatus.RequestReceived elseif Result == TrustedConnectionStatus.NotFriends and FFlagTFNonFriendsPermittedModule then TrustedConnectionStatus.Friends else Result)
				end):catch(function()
					-- upvalues: UseStateResult2 (upval), TrustedConnectionStatus (upval)
					UseStateResult2(TrustedConnectionStatus.Friends)
				end)
			end
		end, { p1.userId, p1.modalVariantOverride })
	end
	local FireAnalyticsEventFunction = UseTCAnalyticsFunction({
		friendId = p1.userId,
		modalVariant = UseMemoResult,
		source = p1.source,
		tfActionsEnum = if FFlagTFUpdateAnalyticsModule then TfActionsEnum else nil
	}).fireAnalyticsEvent
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), p1 (copy)
		FireAnalyticsEventFunction(EventNames.TCUpsellCloseClicked)
		p1.externalNavigation.closeModal()
	end, { FireAnalyticsEventFunction, p1.externalNavigation })
	local UseLocalizationResult = UseLocalizationFunction({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		learnMoreText = if FFlagTCLearnMoreLinkModule then "Feature.Friends.LinkText.LearnMore" else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (ref), FireAnalyticsEventFunction (copy), EventNames (upval)
		if UseMemoResult then
			FireAnalyticsEventFunction(EventNames.TCUpsellModalSeen)
		end
	end, { UseMemoResult, FireAnalyticsEventFunction })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseLocalizationResult (copy)
		p1.externalNavigation.showToast(UseLocalizationResult.somethingIsWrongToast)
	end, {
		UseLocalizationResult.somethingIsWrongToast,
		p1.externalNavigation
	})
	
	if FFlagTFWithActionsCheck then
		RoactUtilsModule.Hooks.useEffectOnce(function()
			-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEventFunction (copy), EventNames (upval), UseResult (copy), UseResult1 (copy)
			if FFlagTFUpdateAnalyticsModule then
				FireAnalyticsEventFunction(EventNames.TCUpsellInvalidTrustedFriendState)
			end
			UseResult()
			UseResult1()
		end, not (UseMemoResult and table.find(List, UseMemoResult)))
	else
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (ref), List (upval), FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEventFunction (copy), EventNames (upval), UseResult (copy), UseResult1 (copy)
			if UseMemoResult and not table.find(List, UseMemoResult) then
				if FFlagTFUpdateAnalyticsModule then
					FireAnalyticsEventFunction(EventNames.TCUpsellInvalidTrustedFriendState)
				end
				UseResult()
				UseResult1()
			end
		end, { UseResult, UseMemoResult })
	end
	local UseModalTextsModuleResult = UseModalTextsModule(UseMemoResult)
	local UseModalButtonActionsModuleResult = UseModalButtonActionsModule(p1.userId, p1.source, if FFlagTFWithActionsCheck then TfActionsEnum else UseMemoResult, {
		closeModal = UseResult,
		onRequestSent = p1.onRequestSent,
		onRequestAccepted = p1.onRequestAccepted,
		onAcknowledged = p1.onAcknowledged,
		sentFromQrCode = p1.sentFromQrCode,
		tokens = p1.tokens,
		showGenericErrorModal = UseResult1,
		isShareLinkSender = p1.modalVariantOverride == Sources.ShareLinkSender,
		showToast = p1.externalNavigation.showToast,
		shareUrl = p1.externalNavigation.shareUrl,
		fireAnalyticsEvent = if FFlagTrustedFriendsUseEnumCTA then FireAnalyticsEventFunction else nil
	})
	local UseResult2 = if FFlagTCLearnMoreLinkModule then ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), p1 (copy), TrustedConnectionsLearnMoreLink (upval)
		FireAnalyticsEventFunction(EventNames.TCUpsellLearnMoreClicked)
		p1.externalNavigation.openWebView(TrustedConnectionsLearnMoreLink, "")
	end, { FireAnalyticsEventFunction, p1.externalNavigation }) else nil
	
	return UseMemoResult and (table.find(List, UseMemoResult) and ReactModule.createElement(TrustedContactsModalModule, {
		isVerticallyConstrained = p1.isVerticallyConstrained,
		userId = p1.userId,
		source = p1.source,
		headerText = UseModalTextsModuleResult.header,
		descriptionText = UseModalTextsModuleResult.description,
		modalButtonActions = UseModalButtonActionsModuleResult,
		onCloseModal = UseResult,
		learnMoreText = if FFlagTCLearnMoreLinkModule then UseLocalizationResult.learnMoreText else nil,
		onLearnMoreClick = if FFlagTCLearnMoreLinkModule then UseResult2 else nil
	}))
end