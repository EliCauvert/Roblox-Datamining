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
	local var9 = signalsReactModule.useSignalState(getChatTooltipStoreModule(false).getShouldShow("PresetChatTooltip"))
	local var10 = useChatTooltipLifecycleModule({
		tooltipKey = "PresetChatTooltip",
		targetTextChannel = value.targetTextChannel
	})
	local var11 = localizationModule.useLocalization({
		headerText = "CoreScripts.TextChat.Tooltip.QuickWords.Header",
		bodyText = "CoreScripts.TextChat.Tooltip.QuickWords.Body"
	})
	local var12 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), expChatSharedModule (copy), constantsModule (copy)
		var10.onDismiss()
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Dismiss,
			component = constantsModule.Analytics.Components.PresetTooltip
		}, expChatSharedModule.Analytics.DefaultStandardizedFields)
	end, { var10.onDismiss })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), expChatSharedModule (copy), constantsModule (copy)
		if var9 then
			expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = constantsModule.Analytics.EventTypes.Show,
				component = constantsModule.Analytics.Components.PresetTooltip
			}, expChatSharedModule.Analytics.DefaultStandardizedFields)
		end
	end, { var9 })
	
	return if var9 then reactModule.createElement(coachmark, {
		title = var11.headerText,
		text = var11.bodyText,
		isOpen = var10.isActive,
		onClose = var12,
		side = popoverSide.Right,
		align = popoverAlign.Center
	}, value.children) else reactModule.createElement(reactModule.Fragment, nil, value.children)
end)