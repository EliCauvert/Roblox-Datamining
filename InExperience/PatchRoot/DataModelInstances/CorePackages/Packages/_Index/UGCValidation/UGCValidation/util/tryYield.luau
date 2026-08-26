local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local var1 = require(parent.flags.getFIntUGCValidationMaxMsPerFrame)() / 1000

return function(p1)
	-- upvalues: var1 (ref)
	if p1.shouldYield and var1 <= tick() - p1.lastTickSeconds then
		task.wait()
		p1.lastTickSeconds = tick()
	end
end