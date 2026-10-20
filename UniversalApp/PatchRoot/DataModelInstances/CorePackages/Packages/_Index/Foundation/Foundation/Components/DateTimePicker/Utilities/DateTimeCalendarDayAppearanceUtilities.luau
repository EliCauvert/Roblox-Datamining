local DateTimeCalendarViewUtilitiesModule = require(script.Parent.DateTimeCalendarViewUtilities)
local DateTimePickerRangeBandRoleModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerRangeBandRole)
local DateTimeRangeSelectionUtilitiesModule = require(script.Parent.DateTimeRangeSelectionUtilities)
local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

local function isDaySelected(p1, Entry, p2): boolean
	-- upvalues: DateTimeUtilitiesModule (copy)
	local LocalTime = DateTimeUtilitiesModule.toLocalTime(p1)
	local Entry1 = if p2 then Entry elseif Entry[1] == nil then {} else { Entry[1] }
	for _, value in Entry1 do
		if value.Day == LocalTime.Day and value.Month == LocalTime.Month and value.Year == LocalTime.Year then
			return true
		end
	end
	return false
end

local function getRangeBand(p3, Entry, p4, Enabled)
	-- upvalues: DateTimeCalendarViewUtilitiesModule (copy), DateTimeUtilitiesModule (copy), DateTimePickerRangeBandRoleModule (copy)
	local Entry1 = Entry[1]
	local Entry2 = Entry[2]
	
	if not p4 or not Entry1 or not Entry2 then
		return nil, nil, nil
	end
	local config = { startDate = Entry1, endDate = Entry2 }
	local RangeDayBounds, RangeDayBounds2 = DateTimeCalendarViewUtilitiesModule.getRangeDayBounds(config)
	
	if RangeDayBounds == RangeDayBounds2 then
		return nil, nil, nil
	end
	local RoundToStartOfDayResult = DateTimeUtilitiesModule.roundToStartOfDay(p3)
	local IsEnabled = Enabled ~= false
	
	local function fullCellBand()
		-- upvalues: DateTimeCalendarViewUtilitiesModule (upval), p3 (copy), config (copy), DateTimePickerRangeBandRoleModule (upval)
		return nil, nil, DateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p3, config, DateTimePickerRangeBandRoleModule.Full)
	end
	
	if RoundToStartOfDayResult == RangeDayBounds then
		if IsEnabled then
			return UDim2.fromScale(0.5, 0), UDim2.fromScale(0.5, 1), DateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p3, config, DateTimePickerRangeBandRoleModule.Start)
		else
			return fullCellBand()
		end
	elseif RoundToStartOfDayResult == RangeDayBounds2 then
		if IsEnabled then
			return UDim2.fromScale(0, 0), UDim2.fromScale(0.5, 1), DateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p3, config, DateTimePickerRangeBandRoleModule.End)
		else
			return fullCellBand()
		end
	elseif if p4 and (Entry[1] and Entry[2]) then DateTimeUtilitiesModule.isDateWithinRange(p3, { startDate = Entry[1], endDate = Entry[2] }) else false then
		return fullCellBand()
	else
		return nil, nil, nil
	end
end

return {
	getDayCellAppearance = function(p3, p4, Entry, p5, p6)
		-- upvalues: isDaySelected (copy), getRangeBand (copy), DateTimeUtilitiesModule (copy)
		local IsDaySelected = isDaySelected(p3, p4, p5)
		local RangeBand, RangeBand2, RangeBand3 = getRangeBand(p3, Entry, p5, IsDaySelected)
		
		return {
			bandPosition = RangeBand,
			bandRadiusTag = RangeBand3,
			bandSize = RangeBand2,
			isHighlighted = if p5 and (Entry[1] and Entry[2]) then DateTimeUtilitiesModule.isDateWithinRange(p3, { startDate = Entry[1], endDate = Entry[2] }) else false,
			isSelectable = not p6 or DateTimeUtilitiesModule.isDateWithinRange(p3, p6),
			isSelected = IsDaySelected
		}
	end,
	getRangeBand = getRangeBand,
	isDayHighlighted = function(p3, Entry, p4)
		-- upvalues: DateTimeUtilitiesModule (copy)
		return if p4 and (Entry[1] and Entry[2]) then DateTimeUtilitiesModule.isDateWithinRange(p3, { startDate = Entry[1], endDate = Entry[2] }) else false
	end,
	isDaySelectable = function(p3, p4)
		-- upvalues: DateTimeUtilitiesModule (copy)
		return not p4 or DateTimeUtilitiesModule.isDateWithinRange(p3, p4)
	end,
	isDaySelected = isDaySelected,
	resolveHighlightDates = function(Entry, p3)
		-- upvalues: DateTimeRangeSelectionUtilitiesModule (copy)
		return if Entry and Entry[1] then if Entry[2] or not p3 then Entry else DateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(Entry, p3) else Entry or {}
	end
}