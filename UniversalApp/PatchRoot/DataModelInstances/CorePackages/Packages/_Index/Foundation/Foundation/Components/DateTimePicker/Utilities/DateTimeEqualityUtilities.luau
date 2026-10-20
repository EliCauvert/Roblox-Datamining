local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return {
	areDatesEqual = function(Entry, Entry1): boolean
		if Entry == nil and Entry1 == nil then
			return true
		elseif Entry == nil or Entry1 == nil then
			return false
		else
			local Entry2 = Entry[1]
			local Entry3 = Entry1[1]
			
			if Entry2 == nil ~= (Entry3 == nil) then
				return false
			elseif Entry2 and Entry3 and Entry2.UnixTimestamp ~= Entry3.UnixTimestamp then
				return false
			else
				local Entry4 = Entry[2]
				local Entry5 = Entry1[2]
				
				return Entry4 == nil == (Entry5 == nil) and (not Entry4 or not Entry5 or Entry4.UnixTimestamp == Entry5.UnixTimestamp)
			end
		end
	end,
	areDatesSameDayAsRange = function(Entry, p1): boolean
		-- upvalues: DateTimeUtilitiesModule (copy)
		return if Entry and Entry[1] and Entry[2] then DateTimeUtilitiesModule.roundToStartOfDay(Entry[1]) == DateTimeUtilitiesModule.roundToStartOfDay(p1.startDate) and DateTimeUtilitiesModule.roundToStartOfDay(Entry[2]) == DateTimeUtilitiesModule.roundToStartOfDay(p1.endDate) else false
	end,
	isRangeWithinSelectableRange = function(p1, p2)
		-- upvalues: DateTimeUtilitiesModule (copy)
		return DateTimeUtilitiesModule.isDateWithinRange(p1.startDate, p2) and DateTimeUtilitiesModule.isDateWithinRange(p1.endDate, p2)
	end,
	isSameDay = function(p1, p2): boolean
		-- upvalues: DateTimeUtilitiesModule (copy)
		return DateTimeUtilitiesModule.roundToStartOfDay(p1) == DateTimeUtilitiesModule.roundToStartOfDay(p2)
	end
}