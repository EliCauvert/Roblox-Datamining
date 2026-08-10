local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return {
	normalizeDates = function(p0) --[[ line: 9 ]]
		local var1 = if typeof(p0.dates) == "table" then p0.dates else { p0.dates }
		
		return if p0.acceptsDateRange or var1[2] == nil then var1 else { var1[1] }
	end,
	selectRangeEndpoint = function(p1, p2) --[[ line: 25 ]]
		-- upvalues: dateTimeUtilitiesModule (ref)
		if not p1 or not p1[1] or p1[2] then
			return { p2 }
		end
		local var2 = p1[1]
		
		return if dateTimeUtilitiesModule.roundToStartOfDay(p2) < dateTimeUtilitiesModule.roundToStartOfDay(var2) then { p2, var2 } else { var2, p2 }
	end
}