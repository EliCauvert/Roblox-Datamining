local Parent = script.Parent
local Signal = require(Parent.Parent.AppCommonLib).Signal
local _ = require(Parent.Types)
local ValueChangedSignalModule = {}
ValueChangedSignalModule.__index = ValueChangedSignalModule

function ValueChangedSignalModule.new(_value) --[[ Line: 29 ]]
	-- upvalues: Signal (copy), ValueChangedSignalModule (copy)
	return (setmetatable({ _value = _value, _changeSignal = Signal.new() }, ValueChangedSignalModule))
end

function ValueChangedSignalModule:get() --[[ Line: 36 ]]
	return self._value
end

function ValueChangedSignalModule:set(_value) --[[ Line: 40 ]]
	if self._value ~= _value then
		self._value = _value
		self._changeSignal:fire(_value)
	end
end

function ValueChangedSignalModule:signal() --[[ Line: 47 ]]
	return self._changeSignal
end

function ValueChangedSignalModule:connect(Callback: (any) -> (), Enabled) --[[ Line: 51 ]]
	local ChangeSignalConnection = self._changeSignal:connect(Callback)
	
	if Enabled == true then
		Callback(self._value)
	end
	return ChangeSignalConnection
end

return ValueChangedSignalModule