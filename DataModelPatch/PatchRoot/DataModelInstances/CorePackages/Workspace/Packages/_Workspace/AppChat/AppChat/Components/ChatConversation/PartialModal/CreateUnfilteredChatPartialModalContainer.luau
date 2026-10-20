local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local UseIsLocalPlayerPartyVoiceEligibleFunction = require(Parent.SquadsCore.Hooks).useIsLocalPlayerPartyVoiceEligible
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UseStateFunction = ReactModule.useState
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local EventNamesModule = require(AppChat.Analytics.EventNames)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local PartialModalModule = require(script.Parent.PartialModal)
local config = {
	conversationId = "",
	titleKey = "Feature.Chat.Heading.CreateUnfilteredChatDialog",
	bodyKey = "Feature.Chat.Description.CreateUnfilteredChatDialog",
	bodyKeyWithVoice = "Feature.Chat.Description.CreateUnfilteredChatWithVoice",
	networkErrorTextKey = "Feature.Toast.NetworkingError.SomethingIsWrong",
	actionKey = "Feature.Chat.Action.Create",
	cancelAlertKey = "Feature.Chat.Action.Cancel",
	onDismissed = function() end,
	navigateToConversation = function(_) end,
	navigateToToast = function(_) end
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseScreenSizeFunction (copy), UseLayerCollectorFunction (copy), UseStateFunction (copy), UseDispatchFunction (copy), UseAnalyticsModule (copy), UseIsLocalPlayerPartyVoiceEligibleFunction (copy), UseEffectOnMountFunction (copy), EventNamesModule (copy), UseLocalizationFunction (copy), UseCallbackFunction (copy), AppChatNetworkingModule (copy), ReactModule (copy), PartialModalModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	
	if UseLayerCollectorResult and UseLayerCollectorResult.absoluteSize then
		UseScreenSizeResult = UseLayerCollectorResult.absoluteSize
	end
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local UseDispatchResult = UseDispatchFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseIsLocalPlayerPartyVoiceEligibleResult = UseIsLocalPlayerPartyVoiceEligibleFunction()
	UseEffectOnMountFunction(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UnionResult (copy)
		if UseAnalyticsModuleResult then
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ConversationUpgradeDialogRendered, { conversationId = UnionResult.conversationId })
		end
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		networkErrorText = UnionResult.networkErrorTextKey,
		titleText = UnionResult.titleKey,
		bodyText = UnionResult.bodyKey,
		bodyTextWithVoice = UnionResult.bodyKeyWithVoice,
		actionText = UnionResult.actionKey,
		cancelAlertText = UnionResult.cancelAlertKey
	})
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UnionResult (copy), UseLocalizationResult (copy)
		UnionResult.navigateToToast(UseLocalizationResult.networkErrorText)
	end, {
		UnionResult.navigateToToast,
		UseLocalizationResult.networkErrorText
	})
	
	return ReactModule.createElement(PartialModalModule, {
		titleText = UseLocalizationResult.titleText,
		bodyText = if UseIsLocalPlayerPartyVoiceEligibleResult then UseLocalizationResult.bodyTextWithVoice else UseLocalizationResult.bodyText,
		actionText = UseLocalizationResult.actionText,
		cancelAlertText = UseLocalizationResult.cancelAlertText,
		isButtonDisabled = UseStateResult,
		screenSize = UseScreenSizeResult,
		onActivated = UseCallbackFunction(function()
			-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UnionResult (copy), UseStateResult2 (copy), UseDispatchResult (copy), AppChatNetworkingModule (upval), UseCallbackResult (copy)
			if UseAnalyticsModuleResult then
				UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ConversationUpgradeDialogActionClicked, { conversationId = UnionResult.conversationId })
			end
			UseStateResult2(true)
			UseDispatchResult(AppChatNetworkingModule.rodux.DuplicateConversation.API(UnionResult.conversationId, "trusted_comms")):andThen(function(Result)
				-- upvalues: UnionResult (upval), UseCallbackResult (upval)
				local ResponseBody = Result.responseBody
				local Id = ResponseBody and (ResponseBody.conversations and (ResponseBody.conversations[1] and ResponseBody.conversations[1].id))
				
				if Id then
					UnionResult.navigateToConversation(Id)
					
					return
				else
					UseCallbackResult()
				end
			end):catch(function()
				-- upvalues: UseCallbackResult (upval)
				UseCallbackResult()
			end):finally(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
		end, {
			UseDispatchResult, UseStateResult2, UseCallbackResult,
			UnionResult.navigateToConversation, UnionResult.conversationId,
			UseAnalyticsModuleResult
		}),
		onDismissed = UseCallbackFunction(function()
			-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UnionResult (copy)
			if UseAnalyticsModuleResult then
				UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ConversationUpgradeDialogDismissed, { conversationId = UnionResult.conversationId })
			end
			UnionResult.onDismissed()
		end, {
			UnionResult.onDismissed,
			UseAnalyticsModuleResult,
			UnionResult.conversationId
		}),
		style = UseStyleResult
	})
end)