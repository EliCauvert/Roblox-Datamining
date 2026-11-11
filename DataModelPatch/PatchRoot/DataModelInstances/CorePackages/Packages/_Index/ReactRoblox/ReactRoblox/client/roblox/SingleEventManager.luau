local Console = require(script.Parent.Parent.Parent.Parent.Shared).console
local SingleEventManager = {}
SingleEventManager.__index = SingleEventManager

function SingleEventManager.new(_instance)
	-- upvalues: SingleEventManager (copy)
	return (setmetatable({
		_status = "Disabled",
		_isResuming = false,
		_suspendedEventQueue = {},
		_connections = {},
		_listeners = {},
		_instance = _instance
	}, SingleEventManager))
end

function SingleEventManager:connectEvent(p1, p2)
	self:_connect(p1, self._instance[p1], p2)
end

function SingleEventManager:connectPropertyChange(Text, p1)
	local Success, Result = pcall(self._instance.GetPropertyChangedSignal, self._instance, Text)
	
	if not Success then
		error(string.format("Cannot get changed signal on property %q: %s", tostring(Text), Result), 0)
	end
	self:_connect("Change." .. Text, Result, p1)
end

function SingleEventManager:_connect(p1, Signal, p2)
	if p2 == nil then
		if self._connections[p1] ~= nil then
			self._connections[p1]:Disconnect()
			self._connections[p1] = nil
		end
		self._listeners[p1] = nil
		
		return
	else
		if self._connections[p1] == nil then
			self._connections[p1] = Signal:Connect(function(...)
				-- upvalues: self (copy), p1 (copy)
				if self._status == "Enabled" then
					self._listeners[p1](self._instance, ...)
					
					return
				end
				if self._status == "Suspended" then
					table.insert(self._suspendedEventQueue, { p1, select("#", ...), ... })
				end
			end)
		end
		self._listeners[p1] = p2
	end
end

function SingleEventManager:suspend()
	self._status = "Suspended"
end

function SingleEventManager:resume()
	-- upvalues: Console (copy)
	if self._isResuming then return end
	self._isResuming = true
	
	for _, value in self._suspendedEventQueue do
		local Listener = self._listeners[value[1]]
		local v1: number = value[2]
		local NoListener = Listener == nil
		local Result = nil
		
		if not NoListener then
			local Success
			Success, Result = coroutine.resume(coroutine.create(Listener), self._instance, unpack(value, 3, 2 + v1))
			NoListener = Success
		end
		if not NoListener then
			Console.warn("%s", Result)
		end
	end
	self._isResuming = false
	self._status = "Enabled"
	table.clear(self._suspendedEventQueue)
end

return SingleEventManager