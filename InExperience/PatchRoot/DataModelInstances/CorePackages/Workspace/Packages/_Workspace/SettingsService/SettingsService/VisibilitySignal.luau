local Parent = script.Parent
local _ = require(Parent.Types)
local ValueChangedSignalModule = require(Parent.ValueChangedSignal)
local VisibilitySignalModule = {}
VisibilitySignalModule.__index = VisibilitySignalModule

function VisibilitySignalModule.new(p1) --[[ Line: 18 ]]
	-- upvalues: ValueChangedSignalModule (copy)
	return ValueChangedSignalModule.new(p1)
end

return VisibilitySignalModule