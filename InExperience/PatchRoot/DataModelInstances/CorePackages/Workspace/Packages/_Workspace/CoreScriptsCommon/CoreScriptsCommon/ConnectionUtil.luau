local t = {}
t.__index = t

function t.new() --[[ line: 21 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.connections = {}
	
	return tbl
end

function t:connect(p0, p1, p2) --[[ line: 27 ]]
	if self.connections[p0] then
		self.connections[p0]()
	end
	local var2 = p1:Connect(p2)
	
	self.connections[p0] = function() --[[ line: 33 ]]
		-- upvalues: var2 (ref)
		var2:Disconnect()
	end
end

function t:connectManual(p3, p4) --[[ line: 38 ]]
	if self.connections[p3] then
		self.connections[p3]()
	end
	self.connections[p3] = p4
end

function t:disconnect(p5) --[[ line: 45 ]]
	if self.connections[p5] then
		self.connections[p5]()
		self.connections[p5] = nil
	end
end

function t:disconnectAll() --[[ line: 52 ]]
	for i, v in pairs(self.connections) do
		v()
	end
	self.connections = {}
end

return t