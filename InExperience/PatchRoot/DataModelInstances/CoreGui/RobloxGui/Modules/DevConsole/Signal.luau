local immutableModule = require(script.Parent.Immutable)
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local t_1 = { _listeners = {} }
	setmetatable(t_1, t)
	
	return t_1
end

function t:Connect(p1)
	-- upvalues: immutableModule (ref)
	local t = { isConnected = true, callback = p1 }
	self._listeners = immutableModule.Append(self._listeners, t)
	
	return {
		Disconnect = function()
			-- upvalues: t (ref), self (ref), immutableModule (copy)
			t.isConnected = false
			self._listeners = immutableModule.RemoveValueFromList(self._listeners, t)
		end
	}
end

function t:Fire(...)
	for i, v in ipairs(self._listeners) do
		if v.isConnected then
			v.callback(...)
		end
	end
end

return t