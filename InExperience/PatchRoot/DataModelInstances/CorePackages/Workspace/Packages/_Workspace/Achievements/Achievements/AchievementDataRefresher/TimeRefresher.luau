local Achievements = script:FindFirstAncestor("Achievements")
local Parent = Achievements.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ClearIntervalFunction = LuauPolyfillModule.clearInterval
local SetIntervalFunction = LuauPolyfillModule.setInterval
local LoggerModule = require(Achievements.Logger)
local _ = require(Parent.Signal)

return {
	init = function(p1, FireDataChanged, IntervalInSec)
		p1.fireDataChanged = FireDataChanged
		p1.intervalInSec = IntervalInSec
	end,
	start = function(p1)
		-- upvalues: SetIntervalFunction (copy)
		p1.timerId = SetIntervalFunction(p1.check, p1.intervalInSec * 1000, p1)
		p1.startTime = os.time()
	end,
	check = function(p1)
		-- upvalues: LoggerModule (copy)
		if p1.startTime then
			p1.fireDataChanged(os.time() - p1.startTime)
			
			return
		else
			LoggerModule:error("No recorded start time")
		end
	end,
	stop = function(p1)
		-- upvalues: ClearIntervalFunction (copy)
		if p1.timerId then
			ClearIntervalFunction(p1.timerId)
			p1.startTime = nil
		end
	end
}