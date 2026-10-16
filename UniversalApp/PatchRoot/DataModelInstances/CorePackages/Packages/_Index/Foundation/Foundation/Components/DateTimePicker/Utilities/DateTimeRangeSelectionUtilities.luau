local DateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return {
	normalizeDates = function(p1) --[[ Line: 9 ]]
		local Dates = if typeof(p1.dates) == "table" then p1.dates else { p1.dates }
		local Date = Dates[2]
		
		return if p1.acceptsDateRange or Date == nil then Dates else { Dates[1] }
	end,
	selectRangeEndpoint = function(Entry, p1) --[[ Line: 25 ]]
		-- upvalues: DateTimeUtilitiesModule (copy)
		if Entry and Entry[1] and not Entry[2] then
			local Entry1 = Entry[1]
			
			return if DateTimeUtilitiesModule.roundToStartOfDay(p1) < DateTimeUtilitiesModule.roundToStartOfDay(Entry1) then { p1, Entry1 } else { Entry1, p1 }
		else
			return { p1 }
		end
	end
}