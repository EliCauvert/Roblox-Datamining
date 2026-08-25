local immutableModule = require(script.Parent.Immutable)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local t_1 = { _listeners = {} }
	setmetatable(t_1, t)
	
	return t_1
end

function t:connect(p0)
	-- upvalues: immutableModule (ref)
	local t = { isConnected = true, callback = p0 }
	self._listeners = immutableModule.Append(self._listeners, t)
	
	return {
		Disconnect = function()
			-- upvalues: t (ref), self (ref), immutableModule (copy)
			warn(string.format("Connection:Disconnect() has been deprecated, use Connection:disconnect()\n%s]", debug.traceback()))
			t.isConnected = false
			self._listeners = immutableModule.RemoveValueFromList(self._listeners, t)
		end,
		disconnect = function()
			-- upvalues: t (ref), self (ref), immutableModule (copy)
			t.isConnected = false
			self._listeners = immutableModule.RemoveValueFromList(self._listeners, t)
		end
	}
end

function t:fire(...)
	for i, v in ipairs(self._listeners) do
		if v.isConnected then
			v.callback(...)
		end
	end
end

function t:Connect(...)
	warn(string.format("Signal:Connect() has been deprecated, use Signal:connect()\n%s]", debug.traceback()))
	
	return self:connect(...)
end

function t:Fire(...)
	warn(string.format("Signal:Fire() has been deprecated, use Signal:fire()\n%s]", debug.traceback()))
	self:fire(...)
end

return t