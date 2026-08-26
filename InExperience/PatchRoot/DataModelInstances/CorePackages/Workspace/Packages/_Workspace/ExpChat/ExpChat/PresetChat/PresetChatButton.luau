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

return reactModule.memo(function(value)
	-- upvalues: reactModule (ref), localizationModule (ref), getPresetChatStoreModule (ref), signalsReactModule (ref), fFlagExpChatUseUnifiedTooltipStore (ref), getChatTooltipStoreModule (ref), setIsPresetTrayOpenModule (ref), expChatSharedModule (ref), constantsModule (ref), foundationModule (ref), configModule (ref), presetChatTooltipModule (ref)
	local var1 = reactModule.useRef(false)
	local var2 = localizationModule.useLocalization({
		sendQuickWords = "CoreScripts.TextChat.Action.SendQuickWords"
	})
	local var3 = getPresetChatStoreModule(false)
	local var4 = reactModule.useCallback(function()
		-- upvalues: fFlagExpChatUseUnifiedTooltipStore (copy), getChatTooltipStoreModule (copy), var1 (ref), setIsPresetTrayOpenModule (copy), var3 (ref), expChatSharedModule (copy), constantsModule (copy)
		if fFlagExpChatUseUnifiedTooltipStore then
			local var5 = getChatTooltipStoreModule(false)
			
			if not var1.current then
				var1.current = true
				var5.reportImpression("PresetChatTooltip")
			end
			var5.setIsDismissed("PresetChatTooltip", true)
		end
		setIsPresetTrayOpenModule(var3, not var3.getIsTrayOpen(false))
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Click,
			component = constantsModule.Analytics.Components.PresetEntryPointButton
		}, expChatSharedModule.Analytics.DefaultStandardizedFields)
	end, { var3 })
	
	return reactModule.createElement(presetChatTooltipModule, { targetTextChannel = value.targetTextChannel }, if value.fullWidth then reactModule.createElement(foundationModule.Button, {
		fillBehavior = foundationModule.Enums.FillBehavior.Fit,
		onActivated = var4,
		text = var2.sendQuickWords,
		variant = foundationModule.Enums.ButtonVariant.Standard,
		width = UDim.new(1, 0)
	}) else reactModule.createElement(foundationModule.IconButton, {
		isDisabled = false,
		icon = {
			name = configModule.PresetChat.Icon,
			variant = if signalsReactModule.useSignalState(var3.getIsTrayOpen) then configModule.PresetChat.IconVariantActive else configModule.PresetChat.IconVariant
		},
		variant = foundationModule.Enums.ButtonVariant.Standard,
		size = if value.size ~= nil then foundationModule.Enums.InputSize.Small else value.size,
		isCircular = value.isCircular ~= nil or value.isCircular,
		onActivated = var4
	}))
end)