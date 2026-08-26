local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local coachmark = foundationModule.Coachmark
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local expChatSharedModule = require(parent.ExpChatShared)
local fFlagExpChatPresetChatEnabled = expChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local constantsModule = require(expChat.PresetChat.Constants)
local localizationModule = require(expChat.Localization)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local useChatTooltipLifecycleModule = require(expChat.ChatWindow.UI.useChatTooltipLifecycle)

return reactModule.memo(function(value)
	-- upvalues: fFlagExpChatPresetChatEnabled (ref), fFlagExpChatUseUnifiedTooltipStore (ref), reactModule (ref), getChatTooltipStoreModule (ref), signalsReactModule (ref), useChatTooltipLifecycleModule (ref), localizationModule (ref), expChatSharedModule (ref), constantsModule (ref), coachmark (ref), popoverSide (ref), popoverAlign (ref)
	if not fFlagExpChatPresetChatEnabled or not fFlagExpChatUseUnifiedTooltipStore then
		return reactModule.createElement(reactModule.Fragment, nil, value.children)
	end
	local var1 = signalsReactModule.useSignalState(getChatTooltipStoreModule(false).getShouldShow("PresetChatTooltip"))
	local var2 = useChatTooltipLifecycleModule({
		tooltipKey = "PresetChatTooltip",
		targetTextChannel = value.targetTextChannel
	})
	local var3 = localizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.QuickWords.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.QuickWords.Body"
	})
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), expChatSharedModule (copy), constantsModule (copy)
		var2.onDismiss()
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Dismiss,
			component = constantsModule.Analytics.Components.PresetTooltip
		}, expChatSharedModule.Analytics.DefaultStandardizedFields)
	end, { var2.onDismiss })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), expChatSharedModule (copy), constantsModule (copy)
		if var1 then
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Show,
				component = constantsModule.Analytics.Components.PresetTooltip
			}, expChatSharedModule.Analytics.DefaultStandardizedFields)
		end
	end, { var1 })
	
	return if var1 then reactModule.createElement(coachmark, {
		title = var3.headerText,
		text = var3.bodyText,
		isOpen = var2.isActive,
		onClose = var4,
		side = popoverSide.Right,
		align = popoverAlign.Center
	}, value.children) else reactModule.createElement(reactModule.Fragment, nil, value.children)
end)