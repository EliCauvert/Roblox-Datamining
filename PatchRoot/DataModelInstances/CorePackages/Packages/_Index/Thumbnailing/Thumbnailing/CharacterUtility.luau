-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:28 2026 Pacific Standard Time.

local t = {}

local function getHeadAttachments(p0) --[[ line: 11 ]]
	local t = {}
	local head = p0:FindFirstChild("Head")
	
	if head then
		for i, v in pairs(head:GetChildren()) do
			if v:IsA("Attachment") then
				t[v.Name] = true
			end
		end
	end
	return t
end

local function _(p1, p2, p3, p4, p5) --[[ line: 32 | named "makeRotatedCorner" ]]
	return p5 * Vector3.new(p1 * p4.X, p2 * p4.Y, p3 * p4.Z)
end

local function growExtentsToIncludePoint(p6, p7, p8) --[[ line: 41 ]]
	return Vector3.new(math.min(p8.X, p6.X), math.min(p8.Y, p6.Y), math.min(p8.Z, p6.Z)), Vector3.new(math.max(p8.X, p7.X), math.max(p8.Y, p7.Y), math.max(p8.Z, p7.Z))
end

local function growExtentsToInclude(p9, p10, p11, p12, p13, p14) --[[ line: 68 ]]
	-- upvalues: growExtentsToIncludePoint (ref)
	local var7 = p11.Size / 2
	local _ = nil
	
	for i_2 = -1, 1, 2 do
		for i_1 = -1, 1, 2 do
			for i = -1, 1, 2 do
				local var8 = p11.CFrame * Vector3.new(i_2 * var7.X, i_1 * var7.Y, i * var7.Z)
				
				if p13 and p14 then
					local var9 = p13:Inverse() * var8
					var8 = p13 * Vector3.new(var9.X, math.max(p14, var9.Y), var9.Z)
				end
				local var10, var11 = growExtentsToIncludePoint(p9, p10, p12 * var8)
				p9 = var10
				p10 = var11
			end
		end
	end
	return p9, p10
end

local _ = function() --[[ line: 103 | named "initExtents" ]]
	return Vector3.new(1e999, 1e999, 1e999), Vector3.new(-1e999, -1e999, -1e999)
end

local function recursiveCalculateExtents(p15, p16, p17, p18, p19) --[[ line: 118 ]]
	-- upvalues: growExtentsToInclude (ref), recursiveCalculateExtents (ref)
	if not p19 then
		p19 = ""
	end
	assert(p19, "indent is non-nil. Silence type checker.")
	p19 ..= "  "
	
	for i, v in pairs(p17:GetChildren()) do
		if v:IsA("BasePart") then
			local var12, var13 = growExtentsToInclude(p15, p16, v, p18)
			p15 = var12
			p16 = var13
		end
		local var14, var15 = recursiveCalculateExtents(p15, p16, v, p18, p19)
		p15 = var14
		p16 = var15
	end
	return p15, p16
end

function t.CalculateModelExtents(p20, p21) --[[ line: 145 ]]
	-- upvalues: recursiveCalculateExtents (ref)
	local var16, var17 = recursiveCalculateExtents(Vector3.new(1e999, 1e999, 1e999), Vector3.new(-1e999, -1e999, -1e999), p20, p21:Inverse(), "  ")
	
	return var16, var17
end

function t.CalculateHeadExtents(p22, p23) --[[ line: 160 ]]
	-- upvalues: growExtentsToInclude (ref), getHeadAttachments (ref)
	local var18 = Vector3.new(1e999, 1e999, 1e999)
	local var19 = Vector3.new(-1e999, -1e999, -1e999)
	local head = p22:FindFirstChild("Head")
	
	if not head then
		return var18, var19
	end
	local var21 = p23:Inverse()
	local var22 = -head.Size.Y / 2
	local var23, var24 = growExtentsToInclude(var18, var19, head, var21)
	local var25 = var23
	local var26 = var24
	local var27 = getHeadAttachments(p22)
	
	for i, v in pairs(p22:GetChildren()) do
		if v:IsA("Accoutrement") then
			local handle = v:FindFirstChild("Handle")
			
			if handle then
				local attachment = handle:FindFirstChildWhichIsA("Attachment")
				
				if not attachment or var27[attachment.Name] then
					local var30, var31 = growExtentsToInclude(var25, var26, handle, var21, head.CFrame, var22)
					var25 = var30
					var26 = var31
				end
			end
		end
	end
	return var25, var26
end

function t.CalculateBodyPartsExtents(p24, p25) --[[ line: 201 ]]
	-- upvalues: growExtentsToInclude (ref)
	local var32 = Vector3.new(1e999, 1e999, 1e999)
	local var33 = Vector3.new(-1e999, -1e999, -1e999)
	local var34 = p24:Inverse()
	
	for i, v in pairs(p25) do
		local var35, var36 = growExtentsToInclude(var32, var33, v, var34, p24)
		var32 = var35
		var33 = var36
	end
	return var32, var33
end

function t.AllocateDebugExtentParts() --[[ line: 217 ]]
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

function t.PositionDebugExtentParts(p26, p27, p28, p29) --[[ line: 237 ]]
	for i_2 = 0, 1 do
		for i_1 = 0, 1 do
			for i = 0, 1 do
				p26[i_2 + i_1 * 2 + i * 4 + 1].Position = p29 * Vector3.new(if i_2 == 0 then p27.X else p28.X, if i_1 == 0 then p27.Y else p28.Y, if i == 0 then p27.Z else p28.Z)
			end
		end
	end
end

return t