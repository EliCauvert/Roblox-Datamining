local ImmutableModule = require(script.Parent.Immutable)
local SignalModule = {}
SignalModule.__index = SignalModule

function SignalModule.new() --[[ Line: 16 ]]
	-- upvalues: SignalModule (copy)
	local config = { _listeners = {} }
	setmetatable(config, SignalModule)
	
	return config
end

function SignalModule:Connect(Callback) --[[ Line: 26 ]]
	-- upvalues: ImmutableModule (copy)
	local config = { isConnected = true, callback = Callback }
	self._listeners = ImmutableModule.Append(self._listeners, config)
	
	return {
		Disconnect = function() --[[ Line: 33 ]]
			-- upvalues: config (copy), self (copy), ImmutableModule (upval)
			config.isConnected = false
			self._listeners = ImmutableModule.RemoveValueFromList(self._listeners, config)
		end
	}
end

function SignalModule.Fire(p1, ...) --[[ Line: 43 ]]
	for _, listener in ipairs(p1._listeners) do
		if listener.isConnected then
			listener.callback(...)
		end
	end
end

return SignalModule