local create = require(script:FindFirstAncestor("VrCommon").Parent.AppCommonLib).Create
local granite = Enum.Material.Granite
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref), create (ref), granite (ref)
	local tbl = setmetatable({}, t)
	tbl.userCFrame = p0
	tbl.model = create("Model")({ Name = "RiftController", Archivable = false })
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
	local var2 = create("Part")({
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
		TextureId = "rbxassetid://9597123835",
		Scale = Vector3.new(0.03200000152, 0.03200000152, 0.03200000152),
		Parent = var2,
		MeshId = if p0 == Enum.UserCFrame.LeftHand then "rbxassetid://9597097835" else "rbxassetid://9597101144"
	})
	local _ = create("Weld")({
		Name = "Weld",
		Parent = var2,
		Part0 = tbl.origin,
		Part1 = var2
	})
	tbl.parts.body = var2
	tbl.model.PrimaryPart = tbl.origin
	
	return tbl
end

function t:setCFrame(p1)
	self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(0, -0.03, 0.06))
end

function t:setCFrameAndScale(p2, p3)
	self.model:SetPrimaryPartCFrame(p2 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(0, -0.03 * p3, 0.06 * p3))
	self.mesh.Scale = Vector3.new(0.03200000152, 0.03200000152, 0.03200000152) * p3
end

function t.onButtonInputChanged(_, _, _) end

function t:onInputBegan(p4)
	self:onButtonInputChanged(p4, true)
end

function t.onInputChanged(_, _) end

function t:onInputEnded(p5)
	self:onButtonInputChanged(p5, false)
end

function t.onTouchpadModeChanged(_, _, _) end

return t