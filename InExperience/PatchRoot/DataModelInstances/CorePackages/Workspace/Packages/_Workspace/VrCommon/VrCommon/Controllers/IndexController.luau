local OpenXrForWin32EngineFeature = game:GetEngineFeature("OpenXrForWin32")
local CreateFunction = require(script:FindFirstAncestor("VrCommon").Parent.AppCommonLib).Create
local Granite = Enum.Material.Granite
local Scale: vector = if OpenXrForWin32EngineFeature then vector.create(3.4000000953674316, 3.4000000953674316, 3.4000000953674316) else vector.create(3.5999999046325684, 3.5999999046325684, 3.5999999046325684)
local IndexController = {}
IndexController.__index = IndexController

function IndexController.new(UserCFrame) --[[ Line: 15 ]]
	-- upvalues: IndexController (copy), CreateFunction (copy), Granite (copy), Scale (copy)
	local self = setmetatable({}, IndexController)
	self.userCFrame = UserCFrame
	self.model = CreateFunction("Model")({ Name = "IndexController", Archivable = false })
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
		Parent = Parent,
		MeshId = if UserCFrame == Enum.UserCFrame.LeftHand then "rbxassetid://9605099531" else "rbxassetid://9605114549",
		TextureId = if UserCFrame == Enum.UserCFrame.LeftHand then "rbxassetid://9605099774" else "rbxassetid://9605114771",
		Scale = Scale
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

function IndexController:setCFrame(p1) --[[ Line: 70 ]]
	-- upvalues: OpenXrForWin32EngineFeature (copy)
	if OpenXrForWin32EngineFeature then
		if self.userCFrame == Enum.UserCFrame.RightHand then
			self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.6981317007977318, 3.141592653589793, 0) * CFrame.new(-0.1, 0.08, -0.01))
			
			return
		else
			self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.6981317007977318, 3.141592653589793, 0) * CFrame.new(0.1, 0.08, -0.01))
			
			return
		end
	elseif self.userCFrame == Enum.UserCFrame.RightHand then
		self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0) * CFrame.new(-0.1, -0.03, -0.4))
		
		return
	else
		self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0) * CFrame.new(0.1, -0.03, -0.4))
	end
end

function IndexController:setCFrameAndScale(p1, p2: number) --[[ Line: 94 ]]
	-- upvalues: OpenXrForWin32EngineFeature (copy), Scale (copy)
	local v1: number = if self.userCFrame == Enum.UserCFrame.RightHand then 1 else -1
	
	if OpenXrForWin32EngineFeature then
		self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.6981317007977318, 3.141592653589793, 0) * CFrame.new(-0.1 * p2 * v1, 0.08 * p2, -0.01 * p2))
	else
		self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0) * CFrame.new(-0.1 * p2 * v1, -0.03 * p2, -0.4 * p2))
	end
	self.mesh.Scale = Scale * p2
end

function IndexController:onButtonInputChanged(_, _) --[[ Line: 112 ]] end

function IndexController:onInputBegan(p1) --[[ Line: 114 ]]
	self:onButtonInputChanged(p1, true)
end

function IndexController:onInputChanged(_) --[[ Line: 118 ]] end

function IndexController:onInputEnded(p1) --[[ Line: 120 ]]
	self:onButtonInputChanged(p1, false)
end

function IndexController:onTouchpadModeChanged(_, _) --[[ Line: 124 ]] end

return IndexController