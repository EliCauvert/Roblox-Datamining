local signal = require(script.Parent.Parent.AppCommonLib).Signal
local t = {}
t.__index = t

local function defaultCompareFn(p1, p2)
	return p1 == p2
end

function t.new(p1, p2)
	-- upvalues: defaultCompareFn (ref), signal (ref), t (ref)
	return setmetatable({
		_isEqual = p2 or defaultCompareFn,
		_value = p1,
		_changeSignal = signal.new()
	}, t)
end

function t:get()
	return self._value
end

function t:set(p1)
	if not self._isEqual(self._value, p1) then
		self._value = p1
		self._changeSignal:fire(p1)
	end
end

function t:connect(p1, p2)
	local changeSignalConnection = self._changeSignal:connect(p1)
	
	if p2 == true then
		p1(self._value)
	end
	return changeSignalConnection
end

function t:__tostring()
	return "ObservableValue(" .. tostring(self._value) .. ")"
end

return t