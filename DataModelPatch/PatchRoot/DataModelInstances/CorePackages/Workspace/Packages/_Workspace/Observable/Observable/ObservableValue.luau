local Signal = require(script.Parent.Parent.AppCommonLib).Signal
local ObservableValueModule = {}
ObservableValueModule.__index = ObservableValueModule

local function defaultCompareFn(p1, p2): boolean
	return p1 == p2
end

function ObservableValueModule.new(_value, p1)
	-- upvalues: defaultCompareFn (copy), Signal (copy), ObservableValueModule (copy)
	return (setmetatable({
		_isEqual = if p1 then p1 else defaultCompareFn,
		_value = _value,
		_changeSignal = Signal.new()
	}, ObservableValueModule))
end

function ObservableValueModule:get()
	return self._value
end

function ObservableValueModule:set(_value)
	if not self._isEqual(self._value, _value) then
		self._value = _value
		self._changeSignal:fire(_value)
	end
end

function ObservableValueModule:connect(Callback: (any) -> (), Enabled)
	local ChangeSignalConnection = self._changeSignal:connect(Callback)
	
	if Enabled == true then
		Callback(self._value)
	end
	return ChangeSignalConnection
end

function ObservableValueModule:__tostring(): string
	return "ObservableValue(" .. tostring(self._value) .. ")"
end

return ObservableValueModule