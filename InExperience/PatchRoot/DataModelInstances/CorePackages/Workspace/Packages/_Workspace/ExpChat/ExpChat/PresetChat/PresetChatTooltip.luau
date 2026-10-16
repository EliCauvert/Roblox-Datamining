local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local Coachmark = FoundationModule.Coachmark
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local ExpChatSharedModule = require(Parent.ExpChatShared)
local FFlagExpChatPresetChatEnabled = ExpChatSharedModule.Flags.FFlagExpChatPresetChatEnabled
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local LocalizationModule = require(ExpChat.Localization)
local GetChatTooltipStoreModule = require(ExpChat.Stores.GetChatTooltipStore)
local UseChatTooltipLifecycleModule = require(ExpChat.ChatWindow.UI.useChatTooltipLifecycle)

return ReactModule.memo(function(p1) --[[ Line: 37 | Named "PresetChatTooltip" ]]
	-- upvalues: FFlagExpChatPresetChatEnabled (copy), FFlagExpChatUseUnifiedTooltipStore (copy), ReactModule (copy), GetChatTooltipStoreModule (copy), SignalsReactModule (copy), UseChatTooltipLifecycleModule (copy), LocalizationModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), Coachmark (copy), PopoverSide (copy), PopoverAlign (copy)
	if FFlagExpChatPresetChatEnabled and FFlagExpChatUseUnifiedTooltipStore then
		local UseSignalStateResult = SignalsReactModule.useSignalState(GetChatTooltipStoreModule(false).getShouldShow("PresetChatTooltip"))
		local UseChatTooltipLifecycleModuleResult = UseChatTooltipLifecycleModule({
			tooltipKey = "PresetChatTooltip",
			targetTextChannel = p1.targetTextChannel
		})
		local UseLocalizationResult = LocalizationModule.useLocalization({
			headerText = "CoreScripts.TextChat.Tooltip.QuickWords.Header",
			bodyText = "CoreScripts.TextChat.Tooltip.QuickWords.Body"
		})
		local UseResult = ReactModule.useCallback(function() --[[ Line: 55 ]]
			-- upvalues: UseChatTooltipLifecycleModuleResult (copy), ExpChatSharedModule (upval), ConstantsModule (upval)
			UseChatTooltipLifecycleModuleResult.onDismiss()
			ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
				event_type = ConstantsModule.Analytics.EventTypes.Dismiss,
				component = ConstantsModule.Analytics.Components.PresetTooltip
			}, ExpChatSharedModule.Analytics.DefaultStandardizedFields)
		end, { UseChatTooltipLifecycleModuleResult.onDismiss })
		ReactModule.useEffect(function() --[[ Line: 64 ]]
			-- upvalues: UseSignalStateResult (copy), ExpChatSharedModule (upval), ConstantsModule (upval)
			if UseSignalStateResult then
				ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
					event_type = ConstantsModule.Analytics.EventTypes.Show,
					component = ConstantsModule.Analytics.Components.PresetTooltip
				}, ExpChatSharedModule.Analytics.DefaultStandardizedFields)
			end
		end, { UseSignalStateResult })
		
		return if UseSignalStateResult then ReactModule.createElement(Coachmark, {
			title = UseLocalizationResult.headerText,
			text = UseLocalizationResult.bodyText,
			isOpen = UseChatTooltipLifecycleModuleResult.isActive,
			onClose = UseResult,
			side = PopoverSide.Right,
			align = PopoverAlign.Center
		}, p1.children) else ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
	else
		return ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
	end
end)