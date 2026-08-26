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
	local var1 = withDefaultsModule(x, t)
	local var2 = useTokensModule()
	local variant = var1.variant or dateTimePickerVariantModule.Single
	local var3 = variant == dateTimePickerVariantModule.DualWithPresets
	local var4 = variant == dateTimePickerVariantModule.SingleWithTime
	local var5 = var3 or var4
	local var6 = useDateTimePickerStateModule(var1)
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var6.isOpen, testId = var1.testId }, {
		DateInput = reactModule.createElement(textInputModule, withCommonPropsModule(var1, {
			key = "date-input",
			hasError = var1.hasError,
			hint = var1.hint,
			iconTrailing = {
				name = icon.Calendar,
				onActivated = var6.showDateTimePicker
			},
			isDisabled = var1.isDisabled,
			isRequired = var1.isRequired,
			label = var1.label,
			onChanged = var6.updateInputText,
			onFocusGained = var6.onFocusGained,
			onFocusLost = var6.onFocusLost,
			placeholder = var1.placeholder or translatorModule:FormatByKey("CommonUI.Controls.Label.SelectDate"),
			ref = var6.textInputRef,
			selectableDateRange = var1.selectableDateRange,
			size = inputSizeModule.Medium,
			testId = `{var1.testId}--text-input`,
			text = var6.inputText,
			width = var1.width
		})),
		Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var6.textInputRef }),
		PopoverContent = reactModule.createElement(popoverModule.Content, {
			hasArrow = false,
			align = popoverAlignModule.Start,
			onPressedOutside = var6.closeDateTimePicker,
			selection = var1.selection,
			selectionGroup = var1.selectionGroup,
			side = {
				offset = var2.Stroke.Standard + var2.Padding.Small,
				position = popoverSideModule.Bottom
			}
		}, var6.isOpen and reactModule.createElement(dateTimePickerPanelModule, {
			isApplyButtonDisabled = var6.isApplyButtonDisabled,
			isResetButtonDisabled = var6.isResetButtonDisabled,
			isSectioned = var5,
			onApply = var6.onApply,
			onCancel = var6.onCancel,
			onReset = if var5 then var6.onReset else nil,
			sectionedLayout = if var3 then "dual" elseif var4 then "singleWithTime" else nil,
			showReset = var5,
			testId = var1.testId
		}, reactModule.createElement(dateTimePickerCalendarContentModule, {
			onDayActivated = var6.onDayActivated,
			onPresetSelected = var6.onPresetSelected,
			onSelectedDatesChanged = var6.onSelectedDatesChanged,
			referenceDate = var1.referenceDate,
			selectableDateRange = var1.selectableDateRange,
			selectedDates = var6.selectedDates,
			testId = var1.testId,
			variant = variant,
			viewAnchorDate = var6.viewAnchorDate
		})))
	})
end)