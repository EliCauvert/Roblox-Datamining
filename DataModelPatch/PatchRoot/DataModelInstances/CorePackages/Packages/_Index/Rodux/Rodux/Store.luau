local SignalModule = require(script.Parent.Signal)
local NoYieldModule = require(script.Parent.NoYield)
local config = {
	reportReducerError = function(_, _, p1)
		error(string.format("Received error: %s\n\n%s", p1.message, p1.thrownValue))
	end,
	reportUpdateError = function(_, _, _, p1)
		error(string.format("Received error: %s\n\n%s", p1.message, p1.thrownValue))
	end
}

local function tracebackReporter(Err)
	return debug.traceback((tostring(Err)))
end

local Store = { _flushEvent = game:GetService("RunService").Heartbeat }
Store.__index = Store

function Store.new(_reducer, _state, p1, p2, _devtools)
	-- upvalues: config (copy), SignalModule (copy), tracebackReporter (copy), Store (copy)
	assert(typeof(_reducer) == "function", "Bad argument #1 to Store.new, expected function.")
	assert(p1 == nil or typeof(p1) == "table", "Bad argument #3 to Store.new, expected nil or table.")
	assert(_devtools == nil or typeof(_devtools) == "table" and _devtools.__className == "Devtools", "Bad argument #5 to Store.new, expected nil or Devtools object.")
	
	if p1 ~= nil then
		for i = 1, #p1 do
			assert(typeof(p1[i]) == "function", ("Expected the middleware ('%s') at index %d to be a function."):format(tostring(p1[i]), i))
		end
	end
	local config1 = {
		_source = string.match(debug.traceback(), "^.-\n(.-)\n"),
		_errorReporter = p2 or config,
		_isDispatching = false,
		_lastState = nil
	}
	config1.changed = SignalModule.new(config1)
	config1._reducer = _reducer
	
	function config1._flushHandler(p3)
		-- upvalues: config1 (copy)
		config1.changed:fire(p3, config1._lastState)
	end
	
	if _devtools then
		config1._devtools = _devtools
		_devtools:_hookIntoStore(config1)
	end
	local config2 = { type = "@@INIT" }
	config1._actionLog = { config2 }
	local Success, Result = xpcall(function()
		-- upvalues: config1 (copy), _state (copy), config2 (copy)
		config1._state = config1._reducer(_state, config2)
	end, tracebackReporter)
	
	if not Success then
		config1._errorReporter.reportReducerError(_state, config2, {
			message = "Caught error in reducer with init",
			thrownValue = Result
		})
		config1._state = _state
	end
	config1._lastState = config1._state
	config1._mutatedSinceFlush = false
	config1._connections = {}
	setmetatable(config1, Store)
	table.insert(config1._connections, (config1._flushEvent:Connect(function()
		-- upvalues: config1 (copy)
		config1:flush()
	end)))
	
	if p1 then
		local DispatchFunction = config1.dispatch
		
		local function v8(...)
			-- upvalues: DispatchFunction (copy), config1 (copy)
			return DispatchFunction(config1, ...)
		end
		
		for i1 = #p1, 1, -1 do
			v8 = p1[i1](v8, config1)
		end
		function config1:dispatch(...)
			-- upvalues: v8 (ref)
			return v8(...)
		end
	end
	return config1
end

function Store:getState()
	if self._isDispatching then
		error(("You may not call store:getState() while the reducer is executing. The reducer (%s) has already received the state as an argument. Pass it down from the top reducer instead of reading it from the store."):format((tostring(self._reducer))))
	end
	return self._state
end

function Store:dispatch(p3)
	if typeof(p3) ~= "table" then
		error(("Actions must be tables. Use custom middleware for %q actions."):format((typeof(p3))), 2)
	end
	if p3.type == nil then
		error("Actions may not have an undefined 'type' property. " .. "Have you misspelled a constant? \n" .. tostring(p3), 2)
	end
	if self._isDispatching then
		error("Reducers may not dispatch actions.")
	end
	local Success, Result = pcall(function()
		-- upvalues: self (copy), p3 (copy)
		self._isDispatching = true
		self._state = self._reducer(self._state, p3)
		self._mutatedSinceFlush = true
	end)
	self._isDispatching = false
	
	if not Success then
		self._errorReporter.reportReducerError(self._state, p3, {
			message = "Caught error in reducer",
			thrownValue = Result
		})
	end
	if #self._actionLog == 3 then
		table.remove(self._actionLog, 1)
	end
	table.insert(self._actionLog, p3)
end

function Store:destruct()
	for _, connection in ipairs(self._connections) do
		connection:Disconnect()
	end
	self._connections = nil
end

function Store:flush()
	-- upvalues: NoYieldModule (copy), tracebackReporter (copy)
	if not self._mutatedSinceFlush then return end
	self._mutatedSinceFlush = false
	local State = self._state
	local Success, Result = xpcall(function()
		-- upvalues: NoYieldModule (upval), self (copy), State (copy)
		NoYieldModule(self._flushHandler, State)
	end, tracebackReporter)
	
	if not Success then
		self._errorReporter.reportUpdateError(self._lastState, State, self._actionLog, {
			message = "Caught error flushing store updates",
			thrownValue = Result
		})
	end
	self._lastState = State
end

return Store