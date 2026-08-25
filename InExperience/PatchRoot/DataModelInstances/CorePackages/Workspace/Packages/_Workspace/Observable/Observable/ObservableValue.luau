local signal = require(script.Parent.Parent.AppCommonLib).Signal
local t = {}
t.__index = t

local function defaultCompareFn(p0, p1)
	return p0 == p1
end

function t.new(p2, p3)
	-- upvalues: defaultCompareFn (ref), signal (ref), t (ref)
	return setmetatable({
		_isEqual = p3 or defaultCompareFn,
		_value = p2,
		_changeSignal = signal.new()
	}, t)
end

function t:get()
	return self._value
end

function t:set(p4)
	if not self._isEqual(self._value, p4) then
		self._value = p4
		self._changeSignal:fire(p4)
	end
end

function t:connect(p5, p6)
	local changeSignalConnection = self._changeSignal:connect(p5)
	
	if p6 == true then
		p5(self._value)
	end
	return changeSignalConnection
end

function t:__tostring()
	return "ObservableValue(" .. tostring(self._value) .. ")"
end

return t