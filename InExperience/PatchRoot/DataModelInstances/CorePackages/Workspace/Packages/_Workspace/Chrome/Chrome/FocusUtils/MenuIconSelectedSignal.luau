local Signal = require(script.Parent.Parent.Parent.AppCommonLib).Signal
local Module = {}
Module.__index = Module

function Module.new() --[[ Line: 17 ]]
	-- upvalues: Signal (copy), Module (copy)
	return (setmetatable({ _value = false, _changeSignal = Signal.new() }, Module))
end

function Module:get() --[[ Line: 24 ]]
	return self._value
end

function Module:set(_value) --[[ Line: 28 ]]
	if self._value ~= _value then
		self._value = _value
		self._changeSignal:fire(_value)
	end
end

function Module:connect(Callback: (any) -> (), Enabled) --[[ Line: 35 ]]
	local ChangeSignalConnection = self._changeSignal:connect(Callback)
	
	if Enabled == true then
		Callback(self._value)
	end
	return ChangeSignalConnection
end

return Module.new()