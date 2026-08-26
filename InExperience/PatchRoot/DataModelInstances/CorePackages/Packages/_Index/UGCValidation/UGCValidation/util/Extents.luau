local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.min = Vector3.new(1e999, 1e999, 1e999)
	tbl.max = Vector3.new(-1e999, -1e999, -1e999)
	
	return tbl
end

function t:fromMinMax(b)
	-- upvalues: t (ref)
	local var1 = t.new()
	local t_1 = { X = self.X, Y = self.Y, Z = self.Z }
	local t_2 = { X = b.X, Y = b.Y, Z = b.Z }
	
	for i, v in { "X", "Y", "Z" } do
		if t_2[v] ~= -1e999 and t_1[v] ~= 1e999 and t_2[v] < t_1[v] then
			local var2 = t_1[v]
			t_1[v] = t_2[v]
			t_2[v] = var2
		end
	end
	var1.min = Vector3.new(t_1.X, t_1.Y, t_1.Z)
	var1.max = Vector3.new(t_2.X, t_2.Y, t_2.Z)
	
	return var1
end

function t:unionExtents(p1)
	-- upvalues: t (ref)
	local var3 = t.new()
	var3.min = self.min:Min(p1.min)
	var3.max = self.max:Max(p1.max)
	
	return var3
end

function t:intersectExtents(p1)
	-- upvalues: t (ref)
	local t_1 = { X = 1e999, Y = 1e999, Z = 1e999 }
	local t_2 = { X = -1e999, Y = -1e999, Z = -1e999 }
	
	for i, v in { "X", "Y", "Z" } do
		if self.max[v] >= self.min[v] and p1.max[v] >= p1.min[v] then
			local maxValue = math.max(self.min[v], p1.min[v])
			local minValue = math.min(self.max[v], p1.max[v])
			
			if maxValue <= minValue then
				t_1[v] = maxValue
				t_2[v] = minValue
			end
		end
	end
	local var3 = t.new()
	var3.min = Vector3.new(t_1.X, t_1.Y, t_1.Z)
	var3.max = Vector3.new(t_2.X, t_2.Y, t_2.Z)
	
	return var3
end

function t:expandToInclude(p2)
	-- upvalues: t (ref)
	local var4 = t.new()
	var4.min = self.min:Min(p2)
	var4.max = self.max:Max(p2)
	
	return var4
end

function t:isValid()
	for i, v in { "X", "Y", "Z" } do
		if self.max[v] < self.min[v] then
			return false
		end
	end
	return true
end

function t:size()
	return if self:isValid() then self.max - self.min else nil
end

function t:center()
	return if self:isValid() then (self.max + self.min) / 2 else nil
end

return t