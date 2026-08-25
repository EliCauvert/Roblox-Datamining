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

local function buildPresetChip(value, p0, p1, p2, p3)
	-- upvalues: dateTimePresetRangesUtilitiesModule (ref), dateTimeEqualityUtilitiesModule (ref), translatorModule (ref)
	local var10 = dateTimePresetRangesUtilitiesModule.resolvePresetRange(value, p1)
	
	return if p2 and not dateTimeEqualityUtilitiesModule.isRangeWithinSelectableRange(var10, p2) then nil else {
		text = translatorModule:FormatByKey(`CommonUI.Controls.Label.{value}`),
		isChecked = dateTimeEqualityUtilitiesModule.areDatesSameDayAsRange(p0, var10),
		onActivated = function()
			-- upvalues: p3 (ref), var10 (ref)
			p3(var10)
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
				local var12 = buildPresetChip(list[i], value.selectedDates, value.referenceDate, value.selectableDateRange, value.onPresetSelected)
				
				if var12 then
					table.insert(t, var12)
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