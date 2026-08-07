local signal = require(script.Parent.Parent.Parent.AppCommonLib).Signal
local t = {}
t.__index = t

function t.new() --[[ line: 17 ]]
	-- upvalues: signal (ref), t (ref)
	return setmetatable({ _value = false, _changeSignal = signal.new() }, t)
end

function t:get() --[[ line: 24 ]]
	return self._value
end

function t:set(p0) --[[ line: 28 ]]
	if self._value ~= p0 then
		self._value = p0
		self._changeSignal:fire(p0)
	end
end

function t:connect(p1, p2) --[[ line: 35 ]]
	local changeSignalConnection = self._changeSignal:connect(p1)
	
	if p2 == true then
		p1(self._value)
	end
	return changeSignalConnection
end

return t.new()