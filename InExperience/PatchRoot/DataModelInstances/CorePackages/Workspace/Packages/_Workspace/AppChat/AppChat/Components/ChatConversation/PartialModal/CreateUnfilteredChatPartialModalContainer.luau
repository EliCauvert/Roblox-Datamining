local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useAnalyticsModule = require(appChat.Analytics.useAnalytics)
local useCallback = reactModule.useCallback
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffectOnMount = require(parent.RoactUtils).Hooks.useEffectOnMount
local useIsLocalPlayerPartyVoiceEligible = require(parent.SquadsCore.Hooks).useIsLocalPlayerPartyVoiceEligible
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useState = reactModule.useState
local appChatNetworkingModule = require(parent.AppChatNetworking)
local eventNamesModule = require(appChat.Analytics.EventNames)
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local partialModalModule = require(script.Parent.PartialModal)
local t = {
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

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useScreenSize (ref), useLayerCollector (ref), useState (ref), useDispatch (ref), useAnalyticsModule (ref), useIsLocalPlayerPartyVoiceEligible (ref), useEffectOnMount (ref), eventNamesModule (ref), useLocalization (ref), useCallback (ref), appChatNetworkingModule (ref), reactModule (ref), partialModalModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useStyle()
	local var3 = useScreenSize()
	local var4 = useLayerCollector()
	
	if var4 and var4.absoluteSize then
		var3 = var4.absoluteSize
	end
	local var5, var6 = useState(false)
	local var7 = useDispatch()
	local var8 = useAnalyticsModule()
	local var9 = useIsLocalPlayerPartyVoiceEligible()
	useEffectOnMount(function()
		-- upvalues: var8 (ref), eventNamesModule (copy), var1 (ref)
		if var8 then
			var8.fireAnalyticsEvent(eventNamesModule.ConversationUpgradeDialogRendered, { conversationId = var1.conversationId })
		end
	end)
	local var10 = useLocalization({
		networkErrorText = var1.networkErrorTextKey,
		titleText = var1.titleKey,
		bodyText = var1.bodyKey,
		bodyTextWithVoice = var1.bodyKeyWithVoice,
		actionText = var1.actionKey,
		cancelAlertText = var1.cancelAlertKey
	})
	local var11 = useCallback(function()
		-- upvalues: var1 (ref), var10 (ref)
		var1.navigateToToast(var10.networkErrorText)
	end, { var1.navigateToToast, var10.networkErrorText })
	
	return reactModule.createElement(partialModalModule, {
		titleText = var10.titleText,
		bodyText = if var9 then var10.bodyTextWithVoice else var10.bodyText,
		actionText = var10.actionText,
		cancelAlertText = var10.cancelAlertText,
		isButtonDisabled = var5,
		screenSize = var3,
		onActivated = useCallback(function()
			-- upvalues: var8 (ref), eventNamesModule (copy), var1 (ref), var6 (ref), var7 (ref), appChatNetworkingModule (copy), var11 (ref)
			if var8 then
				var8.fireAnalyticsEvent(eventNamesModule.ConversationUpgradeDialogActionClicked, { conversationId = var1.conversationId })
			end
			var6(true)
			var7(appChatNetworkingModule.rodux.DuplicateConversation.API(var1.conversationId, "trusted_comms")):andThen(function(p2)
				-- upvalues: var1 (copy), var11 (copy)
				local responseBody = p2.responseBody
				local id = responseBody and (responseBody.conversations and (responseBody.conversations[1] and responseBody.conversations[1].id))
				
				if id then
					var1.navigateToConversation(id)
					
					return
				end
				var11()
			end):catch(function()
				-- upvalues: var11 (copy)
				var11()
			end):finally(function()
				-- upvalues: var6 (copy)
				var6(false)
			end)
		end, {
			var7, var6, var11, var1.navigateToConversation, var1.conversationId, var8
		}),
		onDismissed = useCallback(function()
			-- upvalues: var8 (ref), eventNamesModule (copy), var1 (ref)
			if var8 then
				var8.fireAnalyticsEvent(eventNamesModule.ConversationUpgradeDialogDismissed, { conversationId = var1.conversationId })
			end
			var1.onDismissed()
		end, { var1.onDismissed, var8, var1.conversationId }),
		style = var2
	})
end)