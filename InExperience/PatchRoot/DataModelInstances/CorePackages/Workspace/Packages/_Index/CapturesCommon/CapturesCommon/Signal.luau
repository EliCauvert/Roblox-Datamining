local ImmutableModule = require(script.Parent.Immutable)
local SignalModule = {}
SignalModule.__index = SignalModule

function SignalModule.new()
	-- upvalues: SignalModule (copy)
	local config = { _listeners = {} }
	setmetatable(config, SignalModule)
	
	return config
end

function SignalModule:connect(Callback)
	-- upvalues: ImmutableModule (copy)
	local config = { isConnected = true, callback = Callback }
	self._listeners = ImmutableModule.Append(self._listeners, config)
	
	return {
		Disconnect = function()
			-- upvalues: config (copy), self (copy), ImmutableModule (upval)
			warn(string.format("Connection:Disconnect() has been deprecated, use Connection:disconnect()\n%s]", debug.traceback()))
			config.isConnected = false
			self._listeners = ImmutableModule.RemoveValueFromList(self._listeners, config)
		end,
		disconnect = function()
			-- upvalues: config (copy), self (copy), ImmutableModule (upval)
			config.isConnected = false
			self._listeners = ImmutableModule.RemoveValueFromList(self._listeners, config)
		end
	}
end

function SignalModule.fire(p1, ...)
	for _, listener in ipairs(p1._listeners) do
		if listener.isConnected then
			listener.callback(...)
		end
	end
end

function SignalModule:Connect(...)
	warn(string.format("Signal:Connect() has been deprecated, use Signal:connect()\n%s]", debug.traceback()))
	
	return self:connect(...)
end

function SignalModule:Fire(...)
	warn(string.format("Signal:Fire() has been deprecated, use Signal:fire()\n%s]", debug.traceback()))
	self:fire(...)
end

return SignalModule