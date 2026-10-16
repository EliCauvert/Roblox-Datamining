local Parent = script.Parent
local _ = require(Parent.Types)
local ValueChangedSignalModule = require(Parent.ValueChangedSignal)
local AvailabilitySignalModule = {}
AvailabilitySignalModule.__index = AvailabilitySignalModule

function AvailabilitySignalModule.new(p1) --[[ Line: 18 ]]
	-- upvalues: ValueChangedSignalModule (copy)
	return ValueChangedSignalModule.new(p1)
end

return AvailabilitySignalModule