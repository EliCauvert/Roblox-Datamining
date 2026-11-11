local ConnectionUtil = {}
ConnectionUtil.__index = ConnectionUtil

function ConnectionUtil.new()
	-- upvalues: ConnectionUtil (copy)
	local self = setmetatable({}, ConnectionUtil)
	self.connections = {}
	
	return self
end

function ConnectionUtil:connect(p1, Signal, Callback)
	if self.connections[p1] then
		self.connections[p1]()
	end
	local Connection = Signal:Connect(Callback)
	
	self.connections[p1] = function()
		-- upvalues: Connection (copy)
		Connection:Disconnect()
	end
end

function ConnectionUtil:connectManual(p1, p2)
	if self.connections[p1] then
		self.connections[p1]()
	end
	self.connections[p1] = p2
end

function ConnectionUtil:disconnect(p1)
	if self.connections[p1] then
		self.connections[p1]()
		self.connections[p1] = nil
	end
end

function ConnectionUtil:disconnectAll()
	for _, connection in pairs(self.connections) do
		connection()
	end
	self.connections = {}
end

return ConnectionUtil