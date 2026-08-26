local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.connections = {}
	
	return tbl
end

function t:connect(p1, p2, p3)
	if self.connections[p1] then
		self.connections[p1]()
	end
	local var1 = p2:Connect(p3)
	
	self.connections[p1] = function()
		-- upvalues: var1 (ref)
		var1:Disconnect()
	end
end

function t:connectManual(p1, p2)
	if self.connections[p1] then
		self.connections[p1]()
	end
	self.connections[p1] = p2
end

function t:disconnect(p1)
	if self.connections[p1] then
		self.connections[p1]()
		self.connections[p1] = nil
	end
end

function t:disconnectAll()
	for i, v in pairs(self.connections) do
		v()
	end
	self.connections = {}
end

return t