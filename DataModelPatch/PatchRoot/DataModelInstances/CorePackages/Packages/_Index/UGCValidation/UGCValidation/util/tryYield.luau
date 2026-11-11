local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local v1 = require(Parent.flags.getFIntUGCValidationMaxMsPerFrame)() / 1000

return function(p1)
	-- upvalues: v1 (copy)
	if p1.shouldYield and v1 <= tick() - p1.lastTickSeconds then
		task.wait()
		p1.lastTickSeconds = tick()
	end
end