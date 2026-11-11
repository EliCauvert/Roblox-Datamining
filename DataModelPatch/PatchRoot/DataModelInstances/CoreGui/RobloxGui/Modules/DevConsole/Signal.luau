local ImmutableModule = require(script.Parent.Immutable)
local SignalModule = {}
SignalModule.__index = SignalModule

function SignalModule.new()
	-- upvalues: SignalModule (copy)
	local config = { _listeners = {} }
	setmetatable(config, SignalModule)
	
	return config
end

function SignalModule:Connect(Callback)
	-- upvalues: ImmutableModule (copy)
	local config = { isConnected = true, callback = Callback }
	self._listeners = ImmutableModule.Append(self._listeners, config)
	
	return {
		Disconnect = function()
			-- upvalues: config (copy), self (copy), ImmutableModule (upval)
			config.isConnected = false
			self._listeners = ImmutableModule.RemoveValueFromList(self._listeners, config)
		end
	}
end

function SignalModule.Fire(p1, ...)
	for _, listener in ipairs(p1._listeners) do
		if listener.isConnected then
			listener.callback(...)
		end
	end
end

return SignalModule