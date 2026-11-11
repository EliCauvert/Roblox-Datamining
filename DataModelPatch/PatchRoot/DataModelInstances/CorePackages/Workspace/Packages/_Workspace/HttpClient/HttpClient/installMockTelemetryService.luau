local Jest = require(script:FindFirstAncestor("HttpClient").Parent.Dev.JestGlobals).jest

return function()
	-- upvalues: Jest (copy)
	local FnResult = Jest.fn()
	local FnResult1 = Jest.fn()
	local FnResult2 = Jest.fn()
	local GetServiceFunction = game.GetService
	Jest.spyOn(game, "GetService").mockImplementation(function(_, p1)
		-- upvalues: FnResult (copy), FnResult1 (copy), FnResult2 (copy), GetServiceFunction (copy)
		return if p1 == "TelemetryService" then {
			LogEvent = function(_, p2, p3)
				-- upvalues: FnResult (upval)
				FnResult(p2, p3)
			end,
			LogCounter = function(_, p2, p3)
				-- upvalues: FnResult1 (upval)
				FnResult1(p2, p3)
			end,
			LogStat = function(_, p2, p3, p4)
				-- upvalues: FnResult2 (upval)
				FnResult2(p2, p3, p4)
			end
		} else GetServiceFunction(game, p1)
	end)
	
	return {
		logEvent = FnResult,
		logCounter = FnResult1,
		logStat = FnResult2
	}
end