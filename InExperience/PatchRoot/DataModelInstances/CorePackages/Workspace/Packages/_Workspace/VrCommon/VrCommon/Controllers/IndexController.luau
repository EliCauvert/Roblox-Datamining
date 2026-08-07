local openXrForWin32EngineFeature = game:GetEngineFeature("OpenXrForWin32")
local create = require(script:FindFirstAncestor("VrCommon").Parent.AppCommonLib).Create
local granite = Enum.Material.Granite
local var1 = if openXrForWin32EngineFeature then Vector3.new(3.400000095367, 3.400000095367, 3.400000095367) else Vector3.new(3.599999904633, 3.599999904633, 3.599999904633)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 15 ]]
	-- upvalues: t (ref), create (ref), granite (ref), var1 (ref)
	local tbl = setmetatable({}, t)
	tbl.userCFrame = p0
	tbl.model = create("Model")({ Name = "IndexController", Archivable = false })
	tbl.origin = create("Part")({
		Name = "Origin",
		Anchored = true,
		Transparency = 1,
		Size = Vector3.new(0.050000000745, 0.050000000745, 0.050000000745),
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		Parent = tbl.model
	})
	tbl.parts = {}
	local var4 = create("Part")({
		Name = "body",
		Anchored = true,
		Size = Vector3.new(0.050000000745, 0.050000000745, 0.050000000745),
		Transparency = 0.25,
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		Parent = tbl.model,
		Material = granite,
		CFrame = tbl.origin.CFrame
	})
	tbl.mesh = create("SpecialMesh")({
		Name = "Mesh",
		Parent = var4,
		MeshId = if p0 == Enum.UserCFrame.LeftHand then "rbxassetid://9605099531" else "rbxassetid://9605114549",
		TextureId = if p0 == Enum.UserCFrame.LeftHand then "rbxassetid://9605099774" else "rbxassetid://9605114771",
		Scale = var1
	})
	local _ = create("Weld")({
		Name = "Weld",
		Parent = var4,
		Part0 = tbl.origin,
		Part1 = var4
	})
	tbl.parts.body = var4
	tbl.model.PrimaryPart = tbl.origin
	
	return tbl
end

function t:setCFrame(p1) --[[ line: 70 ]]
	-- upvalues: openXrForWin32EngineFeature (ref)
	if openXrForWin32EngineFeature then
		if self.userCFrame == Enum.UserCFrame.RightHand then
			self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.698131700798, 3.14159265359, 0) * CFrame.new(-0.1, 0.08, -0.01))
			
			return
		end
		self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.698131700798, 3.14159265359, 0) * CFrame.new(0.1, 0.08, -0.01))
		
		return
	elseif self.userCFrame == Enum.UserCFrame.RightHand then
		self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.349065850399, 3.14159265359, 0) * CFrame.new(-0.1, -0.03, -0.4))
		
		return
	end
	self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.349065850399, 3.14159265359, 0) * CFrame.new(0.1, -0.03, -0.4))
end

function t:setCFrameAndScale(p2, p3) --[[ line: 94 ]]
	-- upvalues: openXrForWin32EngineFeature (ref), var1 (ref)
	local var5 = if self.userCFrame == Enum.UserCFrame.RightHand then 1 else -1
	
	if openXrForWin32EngineFeature then
		self.model:SetPrimaryPartCFrame(p2 * CFrame.Angles(0.698131700798, 3.14159265359, 0) * CFrame.new(-0.1 * p3 * var5, 0.08 * p3, -0.01 * p3))
	else
		self.model:SetPrimaryPartCFrame(p2 * CFrame.Angles(0.349065850399, 3.14159265359, 0) * CFrame.new(-0.1 * p3 * var5, -0.03 * p3, -0.4 * p3))
	end
	self.mesh.Scale = var1 * p3
end

function t.onButtonInputChanged(_, _, _) --[[ line: 112 ]] end

function t:onInputBegan(p4) --[[ line: 114 ]]
	self:onButtonInputChanged(p4, true)
end

function t.onInputChanged(_, _) --[[ line: 118 ]] end

function t:onInputEnded(p5) --[[ line: 120 ]]
	self:onButtonInputChanged(p5, false)
end

function t.onTouchpadModeChanged(_, _, _) --[[ line: 124 ]] end

return t