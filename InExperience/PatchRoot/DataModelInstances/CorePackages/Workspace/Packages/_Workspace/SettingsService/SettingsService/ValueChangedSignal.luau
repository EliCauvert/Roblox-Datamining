local parent = script.Parent
local signal = require(parent.Parent.AppCommonLib).Signal
local _ = require(parent.Types)
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: signal (ref), t (ref)
	return setmetatable({ _value = p0, _changeSignal = signal.new() }, t)
end

function t:get()
	return self._value
end

function t:set(p1)
	if self._value ~= p1 then
		self._value = p1
		self._changeSignal:fire(p1)
	end
end

function t:signal()
	return self._changeSignal
end

function t:connect(p2, p3)
	local changeSignalConnection = self._changeSignal:connect(p2)
	
	if p3 == true then
		p2(self._value)
	end
	return changeSignalConnection
end

return t