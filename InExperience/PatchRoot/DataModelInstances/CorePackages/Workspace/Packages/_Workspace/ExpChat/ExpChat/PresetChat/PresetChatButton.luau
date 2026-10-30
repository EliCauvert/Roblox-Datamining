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
local HasPresetEmojiModule = require(script.Parent.hasPresetEmoji)
local SetIsPresetTrayOpenModule = require(script.Parent.Thunks.setIsPresetTrayOpen)
local FFlagExpChatUseUnifiedTooltipStore = ExpChatSharedModule.Flags.FFlagExpChatUseUnifiedTooltipStore
local FFlagExpChatCenterMobilePresetButtonModule = require(ExpChat.Flags.FFlagExpChatCenterMobilePresetButton)
local FFlagExpChatPresetFullWidthButtonFixesModule = require(ExpChat.Flags.FFlagExpChatPresetFullWidthButtonFixes)
local FFlagExpChatPresetChatCircleFaceEmojiEntryPointRolloutEnabledModule = require(ExpChat.Flags.FFlagExpChatPresetChatCircleFaceEmojiEntryPointRolloutEnabled)
local ExpChatPresetChatEmojiTabExperimentation = require(Parent.SocialExperiments).ExpChatPresetChatEmojiTabExperimentation

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FFlagExpChatPresetFullWidthButtonFixesModule (copy), LocalizationModule (copy), GetPresetChatStoreModule (copy), SignalsReactModule (copy), FFlagExpChatPresetChatCircleFaceEmojiEntryPointRolloutEnabledModule (copy), HasPresetEmojiModule (copy), ExpChatPresetChatEmojiTabExperimentation (copy), FFlagExpChatUseUnifiedTooltipStore (copy), GetChatTooltipStoreModule (copy), SetIsPresetTrayOpenModule (copy), ExpChatSharedModule (copy), ConstantsModule (copy), FoundationModule (copy), ConfigModule (copy), PresetChatTooltipModule (copy), FFlagExpChatCenterMobilePresetButtonModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = if FFlagExpChatPresetFullWidthButtonFixesModule then ReactModule.useRef(nil) else nil
	local UseRefResult2 = if FFlagExpChatPresetFullWidthButtonFixesModule then ReactModule.useRef(nil) else nil
	local UseRefResult3 = if p1.fullWidth then UseRefResult2 else UseRefResult1
	local UseLocalizationResult = LocalizationModule.useLocalization({
		sendQuickWords = "CoreScripts.TextChat.Action.SendQuickWords"
	})
	local PresetChatStoreModule = GetPresetChatStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(PresetChatStoreModule.getIsTrayOpen)
	local IsEmojiIconEnabled = false
	
	if FFlagExpChatPresetChatCircleFaceEmojiEntryPointRolloutEnabledModule then
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(PresetChatStoreModule.getCategoryGroups)
		IsEmojiIconEnabled = ReactModule.useMemo(function()
			-- upvalues: HasPresetEmojiModule (upval), UseSignalStateResult1 (copy)
			return HasPresetEmojiModule(UseSignalStateResult1)
		end, { UseSignalStateResult1 })
	elseif ExpChatPresetChatEmojiTabExperimentation.isExperimentEnabled then
		IsEmojiIconEnabled = ExpChatPresetChatEmojiTabExperimentation.getIsEmojiIconEnabled()
	end
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
	local Element = ReactModule.createElement(PresetChatTooltipModule, {
		targetTextChannel = p1.targetTextChannel,
		anchorRef = if FFlagExpChatPresetFullWidthButtonFixesModule then UseRefResult3 else nil
	}, if p1.fullWidth then ReactModule.createElement(FoundationModule.Button, {
		testId = "--social-exp-chat-button-send-quick-words",
		fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
		onActivated = UseResult,
		text = UseLocalizationResult.sendQuickWords,
		variant = FoundationModule.Enums.ButtonVariant.Standard,
		width = UDim.new(1, 0),
		ref = if FFlagExpChatPresetFullWidthButtonFixesModule then UseRefResult3 else nil
	}) else ReactModule.createElement(FoundationModule.IconButton, {
		isDisabled = false,
		testId = "--social-exp-chat-iconbutton-quick-words",
		icon = {
			name = if IsEmojiIconEnabled then ConfigModule.PresetChat.EmojiIcon else ConfigModule.PresetChat.Icon,
			variant = if UseSignalStateResult then ConfigModule.PresetChat.IconVariantActive else ConfigModule.PresetChat.IconVariant
		},
		variant = FoundationModule.Enums.ButtonVariant.Standard,
		size = if p1.size == nil then FoundationModule.Enums.InputSize.Small else p1.size,
		isCircular = p1.isCircular == nil or p1.isCircular,
		onActivated = UseResult,
		ref = if FFlagExpChatPresetFullWidthButtonFixesModule then UseRefResult3 else nil
	}))
	
	return if FFlagExpChatCenterMobilePresetButtonModule and p1.addTopPadding ~= nil then ReactModule.createElement(FoundationModule.View, {
		tag = {
			["size-full-0 auto-y"] = FFlagExpChatPresetFullWidthButtonFixesModule and p1.fullWidth == true,
			["auto-xy"] = not (FFlagExpChatPresetFullWidthButtonFixesModule and p1.fullWidth == true)
		},
		padding = {
			top = UDim.new(0, if p1.addTopPadding then 8 else 0),
			bottom = UDim.new(0, 1)
		}
	}, Element) else Element
end)