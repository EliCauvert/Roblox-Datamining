local AvatarFloorPositionModule = require(script.Parent.avatarFloorPosition)

local function _(p1, p2)
	return p2.Position.Y - p1.Position.Y + 0.5 * p2.Size.Y
end

local function emptyFit()
	return CFrame.lookAt(vector.create(0, 2.5, 8), vector.create(0, 2, 0)), vector.create(0, 2, 0), 8
end

local function distanceToFit(Vector, Degrees: number): number
	local RadiansRatio = math.rad(Degrees) / 2
	local AtanResult = math.atan(math.tan(RadiansRatio) * 0.5625)
	
	return math.max(if math.tan(RadiansRatio) > 0 then Vector.Y / 2 / math.tan(RadiansRatio) else 8, if math.tan(AtanResult) > 0 then Vector.X / 2 / math.tan(AtanResult) else 8, 1) * 1.15
end

local function fitBox(Vector, Vector1, p1)
	-- upvalues: distanceToFit (copy)
	local Target = (Vector + Vector1) / 2
	local Z = distanceToFit(Vector1 - Vector, p1)
	
	return CFrame.lookAt(Target + Vector3.new(0, 0, Z), Target), Target, Z
end

return {
	fitStandingCharacters = function(List, p1)
		-- upvalues: AvatarFloorPositionModule (copy), emptyFit (copy), fitBox (copy)
		local Vector = vector.create(1e999, 1e999, 1e999)
		local Vector1 = vector.create(-1e999, -1e999, -1e999)
		local Flag = false
		
		for _, Object in List do
			local HumanoidRootPart = Object:FindFirstChild("HumanoidRootPart")
			local Head = Object:FindFirstChild("Head")
			local HeightForCharacterResult = AvatarFloorPositionModule.heightForCharacter(Object)
			
			if HumanoidRootPart ~= nil and HumanoidRootPart:IsA("BasePart") and Head ~= nil and Head:IsA("BasePart") and HeightForCharacterResult ~= nil then
				Flag = true
				local NewHeightForCharacterResult = HeightForCharacterResult + (Head.Position.Y - HumanoidRootPart.Position.Y + 0.5 * Head.Size.Y)
				local ScaledNewHeightForCharacterResult = NewHeightForCharacterResult * 0.24
				local Position = HumanoidRootPart.Position
				Vector = Vector3.new(math.min(Vector.X, Position.X - ScaledNewHeightForCharacterResult), math.min(Vector.Y, 0), (math.min(Vector.Z, Position.Z - 0.75)))
				Vector1 = Vector3.new(math.max(Vector1.X, Position.X + ScaledNewHeightForCharacterResult), math.max(Vector1.Y, NewHeightForCharacterResult), (math.max(Vector1.Z, Position.Z + 0.75)))
			end
		end
		return if Flag then fitBox(Vector, Vector1, p1) else emptyFit()
	end,
	fitStandingFace = function(List, p2)
		-- upvalues: AvatarFloorPositionModule (copy), emptyFit (copy), fitBox (copy)
		local Vector = vector.create(1e999, 1e999, 1e999)
		local Vector1 = vector.create(-1e999, -1e999, -1e999)
		local Flag = false
		
		for _, Object in List do
			local HumanoidRootPart = Object:FindFirstChild("HumanoidRootPart")
			local Head = Object:FindFirstChild("Head")
			local HeightForCharacterResult = AvatarFloorPositionModule.heightForCharacter(Object)
			
			if HumanoidRootPart ~= nil and HumanoidRootPart:IsA("BasePart") and Head ~= nil and Head:IsA("BasePart") and HeightForCharacterResult ~= nil then
				Flag = true
				local NewHeightForCharacterResult = HeightForCharacterResult + (Head.Position.Y - HumanoidRootPart.Position.Y + 0.5 * Head.Size.Y)
				local Position = HumanoidRootPart.Position
				Vector = Vector3.new(math.min(Vector.X, Position.X - 0.7), math.min(Vector.Y, NewHeightForCharacterResult - 2), (math.min(Vector.Z, Position.Z - 0.5)))
				Vector1 = Vector3.new(math.max(Vector1.X, Position.X + 0.7), math.max(Vector1.Y, NewHeightForCharacterResult), (math.max(Vector1.Z, Position.Z + 0.5)))
			end
		end
		return if Flag then fitBox(Vector, Vector1, p2) else emptyFit()
	end
}