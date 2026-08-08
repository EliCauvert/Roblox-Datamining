local dateTimeCalendarViewUtilitiesModule = require(script.Parent.DateTimeCalendarViewUtilities)
local dateTimeRangeSelectionUtilitiesModule = require(script.Parent.DateTimeRangeSelectionUtilities)
local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return {
	getRangeBand = function(p0, p1, p2, p3) --[[ line: 57 ]]
		-- upvalues: dateTimeCalendarViewUtilitiesModule (ref), dateTimeUtilitiesModule (ref)
		local var3 = p1[1]
		local var4 = p1[2]
		
		if not p2 or not var3 or not var4 then
			return nil, nil, nil
		end
		local t = { startDate = var3, endDate = var4 }
		local rangeDayBounds, rangeDayBounds_1 = dateTimeCalendarViewUtilitiesModule.getRangeDayBounds(t)
		
		if rangeDayBounds == rangeDayBounds_1 then
			return nil, nil, nil
		end
		local var8 = dateTimeUtilitiesModule.roundToStartOfDay(p0)
		local var9 = p3 ~= false
		
		local function fullCellBand() --[[ line: 77 ]]
			-- upvalues: dateTimeCalendarViewUtilitiesModule (copy), p0 (ref), t (ref)
			return nil, nil, dateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p0, t, "full")
		end
		
		if var8 == rangeDayBounds then
			if var9 then
				return UDim2.fromScale(0.5, 0), UDim2.fromScale(0.5, 1), dateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p0, t, "start")
			end
			return fullCellBand()
		elseif var8 == rangeDayBounds_1 then
			if var9 then
				return UDim2.fromScale(0, 0), UDim2.fromScale(0.5, 1), dateTimeCalendarViewUtilitiesModule.getRangeBandRadiusTag(p0, t, "end")
			end
			return fullCellBand()
		elseif not p2 and (if p1[1] and p1[2] then dateTimeUtilitiesModule.isDateWithinRange(p0, { startDate = p1[1], endDate = p1[2] }) else false) then
			return fullCellBand()
		end
		return nil, nil, nil
	end,
	isDayHighlighted = function(p4, p5, p6) --[[ line: 47 ]]
		-- upvalues: dateTimeUtilitiesModule (ref)
		return if p6 then if p5[1] and p5[2] then dateTimeUtilitiesModule.isDateWithinRange(p4, { startDate = p5[1], endDate = p5[2] }) else false else false
	end,
	isDaySelectable = function(p7, p8) --[[ line: 101 ]]
		-- upvalues: dateTimeUtilitiesModule (ref)
		return p8 and not dateTimeUtilitiesModule.isDateWithinRange(p7, p8)
	end,
	isDaySelected = function(p9, p10, p11) --[[ line: 7 ]]
		-- upvalues: dateTimeUtilitiesModule (ref)
		local var11 = dateTimeUtilitiesModule.toLocalTime(p9)
		
		for i, v in if p11 then p10 elseif p10[1] ~= nil then {} else { p10[1] } do
			if v.Day == var11.Day and v.Month == var11.Month and v.Year == var11.Year then
				return true
			end
		end
		return false
	end,
	resolveHighlightDates = function(p12, p13) --[[ line: 37 ]]
		-- upvalues: dateTimeRangeSelectionUtilitiesModule (ref)
		return if not (not p12 or not p12[1]) then if p12[2] or not p13 then p12 else dateTimeRangeSelectionUtilitiesModule.selectRangeEndpoint(p12, p13) else p12 or {}
	end
}