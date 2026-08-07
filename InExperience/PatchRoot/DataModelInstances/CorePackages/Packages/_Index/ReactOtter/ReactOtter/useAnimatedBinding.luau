local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.Otter)
local useMotorModule = require(script.Parent.useMotor)

return function(p0, p1) --[[ line: 12 | named "useAnimatedBinding" ]]
	-- upvalues: reactModule (ref), useMotorModule (ref)
	local var2, var3 = reactModule.useBinding(p0)
	
	return var2, useMotorModule(p0, var3, p1)
end