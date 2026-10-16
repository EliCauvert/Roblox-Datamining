local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local DateTimeEqualityUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeEqualityUtilities)
local DateTimePickerDateRangePresetModule = require(Foundation.Enums.DateTimePickerDateRangePreset)
local DateTimePresetRangesUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimePresetRangesUtilities)
local _ = require(script.Parent.Parent.DateTimeUtilities)
local ChipGroupModule = require(Foundation.Components.ChipGroup)
local ChipSizeModule = require(Foundation.Enums.ChipSize)
local TranslatorModule = require(Foundation.Utility.Localization.Translator)
local list = {
	DateTimePickerDateRangePresetModule.Today,
	DateTimePickerDateRangePresetModule.ThisWeek,
	DateTimePickerDateRangePresetModule.LastWeek,
	DateTimePickerDateRangePresetModule.ThisMonth,
	DateTimePickerDateRangePresetModule.ThisYear,
	DateTimePickerDateRangePresetModule.LastYear
}

local function buildPresetChip(p1, SelectedDates, ReferenceDate, SelectableDateRange, Callback) --[[ Line: 39 ]]
	-- upvalues: DateTimePresetRangesUtilitiesModule (copy), DateTimeEqualityUtilitiesModule (copy), TranslatorModule (copy)
	local ResolvePresetRangeResult = DateTimePresetRangesUtilitiesModule.resolvePresetRange(p1, ReferenceDate)
	
	return if SelectableDateRange and not DateTimeEqualityUtilitiesModule.isRangeWithinSelectableRange(ResolvePresetRangeResult, SelectableDateRange) then nil else {
		text = TranslatorModule:FormatByKey(`CommonUI.Controls.Label.{p1}`),
		isChecked = DateTimeEqualityUtilitiesModule.areDatesSameDayAsRange(SelectedDates, ResolvePresetRangeResult),
		onActivated = function() --[[ Line: 56 ]]
			-- upvalues: Callback (copy), ResolvePresetRangeResult (copy)
			Callback(ResolvePresetRangeResult)
		end
	}
end

return function(Frame) --[[ Line: 62 | Named "DateRangePresets" ]]
	-- upvalues: ReactModule (copy), list (copy), buildPresetChip (copy), ChipGroupModule (copy), ChipSizeModule (copy)
	return ReactModule.createElement(ChipGroupModule, {
		chips = ReactModule.useMemo(function() --[[ Line: 63 ]]
			-- upvalues: list (upval), buildPresetChip (upval), Frame (copy)
			local List = {}
			
			for i = 1, #list do
				local PresetChip = buildPresetChip(list[i], Frame.selectedDates, Frame.referenceDate, Frame.selectableDateRange, Frame.onPresetSelected)
				
				if PresetChip then
					table.insert(List, PresetChip)
				end
			end
			return List
		end, {
			Frame.selectedDates,
			Frame.referenceDate,
			Frame.onPresetSelected,
			Frame.selectableDateRange
		}),
		LayoutOrder = Frame.LayoutOrder,
		size = ChipSizeModule.Small,
		testId = Frame.testId
	})
end