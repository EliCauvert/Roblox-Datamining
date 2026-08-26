local t = {}

local function getHeadAttachments(p1)
	local t = {}
	local head = p1:FindFirstChild("Head")
	
	if head then
		for i, v in pairs(head:GetChildren()) do
			if v:IsA("Attachment") then
				t[v.Name] = true
			end
		end
	end
	return t
end

local function _(p2, p3, p4, p5, p6)
	return p6 * Vector3.new(p2 * p5.X, p3 * p5.Y, p4 * p5.Z)
end

local function growExtentsToIncludePoint(p2, p3, p4)
	return Vector3.new(math.min(p4.X, p2.X), math.min(p4.Y, p2.Y), math.min(p4.Z, p2.Z)), Vector3.new(math.max(p4.X, p3.X), math.max(p4.Y, p3.Y), math.max(p4.Z, p3.Z))
end

local function growExtentsToInclude(p2, p3, p4, p5, p6, p7)
	-- upvalues: growExtentsToIncludePoint (ref)
	local var1 = p4.Size / 2
	local _ = nil
	
	for i_2 = -1, 1, 2 do
		for i_1 = -1, 1, 2 do
			for i = -1, 1, 2 do
				local var2 = p4.CFrame * Vector3.new(i_2 * var1.X, i_1 * var1.Y, i * var1.Z)
				
				if p6 and p7 then
					local var3 = p6:Inverse() * var2
					var2 = p6 * Vector3.new(var3.X, math.max(p7, var3.Y), var3.Z)
				end
				local var4, var5 = growExtentsToIncludePoint(p2, p3, p5 * var2)
				p2 = var4
				p3 = var5
			end
		end
	end
	return p2, p3
end

local _ = function()
	return Vector3.new(1e999, 1e999, 1e999), Vector3.new(-1e999, -1e999, -1e999)
end

local function recursiveCalculateExtents(p8, p9, p10, p11, p12)
	-- upvalues: growExtentsToInclude (ref), recursiveCalculateExtents (ref)
	if not p12 then
		p12 = ""
	end
	assert(p12, "indent is non-nil. Silence type checker.")
	p12 ..= "  "
	
	for i, v in pairs(p10:GetChildren()) do
		if v:IsA("BasePart") then
			local var6, var7 = growExtentsToInclude(p8, p9, v, p11)
			p8 = var6
			p9 = var7
		end
		local var8, var9 = recursiveCalculateExtents(p8, p9, v, p11, p12)
		p8 = var8
		p9 = var9
	end
	return p8, p9
end

function t.CalculateModelExtents(p13, p14)
	-- upvalues: recursiveCalculateExtents (ref)
	local var10, var11 = recursiveCalculateExtents(Vector3.new(1e999, 1e999, 1e999), Vector3.new(-1e999, -1e999, -1e999), p13, p14:Inverse(), "  ")
	
	return var10, var11
end

function t.CalculateHeadExtents(p13, p14)
	-- upvalues: growExtentsToInclude (ref), getHeadAttachments (ref)
	local var10 = Vector3.new(1e999, 1e999, 1e999)
	local var11 = Vector3.new(-1e999, -1e999, -1e999)
	local head = p13:FindFirstChild("Head")
	
	if not head then
		return var10, var11
	end
	local var12 = p14:Inverse()
	local var13 = -head.Size.Y / 2
	local var14, var15 = growExtentsToInclude(var10, var11, head, var12)
	local var16 = var14
	local var17 = var15
	local var18 = getHeadAttachments(p13)
	
	for i, v in pairs(p13:GetChildren()) do
		if v:IsA("Accoutrement") then
			local handle = v:FindFirstChild("Handle")
			
			if handle then
				local attachment = handle:FindFirstChildWhichIsA("Attachment")
				
				if not attachment or var18[attachment.Name] then
					local var19, var20 = growExtentsToInclude(var16, var17, handle, var12, head.CFrame, var13)
					var16 = var19
					var17 = var20
				end
			end
		end
	end
	return var16, var17
end

function t.CalculateBodyPartsExtents(p15, p16)
	-- upvalues: growExtentsToInclude (ref)
	local var21 = Vector3.new(1e999, 1e999, 1e999)
	local var22 = Vector3.new(-1e999, -1e999, -1e999)
	local var23 = p15:Inverse()
	
	for i, v in pairs(p16) do
		local var24, var25 = growExtentsToInclude(var21, var22, v, var23, p15)
		var21 = var24
		var22 = var25
	end
	return var21, var22
end

function t.AllocateDebugExtentParts()
	local t = {}
	
	for i = 1, 8 do
		local part = Instance.new("Part")
		part.Parent = workspace
		part.Name = "DebugExtentPart" .. tostring(i)
		part.Shape = Enum.PartType.Ball
		part.Size = Vector3.new(0.25, 0.25, 0.25)
		part.Anchored = true
		part.CanCollide = false
		t[#t + 1] = part
	end
	return t
end

function t.PositionDebugExtentParts(p17, p18, p19, p20)
	for i_2 = 0, 1 do
		for i_1 = 0, 1 do
			for i = 0, 1 do
				p17[i_2 + i_1 * 2 + i * 4 + 1].Position = p20 * Vector3.new(if i_2 == 0 then p18.X else p19.X, if i_1 == 0 then p18.Y else p19.Y, if i == 0 then p18.Z else p19.Z)
			end
		end
	end
end

return t