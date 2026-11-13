local _ = require("./types")
local TravelEngineModule = require("./travel_engine")
local ReducedFunction = require("./motion").reduced

return function(p1, p2, Callback, Complete)
	-- upvalues: ReducedFunction (copy), TravelEngineModule (copy)
	return (p1.runtime.mountFragment(function()
		-- upvalues: ReducedFunction (upval), p1 (copy), TravelEngineModule (upval), Callback (copy), Complete (copy)
		local ReducedResult = ReducedFunction(p1)
		TravelEngineModule(p1, {
			motion = "ease",
			initial = { 0 },
			target = function()
				return { 1 }
			end,
			sample = function(Entry)
				-- upvalues: Callback (upval)
				Callback(Entry[1])
			end,
			complete = Complete,
			reduced = function()
				-- upvalues: ReducedResult (copy)
				return ReducedResult()
			end,
			duration = p1.metric("motion.durations.travel"),
			ease = p1.motionEase("travel"),
			spring = p1.motionSpring("travel")
		})
		
		return {}
	end, p2))
end