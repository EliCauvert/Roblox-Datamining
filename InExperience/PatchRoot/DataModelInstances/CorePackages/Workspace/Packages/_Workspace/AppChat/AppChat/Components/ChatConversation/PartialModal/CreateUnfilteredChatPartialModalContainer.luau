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
	onDismissed = function() --[[ line: 41 ]] end,
	navigateToConversation = function(_) --[[ line: 42 ]] end,
	navigateToToast = function(_) --[[ line: 43 ]] end
}

return memo(function(p0) --[[ line: 53 | named "CreateUnfilteredChatPartialModalContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useScreenSize (ref), useLayerCollector (ref), useState (ref), useDispatch (ref), useAnalyticsModule (ref), useIsLocalPlayerPartyVoiceEligible (ref), useEffectOnMount (ref), eventNamesModule (ref), useLocalization (ref), useCallback (ref), appChatNetworkingModule (ref), reactModule (ref), partialModalModule (ref)
	local var9 = cryoModule.Dictionary.union(t, p0)
	local var10 = useStyle()
	local var11 = useScreenSize()
	local var12 = useLayerCollector()
	
	if var12 and var12.absoluteSize then
		var11 = var12.absoluteSize
	end
	local var13, var14 = useState(false)
	local var15 = useDispatch()
	local var16 = useAnalyticsModule()
	local var17 = useIsLocalPlayerPartyVoiceEligible()
	useEffectOnMount(function() --[[ line: 66 ]]
		-- upvalues: var16 (ref), eventNamesModule (copy), var9 (ref)
		if var16 then
			var16.fireAnalyticsEvent(eventNamesModule.ConversationUpgradeDialogRendered, { conversationId = var9.conversationId })
		end
	end)
	local var18 = useLocalization({
		networkErrorText = var9.networkErrorTextKey,
		titleText = var9.titleKey,
		bodyText = var9.bodyKey,
		bodyTextWithVoice = var9.bodyKeyWithVoice,
		actionText = var9.actionKey,
		cancelAlertText = var9.cancelAlertKey
	})
	local var19 = useCallback(function() --[[ line: 83 ]]
		-- upvalues: var9 (ref), var18 (ref)
		var9.navigateToToast(var18.networkErrorText)
	end, { var9.navigateToToast, var18.networkErrorText })
	
	return reactModule.createElement(partialModalModule, {
		titleText = var18.titleText,
		bodyText = if var17 then var18.bodyTextWithVoice else var18.bodyText,
		actionText = var18.actionText,
		cancelAlertText = var18.cancelAlertText,
		isButtonDisabled = var13,
		screenSize = var11,
		onActivated = useCallback(function() --[[ line: 88 ]]
			-- upvalues: var16 (ref), eventNamesModule (copy), var9 (ref), var14 (ref), var15 (ref), appChatNetworkingModule (copy), var19 (ref)
			if var16 then
				var16.fireAnalyticsEvent(eventNamesModule.ConversationUpgradeDialogActionClicked, { conversationId = var9.conversationId })
			end
			var14(true)
			var15(appChatNetworkingModule.rodux.DuplicateConversation.API(var9.conversationId, "trusted_comms")):andThen(function(p1) --[[ line: 96 ]]
				-- upvalues: var9 (copy), var19 (copy)
				local responseBody = p1.responseBody
				local id = responseBody and (responseBody.conversations and (responseBody.conversations[1] and responseBody.conversations[1].id))
				
				if id then
					var9.navigateToConversation(id)
					
					return
				end
				var19()
			end):catch(function() --[[ line: 108 ]]
				-- upvalues: var19 (copy)
				var19()
			end):finally(function() --[[ line: 111 ]]
				-- upvalues: var14 (copy)
				var14(false)
			end)
		end, {
			var15, var14, var19, var9.navigateToConversation, var9.conversationId, var16
		}),
		onDismissed = useCallback(function() --[[ line: 117 ]]
			-- upvalues: var16 (ref), eventNamesModule (copy), var9 (ref)
			if var16 then
				var16.fireAnalyticsEvent(eventNamesModule.ConversationUpgradeDialogDismissed, { conversationId = var9.conversationId })
			end
			var9.onDismissed()
		end, { var9.onDismissed, var16, var9.conversationId }),
		style = var10
	})
end)