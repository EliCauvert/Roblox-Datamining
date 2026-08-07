local t = {}
t.__index = t

function t.new() --[[ line: 14 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.min = Vector3.new(1e999, 1e999, 1e999)
	tbl.max = Vector3.new(-1e999, -1e999, -1e999)
	
	return tbl
end

function t:fromMinMax(b) --[[ line: 22 ]]
	-- upvalues: t (ref)
	local var2 = t.new()
	local t_1 = { X = self.X, Y = self.Y, Z = self.Z }
	local t_2 = { X = b.X, Y = b.Y, Z = b.Z }
	
	for i, v in { "X", "Y", "Z" } do
		if t_2[v] ~= -1e999 and t_1[v] ~= 1e999 and t_2[v] < t_1[v] then
			local var5 = t_1[v]
			t_1[v] = t_2[v]
			t_2[v] = var5
		end
	end
	var2.min = Vector3.new(t_1.X, t_1.Y, t_1.Z)
	var2.max = Vector3.new(t_2.X, t_2.Y, t_2.Z)
	
	return var2
end

function t:unionExtents(p0) --[[ line: 42 ]]
	-- upvalues: t (ref)
	local var6 = t.new()
	var6.min = self.min:Min(p0.min)
	var6.max = self.max:Max(p0.max)
	
	return var6
end

function t:intersectExtents(p1) --[[ line: 49 ]]
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
	local var9 = t.new()
	var9.min = Vector3.new(t_1.X, t_1.Y, t_1.Z)
	var9.max = Vector3.new(t_2.X, t_2.Y, t_2.Z)
	
	return var9
end

function t:expandToInclude(p2) --[[ line: 72 ]]
	-- upvalues: t (ref)
	local var12 = t.new()
	var12.min = self.min:Min(p2)
	var12.max = self.max:Max(p2)
	
	return var12
end

function t:isValid() --[[ line: 79 ]]
	for i, v in { "X", "Y", "Z" } do
		if self.max[v] < self.min[v] then
			return false
		end
	end
	return true
end

function t:size() --[[ line: 88 ]]
	return if self:isValid() then self.max - self.min else nil
end

function t:center() --[[ line: 95 ]]
	return if self:isValid() then (self.max + self.min) / 2 else nil
end

return t