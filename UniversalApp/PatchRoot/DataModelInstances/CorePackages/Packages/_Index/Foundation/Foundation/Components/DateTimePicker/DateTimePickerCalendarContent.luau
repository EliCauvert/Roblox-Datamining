local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(script.Parent.DateTimeUtilities)
local singleMonthCalendarModule = require(script.Parent.Calendar.SingleMonthCalendar)
local dateTimePickerVariantModule = require(foundation.Enums.DateTimePickerVariant)
local dividerModule = require(foundation.Components.Divider)
local viewModule = require(foundation.Components.View)

return function(p1)
	-- upvalues: dateTimePickerVariantModule (ref), reactModule (ref), viewModule (ref), dividerModule (ref), singleMonthCalendarModule (ref)
	local testId = `{p1.testId}--calendar`
	
	return if p1.variant == dateTimePickerVariantModule.DualWithPresets then reactModule.createElement(viewModule, { tag = "col size-full-0 auto-y" }, {
		Calendar = reactModule.createElement(require(script.Parent.Calendar.TwoMonthCalendar), {
			LayoutOrder = 1,
			onDayActivated = p1.onDayActivated,
			referenceDate = p1.referenceDate,
			selectableDateRange = p1.selectableDateRange,
			selectedDates = p1.selectedDates,
			testId = testId,
			viewAnchorDate = p1.viewAnchorDate
		}),
		PresetsDivider = reactModule.createElement(dividerModule, { LayoutOrder = 2 }),
		PresetsBar = reactModule.createElement(viewModule, {
			LayoutOrder = 3,
			tag = "row size-full-0 auto-y padding-x-large padding-y-medium"
		}, {
			Presets = reactModule.createElement(require(script.Parent.Presets.DateRangePresets), {
				LayoutOrder = 1,
				onPresetSelected = p1.onPresetSelected,
				referenceDate = p1.referenceDate,
				selectableDateRange = p1.selectableDateRange,
				selectedDates = p1.selectedDates,
				testId = `{testId}--presets`
			})
		})
	}) else reactModule.createElement(singleMonthCalendarModule, {
		LayoutOrder = 1,
		isDateRange = p1.variant == dateTimePickerVariantModule.Dual,
		onSelectedDateChanged = p1.onSelectedDatesChanged,
		referenceDate = p1.referenceDate,
		selectableDateRange = p1.selectableDateRange,
		selectedDates = p1.selectedDates,
		showTimeList = p1.variant == dateTimePickerVariantModule.SingleWithTime,
		testId = testId,
		viewAnchorDate = p1.viewAnchorDate
	})
end