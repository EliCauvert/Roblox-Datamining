local FloatVectorModule = {}

function FloatVectorModule.new(...)
	-- upvalues: FloatVectorModule (copy)
	local self = setmetatable({}, FloatVectorModule)
	self.data = {}
	local list = { ... }
	
	if #list == 1 and typeof(list[1]) == "table" then
		if getmetatable(list[1]) == FloatVectorModule then
			list = list[1].data
		else
			list = list[1]
		end
	end
	for _, value in list do
		if typeof(value) == "number" then
			table.insert(self.data, value)
		else
			error("arg to FloatVector.new() not a number")
		end
	end
	return self
end

function FloatVectorModule:getSize(): number
	return #self.data
end

function FloatVectorModule:checkCompatible(p1): boolean
	-- upvalues: FloatVectorModule (copy)
	if typeof(self) ~= typeof(FloatVectorModule) or typeof(p1) ~= typeof(FloatVectorModule) then
		error("vector operation on non-vector type")
		
		return false
	elseif #self.data == #p1.data then
		return true
	else
		error("operating on vectors of different dimension")
		
		return false
	end
end

function FloatVectorModule.__index(p1, p2)
	-- upvalues: FloatVectorModule (copy)
	return if typeof(p2) == "number" then p1.data[p2] else FloatVectorModule[p2]
end

function FloatVectorModule:__newindex(p1, p2)
	if typeof(p1) == "number" then
		self.data[p1] = p2
		
		return
	else
		rawset(self, p1, p2)
	end
end

function FloatVectorModule:__add(p1)
	-- upvalues: FloatVectorModule (copy)
	FloatVectorModule.checkCompatible(self, p1)
	local List = {}
	
	for i = 1, #self.data do
		table.insert(List, self.data[i] + p1.data[i])
	end
	return FloatVectorModule.new(List)
end

function FloatVectorModule:__sub(p2)
	-- upvalues: FloatVectorModule (copy)
	FloatVectorModule.checkCompatible(self, p2)
	local List = {}
	
	for i = 1, #self.data do
		table.insert(List, self.data[i] - p2.data[i])
	end
	return FloatVectorModule.new(List)
end

function FloatVectorModule:__mul(p3)
	-- upvalues: FloatVectorModule (copy)
	if typeof(self) == typeof(FloatVectorModule) and typeof(p3) == "number" then
		local List1 = {}
		
		for _, entry in self.data do
			table.insert(List1, entry * p3)
		end
		return FloatVectorModule.new(List1)
	else
		FloatVectorModule.checkCompatible(self, p3)
		local List = {}
		
		for i = 1, #self.data do
			table.insert(List, self.data[i] * p3.data[i])
		end
		return FloatVectorModule.new(List)
	end
end

function FloatVectorModule:__div(p4)
	-- upvalues: FloatVectorModule (copy)
	if typeof(self) == typeof(FloatVectorModule) and typeof(p4) == "number" then
		local List1 = {}
		
		for _, entry in self.data do
			table.insert(List1, entry / p4)
		end
		return FloatVectorModule.new(List1)
	else
		FloatVectorModule.checkCompatible(self, p4)
		local List = {}
		
		for i = 1, #self.data do
			table.insert(List, self.data[i] / p4.data[i])
		end
		return FloatVectorModule.new(List)
	end
end

function FloatVectorModule:dot(p5): number
	-- upvalues: FloatVectorModule (copy)
	FloatVectorModule.checkCompatible(self, p5)
	local NewEntry = 0
	
	for i = 1, #self.data do
		NewEntry += self.data[i] * p5.data[i]
	end
	return NewEntry
end

function FloatVectorModule:cross(p6)
	-- upvalues: FloatVectorModule (copy)
	FloatVectorModule.checkCompatible(self, p6)
	
	if #self.data == 3 and #p6.data == 3 then
		return FloatVectorModule.new(self.data[2] * p6.data[3] - self.data[3] * p6.data[2], self.data[3] * p6.data[1] - self.data[1] * p6.data[3], self.data[1] * p6.data[2] - self.data[2] * p6.data[1])
	else
		error("cross product is only defined for two 3 dimensional vectors")
		
		return nil
	end
end

function FloatVectorModule.magnitude(p6): number
	local Value = 0
	
	for _, entry in p6.data do
		Value += entry ^ 2
	end
	return (math.sqrt(Value))
end

function FloatVectorModule:fuzzyEq(p7, p8): boolean
	-- upvalues: FloatVectorModule (copy)
	if not FloatVectorModule.checkCompatible(self, p7) then
		return false
	end
	local P23 = p8 or 0.00001
	
	for i = 1, #self.data do
		if P23 < math.abs(self.data[i] - p7.data[i]) then
			return false
		end
	end
	return true
end

return FloatVectorModule