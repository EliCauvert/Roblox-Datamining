local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return {
	areDatesEqual = function(p0, p1)
		if p0 == nil and p1 == nil then
			return true
		elseif p0 == nil or p1 == nil then
			return false
		end
		local var1 = p0[1]
		local var2 = p1[1]
		
		if var1 == nil ~= (var2 == nil) then
			return false
		elseif var1 and var2 and var1.UnixTimestamp ~= var2.UnixTimestamp then
			return false
		end
		local var3 = p0[2]
		local var4 = p1[2]
		
		return var3 == nil == (var4 == nil) and (var3 and var4 and var3.UnixTimestamp ~= var4.UnixTimestamp)
	end,
	areDatesSameDayAsRange = function(p2, p3)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return if p2 and p2[1] and p2[2] then dateTimeUtilitiesModule.roundToStartOfDay(p2[1]) == dateTimeUtilitiesModule.roundToStartOfDay(p3.startDate) and dateTimeUtilitiesModule.roundToStartOfDay(p2[2]) == dateTimeUtilitiesModule.roundToStartOfDay(p3.endDate) else false
	end,
	isRangeWithinSelectableRange = function(p4, p5)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return dateTimeUtilitiesModule.isDateWithinRange(p4.startDate, p5) and dateTimeUtilitiesModule.isDateWithinRange(p4.endDate, p5)
	end,
	isSameDay = function(p6, p7)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return dateTimeUtilitiesModule.roundToStartOfDay(p6) == dateTimeUtilitiesModule.roundToStartOfDay(p7)
	end
}