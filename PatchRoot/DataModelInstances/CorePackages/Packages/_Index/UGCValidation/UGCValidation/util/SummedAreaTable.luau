-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:40 2026 Pacific Standard Time.

local t = {}
t.__index = t

function t:ReadPixel(p0, p1) --[[ line: 21 ]]
	if self.size.X <= p0 or self.size.Y <= p1 or (p0 < 0 or p1 < 0) then
		return Color3.fromRGB(0, 0, 0)
	end
	local var2 = (p0 + p1 * self.size.X) * 4
	
	return Color3.fromRGB(buffer.readu8(self.buffer, var2), buffer.readu8(self.buffer, var2 + 1), buffer.readu8(self.buffer, var2 + 2))
end

function t.new(p2) --[[ line: 35 ]]
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.buffer = p2:ReadPixelsBuffer(Vector2.new(0, 0), p2.Size)
	tbl.size = p2.Size
	
	return tbl
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p3, p4) --[[ line: 51 ]]
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.size = p3
	tbl.calculateWeightFromColor3 = p4
	tbl.buffer = buffer.create(p3.X * p3.Y * 4)
	
	return tbl
end

function t_1:ReadValue(p5, p6) --[[ line: 60 ]]
	return if p5 < 0 or p6 < 0 then 0 else buffer.readu32(self.buffer, (math.min(p5, self.size.X - 1) + math.min(p6, self.size.Y - 1) * self.size.X) * 4)
end

function t_1:WriteValue(p7, p8, p9) --[[ line: 71 ]]
	assert(p7 < self.size.X and (p8 < self.size.Y and (p7 >= 0 and p8 >= 0)))
	buffer.writeu32(self.buffer, (p7 + p8 * self.size.X) * 4, p9)
end

function t_1:BuildSummedAreaTable(p10) --[[ line: 78 ]]
	-- upvalues: t (ref)
	local var5 = t.new(p10)
	assert(var5.size == self.size)
	
	for i_1 = 0, self.size.Y - 1 do
		for i = 0, self.size.X - 1 do
			self:WriteValue(i, i_1, self.calculateWeightFromColor3(var5:ReadPixel(i, i_1)) + self:ReadValue(i - 1, i_1) + self:ReadValue(i, i_1 - 1) - self:ReadValue(i - 1, i_1 - 1))
		end
	end
end

function t_1:GetAreaDensity(p11, p12) --[[ line: 96 ]]
	local var6 = p11 - Vector2.one
	local var7 = p11 + p12 - Vector2.one
	local vector2 = Vector2.new(var7.X, var6.Y)
	local vector2_1 = Vector2.new(var6.X, var7.Y)
	
	return self:ReadValue(var7.X, var7.Y) - self:ReadValue(vector2.X, vector2.Y) - self:ReadValue(vector2_1.X, vector2_1.Y) + self:ReadValue(var6.X, var6.Y)
end

function t_1:GetAreaDensityContinuous(p13, p14) --[[ line: 115 ]]
	local var10 = 0
	local var11 = p13 + p14
	local var12 = p13:Ceil()
	local var13 = var11:Floor()
	local var14 = var13 - var12
	
	if var14.X > 0 and var14.Y > 0 then
		var10 += self:GetAreaDensity(var12, var14)
	end
	local var15 = var12 - p13
	local var16 = var11 - var13
	
	if var14.Y > 0 then
		local vector2 = Vector2.new(1, var14.Y)
		var10 = if math.floor(p13.X) < math.floor(var11.X) then var10 + self:GetAreaDensity(var12 + Vector2.new(-1, 0), vector2) * var15.X + self:GetAreaDensity(var12 + Vector2.new(var14.X, 0), vector2) * var16.X else var10 + self:GetAreaDensity(var12 + Vector2.new(-1, 0), vector2) * (var11.X - p13.X)
	end
	if var14.X > 0 then
		local vector2 = Vector2.new(var14.X, 1)
		var10 = if math.floor(p13.Y) < math.floor(var11.Y) then var10 + self:GetAreaDensity(var12 + Vector2.new(0, -1), vector2) * var15.Y + self:GetAreaDensity(var12 + Vector2.new(0, var14.Y), vector2) * var16.Y else var10 + self:GetAreaDensity(var12 + Vector2.new(0, -1), vector2) * (var11.Y - p13.Y)
	end
	local var19 = math.min(var12.X, var11.X) - p13.X
	local var20 = math.min(var12.Y, var11.Y) - p13.Y
	var10 += self:GetAreaDensity(p13:Floor(), Vector2.new(1, 1)) * var19 * var20
	
	if math.floor(p13.X) < math.floor(var11.X) then
		var10 += self:GetAreaDensity(Vector2.new(var11.X, p13.Y):Floor(), Vector2.new(1, 1)) * var16.X * var20
		
		if math.floor(p13.Y) < math.floor(var11.Y) then
			var10 += self:GetAreaDensity(var11:Floor(), Vector2.new(1, 1)) * var16.X * var16.Y
		end
	end
	if math.floor(p13.Y) < math.floor(var11.Y) then
		var10 += self:GetAreaDensity(Vector2.new(p13.X, var11.Y):Floor(), Vector2.new(1, 1)) * var19 * var16.Y
	end
	return var10
end

return t_1