local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ExpChatSharedModule = require(Parent.ExpChatShared)
local SignalsReactModule = require(Parent.SignalsReact)
local ConfigModule = require(ExpChat.Config)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local GetPresetChatStoreModule = require(ExpChat.Stores.GetPresetChatStore)
local GetChatTooltipStoreModule = require(ExpChat.Stores.GetChatTooltipStore)
local LocalizationModule = require(ExpChat.Localization)
local PresetChatTooltipModule = require(script.Parent.PresetChatTooltip)
local SetIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), LocalizationModule (copy), GetPresetChatStoreModule (copy), SignalsReactModule (copy), FFlagExpChatUseUnifiedTooltipStore (copy), GetChatTooltipStoreModule (copy), SetIsPresetTrayOpenModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), FoundationModule (copy), ConfigModule (copy), PresetChatTooltipModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseLocalizationResult = LocalizationModule.useLocalization({
		sendQuickWords = "CoreScripts.TextChat.Action.SendQuickWords"
	})
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PresetChatStoreModule.getIsTrayOpen)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagExpChatUseUnifiedTooltipStore (upval), GetChatTooltipStoreModule (upval), UseRefResult (copy), SetIsPresetTrayOpenModule (upval), PresetChatStoreModule (copy), ExpChatSharedModule (upval), ConstantsModule (upval)
		if FFlagExpChatUseUnifiedTooltipStore then
			local ChatTooltipStoreModule = GetChatTooltipStoreModule(false)
			
			if not UseRefResult.current then
				UseRefResult.current = true
				ChatTooltipStoreModule.reportImpression("PresetChatTooltip")
			end
			ChatTooltipStoreModule.setIsDismissed("PresetChatTooltip", true)
		end
		SetIsPresetTrayOpenModule(PresetChatStoreModule, not PresetChatStoreModule.getIsTrayOpen(false))
		ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = ConstantsModule.Analytics.EventTypes.Click,
			component = ConstantsModule.Analytics.Components.PresetEntryPointButton
		}, ExpChatSharedModule.Analytics.DefaultStandardizedFields)
	end, { PresetChatStoreModule })
	
	return ReactModule.createElement(PresetChatTooltipModule, { targetTextChannel = p1.targetTextChannel }, if p1.fullWidth then ReactModule.createElement(FoundationModule.Button, {
		fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
		onActivated = UseResult,
		text = UseLocalizationResult.sendQuickWords,
		variant = FoundationModule.Enums.ButtonVariant.Standard,
		width = UDim.new(1, 0)
	}) else ReactModule.createElement(FoundationModule.IconButton, {
		isDisabled = false,
		icon = {
			name = ConfigModule.PresetChat.Icon,
			variant = if UseSignalStateResult then ConfigModule.PresetChat.IconVariantActive else ConfigModule.PresetChat.IconVariant
		},
		variant = FoundationModule.Enums.ButtonVariant.Standard,
		size = if p1.size == nil then FoundationModule.Enums.InputSize.Small else p1.size,
		isCircular = p1.isCircular == nil or p1.isCircular,
		onActivated = UseResult
	}))
end)