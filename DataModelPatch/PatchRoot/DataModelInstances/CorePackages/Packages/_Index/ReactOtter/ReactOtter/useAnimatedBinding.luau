local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Otter)
local UseMotorModule = require(script.Parent.useMotor)

return function(p1, p2)
	-- upvalues: ReactModule (copy), UseMotorModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p1)
	
	return UseBindingResult, (UseMotorModule(p1, UseBindingResult2, p2))
end