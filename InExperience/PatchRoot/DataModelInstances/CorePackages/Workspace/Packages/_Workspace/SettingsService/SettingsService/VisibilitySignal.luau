local parent = script.Parent
local _ = require(parent.Types)
local valueChangedSignalModule = require(parent.ValueChangedSignal)
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: valueChangedSignalModule (ref)
	return valueChangedSignalModule.new(p0)
end

return t