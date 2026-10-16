local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local Icon = require(Parent.BuilderIcons).Icon
local DateTimePickerCalendarContentModule = require(script.Parent.DateTimePickerCalendarContent)
local DateTimePickerPanelModule = require(script.Parent.DateTimePickerPanel)
local _ = require(script.Parent.DateTimePickerProps)
local UseDateTimePickerStateModule = require(script.Parent.useDateTimePickerState)
local DateTimePickerVariantModule = require(Foundation.Enums.DateTimePickerVariant)
local InputSizeModule = require(Foundation.Enums.InputSize)
local PopoverModule = require(Foundation.Components.Popover)
local PopoverAlignModule = require(Foundation.Enums.PopoverAlign)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)
local TextInputModule = require(Foundation.Components.TextInput)
local TranslatorModule = require(Foundation.Utility.Localization.Translator)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	testId = "--foundation-date-time-picker",
	variant = DateTimePickerVariantModule.Single
}

return ReactModule.memo(function(p1) --[[ Line: 32 | Named "DateTimePickerBeta" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), DateTimePickerVariantModule (copy), UseDateTimePickerStateModule (copy), ReactModule (copy), PopoverModule (copy), TextInputModule (copy), WithCommonPropsModule (copy), Icon (copy), TranslatorModule (copy), InputSizeModule (copy), PopoverAlignModule (copy), PopoverSideModule (copy), DateTimePickerPanelModule (copy), DateTimePickerCalendarContentModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local Variant = WithDefaultsModuleResult.variant or DateTimePickerVariantModule.Single
	local IsVariantMatch = Variant == DateTimePickerVariantModule.DualWithPresets
	local IsVariantMatch1 = Variant == DateTimePickerVariantModule.SingleWithTime
	local IsVariantMatch2: boolean = IsVariantMatch or IsVariantMatch1
	local UseDateTimePickerStateModuleResult = UseDateTimePickerStateModule(WithDefaultsModuleResult)
	
	return ReactModule.createElement(PopoverModule.Root, {
		isOpen = UseDateTimePickerStateModuleResult.isOpen,
		testId = WithDefaultsModuleResult.testId
	}, {
		DateInput = ReactModule.createElement(TextInputModule, WithCommonPropsModule(WithDefaultsModuleResult, {
			key = "date-input",
			hasError = WithDefaultsModuleResult.hasError,
			hint = WithDefaultsModuleResult.hint,
			iconTrailing = {
				name = Icon.Calendar,
				onActivated = UseDateTimePickerStateModuleResult.showDateTimePicker
			},
			isDisabled = WithDefaultsModuleResult.isDisabled,
			isRequired = WithDefaultsModuleResult.isRequired,
			label = WithDefaultsModuleResult.label,
			onChanged = UseDateTimePickerStateModuleResult.updateInputText,
			onFocusGained = UseDateTimePickerStateModuleResult.onFocusGained,
			onFocusLost = UseDateTimePickerStateModuleResult.onFocusLost,
			placeholder = WithDefaultsModuleResult.placeholder or TranslatorModule:FormatByKey("CommonUI.Controls.Label.SelectDate"),
			ref = UseDateTimePickerStateModuleResult.textInputRef,
			selectableDateRange = WithDefaultsModuleResult.selectableDateRange,
			size = InputSizeModule.Medium,
			testId = `{WithDefaultsModuleResult.testId}--text-input`,
			text = UseDateTimePickerStateModuleResult.inputText,
			width = WithDefaultsModuleResult.width
		})),
		Anchor = ReactModule.createElement(PopoverModule.Anchor, {
			anchorRef = UseDateTimePickerStateModuleResult.textInputRef
		}),
		PopoverContent = ReactModule.createElement(PopoverModule.Content, {
			hasArrow = false,
			align = PopoverAlignModule.Start,
			onPressedOutside = UseDateTimePickerStateModuleResult.closeDateTimePicker,
			selection = WithDefaultsModuleResult.selection,
			selectionGroup = WithDefaultsModuleResult.selectionGroup,
			side = {
				offset = UseTokensModuleResult.Stroke.Standard + UseTokensModuleResult.Padding.Small,
				position = PopoverSideModule.Bottom
			}
		}, UseDateTimePickerStateModuleResult.isOpen and ReactModule.createElement(DateTimePickerPanelModule, {
			isApplyButtonDisabled = UseDateTimePickerStateModuleResult.isApplyButtonDisabled,
			isResetButtonDisabled = UseDateTimePickerStateModuleResult.isResetButtonDisabled,
			isSectioned = IsVariantMatch2,
			onApply = UseDateTimePickerStateModuleResult.onApply,
			onCancel = UseDateTimePickerStateModuleResult.onCancel,
			onReset = if IsVariantMatch2 then UseDateTimePickerStateModuleResult.onReset else nil,
			sectionedLayout = if IsVariantMatch then "dual" elseif IsVariantMatch1 then "singleWithTime" else nil,
			showReset = IsVariantMatch2,
			testId = WithDefaultsModuleResult.testId
		}, ReactModule.createElement(DateTimePickerCalendarContentModule, {
			onDayActivated = UseDateTimePickerStateModuleResult.onDayActivated,
			onPresetSelected = UseDateTimePickerStateModuleResult.onPresetSelected,
			onSelectedDatesChanged = UseDateTimePickerStateModuleResult.onSelectedDatesChanged,
			referenceDate = WithDefaultsModuleResult.referenceDate,
			selectableDateRange = WithDefaultsModuleResult.selectableDateRange,
			selectedDates = UseDateTimePickerStateModuleResult.selectedDates,
			testId = WithDefaultsModuleResult.testId,
			variant = Variant,
			viewAnchorDate = UseDateTimePickerStateModuleResult.viewAnchorDate
		})))
	})
end)