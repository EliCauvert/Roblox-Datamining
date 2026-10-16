local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(script.Parent.DateTimeUtilities)
local SingleMonthCalendarModule = require(script.Parent.Calendar.SingleMonthCalendar)
local DateTimePickerVariantModule = require(Foundation.Enums.DateTimePickerVariant)
local DividerModule = require(Foundation.Components.Divider)
local ViewModule = require(Foundation.Components.View)

return function(p1) --[[ Line: 35 | Named "DateTimePickerCalendarContent" ]]
	-- upvalues: DateTimePickerVariantModule (copy), ReactModule (copy), ViewModule (copy), DividerModule (copy), SingleMonthCalendarModule (copy)
	local CalendarName: string = `{p1.testId}--calendar`
	
	return if p1.variant == DateTimePickerVariantModule.DualWithPresets then ReactModule.createElement(ViewModule, { tag = "col size-full-0 auto-y" }, {
		Calendar = ReactModule.createElement(require(script.Parent.Calendar.TwoMonthCalendar), {
			LayoutOrder = 1,
			onDayActivated = p1.onDayActivated,
			referenceDate = p1.referenceDate,
			selectableDateRange = p1.selectableDateRange,
			selectedDates = p1.selectedDates,
			testId = CalendarName,
			viewAnchorDate = p1.viewAnchorDate
		}),
		PresetsDivider = ReactModule.createElement(DividerModule, { LayoutOrder = 2 }),
		PresetsBar = ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			tag = "row size-full-0 auto-y padding-x-large padding-y-medium"
		}, {
			Presets = ReactModule.createElement(require(script.Parent.Presets.DateRangePresets), {
				LayoutOrder = 1,
				onPresetSelected = p1.onPresetSelected,
				referenceDate = p1.referenceDate,
				selectableDateRange = p1.selectableDateRange,
				selectedDates = p1.selectedDates,
				testId = `{CalendarName}--presets`
			})
		})
	}) else ReactModule.createElement(SingleMonthCalendarModule, {
		LayoutOrder = 1,
		isDateRange = p1.variant == DateTimePickerVariantModule.Dual,
		onSelectedDateChanged = p1.onSelectedDatesChanged,
		referenceDate = p1.referenceDate,
		selectableDateRange = p1.selectableDateRange,
		selectedDates = p1.selectedDates,
		showTimeList = p1.variant == DateTimePickerVariantModule.SingleWithTime,
		testId = CalendarName,
		viewAnchorDate = p1.viewAnchorDate
	})
end