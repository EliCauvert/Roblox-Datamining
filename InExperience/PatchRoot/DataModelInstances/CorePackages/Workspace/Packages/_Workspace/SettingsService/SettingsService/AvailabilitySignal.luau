local parent = script.Parent
local _ = require(parent.Types)
local valueChangedSignalModule = require(parent.ValueChangedSignal)
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: valueChangedSignalModule (ref)
	return valueChangedSignalModule.new(p1)
end

return t