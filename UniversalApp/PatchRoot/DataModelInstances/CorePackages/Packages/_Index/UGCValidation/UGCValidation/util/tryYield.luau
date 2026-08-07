local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local var0 = require(parent.flags.getFIntUGCValidationMaxMsPerFrame)() / 1000

return function(p0) --[[ line: 8 ]]
	-- upvalues: var0 (ref)
	if p0.shouldYield and var0 <= tick() - p0.lastTickSeconds then
		task.wait()
		p0.lastTickSeconds = tick()
	end
end