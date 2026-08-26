local achievements = script:FindFirstAncestor("Achievements")
local parent = achievements.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local clearInterval = luauPolyfillModule.clearInterval
local setInterval = luauPolyfillModule.setInterval
local loggerModule = require(achievements.Logger)
local _ = require(parent.Signal)

return {
	init = function(p1, p2, p3)
		p1.fireDataChanged = p2
		p1.intervalInSec = p3
	end,
	start = function(p1)
		-- upvalues: setInterval (ref)
		p1.timerId = setInterval(p1.check, p1.intervalInSec * 1000, p1)
		p1.startTime = os.time()
	end,
	check = function(p1)
		-- upvalues: loggerModule (ref)
		if p1.startTime then
			p1.fireDataChanged(os.time() - p1.startTime)
			
			return
		end
		loggerModule:error("No recorded start time")
	end,
	stop = function(p1)
		-- upvalues: clearInterval (ref)
		if p1.timerId then
			clearInterval(p1.timerId)
			p1.startTime = nil
		end
	end
}