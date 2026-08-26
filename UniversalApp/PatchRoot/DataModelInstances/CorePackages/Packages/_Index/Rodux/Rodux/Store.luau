local runService = game:GetService("RunService")
local signalModule = require(script.Parent.Signal)
local noYieldModule = require(script.Parent.NoYield)
local t = {
	reportReducerError = function(_, _, p1)
		error(string.format("Received error: %s\n\n%s", p1.message, p1.thrownValue))
	end,
	reportUpdateError = function(_, _, _, p1)
		error(string.format("Received error: %s\n\n%s", p1.message, p1.thrownValue))
	end
}

local function tracebackReporter(p1)
	return debug.traceback(tostring(p1))
end

local t_1 = { _flushEvent = runService.Heartbeat }
t_1.__index = t_1

function t_1.new(p1, p2, p3, p4, p5)
	-- upvalues: t (ref), signalModule (ref), tracebackReporter (ref), t_1 (ref)
	assert(typeof(p1) == "function", "Bad argument #1 to Store.new, expected function.")
	assert(if p3 ~= nil then typeof(p3) == "table" else true, "Bad argument #3 to Store.new, expected nil or table.")
	assert(if p5 ~= nil then typeof(p5) == "table" and p5.__className == "Devtools" else true, "Bad argument #5 to Store.new, expected nil or Devtools object.")
	
	if p3 ~= nil then
		for i = 1, #p3 do
			assert(typeof(p3[i]) == "function", ("Expected the middleware ('%s') at index %d to be a function."):format(tostring(p3[i]), i))
		end
	end
	local t_2 = {
		_source = string.match(debug.traceback(), "^.-\n(.-)\n"),
		_errorReporter = p4 or t,
		_isDispatching = false,
		_lastState = nil
	}
	t_2.changed = signalModule.new(t_2)
	t_2._reducer = p1
	
	function t_2._flushHandler(p6)
		-- upvalues: t_2 (ref)
		t_2.changed:fire(p6, t_2._lastState)
	end
	
	if p5 then
		t_2._devtools = p5
		p5:_hookIntoStore(t_2)
	end
	local t_3 = { type = "@@INIT" }
	t_2._actionLog = { t_3 }
	local ok, status = xpcall(function()
		-- upvalues: t_2 (ref), p2 (ref), t_3 (ref)
		t_2._state = t_2._reducer(p2, t_3)
	end, tracebackReporter)
	
	if not ok then
		t_2._errorReporter.reportReducerError(p2, t_3, {
			message = "Caught error in reducer with init",
			thrownValue = status
		})
		t_2._state = p2
	end
	t_2._lastState = t_2._state
	t_2._mutatedSinceFlush = false
	t_2._connections = {}
	setmetatable(t_2, t_1)
	table.insert(t_2._connections, t_2._flushEvent:Connect(function()
		-- upvalues: t_2 (ref)
		t_2:flush()
	end))
	
	if p3 then
		local dispatch = t_2.dispatch
		
		local var1 = function(...)
			-- upvalues: dispatch (ref), t_2 (ref)
			return dispatch(t_2, ...)
		end
		
		for i_1 = #p3, 1, -1 do
			var1 = p3[i_1](var1, t_2)
		end
		function t_2.dispatch(_, ...)
			-- upvalues: var1 (write)
			return var1(...)
		end
	end
	return t_2
end

function t_1:getState()
	if self._isDispatching then
		error(("You may not call store:getState() while the reducer is executing. The reducer (%s) has already received the state as an argument. Pass it down from the top reducer instead of reading it from the store."):format(tostring(self._reducer)))
	end
	return self._state
end

function t_1:dispatch(p6)
	if typeof(p6) ~= "table" then
		error(("Actions must be tables. Use custom middleware for %q actions."):format(typeof(p6)), 2)
	end
	if p6.type == nil then
		error("Actions may not have an undefined 'type' property. " .. "Have you misspelled a constant? \n" .. tostring(p6), 2)
	end
	if self._isDispatching then
		error("Reducers may not dispatch actions.")
	end
	local ok, status = pcall(function()
		-- upvalues: self (ref), p6 (ref)
		self._isDispatching = true
		self._state = self._reducer(self._state, p6)
		self._mutatedSinceFlush = true
	end)
	self._isDispatching = false
	
	if not ok then
		self._errorReporter.reportReducerError(self._state, p6, {
			message = "Caught error in reducer",
			thrownValue = status
		})
	end
	if #self._actionLog == 3 then
		table.remove(self._actionLog, 1)
	end
	table.insert(self._actionLog, p6)
end

function t_1:destruct()
	for i, v in ipairs(self._connections) do
		v:Disconnect()
	end
	self._connections = nil
end

function t_1:flush()
	-- upvalues: noYieldModule (ref), tracebackReporter (ref)
	if not self._mutatedSinceFlush then return end
	self._mutatedSinceFlush = false
	local state = self._state
	local ok, status = xpcall(function()
		-- upvalues: noYieldModule (copy), self (ref), state (ref)
		noYieldModule(self._flushHandler, state)
	end, tracebackReporter)
	
	if not ok then
		self._errorReporter.reportUpdateError(self._lastState, state, self._actionLog, {
			message = "Caught error flushing store updates",
			thrownValue = status
		})
	end
	self._lastState = state
end

return t_1