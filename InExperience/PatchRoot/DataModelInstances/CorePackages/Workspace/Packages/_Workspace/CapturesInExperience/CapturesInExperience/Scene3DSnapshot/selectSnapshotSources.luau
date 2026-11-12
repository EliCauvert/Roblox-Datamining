local list = {
	vector.create(1, 1, 1), vector.create(1, 1, -1), vector.create(1, -1, 1),
	vector.create(1, -1, -1), vector.create(-1, 1, 1), vector.create(-1, 1, -1),
	vector.create(-1, -1, 1), vector.create(-1, -1, -1)
}

local function _(Model: Model): boolean
	return Model:IsA("Model") and Model:FindFirstChildOfClass("Humanoid") ~= nil
end

return function(p1)
	-- upvalues: list (copy)
	local Position = p1.cameraCFrame.Position
	local Inverted = p1.cameraCFrame:Inverse()
	local Radians = math.rad(p1.fovMargin)
	local Radians1 = math.rad(p1.fieldOfView * 0.5)
	local Tangent = math.tan((math.min(Radians1 + Radians, 1.53588974175501)))
	local Tangent1 = math.tan((math.min(math.atan(math.tan(Radians1) * p1.aspect) + Radians, 1.53588974175501)))
	
	local function isInView(p2): boolean
		-- upvalues: list (upval), Inverted (copy), Tangent1 (copy), Tangent (copy), p1 (copy), Position (copy)
		local ScaledSize = p2.Size * 0.5
		local _CFrame = p2.CFrame
		local Count = 0
		local Count1 = 0
		local Count2 = 0
		local Count3 = 0
		local Count4 = 0
		local Count5 = 0
		
		for _, value in list do
			local ScaledInverted = Inverted * (_CFrame * (ScaledSize * value))
			local Negated = -ScaledInverted.Z
			local ScaledNegated = Negated * Tangent1
			local ScaledNegated1 = Negated * Tangent
			
			if Negated <= 0 then
				Count += 1
			end
			if p1.maxDepth < Negated then
				Count1 += 1
			end
			if ScaledNegated < ScaledInverted.X then
				Count2 += 1
			end
			if ScaledNegated < -ScaledInverted.X then
				Count3 += 1
			end
			if ScaledNegated1 < ScaledInverted.Y then
				Count4 += 1
			end
			if ScaledNegated1 < -ScaledInverted.Y then
				Count5 += 1
			end
		end
		local CountList = #list
		
		return not (Count == CountList or (Count1 == CountList or (Count2 == CountList or (Count3 == CountList or (Count4 == CountList or Count5 == CountList))))) or (p2.Position - Position).Magnitude - ScaledSize.Magnitude <= p1.nearRadius
	end
	
	local function nearestCharacter(p3)
		-- upvalues: p1 (copy)
		local Parent = p3.Parent
		while Parent ~= nil and Parent ~= p1.root do
			if Parent:IsA("Model") and Parent:FindFirstChildOfClass("Humanoid") ~= nil then
				return Parent
			end
			Parent = Parent.Parent
		end
		return nil
	end
	
	local List = {}
	local List1 = {}
	local t = {}
	
	local function _(Key)
		-- upvalues: t (copy), List1 (copy)
		if not t[Key] then
			t[Key] = true
			table.insert(List1, Key)
		end
	end
	
	if p1.localCharacter ~= nil then
		local LocalCharacter = p1.localCharacter
		
		if not t[LocalCharacter] then
			t[LocalCharacter] = true
			table.insert(List1, LocalCharacter)
		end
	end
	for _, descendant in p1.root:GetDescendants() do
		if descendant:IsA("BasePart") and not descendant:IsA("Terrain") and isInView(descendant) then
			local NearestCharacterResult = nearestCharacter(descendant)
			
			if NearestCharacterResult == nil then
				t[descendant] = true
				table.insert(List, descendant)
			elseif not t[NearestCharacterResult] then
				t[NearestCharacterResult] = true
				table.insert(List1, NearestCharacterResult)
			end
		end
	end
	local _ = function(p4): boolean
		-- upvalues: p1 (copy), t (copy)
		local Parent = p4.Parent
		while Parent ~= nil and Parent ~= p1.root do
			if t[Parent] then
				return true
			end
			Parent = Parent.Parent
		end
		return false
	end
	
	local LooseParts = {}
	
	for _, value in List do
		local Parent = value.Parent
		local Flag = nil
		while Parent ~= nil and Parent ~= p1.root do
			if not t[Parent] then
				Parent = Parent.Parent
				continue
			end
			Flag = true
			if not Flag then
				table.insert(LooseParts, value)
			end
		end
		Flag = false
	end
	local Characters = {}
	
	for _, value1 in List1 do
		local Parent = value1.Parent
		local Flag = nil
		while Parent ~= nil and Parent ~= p1.root do
			if not t[Parent] then
				Parent = Parent.Parent
				continue
			end
			Flag = true
			if not Flag then
				table.insert(Characters, value1)
			end
		end
		Flag = false
	end
	return { looseParts = LooseParts, characters = Characters }
end