local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Sources = require(Parent.SocialLuaAnalytics).Analytics.Enums.Sources
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
local FFlagTFUpdateAnalyticsModule = require(TrustedContacts.Flags.FFlagTFUpdateAnalytics)
local FFlagEnableTrustedFriendsWizardVPCPrologueModule = require(TrustedContacts.Flags.FFlagEnableTrustedFriendsWizardVPCPrologue)
local _ = require(TrustedContacts.Common.Types)
local TrustedConnectionsLearnMoreLink = game:DefineFastString("TrustedConnectionsLearnMoreLink", "https://help.roblox.com/hc/articles/37725513985812")
local List = {
	TrustedConnectionStatus.Friends,
	TrustedConnectionStatus.RequestReceived,
	TrustedConnectionStatus.TrustedFriends
}

return function(p1) --[[ Line: 49 ]]
	-- upvalues: ReactModule (copy), NormalizeTFActionsEnumToModalVariantModule (copy), UseTCAnalyticsFunction (copy), FFlagTFUpdateAnalyticsModule (copy), EventNames (copy), UseLocalizationFunction (copy), FFlagTCLearnMoreLinkModule (copy), List (copy), RoactUtilsModule (copy), UseModalTextsModule (copy), UseModalButtonActionsModule (copy), Sources (copy), FFlagEnableTrustedFriendsWizardVPCPrologueModule (copy), TrustedConnectionsLearnMoreLink (copy), TrustedContactsModalModule (copy)
	local UseMemoResult = nil
	local TfActionsEnum = nil
	TfActionsEnum = p1.tfActionsEnum
	UseMemoResult = ReactModule.useMemo(function() --[[ Line: 52 ]]
		-- upvalues: TfActionsEnum (ref), NormalizeTFActionsEnumToModalVariantModule (upval)
		return if TfActionsEnum then NormalizeTFActionsEnumToModalVariantModule(TfActionsEnum) else nil
	end, { TfActionsEnum })
	local FireAnalyticsEventFunction = UseTCAnalyticsFunction({
		friendId = p1.userId,
		modalVariant = UseMemoResult,
		source = p1.source,
		tfActionsEnum = if FFlagTFUpdateAnalyticsModule then TfActionsEnum else nil
	}).fireAnalyticsEvent
	local UseResult = ReactModule.useCallback(function() --[[ Line: 63 ]]
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), p1 (copy)
		FireAnalyticsEventFunction(EventNames.TCUpsellCloseClicked)
		p1.externalNavigation.closeModal()
	end, { FireAnalyticsEventFunction, p1.externalNavigation })
	local UseLocalizationResult = UseLocalizationFunction({
		somethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
		linkCopiedToast = "Feature.Catalog.Toast.LinkCopied",
		learnMoreText = if FFlagTCLearnMoreLinkModule then "Feature.Friends.LinkText.LearnMore" else nil
	})
	ReactModule.useEffect(function() --[[ Line: 74 ]]
		-- upvalues: UseMemoResult (ref), FireAnalyticsEventFunction (copy), EventNames (upval)
		if UseMemoResult then
			FireAnalyticsEventFunction(EventNames.TCUpsellModalSeen)
		end
	end, { UseMemoResult, FireAnalyticsEventFunction })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 80 ]]
		-- upvalues: p1 (copy), UseLocalizationResult (copy)
		p1.externalNavigation.showToast(UseLocalizationResult.somethingIsWrongToast)
	end, {
		UseLocalizationResult.somethingIsWrongToast,
		p1.externalNavigation
	})
	RoactUtilsModule.Hooks.useEffectOnce(function() --[[ Line: 85 ]]
		-- upvalues: FFlagTFUpdateAnalyticsModule (upval), FireAnalyticsEventFunction (copy), EventNames (upval), UseResult (copy), UseResult1 (copy)
		if FFlagTFUpdateAnalyticsModule then
			FireAnalyticsEventFunction(EventNames.TCUpsellInvalidTrustedFriendState)
		end
		UseResult()
		UseResult1()
	end, not (UseMemoResult and table.find(List, UseMemoResult)))
	local UseModalTextsModuleResult = UseModalTextsModule(UseMemoResult)
	local UseModalButtonActionsModuleResult = UseModalButtonActionsModule(p1.userId, p1.source, TfActionsEnum, {
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
		openAmpWizard = if FFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.externalNavigation.openAmpWizard else nil,
		dismissModal = if FFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.externalNavigation.closeModal else nil,
		fireAnalyticsEvent = FireAnalyticsEventFunction
	})
	local UseResult2 = if FFlagTCLearnMoreLinkModule then ReactModule.useCallback(function() --[[ Line: 116 ]]
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