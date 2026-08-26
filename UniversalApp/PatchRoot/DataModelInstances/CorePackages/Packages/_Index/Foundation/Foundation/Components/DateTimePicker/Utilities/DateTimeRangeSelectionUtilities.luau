local dateTimeUtilitiesModule = require(script.Parent.Parent.DateTimeUtilities)

return {
	normalizeDates = function(p1)
		local var1 = if typeof(p1.dates) == "table" then p1.dates else { p1.dates }
		
		return if p1.acceptsDateRange or var1[2] == nil then var1 else { var1[1] }
	end,
	selectRangeEndpoint = function(p1, p2)
		-- upvalues: dateTimeUtilitiesModule (ref)
		if not p1 or not p1[1] or p1[2] then
			return { p2 }
		end
		local var1 = p1[1]
		
		return if dateTimeUtilitiesModule.roundToStartOfDay(p2) < dateTimeUtilitiesModule.roundToStartOfDay(var1) then { p2, var1 } else { var1, p2 }
	end
}