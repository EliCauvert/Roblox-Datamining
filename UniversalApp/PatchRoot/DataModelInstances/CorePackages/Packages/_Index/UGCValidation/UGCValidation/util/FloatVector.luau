local t = {}

function t.new(...)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.data = {}
	local list = { ... }
	
	if #list == 1 and typeof(list[1]) == "table" then
		list = if getmetatable(list[1]) == t then list[1].data else list[1]
	end
	for i, v in list do
		if typeof(v) == "number" then
			table.insert(tbl.data, v)
		else
			error("arg to FloatVector.new() not a number")
		end
	end
	return tbl
end

function t:getSize()
	return #self.data
end

function t:checkCompatible(p1)
	-- upvalues: t (ref)
	if typeof(self) ~= typeof(t) or typeof(p1) ~= typeof(t) then
		error("vector operation on non-vector type")
		
		return false
	elseif #self.data == #p1.data then
		return true
	end
	error("operating on vectors of different dimension")
	
	return false
end

function t:__index(p1)
	-- upvalues: t (ref)
	return if typeof(p1) == "number" then self.data[p1] else t[p1]
end

function t:__newindex(p1, p2)
	if typeof(p1) == "number" then
		self.data[p1] = p2
		
		return
	end
	rawset(self, p1, p2)
end

function t:__add(p1)
	-- upvalues: t (ref)
	t.checkCompatible(self, p1)
	local t_1 = {}
	
	for i = 1, #self.data do
		table.insert(t_1, self.data[i] + p1.data[i])
	end
	return t.new(t_1)
end

function t:__sub(p2)
	-- upvalues: t (ref)
	t.checkCompatible(self, p2)
	local t_1 = {}
	
	for i = 1, #self.data do
		table.insert(t_1, self.data[i] - p2.data[i])
	end
	return t.new(t_1)
end

function t:__mul(p3)
	-- upvalues: t (ref)
	if typeof(self) == typeof(t) and typeof(p3) == "number" then
		local t_1 = {}
		
		for i, v in self.data do
			table.insert(t_1, v * p3)
		end
		return t.new(t_1)
	else
		t.checkCompatible(self, p3)
		local t_1 = {}
		
		for i = 1, #self.data do
			table.insert(t_1, self.data[i] * p3.data[i])
		end
		return t.new(t_1)
	end
end

function t:__div(p4)
	-- upvalues: t (ref)
	if typeof(self) == typeof(t) and typeof(p4) == "number" then
		local t_1 = {}
		
		for i, v in self.data do
			table.insert(t_1, v / p4)
		end
		return t.new(t_1)
	else
		t.checkCompatible(self, p4)
		local t_1 = {}
		
		for i = 1, #self.data do
			table.insert(t_1, self.data[i] / p4.data[i])
		end
		return t.new(t_1)
	end
end

function t:dot(vectorB)
	-- upvalues: t (ref)
	t.checkCompatible(self, vectorB)
	local var1 = 0
	
	for i = 1, #self.data do
		var1 += self.data[i] * vectorB.data[i]
	end
	return var1
end

function t:cross(vectorB)
	-- upvalues: t (ref)
	t.checkCompatible(self, vectorB)
	
	if #self.data == 3 and #vectorB.data == 3 then
		return t.new(self.data[2] * vectorB.data[3] - self.data[3] * vectorB.data[2], self.data[3] * vectorB.data[1] - self.data[1] * vectorB.data[3], self.data[1] * vectorB.data[2] - self.data[2] * vectorB.data[1])
	end
	error("cross product is only defined for two 3 dimensional vectors")
	
	return nil
end

function t:magnitude()
	local var2 = 0
	
	for i, v in self.data do
		var2 += v ^ 2
	end
	return math.sqrt(var2)
end

function t:fuzzyEq(p5, p6)
	-- upvalues: t (ref)
	if not t.checkCompatible(self, p5) then
		return false
	end
	p6 = p6 or 0.00001
	
	for i = 1, #self.data do
		if p6 >= math.abs(self.data[i] - p5.data[i]) then
			continue
		end
		return false
	end
	return true
end

return t