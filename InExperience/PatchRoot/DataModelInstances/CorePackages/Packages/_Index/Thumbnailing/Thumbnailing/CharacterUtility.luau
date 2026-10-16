local function getHeadAttachments(Object) --[[ Line: 11 ]]
	local t = {}
	local Head = Object:FindFirstChild("Head")
	
	if Head then
		for _, Attachment in pairs(Head:GetChildren()) do
			if Attachment:IsA("Attachment") then
				t[Attachment.Name] = true
			end
		end
	end
	return t
end

local function _(p1, p2, p3, Vector, p4): Vector3 --[[ Line: 32 | Named "makeRotatedCorner" ]]
	return p4 * Vector3.new(p1 * Vector.X, p2 * Vector.Y, p3 * Vector.Z)
end

local function growExtentsToIncludePoint(Vector, Vector1, Vector2) --[[ Line: 41 ]]
	return Vector3.new(math.min(Vector2.X, Vector.X), math.min(Vector2.Y, Vector.Y), (math.min(Vector2.Z, Vector.Z))), (Vector3.new(math.max(Vector2.X, Vector1.X), math.max(Vector2.Y, Vector1.Y), (math.max(Vector2.Z, Vector1.Z))))
end

local function growExtentsToInclude(p1, p2, Handle, p3, p4, p5: number) --[[ Line: 68 ]]
	-- upvalues: growExtentsToIncludePoint (copy)
	local SizeRatio = Handle.Size / 2
	
	for i = -1, 1, 2 do
		for i1 = -1, 1, 2 do
			for i2 = -1, 1, 2 do
				local ScaledVector = Handle.CFrame * Vector3.new(i * SizeRatio.X, i1 * SizeRatio.Y, i2 * SizeRatio.Z)
				
				if p4 and p5 then
					local ScaledInverted = p4:Inverse() * ScaledVector
					ScaledVector = p4 * Vector3.new(ScaledInverted.X, math.max(p5, ScaledInverted.Y), ScaledInverted.Z)
				end
				p1, p10 = growExtentsToIncludePoint(p1, p2, p3 * ScaledVector)
			end
		end
	end
	return p1, p2
end

local _ = function() --[[ Line: 103 | Named "initExtents" ]]
	return vector.create(1e999, 1e999, 1e999), vector.create(-1e999, -1e999, -1e999)
end

local function recursiveCalculateExtents(p6, p7, Part, p8, Text: string) --[[ Line: 118 ]]
	-- upvalues: growExtentsToInclude (copy), recursiveCalculateExtents (copy)
	if not Text then
		Text = ""
	end
	assert(Text, "indent is non-nil. Silence type checker.")
	local Text1 = Text .. "  "
	
	for _, Part1 in pairs(Part:GetChildren()) do
		if Part1:IsA("BasePart") then
			p6, p16 = growExtentsToInclude(p6, p7, Part1, p8)
		end
		p6, p16 = recursiveCalculateExtents(p6, p7, Part1, p8, Text1)
	end
	return p6, p7
end

return {
	CalculateModelExtents = function(p9, p10) --[[ Line: 145 ]]
		-- upvalues: recursiveCalculateExtents (copy)
		local v1, v2 = recursiveCalculateExtents(vector.create(1e999, 1e999, 1e999), vector.create(-1e999, -1e999, -1e999), p9, p10:Inverse(), "  ")
		
		return v1, v2
	end,
	CalculateHeadExtents = function(Object, p9) --[[ Line: 160 ]]
		-- upvalues: growExtentsToInclude (copy), getHeadAttachments (copy)
		local v1: vector = vector.create(1e999, 1e999, 1e999)
		local v2: vector = vector.create(-1e999, -1e999, -1e999)
		local Head = Object:FindFirstChild("Head")
		
		if not Head then
			return v1, v2
		end
		local Inverted = p9:Inverse()
		local v3 = -Head.Size.Y / 2
		local GrowExtentsToIncludeResult, GrowExtentsToIncludeResult2 = growExtentsToInclude(v1, v2, Head, Inverted)
		local HeadAttachments = getHeadAttachments(Object)
		
		for _, Accoutrement in pairs(Object:GetChildren()) do
			if Accoutrement:IsA("Accoutrement") then
				local Handle = Accoutrement:FindFirstChild("Handle")
				
				if Handle then
					local Attachment = Handle:FindFirstChildWhichIsA("Attachment")
					
					if not Attachment or HeadAttachments[Attachment.Name] then
						GrowExtentsToIncludeResult, GrowExtentsToIncludeResult2 = growExtentsToInclude(GrowExtentsToIncludeResult, GrowExtentsToIncludeResult2, Handle, Inverted, Head.CFrame, v3)
					end
				end
			end
		end
		return GrowExtentsToIncludeResult, GrowExtentsToIncludeResult2
	end,
	CalculateBodyPartsExtents = function(p10, List) --[[ Line: 201 ]]
		-- upvalues: growExtentsToInclude (copy)
		local v4: vector = vector.create(1e999, 1e999, 1e999)
		local v5: vector = vector.create(-1e999, -1e999, -1e999)
		local Inverted = p10:Inverse()
		
		for _, value in pairs(List) do
			v4, v25 = growExtentsToInclude(v4, v5, value, Inverted, p10)
		end
		return v4, v5
	end,
	AllocateDebugExtentParts = function() --[[ Line: 217 ]]
		local Parts = {}
		
		for i = 1, 8 do
			local Part = Instance.new("Part")
			Part.Parent = workspace
			Part.Name = "DebugExtentPart" .. tostring(i)
			Part.Shape = Enum.PartType.Ball
			Part.Size = vector.create(0.25, 0.25, 0.25)
			Part.Anchored = true
			Part.CanCollide = false
			Parts[#Parts + 1] = Part
		end
		return Parts
	end,
	PositionDebugExtentParts = function(p11, Vector, Vector1, p12) --[[ Line: 237 ]]
		for i = 0, 1 do
			for i1 = 0, 1 do
				for i2 = 0, 1 do
					p11[i + i1 * 2 + i2 * 4 + 1].Position = p12 * Vector3.new(i == 0 and Vector.X or Vector1.X, i1 == 0 and Vector.Y or Vector1.Y, i2 == 0 and Vector.Z or Vector1.Z)
				end
			end
		end
	end
}