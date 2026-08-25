local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.connections = {}
	
	return tbl
end

function t:connect(p0, p1, p2)
	if self.connections[p0] then
		self.connections[p0]()
	end
	local var2 = p1:Connect(p2)
	
	self.connections[p0] = function()
		-- upvalues: var2 (ref)
		var2:Disconnect()
	end
end

function t:connectManual(p3, p4)
	if self.connections[p3] then
		self.connections[p3]()
	end
	self.connections[p3] = p4
end

function t:disconnect(p5)
	if self.connections[p5] then
		self.connections[p5]()
		self.connections[p5] = nil
	end
end

function t:disconnectAll()
	for i, v in pairs(self.connections) do
		v()
	end
	self.connections = {}
end

return t