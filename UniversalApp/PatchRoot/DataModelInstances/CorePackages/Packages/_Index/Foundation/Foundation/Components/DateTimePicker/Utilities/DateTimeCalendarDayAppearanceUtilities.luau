local dateTimeCalendarViewUtilitiesModule = require(script.Parent.DateTimeCalendarViewUtilities)
local dateTimePickerRangeBandRoleModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerRangeBandRole)
local dateTimeRangeSelectionUtilitiesModule = require(script.Parent.DateTimeRangeSelectionUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

local function isDaySelected(p1, p2, p3)
	-- upvalues: dateTimeUtilitiesModule (ref)
	local var1 = dateTimeUtilitiesModule.toLocalTime(p1)
	
	for i, v in if p3 then p2 elseif p2[1] ~= nil then {} else { p2[1] } do
		if v.Day == var1.Day and v.Month == var1.Month and v.Year == var1.Year then
			return true
		end
	end
	return false
end

local function getRangeBand(p4, p5, p6, p7)
	-- upvalues: dateTimeCalendarViewUtilitiesModule (ref), dateTimeUtilitiesModule (ref), dateTimePickerRangeBandRoleModule (ref)
	local var2 = p5[1]
	local var3 = p5[2]
	
	if not p6 or not var2 or not var3 then
		return nil, nil, nil
	end
	local t = { startDate = var2, endDate = var3 }
	local rangeDayBounds, rangeDayBounds_1 = dateTimeCalendarViewUtilitiesModule.getRangeDayBounds(t)
	
	if rangeDayBounds == rangeDayBounds_1 then
		return nil, nil, nil
	end
	local var4 = dateTimeUtilitiesModule.roundToStartOfDay(p4)
	local var5 = p7 ~= false
	
	local function fullCellBand()
		-- upvalues: dateTimeCalendarViewUtilitiesModule (copy), p4 (ref), t (ref), dateTimePickerRangeBandRoleModule (copy)
		return nil, nil, dateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p4, t, dateTimePickerRangeBandRoleModule.Full)
	end
	
	if var4 == rangeDayBounds then
		if var5 then
			return UDim2.fromScale(0.5, 0), UDim2.fromScale(0.5, 1), dateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p4, t, dateTimePickerRangeBandRoleModule.Start)
		end
		return fullCellBand()
	elseif var4 == rangeDayBounds_1 then
		if var5 then
			return UDim2.fromScale(0, 0), UDim2.fromScale(0.5, 1), dateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p4, t, dateTimePickerRangeBandRoleModule.End)
		end
		return fullCellBand()
	elseif not p6 and (if p5[1] and p5[2] then dateTimeUtilitiesModule.isDateWithinRange(p4, { startDate = p5[1], endDate = p5[2] }) else false) then
		return fullCellBand()
	end
	return nil, nil, nil
end

return {
	getDayCellAppearance = function(p4, p5, p6, p7, p8)
		-- upvalues: isDaySelected (ref), getRangeBand (ref), dateTimeUtilitiesModule (ref)
		local var2 = isDaySelected(p4, p5, p7)
		local var3, var4, var5 = getRangeBand(p4, p6, p7, var2)
		
		return {
			bandPosition = var3,
			bandRadiusTag = var5,
			bandSize = var4,
			isHighlighted = not p7 and (if p6[1] and p6[2] then dateTimeUtilitiesModule.isDateWithinRange(p4, { startDate = p6[1], endDate = p6[2] }) else false),
			isSelectable = if p8 and not dateTimeUtilitiesModule.isDateWithinRange(p4, p8) then false else true,
			isSelected = var2
		}
	end,
	getRangeBand = getRangeBand,
	isDayHighlighted = function(p4, p5, p6)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return if p6 then if p5[1] and p5[2] then dateTimeUtilitiesModule.isDateWithinRange(p4, { startDate = p5[1], endDate = p5[2] }) else false else false
	end,
	isDaySelectable = function(p4, p5)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return p5 and not dateTimeUtilitiesModule.isDateWithinRange(p4, p5)
	end,
	isDaySelected = isDaySelected,
	resolveHighlightDates = function(p4, p5)
		-- upvalues: dateTimeRangeSelectionUtilitiesModule (ref)
		return if not (not p4 or not p4[1]) then if p4[2] or not p5 then p4 else dateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(p4, p5) else p4 or {}
	end
}