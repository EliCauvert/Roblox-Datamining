local parent = script.Parent.Parent
local reactModule = require(parent.React)
local _ = require(parent.Otter)
local useMotorModule = require(script.Parent.useMotor)

return function(p1, p2)
	-- upvalues: reactModule (ref), useMotorModule (ref)
	local var1, var2 = reactModule.useBinding(p1)
	
	return var1, useMotorModule(p1, var2, p2)
end