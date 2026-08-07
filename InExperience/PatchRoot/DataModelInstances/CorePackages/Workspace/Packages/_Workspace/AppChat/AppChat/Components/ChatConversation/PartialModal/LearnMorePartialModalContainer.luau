local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local useCallback = reactModule.useCallback
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local eventNamesModule = require(appChat.Analytics.EventNames)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local partialModalModule = require(script.Parent.PartialModal)
local t = {
	conversationId = "",
	titleKey = "Feature.Chat.Heading.ExpressiveChat",
	bodyKey = "Feature.Chat.Description.ExpressiveChatLearnMore",
	cancelAlertKey = "CommonUI.Features.Action.Close",
	onDismissed = function() --[[ line: 33 ]] end
}

return memo(function(p0) --[[ line: 40 | named "LearnMorePartialModalContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useScreenSize (ref), useLayerCollector (ref), useAnalyticsModule (ref), useEffectOnMount (ref), eventNamesModule (ref), useCallback (ref), useLocalization (ref), reactModule (ref), partialModalModule (ref)
	local var8 = cryoModule.Dictionary.union(t, p0)
	local var9 = useStyle()
	local var10 = useScreenSize()
	local var11 = useLayerCollector()
	
	if var11 and var11.absoluteSize then
		var10 = var11.absoluteSize
	end
	local var12 = useAnalyticsModule()
	useEffectOnMount(function() --[[ line: 50 ]]
		-- upvalues: var12 (ref), eventNamesModule (copy), var8 (ref)
		if var12 then
			var12.fireAnalyticsEvent(eventNamesModule.ConversationLearnMoreDialogRendered, { conversationId = var8.conversationId })
		end
	end)
	local var13 = useLocalization({
		titleText = var8.titleKey,
		bodyText = var8.bodyKey,
		cancelAlertText = var8.cancelAlertKey
	})
	
	return reactModule.createElement(partialModalModule, {
		titleText = var13.titleText,
		bodyText = var13.bodyText,
		cancelAlertText = var13.cancelAlertText,
		screenSize = var10,
		onDismissed = useCallback(function() --[[ line: 58 ]]
			-- upvalues: var12 (ref), eventNamesModule (copy), var8 (ref)
			if var12 then
				var12.fireAnalyticsEvent(eventNamesModule.ConversationLearnMoreDialogDismissed, { conversationId = var8.conversationId })
			end
			var8.onDismissed()
		end, { var12, var8.conversationId, var8.onDismissed }),
		style = var9
	})
end)