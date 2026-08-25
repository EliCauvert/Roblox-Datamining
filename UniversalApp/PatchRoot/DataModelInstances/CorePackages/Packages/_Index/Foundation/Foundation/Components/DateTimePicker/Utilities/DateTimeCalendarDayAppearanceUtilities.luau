local dateTimeCalendarViewUtilitiesModule = require(script.Parent.DateTimeCalendarViewUtilities)
local dateTimePickerRangeBandRoleModule = require(script:FindFirstAncestor("Foundation").Enums.DateTimePickerRangeBandRole)
local dateTimeRangeSelectionUtilitiesModule = require(script.Parent.DateTimeRangeSelectionUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

local function isDaySelected(p0, p1, p2)
	-- upvalues: dateTimeUtilitiesModule (ref)
	local var6 = dateTimeUtilitiesModule.toLocalTime(p0)
	
	for i, v in if p2 then p1 elseif p1[1] ~= nil then {} else { p1[1] } do
		if v.Day == var6.Day and v.Month == var6.Month and v.Year == var6.Year then
			return true
		end
	end
	return false
end

local function getRangeBand(p3, p4, p5, p6)
	-- upvalues: dateTimeCalendarViewUtilitiesModule (ref), dateTimeUtilitiesModule (ref), dateTimePickerRangeBandRoleModule (ref)
	local var7 = p4[1]
	local var8 = p4[2]
	
	if not p5 or not var7 or not var8 then
		return nil, nil, nil
	end
	local t = { startDate = var7, endDate = var8 }
	local rangeDayBounds, rangeDayBounds_1 = dateTimeCalendarViewUtilitiesModule.getRangeDayBounds(t)
	
	if rangeDayBounds == rangeDayBounds_1 then
		return nil, nil, nil
	end
	local var12 = dateTimeUtilitiesModule.roundToStartOfDay(p3)
	local var13 = p6 ~= false
	
	local function fullCellBand()
		-- upvalues: dateTimeCalendarViewUtilitiesModule (copy), p3 (ref), t (ref), dateTimePickerRangeBandRoleModule (copy)
		return nil, nil, dateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p3, t, dateTimePickerRangeBandRoleModule.Full)
	end
	
	if var12 == rangeDayBounds then
		if var13 then
			return UDim2.fromScale(0.5, 0), UDim2.fromScale(0.5, 1), dateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p3, t, dateTimePickerRangeBandRoleModule.Start)
		end
		return fullCellBand()
	elseif var12 == rangeDayBounds_1 then
		if var13 then
			return UDim2.fromScale(0, 0), UDim2.fromScale(0.5, 1), dateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p3, t, dateTimePickerRangeBandRoleModule.End)
		end
		return fullCellBand()
	elseif not p5 and (if p4[1] and p4[2] then dateTimeUtilitiesModule.isDateWithinRange(p3, { startDate = p4[1], endDate = p4[2] }) else false) then
		return fullCellBand()
	end
	return nil, nil, nil
end

return {
	getDayCellAppearance = function(p7, p8, p9, p10, p11)
		-- upvalues: isDaySelected (ref), getRangeBand (ref), dateTimeUtilitiesModule (ref)
		local var15 = isDaySelected(p7, p8, p10)
		local var16, var17, var18 = getRangeBand(p7, p9, p10, var15)
		
		return {
			bandPosition = var16,
			bandRadiusTag = var18,
			bandSize = var17,
			isHighlighted = not p10 and (if p9[1] and p9[2] then dateTimeUtilitiesModule.isDateWithinRange(p7, { startDate = p9[1], endDate = p9[2] }) else false),
			isSelectable = if p11 and not dateTimeUtilitiesModule.isDateWithinRange(p7, p11) then false else true,
			isSelected = var15
		}
	end,
	getRangeBand = getRangeBand,
	isDayHighlighted = function(p12, p13, p14)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return if p14 then if p13[1] and p13[2] then dateTimeUtilitiesModule.isDateWithinRange(p12, { startDate = p13[1], endDate = p13[2] }) else false else false
	end,
	isDaySelectable = function(p15, p16)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return p16 and not dateTimeUtilitiesModule.isDateWithinRange(p15, p16)
	end,
	isDaySelected = isDaySelected,
	resolveHighlightDates = function(p17, p18)
		-- upvalues: dateTimeRangeSelectionUtilitiesModule (ref)
		return if not (not p17 or not p17[1]) then if p17[2] or not p18 then p17 else dateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(p17, p18) else p17 or {}
	end
}