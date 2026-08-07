local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local expChatSharedModule = require(parent.ExpChatShared)
local signalsReactModule = require(parent.SignalsReact)
local configModule = require(expChat.Config)
local constantsModule = require(expChat.PresetChat.Constants)
local getPresetChatStoreModule = require(expChat.Stores.GetPresetChatStore)
local getChatTooltipStoreModule = require(expChat.Stores.GetChatTooltipStore)
local localizationModule = require(expChat.Localization)
local presetChatTooltipModule = require(script.Parent.PresetChatTooltip)
local setIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local fFlagExpChatUseUnifiedTooltipStore = expChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore

return reactModule.memo(function(value) --[[ line: 24 | named "PresetChatButton" ]]
	-- upvalues: reactModule (ref), localizationModule (ref), getPresetChatStoreModule (ref), signalsReactModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), setIsPresetTrayOpenModule (ref), expChatSharedModule (ref), constantsModule (ref), foundationModule (ref), configModule (ref), presetChatTooltipModule (ref)
	local var12 = reactModule.useRef(false)
	local var13 = localizationModule.useLocalization({
		sendQuickWords = "CoreScripts.TextChat.Action.SendQuickWords"
	})
	local var14 = getPresetChatStoreModule(false)
	local var15 = reactModule.useCallback(function() --[[ line: 34 ]]
		-- upvalues: fFlagExpChatUseUnifiedTooltipStore (copy), getChatTooltipStoreModule (copy), var12 (ref), setIsPresetTrayOpenModule (copy), var14 (ref), expChatSharedModule (copy), constantsModule (copy)
		if fFlagExpChatUseUnifiedTooltipStore then
			local var16 = getChatTooltipStoreModule(false)
			
			if not var12.current then
				var12.current = true
				var16.reportImpression("PresetChatTooltip")
			end
			var16.setIsDismissed("PresetChatTooltip", true)
		end
		setIsPresetTrayOpenModule(var14, not var14.getIsTrayOpen(false))
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Click,
			component = constantsModule.Analytics.Components.PresetEntryPointButton
		}, expChatSharedModule.Analytics.DefaultStandardizedFields)
	end, { var14 })
	
	return reactModule.createElement(presetChatTooltipModule, { targetTextChannel = value.targetTextChannel }, if value.fullWidth then reactModule.createElement(foundationModule.Button, {
		fillBehavior = foundationModule.Enums.FillBehavior.Fit,
		onActivated = var15,
		text = var13.sendQuickWords,
		variant = foundationModule.Enums.ButtonVariant.Standard,
		width = UDim.new(1, 0)
	}) else reactModule.createElement(foundationModule.IconButton, {
		isDisabled = false,
		icon = {
			name = configModule.PresetChat.Icon,
			variant = if signalsReactModule.useSignalState(var14.getIsTrayOpen) then configModule.PresetChat.IconVariantActive else configModule.PresetChat.IconVariant
		},
		variant = foundationModule.Enums.ButtonVariant.Standard,
		size = if value.size ~= nil then foundationModule.Enums.InputSize.Small else value.size,
		isCircular = value.isCircular ~= nil or value.isCircular,
		onActivated = var15
	}))
end)