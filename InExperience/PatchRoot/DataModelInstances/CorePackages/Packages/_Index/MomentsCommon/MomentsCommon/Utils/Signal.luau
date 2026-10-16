local ImmutableModule = require(script:FindFirstAncestor("MomentsCommon").Utils.Immutable)
local SignalModule = {}
SignalModule.__index = SignalModule

function SignalModule.new() --[[ Line: 32 ]]
	-- upvalues: SignalModule (copy)
	local config = { _listeners = {} }
	setmetatable(config, SignalModule)
	
	return config
end

function SignalModule:connect(Callback) --[[ Line: 42 ]]
	-- upvalues: ImmutableModule (copy)
	local config = { isConnected = true, callback = Callback }
	self._listeners = ImmutableModule.Append(self._listeners, config)
	
	return {
		disconnect = function() --[[ Line: 49 ]]
			-- upvalues: config (copy), self (copy), ImmutableModule (upval)
			config.isConnected = false
			self._listeners = ImmutableModule.RemoveValueFromList(self._listeners, config)
		end
	}
end

function SignalModule.fire(p1, ...) --[[ Line: 59 ]]
	for _, listener in ipairs(p1._listeners) do
		if listener.isConnected then
			listener.callback(...)
		end
	end
end

return SignalModule