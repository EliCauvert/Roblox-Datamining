local console = require(script.Parent.Parent.Parent.Parent.Shared).console
local _ = {
	Disabled = "Disabled",
	Suspended = "Suspended",
	Enabled = "Enabled"
}
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	return setmetatable({
		_status = "Disabled",
		_isResuming = false,
		_suspendedEventQueue = {},
		_connections = {},
		_listeners = {},
		_instance = p1
	}, t)
end

function t:connectEvent(p1, p2)
	self:_connect(p1, self._instance[p1], p2)
end

function t:connectPropertyChange(p1, p2)
	local ok, status = pcall(self._instance.GetPropertyChangedSignal, self._instance, p1)
	
	if not ok then
		error(string.format("Cannot get changed signal on property %q: %s", tostring(p1), status), 0)
	end
	self:_connect("Change." .. p3, status, p2)
end

function t:_connect(p1, p2, p3)
	if p3 == nil then
		if self._connections[p1] ~= nil then
			self._connections[p1]:Disconnect()
			self._connections[p1] = nil
		end
		self._listeners[p1] = nil
		
		return
	elseif self._connections[p1] == nil then
		self._connections[p1] = p2:Connect(function(...)
			-- upvalues: self (ref), p1 (ref)
			if self._status == "Enabled" then
				self._listeners[p1](self._instance, ...)
				
				return
			elseif self._status == "Suspended" then
				table.insert(self._suspendedEventQueue, { p1, select("#", ...), ... })
			end
		end)
	end
	self._listeners[p1] = p3
end

function t:suspend()
	self._status = "Suspended"
end

function t:resume()
	-- upvalues: console (ref)
	if self._isResuming then return end
	self._isResuming = true
	
	for i, v in self._suspendedEventQueue do
		local var1 = self._listeners[v[1]]
		local var2 = v[2]
		
		if var1 ~= nil then
			local var3, var4 = coroutine.resume(coroutine.create(var1), self._instance, unpack(v, 3, 2 + var2))
			
			if not var3 then
				console.warn("%s", var4)
			end
		end
	end
	self._isResuming = false
	self._status = "Enabled"
	table.clear(self._suspendedEventQueue)
end

return t