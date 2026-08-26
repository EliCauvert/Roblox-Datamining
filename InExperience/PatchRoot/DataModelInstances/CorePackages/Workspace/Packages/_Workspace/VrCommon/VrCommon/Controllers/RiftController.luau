local create = require(script:FindFirstAncestor("VrCommon").Parent.AppCommonLib).Create
local granite = Enum.Material.Granite
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref), create (ref), granite (ref)
	local tbl = setmetatable({}, t)
	tbl.userCFrame = p1
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
	local var1 = create("Part")({
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
		Parent = var1,
		MeshId = if p1 == Enum.UserCFrame.LeftHand then "rbxassetid://9597097835" else "rbxassetid://9597101144"
	})
	local _ = create("Weld")({
		Name = "Weld",
		Parent = var1,
		Part0 = tbl.origin,
		Part1 = var1
	})
	tbl.parts.body = var1
	tbl.model.PrimaryPart = tbl.origin
	
	return tbl
end

function t:setCFrame(p1)
	self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(0, -0.03, 0.06))
end

function t:setCFrameAndScale(p1, p2)
	self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(0, -0.03 * p2, 0.06 * p2))
	self.mesh.Scale = Vector3.new(0.03200000152, 0.03200000152, 0.03200000152) * p2
end

function t.onButtonInputChanged(_, _, _) end

function t:onInputBegan(p1)
	self:onButtonInputChanged(p1, true)
end

function t.onInputChanged(_, _) end

function t:onInputEnded(p1)
	self:onButtonInputChanged(p1, false)
end

function t.onTouchpadModeChanged(_, _, _) end

return t