local dEV = _G.__DEV__
local _, status = xpcall(function()
	return game:DefineFastFlag("RoduxRemoveConnectTraceback", false)
end, function()
	return true
end)

local function immutableAppend(p1, ...)
	local t = {}
	local p0Count = #p1
	
	for i = 1, p0Count do
		t[i] = p1[i]
	end
	for i_1 = 1, select("#", ...) do
		t[p0Count + i_1] = select(i_1, ...)
	end
	return t
end

local function immutableRemoveValue(p2, p3)
	local t = {}
	
	for i = 1, #p2 do
		if p2[i] ~= p3 then
			table.insert(t, p2[i])
		end
	end
	return t
end

local t = {}
t.__index = t

function t.new(p4)
	-- upvalues: t (ref)
	local t_1 = { _listeners = {}, _store = p4 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:connect(p4)
	-- upvalues: status (ref), dEV (ref), immutableAppend (ref), immutableRemoveValue (ref)
	if typeof(p4) ~= "function" then
		error("Expected the listener to be a function.")
	end
	if self._store and self._store._isDispatching then
		error("You may not call store.changed:connect() while the reducer is executing. If you would like to be notified after the store has been updated, subscribe from a component and invoke store:getState() in the callback to access the latest state. ")
	end
	local t = {
		disconnected = false,
		connectTraceback = nil,
		disconnectTraceback = nil,
		callback = p4
	}
	
	if not status or dEV then
		t.connectTraceback = debug.traceback()
	end
	self._listeners = immutableAppend(self._listeners, t)
	
	return {
		disconnect = function()
			-- upvalues: t (ref), self (ref), status (copy), dEV (copy), immutableRemoveValue (copy)
			if t.disconnected then
				error(("Listener connected at: \n%s\nwas already disconnected at: \n%s\n"):format(tostring(t.connectTraceback), tostring(t.disconnectTraceback)))
			end
			if self._store and self._store._isDispatching then
				error("You may not unsubscribe from a store listener while the reducer is executing.")
			end
			if not status or dEV then
				t.disconnectTraceback = debug.traceback()
			end
			t.disconnected = true
			self._listeners = immutableRemoveValue(self._listeners, t)
		end
	}
end

function t:fire(...)
	for i, v in ipairs(self._listeners) do
		if not v.disconnected then
			v.callback(...)
		end
	end
end

return t