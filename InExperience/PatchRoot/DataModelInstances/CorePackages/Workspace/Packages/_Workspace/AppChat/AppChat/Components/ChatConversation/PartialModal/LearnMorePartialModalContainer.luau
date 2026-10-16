local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseAnalyticsModule = require(AppChat.Analytics.useAnalytics)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectOnMountFunction = require(Parent.RoactUtils).Hooks.useEffectOnMount
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local EventNamesModule = require(AppChat.Analytics.EventNames)
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local PartialModalModule = require(script.Parent.PartialModal)
local config = {
	conversationId = "",
	titleKey = "Feature.Chat.Heading.ExpressiveChat",
	bodyKey = "Feature.Chat.Description.ExpressiveChatLearnMore",
	cancelAlertKey = "CommonUI.Features.Action.Close",
	onDismissed = function() --[[ Line: 33 ]] end
}

return ReactModule.memo(function(p1) --[[ Line: 40 | Named "LearnMorePartialModalContainer" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseScreenSizeFunction (copy), UseLayerCollectorFunction (copy), UseAnalyticsModule (copy), UseEffectOnMountFunction (copy), EventNamesModule (copy), UseCallbackFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), PartialModalModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	
	if UseLayerCollectorResult and UseLayerCollectorResult.absoluteSize then
		UseScreenSizeResult = UseLayerCollectorResult.absoluteSize
	end
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	UseEffectOnMountFunction(function() --[[ Line: 50 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UnionResult (copy)
		if UseAnalyticsModuleResult then
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ConversationLearnMoreDialogRendered, { conversationId = UnionResult.conversationId })
		end
	end)
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 58 ]]
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UnionResult (copy)
		if UseAnalyticsModuleResult then
			UseAnalyticsModuleResult.fireAnalyticsEvent(EventNamesModule.ConversationLearnMoreDialogDismissed, { conversationId = UnionResult.conversationId })
		end
		UnionResult.onDismissed()
	end, {
		UseAnalyticsModuleResult,
		UnionResult.conversationId,
		UnionResult.onDismissed
	})
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = UnionResult.titleKey,
		bodyText = UnionResult.bodyKey,
		cancelAlertText = UnionResult.cancelAlertKey
	})
	
	return ReactModule.createElement(PartialModalModule, {
		titleText = UseLocalizationResult.titleText,
		bodyText = UseLocalizationResult.bodyText,
		cancelAlertText = UseLocalizationResult.cancelAlertText,
		screenSize = UseScreenSizeResult,
		onDismissed = UseCallbackResult,
		style = UseStyleResult
	})
end)