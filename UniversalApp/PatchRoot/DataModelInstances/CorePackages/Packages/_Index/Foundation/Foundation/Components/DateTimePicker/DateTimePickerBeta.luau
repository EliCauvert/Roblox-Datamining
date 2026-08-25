local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local icon = require(parent.BuilderIcons).Icon
local dateTimePickerCalendarContentModule = require(script.Parent.DateTimePickerCalendarContent)
local dateTimePickerPanelModule = require(script.Parent.DateTimePickerPanel)
local _ = require(script.Parent.DateTimePickerProps)
local useDateTimePickerStateModule = require(script.Parent.useDateTimePickerState)
local dateTimePickerVariantModule = require(foundation.Enums.DateTimePickerVariant)
local inputSizeModule = require(foundation.Enums.InputSize)
local popoverModule = require(foundation.Components.Popover)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local textInputModule = require(foundation.Components.TextInput)
local translatorModule = require(foundation.Utility.Localization.Translator)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	testId = "--foundation-date-time-picker",
	variant = dateTimePickerVariantModule.Single
}

return reactModule.memo(function(x)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), dateTimePickerVariantModule (ref), useDateTimePickerStateModule (ref), reactModule (ref), popoverModule (ref), textInputModule (ref), withCommonPropsModule (ref), icon (ref), translatorModule (ref), inputSizeModule (ref), popoverAlignModule (ref), popoverSideModule (ref), dateTimePickerPanelModule (ref), dateTimePickerCalendarContentModule (ref)
	local var16 = withDefaultsModule(x, t)
	local var17 = useTokensModule()
	local variant = var16.variant or dateTimePickerVariantModule.Single
	local var19 = variant == dateTimePickerVariantModule.DualWithPresets
	local var20 = variant == dateTimePickerVariantModule.SingleWithTime
	local var19_1 = var19 or var20
	local var22 = useDateTimePickerStateModule(var16)
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var22.isOpen, testId = var16.testId }, {
		DateInput = reactModule.createElement(textInputModule, withCommonPropsModule(var16, {
			key = "date-input",
			hasError = var16.hasError,
			hint = var16.hint,
			iconTrailing = {
				name = icon.Calendar,
				onActivated = var22.showDateTimePicker
			},
			isDisabled = var16.isDisabled,
			isRequired = var16.isRequired,
			label = var16.label,
			onChanged = var22.updateInputText,
			onFocusGained = var22.onFocusGained,
			onFocusLost = var22.onFocusLost,
			placeholder = var16.placeholder or translatorModule:FormatByKey("CommonUI.Controls.Label.SelectDate"),
			ref = var22.textInputRef,
			selectableDateRange = var16.selectableDateRange,
			size = inputSizeModule.Medium,
			testId = `{var16.testId}--text-input`,
			text = var22.inputText,
			width = var16.width
		})),
		Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var22.textInputRef }),
		PopoverContent = reactModule.createElement(popoverModule.Content, {
			hasArrow = false,
			align = popoverAlignModule.Start,
			onPressedOutside = var22.closeDateTimePicker,
			selection = var16.selection,
			selectionGroup = var16.selectionGroup,
			side = {
				offset = var17.Stroke.Standard + var17.Padding.Small,
				position = popoverSideModule.Bottom
			}
		}, var22.isOpen and reactModule.createElement(dateTimePickerPanelModule, {
			isApplyButtonDisabled = var22.isApplyButtonDisabled,
			isResetButtonDisabled = var22.isResetButtonDisabled,
			isSectioned = var19_1,
			onApply = var22.onApply,
			onCancel = var22.onCancel,
			onReset = if var19_1 then var22.onReset else nil,
			sectionedLayout = if var19 then "dual" elseif var20 then "singleWithTime" else nil,
			showReset = var19_1,
			testId = var16.testId
		}, reactModule.createElement(dateTimePickerCalendarContentModule, {
			onDayActivated = var22.onDayActivated,
			onPresetSelected = var22.onPresetSelected,
			onSelectedDatesChanged = var22.onSelectedDatesChanged,
			referenceDate = var16.referenceDate,
			selectableDateRange = var16.selectableDateRange,
			selectedDates = var22.selectedDates,
			testId = var16.testId,
			variant = variant,
			viewAnchorDate = var22.viewAnchorDate
		})))
	})
end)