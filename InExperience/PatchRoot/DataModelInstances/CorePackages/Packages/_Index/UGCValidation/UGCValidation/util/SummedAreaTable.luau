local t = {}
t.__index = t

function t:ReadPixel(p1, p2)
	if self.size.X <= p1 or self.size.Y <= p2 or (p1 < 0 or p2 < 0) then
		return Color3.fromRGB(0, 0, 0)
	end
	local var1 = (p1 + p2 * self.size.X) * 4
	
	return Color3.fromRGB(buffer.readu8(self.buffer, var1), buffer.readu8(self.buffer, var1 + 1), buffer.readu8(self.buffer, var1 + 2))
end

function t.new(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.buffer = p1:ReadPixelsBuffer(Vector2.new(0, 0), p1.Size)
	tbl.size = p1.Size
	
	return tbl
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2)
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.size = p1
	tbl.calculateWeightFromColor3 = p2
	tbl.buffer = buffer.create(p1.X * p1.Y * 4)
	
	return tbl
end

function t_1:ReadValue(p1, p2)
	return if p1 < 0 or p2 < 0 then 0 else buffer.readu32(self.buffer, (math.min(p1, self.size.X - 1) + math.min(p2, self.size.Y - 1) * self.size.X) * 4)
end

function t_1:WriteValue(p1, p2, p3)
	assert(p1 < self.size.X and (p2 < self.size.Y and (p1 >= 0 and p2 >= 0)))
	buffer.writeu32(self.buffer, (p1 + p2 * self.size.X) * 4, p3)
end

function t_1:BuildSummedAreaTable(p1)
	-- upvalues: t (ref)
	local var1 = t.new(p1)
	assert(var1.size == self.size)
	
	for i_1 = 0, self.size.Y - 1 do
		for i = 0, self.size.X - 1 do
			self:WriteValue(i, i_1, self.calculateWeightFromColor3(var1:ReadPixel(i, i_1)) + self:ReadValue(i - 1, i_1) + self:ReadValue(i, i_1 - 1) - self:ReadValue(i - 1, i_1 - 1))
		end
	end
end

function t_1:GetAreaDensity(p2, p3)
	local var2 = p2 - Vector2.one
	local var3 = p2 + p3 - Vector2.one
	local vector2 = Vector2.new(var3.X, var2.Y)
	local vector2_1 = Vector2.new(var2.X, var3.Y)
	
	return self:ReadValue(var3.X, var3.Y) - self:ReadValue(vector2.X, vector2.Y) - self:ReadValue(vector2_1.X, vector2_1.Y) + self:ReadValue(var2.X, var2.Y)
end

function t_1:GetAreaDensityContinuous(p2, p3)
	local var2 = 0
	local var3 = p2 + p3
	local var4 = p2:Ceil()
	local var5 = var3:Floor()
	local var6 = var5 - var4
	
	if var6.X > 0 and var6.Y > 0 then
		var2 += self:GetAreaDensity(var4, var6)
	end
	local var7 = var4 - p2
	local var8 = var3 - var5
	
	if var6.Y > 0 then
		local vector2 = Vector2.new(1, var6.Y)
		var2 = if math.floor(p2.X) < math.floor(var3.X) then var2 + self:GetAreaDensity(var4 + Vector2.new(-1, 0), vector2) * var7.X + self:GetAreaDensity(var4 + Vector2.new(var6.X, 0), vector2) * var8.X else var2 + self:GetAreaDensity(var4 + Vector2.new(-1, 0), vector2) * (var3.X - p2.X)
	end
	if var6.X > 0 then
		local vector2 = Vector2.new(var6.X, 1)
		var2 = if math.floor(p2.Y) < math.floor(var3.Y) then var2 + self:GetAreaDensity(var4 + Vector2.new(0, -1), vector2) * var7.Y + self:GetAreaDensity(var4 + Vector2.new(0, var6.Y), vector2) * var8.Y else var2 + self:GetAreaDensity(var4 + Vector2.new(0, -1), vector2) * (var3.Y - p2.Y)
	end
	local var9 = math.min(var4.X, var3.X) - p2.X
	local var10 = math.min(var4.Y, var3.Y) - p2.Y
	var2 += self:GetAreaDensity(p2:Floor(), Vector2.new(1, 1)) * var9 * var10
	
	if math.floor(p2.X) < math.floor(var3.X) then
		var2 += self:GetAreaDensity(Vector2.new(var3.X, p2.Y):Floor(), Vector2.new(1, 1)) * var8.X * var10
		
		if math.floor(p2.Y) < math.floor(var3.Y) then
			var2 += self:GetAreaDensity(var3:Floor(), Vector2.new(1, 1)) * var8.X * var8.Y
		end
	end
	if math.floor(p2.Y) < math.floor(var3.Y) then
		var2 += self:GetAreaDensity(Vector2.new(p2.X, var3.Y):Floor(), Vector2.new(1, 1)) * var9 * var8.Y
	end
	return var2
end

return t_1