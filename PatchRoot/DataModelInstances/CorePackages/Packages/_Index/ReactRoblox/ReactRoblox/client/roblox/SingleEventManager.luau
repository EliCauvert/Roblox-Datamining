-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:38 2026 Pacific Standard Time.

local console = require(script.Parent.Parent.Parent.Parent.Shared).console
local _ = {
	Disabled = "Disabled",
	Suspended = "Suspended",
	Enabled = "Enabled"
}
local t = {}
t.__index = t

function t.new(p0) --[[ line: 49 ]]
	-- upvalues: t (ref)
	return setmetatable({
		_status = "Disabled",
		_isResuming = false,
		_suspendedEventQueue = {},
		_connections = {},
		_listeners = {},
		_instance = p0
	}, t)
end

function t:connectEvent(p1, p2) --[[ line: 77 ]]
	self:_connect(p1, self._instance[p1], p2)
end

function t:connectPropertyChange(p3, p4) --[[ line: 81 ]]
	local ok, status = pcall(self._instance.GetPropertyChangedSignal, self._instance, p3)
	
	if not ok then
		error(string.format("Cannot get changed signal on property %q: %s", tostring(p3), status), 0)
	end
	self:_connect("Change." .. p3, status, p4)
end

function t:_connect(p5, p6, p7) --[[ line: 99 ]]
	if p7 == nil then
		if self._connections[p5] ~= nil then
			self._connections[p5]:Disconnect()
			self._connections[p5] = nil
		end
		self._listeners[p5] = nil
		
		return
	elseif self._connections[p5] == nil then
		self._connections[p5] = p6:Connect(function(...) --[[ line: 110 ]]
			-- upvalues: self (ref), p5 (ref)
			if self._status == "Enabled" then
				self._listeners[p5](self._instance, ...)
				
				return
			elseif self._status == "Suspended" then
				table.insert(self._suspendedEventQueue, { p5, select("#", ...), ... })
			end
		end)
	end
	self._listeners[p5] = p7
end

function t:suspend() --[[ line: 130 ]]
	self._status = "Suspended"
end

function t:resume() --[[ line: 134 ]]
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