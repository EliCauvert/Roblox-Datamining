local DEV = _G.__DEV__
local _, Result = xpcall(function() --[[ Line: 9 ]]
	return game:DefineFastFlag("RoduxRemoveConnectTraceback", false)
end, function(): boolean --[[ Line: 11 ]]
	return true
end)

local function immutableAppend(Listeners, ...) --[[ Line: 15 ]]
	local t = {}
	local CountListeners = #Listeners
	
	for i = 1, CountListeners do
		t[i] = Listeners[i]
	end
	for i1 = 1, select("#", ...) do
		t[CountListeners + i1] = select(i1, ...)
	end
	return t
end

local function immutableRemoveValue(Listeners, p1) --[[ Line: 30 ]]
	local List = {}
	
	for i = 1, #Listeners do
		if Listeners[i] ~= p1 then
			table.insert(List, Listeners[i])
		end
	end
	return List
end

local SignalModule = {}
SignalModule.__index = SignalModule

function SignalModule.new(_store) --[[ Line: 46 ]]
	-- upvalues: SignalModule (copy)
	local config = { _listeners = {}, _store = _store }
	setmetatable(config, SignalModule)
	
	return config
end

function SignalModule:connect(Callback) --[[ Line: 57 ]]
	-- upvalues: Result (copy), DEV (copy), immutableAppend (copy), immutableRemoveValue (copy)
	if typeof(Callback) ~= "function" then
		error("Expected the listener to be a function.")
	end
	if self._store and self._store._isDispatching then
		error("You may not call store.changed:connect() while the reducer is executing. If you would like to be notified after the store has been updated, subscribe from a component and invoke store:getState() in the callback to access the latest state. ")
	end
	local config = {
		disconnected = false,
		connectTraceback = nil,
		disconnectTraceback = nil,
		callback = Callback
	}
	
	if not Result or DEV then
		config.connectTraceback = debug.traceback()
	end
	self._listeners = immutableAppend(self._listeners, config)
	
	return {
		disconnect = function() --[[ Line: 83 ]]
			-- upvalues: config (copy), self (copy), Result (upval), DEV (upval), immutableRemoveValue (upval)
			if config.disconnected then
				error(("Listener connected at: \n%s\nwas already disconnected at: \n%s\n"):format(tostring(config.connectTraceback), (tostring(config.disconnectTraceback))))
			end
			if self._store and self._store._isDispatching then
				error("You may not unsubscribe from a store listener while the reducer is executing.")
			end
			if not Result or DEV then
				config.disconnectTraceback = debug.traceback()
			end
			config.disconnected = true
			self._listeners = immutableRemoveValue(self._listeners, config)
		end
	}
end

function SignalModule.fire(p2, ...) --[[ Line: 109 ]]
	for _, listener in ipairs(p2._listeners) do
		if not listener.disconnected then
			listener.callback(...)
		end
	end
end

return SignalModule