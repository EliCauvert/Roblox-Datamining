local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return {
	areDatesEqual = function(p1, p2)
		if p1 == nil and p2 == nil then
			return true
		elseif p1 == nil or p2 == nil then
			return false
		end
		local var1 = p1[1]
		local var2 = p2[1]
		
		if var1 == nil ~= (var2 == nil) then
			return false
		elseif var1 and var2 and var1.UnixTimestamp ~= var2.UnixTimestamp then
			return false
		end
		local var3 = p1[2]
		local var4 = p2[2]
		
		return var3 == nil == (var4 == nil) and (var3 and var4 and var3.UnixTimestamp ~= var4.UnixTimestamp)
	end,
	areDatesSameDayAsRange = function(p1, p2)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return if p1 and p1[1] and p1[2] then dateTimeUtilitiesModule.roundToStartOfDay(p1[1]) == dateTimeUtilitiesModule.roundToStartOfDay(p2.startDate) and dateTimeUtilitiesModule.roundToStartOfDay(p1[2]) == dateTimeUtilitiesModule.roundToStartOfDay(p2.endDate) else false
	end,
	isRangeWithinSelectableRange = function(p1, p2)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return dateTimeUtilitiesModule.isDateWithinRange(p1.startDate, p2) and dateTimeUtilitiesModule.isDateWithinRange(p1.endDate, p2)
	end,
	isSameDay = function(p1, p2)
		-- upvalues: dateTimeUtilitiesModule (ref)
		return dateTimeUtilitiesModule.roundToStartOfDay(p1) == dateTimeUtilitiesModule.roundToStartOfDay(p2)
	end
}