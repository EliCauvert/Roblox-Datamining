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
	onDismissed = function() end
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useScreenSize (ref), useLayerCollector (ref), useAnalyticsModule (ref), useEffectOnMount (ref), eventNamesModule (ref), useCallback (ref), useLocalization (ref), reactModule (ref), partialModalModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useStyle()
	local var3 = useScreenSize()
	local var4 = useLayerCollector()
	
	if var4 and var4.absoluteSize then
		var3 = var4.absoluteSize
	end
	local var5 = useAnalyticsModule()
	useEffectOnMount(function()
		-- upvalues: var5 (ref), eventNamesModule (copy), var1 (ref)
		if var5 then
			var5.fireAnalyticsEvent(eventNamesModule.ConversationLearnMoreDialogRendered, { conversationId = var1.conversationId })
		end
	end)
	local var6 = useLocalization({
		titleText = var1.titleKey,
		bodyText = var1.bodyKey,
		cancelAlertText = var1.cancelAlertKey
	})
	
	return reactModule.createElement(partialModalModule, {
		titleText = var6.titleText,
		bodyText = var6.bodyText,
		cancelAlertText = var6.cancelAlertText,
		screenSize = var3,
		onDismissed = useCallback(function()
			-- upvalues: var5 (ref), eventNamesModule (copy), var1 (ref)
			if var5 then
				var5.fireAnalyticsEvent(eventNamesModule.ConversationLearnMoreDialogDismissed, { conversationId = var1.conversationId })
			end
			var1.onDismissed()
		end, { var5, var1.conversationId, var1.onDismissed }),
		style = var2
	})
end)