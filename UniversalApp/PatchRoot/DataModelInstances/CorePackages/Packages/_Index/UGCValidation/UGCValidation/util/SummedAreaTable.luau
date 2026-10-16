local Module = {}
Module.__index = Module

function Module:ReadPixel(p1: number, p2: number): Color3 --[[ Line: 21 ]]
	if self.size.X <= p1 or self.size.Y <= p2 or p1 < 0 or p2 < 0 then
		return Color3.fromRGB(0, 0, 0)
	else
		local ScaledX = (p1 + p2 * self.size.X) * 4
		
		return Color3.fromRGB(buffer.readu8(self.buffer, ScaledX), buffer.readu8(self.buffer, ScaledX + 1), (buffer.readu8(self.buffer, ScaledX + 2)))
	end
end

function Module.new(EditableImage) --[[ Line: 35 ]]
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.buffer = EditableImage:ReadPixelsBuffer(Vector2.new(0, 0), EditableImage.Size)
	self.size = EditableImage.Size
	
	return self
end

local SummedAreaTableModule = {}
SummedAreaTableModule.__index = SummedAreaTableModule

function SummedAreaTableModule.new(Size, CalculateWeightFromColor3) --[[ Line: 51 ]]
	-- upvalues: SummedAreaTableModule (copy)
	local self = setmetatable({}, SummedAreaTableModule)
	self.size = Size
	self.calculateWeightFromColor3 = CalculateWeightFromColor3
	self.buffer = buffer.create(Size.X * Size.Y * 4)
	
	return self
end

function SummedAreaTableModule.ReadValue(p1, X: number, Y: number): number --[[ Line: 60 ]]
	return if X < 0 or Y < 0 then 0 else buffer.readu32(p1.buffer, (math.min(X, p1.size.X - 1) + math.min(Y, p1.size.Y - 1) * p1.size.X) * 4)
end

function SummedAreaTableModule:WriteValue(p1: number, p2: number, Value) --[[ Line: 71 ]]
	assert(p1 < self.size.X and (p2 < self.size.Y and p1 >= 0) and p2 >= 0)
	buffer.writeu32(self.buffer, (p1 + p2 * self.size.X) * 4, Value)
end

function SummedAreaTableModule:BuildSummedAreaTable(p1) --[[ Line: 78 ]]
	-- upvalues: Module (copy)
	local NewModule = Module.new(p1)
	assert(NewModule.size == self.size)
	
	for i = 0, self.size.Y - 1 do
		for i1 = 0, self.size.X - 1 do
			self:WriteValue(i1, i, self.calculateWeightFromColor3(NewModule:ReadPixel(i1, i)) + self:ReadValue(i1 - 1, i) + self:ReadValue(i1, i - 1) - self:ReadValue(i1 - 1, i - 1))
		end
	end
end

function SummedAreaTableModule:GetAreaDensity(NewVector, Vector) --[[ Line: 96 ]]
	local NewVectorDelta = NewVector - Vector2.one
	local NewVectorDelta1 = NewVector + Vector - Vector2.one
	local _Vector2 = Vector2.new(NewVectorDelta1.X, NewVectorDelta.Y)
	local _Vector2_1 = Vector2.new(NewVectorDelta.X, NewVectorDelta1.Y)
	
	return self:ReadValue(NewVectorDelta1.X, NewVectorDelta1.Y) - self:ReadValue(_Vector2.X, _Vector2.Y) - self:ReadValue(_Vector2_1.X, _Vector2_1.Y) + self:ReadValue(NewVectorDelta.X, NewVectorDelta.Y)
end

function SummedAreaTableModule:GetAreaDensityContinuous(Vector, p2): number --[[ Line: 115 ]]
	local NewAreaDensity = 0
	local NewVector = Vector + p2
	local CeilResult = Vector:Ceil()
	local FloorResult = NewVector:Floor()
	local FloorResultDelta = FloorResult - CeilResult
	
	if FloorResultDelta.X > 0 and FloorResultDelta.Y > 0 then
		NewAreaDensity += self:GetAreaDensity(CeilResult, FloorResultDelta)
	end
	local CeilResultDelta = CeilResult - Vector
	local NewVectorDelta = NewVector - FloorResult
	
	if FloorResultDelta.Y > 0 then
		local _Vector2 = Vector2.new(1, FloorResultDelta.Y)
		
		if math.floor(Vector.X) < math.floor(NewVector.X) then
			NewAreaDensity = NewAreaDensity + self:GetAreaDensity(CeilResult + Vector2.new(-1, 0), _Vector2) * CeilResultDelta.X + self:GetAreaDensity(CeilResult + Vector2.new(FloorResultDelta.X, 0), _Vector2) * NewVectorDelta.X
		else
			NewAreaDensity += self:GetAreaDensity(CeilResult + Vector2.new(-1, 0), _Vector2) * (NewVector.X - Vector.X)
		end
	end
	if FloorResultDelta.X > 0 then
		local _Vector2 = Vector2.new(FloorResultDelta.X, 1)
		
		if math.floor(Vector.Y) < math.floor(NewVector.Y) then
			NewAreaDensity = NewAreaDensity + self:GetAreaDensity(CeilResult + Vector2.new(0, -1), _Vector2) * CeilResultDelta.Y + self:GetAreaDensity(CeilResult + Vector2.new(0, FloorResultDelta.Y), _Vector2) * NewVectorDelta.Y
		else
			NewAreaDensity += self:GetAreaDensity(CeilResult + Vector2.new(0, -1), _Vector2) * (NewVector.Y - Vector.Y)
		end
	end
	local SmallestDelta = math.min(CeilResult.X, NewVector.X) - Vector.X
	local SmallestDelta1 = math.min(CeilResult.Y, NewVector.Y) - Vector.Y
	local NewNewAreaDensity = NewAreaDensity + self:GetAreaDensity(Vector:Floor(), Vector2.new(1, 1)) * SmallestDelta * SmallestDelta1
	
	if math.floor(Vector.X) < math.floor(NewVector.X) then
		NewNewAreaDensity += self:GetAreaDensity(Vector2.new(NewVector.X, Vector.Y):Floor(), Vector2.new(1, 1)) * NewVectorDelta.X * SmallestDelta1
		
		if math.floor(Vector.Y) < math.floor(NewVector.Y) then
			NewNewAreaDensity += self:GetAreaDensity(NewVector:Floor(), Vector2.new(1, 1)) * NewVectorDelta.X * NewVectorDelta.Y
		end
	end
	if math.floor(Vector.Y) < math.floor(NewVector.Y) then
		NewNewAreaDensity += self:GetAreaDensity(Vector2.new(Vector.X, NewVector.Y):Floor(), Vector2.new(1, 1)) * SmallestDelta * NewVectorDelta.Y
	end
	return NewNewAreaDensity
end

return SummedAreaTableModule