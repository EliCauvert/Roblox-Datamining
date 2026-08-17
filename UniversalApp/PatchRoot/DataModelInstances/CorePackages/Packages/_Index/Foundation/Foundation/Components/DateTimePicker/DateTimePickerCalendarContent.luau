local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(script.Parent.DateTimeUtilities)
local singleMonthCalendarModule = require(script.Parent.Calendar.SingleMonthCalendar)
local dateTimePickerVariantModule = require(foundation.Enums.DateTimePickerVariant)
local dividerModule = require(foundation.Components.Divider)
local viewModule = require(foundation.Components.View)

return function(p0) --[[ line: 35 | named "DateTimePickerCalendarContent" ]]
	-- upvalues: dateTimePickerVariantModule (ref), reactModule (ref), viewModule (ref), dividerModule (ref), singleMonthCalendarModule (ref)
	local testId = `{p0.testId}--calendar`
	
	return if p0.variant == dateTimePickerVariantModule.DualWithPresets then reactModule.createElement(viewModule, { tag = "col size-full-0 auto-y" }, {
		Calendar = reactModule.createElement(require(script.Parent.Calendar.TwoMonthCalendar), {
			LayoutOrder = 1,
			onDayActivated = p0.onDayActivated,
			referenceDate = p0.referenceDate,
			selectableDateRange = p0.selectableDateRange,
			selectedDates = p0.selectedDates,
			testId = testId,
			viewAnchorDate = p0.viewAnchorDate
		}),
		PresetsDivider = reactModule.createElement(dividerModule, { LayoutOrder = 2 }),
		PresetsBar = reactModule.createElement(viewModule, {
			LayoutOrder = 3,
			tag = "row size-full-0 auto-y padding-x-large padding-y-medium"
		}, {
			Presets = reactModule.createElement(require(script.Parent.Presets.DateRangePresets), {
				LayoutOrder = 1,
				onPresetSelected = p0.onPresetSelected,
				referenceDate = p0.referenceDate,
				selectableDateRange = p0.selectableDateRange,
				selectedDates = p0.selectedDates,
				testId = `{testId}--presets`
			})
		})
	}) else reactModule.createElement(singleMonthCalendarModule, {
		LayoutOrder = 1,
		isDateRange = p0.variant == dateTimePickerVariantModule.Dual,
		onSelectedDateChanged = p0.onSelectedDatesChanged,
		referenceDate = p0.referenceDate,
		selectableDateRange = p0.selectableDateRange,
		selectedDates = p0.selectedDates,
		showTimeList = p0.variant == dateTimePickerVariantModule.SingleWithTime,
		testId = testId,
		viewAnchorDate = p0.viewAnchorDate
	})
end