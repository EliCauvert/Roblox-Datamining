local CreateFunction = require(script:FindFirstAncestor("VrCommon").Parent.AppCommonLib).Create
local Granite = Enum.Material.Granite
local RiftController = {}
RiftController.__index = RiftController

function RiftController.new(UserCFrame) --[[ Line: 13 ]]
	-- upvalues: RiftController (copy), CreateFunction (copy), Granite (copy)
	local self = setmetatable({}, RiftController)
	self.userCFrame = UserCFrame
	self.model = CreateFunction("Model")({ Name = "RiftController", Archivable = false })
	self.origin = CreateFunction("Part")({
		Name = "Origin",
		Anchored = true,
		Transparency = 1,
		Size = vector.create(0.05000000074505806, 0.05000000074505806, 0.05000000074505806),
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		Parent = self.model
	})
	self.parts = {}
	local Parent = CreateFunction("Part")({
		Name = "body",
		Anchored = true,
		Size = vector.create(0.05000000074505806, 0.05000000074505806, 0.05000000074505806),
		Transparency = 0.25,
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		Parent = self.model,
		Material = Granite,
		CFrame = self.origin.CFrame
	})
	self.mesh = CreateFunction("SpecialMesh")({
		Name = "Mesh",
		TextureId = "rbxassetid://9597123835",
		Scale = vector.create(0.03200000151991844, 0.03200000151991844, 0.03200000151991844),
		Parent = Parent,
		MeshId = if UserCFrame == Enum.UserCFrame.LeftHand then "rbxassetid://9597097835" else "rbxassetid://9597101144"
	})
	local _ = CreateFunction("Weld")({
		Name = "Weld",
		Parent = Parent,
		Part0 = self.origin,
		Part1 = Parent
	})
	self.parts.body = Parent
	self.model.PrimaryPart = self.origin
	
	return self
end

function RiftController:setCFrame(p1) --[[ Line: 68 ]]
	self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(0, -0.03, 0.06))
end

function RiftController:setCFrameAndScale(p1, p2: number) --[[ Line: 72 ]]
	self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(0, -0.03 * p2, 0.06 * p2))
	self.mesh.Scale = vector.create(0.03200000151991844, 0.03200000151991844, 0.03200000151991844) * p2
end

function RiftController:onButtonInputChanged(_, _) --[[ Line: 79 ]] end

function RiftController:onInputBegan(p1) --[[ Line: 81 ]]
	self:onButtonInputChanged(p1, true)
end

function RiftController:onInputChanged(_) --[[ Line: 85 ]] end

function RiftController:onInputEnded(p1) --[[ Line: 87 ]]
	self:onButtonInputChanged(p1, false)
end

function RiftController:onTouchpadModeChanged(_, _) --[[ Line: 91 ]] end

return RiftController