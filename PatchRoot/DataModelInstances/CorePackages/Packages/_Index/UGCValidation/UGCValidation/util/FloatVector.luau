-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

local t = {}

function t.new(...) --[[ line: 12 ]]
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

function t:getSize() --[[ line: 37 ]]
	return #self.data
end

function t:checkCompatible(p0) --[[ line: 41 ]]
	-- upvalues: t (ref)
	if typeof(self) ~= typeof(t) or typeof(p0) ~= typeof(t) then
		error("vector operation on non-vector type")
		
		return false
	elseif #self.data == #p0.data then
		return true
	end
	error("operating on vectors of different dimension")
	
	return false
end

function t:__index(p1) --[[ line: 54 ]]
	-- upvalues: t (ref)
	return if typeof(p1) == "number" then self.data[p1] else t[p1]
end

function t:__newindex(p2, p3) --[[ line: 62 ]]
	if typeof(p2) == "number" then
		self.data[p2] = p3
		
		return
	end
	rawset(self, p2, p3)
end

function t:__add(p4) --[[ line: 71 ]]
	-- upvalues: t (ref)
	t.checkCompatible(self, p4)
	local t_1 = {}
	
	for i = 1, #self.data do
		table.insert(t_1, self.data[i] + p4.data[i])
	end
	return t.new(t_1)
end

function t:__sub(p5) --[[ line: 80 ]]
	-- upvalues: t (ref)
	t.checkCompatible(self, p5)
	local t_1 = {}
	
	for i = 1, #self.data do
		table.insert(t_1, self.data[i] - p5.data[i])
	end
	return t.new(t_1)
end

function t:__mul(p6) --[[ line: 89 ]]
	-- upvalues: t (ref)
	if typeof(self) == typeof(t) and typeof(p6) == "number" then
		local t_1 = {}
		
		for i, v in self.data do
			table.insert(t_1, v * p6)
		end
		return t.new(t_1)
	else
		t.checkCompatible(self, p6)
		local t_1 = {}
		
		for i = 1, #self.data do
			table.insert(t_1, self.data[i] * p6.data[i])
		end
		return t.new(t_1)
	end
end

function t:__div(p7) --[[ line: 106 ]]
	-- upvalues: t (ref)
	if typeof(self) == typeof(t) and typeof(p7) == "number" then
		local t_1 = {}
		
		for i, v in self.data do
			table.insert(t_1, v / p7)
		end
		return t.new(t_1)
	else
		t.checkCompatible(self, p7)
		local t_1 = {}
		
		for i = 1, #self.data do
			table.insert(t_1, self.data[i] / p7.data[i])
		end
		return t.new(t_1)
	end
end

function t:dot(vectorB) --[[ line: 123 ]]
	-- upvalues: t (ref)
	t.checkCompatible(self, vectorB)
	local var9 = 0
	
	for i = 1, #self.data do
		var9 += self.data[i] * vectorB.data[i]
	end
	return var9
end

function t:cross(vectorB) --[[ line: 133 ]]
	-- upvalues: t (ref)
	t.checkCompatible(self, vectorB)
	
	if #self.data == 3 and #vectorB.data == 3 then
		return t.new(self.data[2] * vectorB.data[3] - self.data[3] * vectorB.data[2], self.data[3] * vectorB.data[1] - self.data[1] * vectorB.data[3], self.data[1] * vectorB.data[2] - self.data[2] * vectorB.data[1])
	end
	error("cross product is only defined for two 3 dimensional vectors")
	
	return nil
end

function t:magnitude() --[[ line: 146 ]]
	local var10 = 0
	
	for i, v in self.data do
		var10 += v ^ 2
	end
	return math.sqrt(var10)
end

function t:fuzzyEq(p8, p9) --[[ line: 154 ]]
	-- upvalues: t (ref)
	if not t.checkCompatible(self, p8) then
		return false
	end
	p9 = p9 or 0.00001
	
	for i = 1, #self.data do
		if p9 >= math.abs(self.data[i] - p8.data[i]) then
			continue
		end
		return false
	end
	return true
end

return t