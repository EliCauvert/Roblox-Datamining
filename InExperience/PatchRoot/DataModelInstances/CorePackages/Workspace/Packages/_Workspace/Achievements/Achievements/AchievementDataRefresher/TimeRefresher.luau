local achievements = script:FindFirstAncestor("Achievements")
local parent = achievements.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local clearInterval = luauPolyfillModule.clearInterval
local setInterval = luauPolyfillModule.setInterval
local loggerModule = require(achievements.Logger)
local _ = require(parent.Signal)

return {
	init = function(p0, p1, p2)
		p0.fireDataChanged = p1
		p0.intervalInSec = p2
	end,
	start = function(p3)
		-- upvalues: setInterval (ref)
		p3.timerId = setInterval(p3.check, p3.intervalInSec * 1000, p3)
		p3.startTime = os.time()
	end,
	check = function(p4)
		-- upvalues: loggerModule (ref)
		if p4.startTime then
			p4.fireDataChanged(os.time() - p4.startTime)
			
			return
		end
		loggerModule:error("No recorded start time")
	end,
	stop = function(p5)
		-- upvalues: clearInterval (ref)
		if p5.timerId then
			clearInterval(p5.timerId)
			p5.startTime = nil
		end
	end
}