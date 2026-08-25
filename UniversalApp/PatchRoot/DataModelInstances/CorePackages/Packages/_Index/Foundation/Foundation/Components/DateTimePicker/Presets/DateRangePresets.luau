local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local dateTimeEqualityUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimeEqualityUtilities)
local dateTimePickerDateRangePresetModule = require(foundation.Enums.DateTimePickerDateRangePreset)
local dateTimePresetRangesUtilitiesModule = require(script.Parent.Parent.Utilities.DateTimePresetRangesUtilities)
local _ = require(script.Parent.Parent.DateTimeUtilities)
local chipGroupModule = require(foundation.Components.ChipGroup)
local chipSizeModule = require(foundation.Enums.ChipSize)
local translatorModule = require(foundation.Utility.Localization.Translator)
local list = {
	dateTimePickerDateRangePresetModule.Today,
	dateTimePickerDateRangePresetModule.ThisWeek,
	dateTimePickerDateRangePresetModule.LastWeek,
	dateTimePickerDateRangePresetModule.ThisMonth,
	dateTimePickerDateRangePresetModule.ThisYear,
	dateTimePickerDateRangePresetModule.LastYear
}

local function buildPresetChip(value, p1, p2, p3, p4)
	-- upvalues: dateTimePresetRangesUtilitiesModule (ref), dateTimeEqualityUtilitiesModule (ref), translatorModule (ref)
	local var1 = dateTimePresetRangesUtilitiesModule.resolvePresetRange(value, p2)
	
	return if p3 and not dateTimeEqualityUtilitiesModule.isRangeWithinSelectableRange(var1, p3) then nil else {
		text = translatorModule:FormatByKey(`CommonUI.Controls.Label.{value}`),
		isChecked = dateTimeEqualityUtilitiesModule.areDatesSameDayAsRange(p1, var1),
		onActivated = function()
			-- upvalues: p4 (ref), var1 (ref)
			p4(var1)
		end
	}
end

return function(value)
	-- upvalues: reactModule (ref), list (ref), buildPresetChip (ref), chipGroupModule (ref), chipSizeModule (ref)
	return reactModule.createElement(chipGroupModule, {
		chips = reactModule.useMemo(function()
			-- upvalues: list (copy), buildPresetChip (copy), value (ref)
			local t = {}
			
			for i = 1, #list do
				local var1 = buildPresetChip(list[i], value.selectedDates, value.referenceDate, value.selectableDateRange, value.onPresetSelected)
				
				if var1 then
					table.insert(t, var1)
				end
			end
			return t
		end, {
			value.selectedDates,
			value.referenceDate,
			value.onPresetSelected,
			value.selectableDateRange
		}),
		LayoutOrder = value.LayoutOrder,
		size = chipSizeModule.Small,
		testId = value.testId
	})
end