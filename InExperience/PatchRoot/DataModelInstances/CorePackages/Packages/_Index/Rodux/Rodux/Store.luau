local runService = game:GetService("RunService")
local signalModule = require(script.Parent.Signal)
local noYieldModule = require(script.Parent.NoYield)
local t = {
	reportReducerError = function(_, _, p0) --[[ line: 9 ]]
		error(string.format("Received error: %s\n\n%s", p0.message, p0.thrownValue))
	end,
	reportUpdateError = function(_, _, _, p1) --[[ line: 12 ]]
		error(string.format("Received error: %s\n\n%s", p1.message, p1.thrownValue))
	end
}

local function tracebackReporter(p2) --[[ line: 17 ]]
	return debug.traceback(tostring(p2))
end

local t_1 = { _flushEvent = runService.Heartbeat }
t_1.__index = t_1

function t_1.new(p3, p4, p5, p6, p7) --[[ line: 41 ]]
	-- upvalues: t (ref), signalModule (ref), tracebackReporter (ref), t_1 (ref)
	assert(typeof(p3) == "function", "Bad argument #1 to Store.new, expected function.")
	assert(if p5 ~= nil then typeof(p5) == "table" else true, "Bad argument #3 to Store.new, expected nil or table.")
	assert(if p7 ~= nil then typeof(p7) == "table" and p7.__className == "Devtools" else true, "Bad argument #5 to Store.new, expected nil or Devtools object.")
	
	if p5 ~= nil then
		for i = 1, #p5 do
			assert(typeof(p5[i]) == "function", ("Expected the middleware ('%s') at index %d to be a function."):format(tostring(p5[i]), i))
		end
	end
	local t_2 = {
		_source = string.match(debug.traceback(), "^.-\n(.-)\n"),
		_errorReporter = p6 or t,
		_isDispatching = false,
		_lastState = nil
	}
	t_2.changed = signalModule.new(t_2)
	t_2._reducer = p3
	
	function t_2._flushHandler(p8) --[[ line: 66 ]]
		-- upvalues: t_2 (ref)
		t_2.changed:fire(p8, t_2._lastState)
	end
	
	if p7 then
		t_2._devtools = p7
		p7:_hookIntoStore(t_2)
	end
	local t_3 = { type = "@@INIT" }
	t_2._actionLog = { t_3 }
	local ok, status = xpcall(function() --[[ line: 82 ]]
		-- upvalues: t_2 (ref), p4 (ref), t_3 (ref)
		t_2._state = t_2._reducer(p4, t_3)
	end, tracebackReporter)
	
	if not ok then
		t_2._errorReporter.reportReducerError(p4, t_3, {
			message = "Caught error in reducer with init",
			thrownValue = status
		})
		t_2._state = p4
	end
	t_2._lastState = t_2._state
	t_2._mutatedSinceFlush = false
	t_2._connections = {}
	setmetatable(t_2, t_1)
	table.insert(t_2._connections, t_2._flushEvent:Connect(function() --[[ line: 99 ]]
		-- upvalues: t_2 (ref)
		t_2:flush()
	end))
	
	if p5 then
		local dispatch = t_2.dispatch
		
		local var8 = function(...) --[[ line: 106 ]]
			-- upvalues: dispatch (ref), t_2 (ref)
			return dispatch(t_2, ...)
		end
		
		for i_1 = #p5, 1, -1 do
			var8 = p5[i_1](var8, t_2)
		end
		function t_2.dispatch(_, ...) --[[ line: 115 ]]
			-- upvalues: var8 (write)
			return var8(...)
		end
	end
	return t_2
end

function t_1:getState() --[[ line: 126 ]]
	if self._isDispatching then
		error(("You may not call store:getState() while the reducer is executing. The reducer (%s) has already received the state as an argument. Pass it down from the top reducer instead of reading it from the store."):format(tostring(self._reducer)))
	end
	return self._state
end

function t_1:dispatch(p9) --[[ line: 143 ]]
	if typeof(p9) ~= "table" then
		error(("Actions must be tables. Use custom middleware for %q actions."):format(typeof(p9)), 2)
	end
	if p9.type == nil then
		error("Actions may not have an undefined 'type' property. " .. "Have you misspelled a constant? \n" .. tostring(p9), 2)
	end
	if self._isDispatching then
		error("Reducers may not dispatch actions.")
	end
	local ok, status = pcall(function() --[[ line: 161 ]]
		-- upvalues: self (ref), p9 (ref)
		self._isDispatching = true
		self._state = self._reducer(self._state, p9)
		self._mutatedSinceFlush = true
	end)
	self._isDispatching = false
	
	if not ok then
		self._errorReporter.reportReducerError(self._state, p9, {
			message = "Caught error in reducer",
			thrownValue = status
		})
	end
	if #self._actionLog == 3 then
		table.remove(self._actionLog, 1)
	end
	table.insert(self._actionLog, p9)
end

function t_1:destruct() --[[ line: 189 ]]
	for i, v in ipairs(self._connections) do
		v:Disconnect()
	end
	self._connections = nil
end

function t_1:flush() --[[ line: 200 ]]
	-- upvalues: noYieldModule (ref), tracebackReporter (ref)
	if not self._mutatedSinceFlush then return end
	self._mutatedSinceFlush = false
	local state = self._state
	local ok, status = xpcall(function() --[[ line: 212 ]]
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