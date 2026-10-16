local VRService = game:GetService("VRService")
local CreateFunction = require(script:FindFirstAncestor("VrCommon").Parent.AppCommonLib).Create
local config = {
	Body = {
		size = vector.create(0.39100000262260437, 0.2770000100135803, 0.7310000061988831),
		meshId = "rbxassetid://433286977",
		textureId = "rbxassetid://433287000",
		offset = CFrame.new(0, -0.115, 0.213)
	},
	RightGrip = {
		meshId = "rbxassetid://433290663",
		textureId = "rbxassetid://433290688",
		offset = CFrame.new(0.057, -0.047, 0.29),
		moveOffset = CFrame.new(-0.005, 0, 0)
	},
	LeftGrip = {
		meshId = "rbxassetid://433289821",
		textureId = "rbxassetid://433289832",
		offset = CFrame.new(-0.057, -0.047, 0.29),
		moveOffset = CFrame.new(0.005, 0, 0)
	},
	SystemButton = {
		meshId = "rbxassetid://433291265",
		textureId = "rbxassetid://433291278",
		offset = CFrame.new(0, 0.005, 0.294),
		moveOffset = CFrame.new(vector.create(-0, -0.0009974209824576974, -7.177444058470428e-05))
	},
	MenuButton = {
		meshId = "rbxassetid://433288124",
		textureId = "rbxassetid://433288134",
		offset = CFrame.new(0, 0.016, 0.068),
		moveOffset = CFrame.new(vector.create(-0, -0.000999877811409533, 1.5630490452167578e-05))
	},
	Trackpad = {
		meshId = "rbxassetid://433288821",
		textureId = "rbxassetid://433288836",
		offset = CFrame.new(0, 0, 0.163),
		moveOffset = CFrame.new(vector.create(-0, -0.0009935068665072322, -0.000113772286567837))
	},
	Trigger = {
		meshId = "rbxassetid://433288767",
		textureId = "rbxassetid://433288775",
		offset = CFrame.new(0, -0.093, 0.163)
	},
	LED = {
		meshId = "rbxassetid://433293218",
		textureId = "rbxassetid://433293231",
		offset = CFrame.new(0, 0.007, 0.32)
	},
	ButtonA = {
		meshId = "rbxassetid://922444331",
		textureId = "rbxasset://textures/ui/VR/ButtonA.png",
		offset = CFrame.new(-0, 0.0115499999, 0.197307006) * CFrame.Angles(0, 3.141592653589793, 0),
		moveOffset = CFrame.new(0, -0.005, 0)
	},
	ButtonB = {
		meshId = "rbxassetid://922454202",
		textureId = "rbxasset://textures/ui/VR/ButtonB.png",
		offset = CFrame.new(0.0391042456, 0.0154935224, 0.161779419) * CFrame.Angles(0, 3.141592653589793, 0),
		moveOffset = CFrame.new(0, -0.005, 0)
	},
	ButtonX = {
		meshId = "rbxassetid://922453111",
		textureId = "rbxasset://textures/ui/VR/ButtonX.png",
		offset = CFrame.new(-0.0390719995, 0.0154770007, 0.161733001) * CFrame.Angles(0, 3.141592653589793, 0),
		moveOffset = CFrame.new(0, -0.005, 0)
	},
	ButtonY = {
		meshId = "rbxassetid://922455502",
		textureId = "rbxasset://textures/ui/VR/ButtonY.png",
		offset = CFrame.new(0, 0.0197229274, 0.126810834) * CFrame.Angles(0, 3.141592653589793, 0),
		moveOffset = CFrame.new(0, -0.005, 0)
	}
}
local config1 = {
	[Enum.KeyCode.ButtonL1] = "LeftGrip",
	[Enum.KeyCode.ButtonL2] = "Trigger",
	[Enum.KeyCode.ButtonL3] = "Trackpad",
	[Enum.KeyCode.ButtonR1] = "RightGrip",
	[Enum.KeyCode.ButtonR2] = "Trigger",
	[Enum.KeyCode.ButtonR3] = "Trackpad",
	[Enum.KeyCode.Thumbstick1] = "Trackpad",
	[Enum.KeyCode.Thumbstick2] = "Trackpad",
	[Enum.KeyCode.ButtonSelect] = "MenuButton",
	[Enum.KeyCode.ButtonStart] = "MenuButton",
	[Enum.KeyCode.ButtonA] = "ButtonA",
	[Enum.KeyCode.ButtonB] = "ButtonB",
	[Enum.KeyCode.ButtonX] = "ButtonX",
	[Enum.KeyCode.ButtonY] = "ButtonY"
}
local Granite = Enum.Material.Granite
local ViveController = {}
ViveController.__index = ViveController
local config2 = {
	[Enum.UserCFrame.LeftHand] = Enum.VRTouchpad.Left,
	[Enum.UserCFrame.RightHand] = Enum.VRTouchpad.Right
}

function ViveController.new(UserCFrame) --[[ Line: 109 ]]
	-- upvalues: ViveController (copy), config2 (copy), VRService (copy), CreateFunction (copy), config (copy), Granite (copy)
	local self = setmetatable({}, ViveController)
	self.userCFrame = UserCFrame
	self.touchpad = config2[self.userCFrame]
	self.touchpadMode = VRService:GetTouchpadMode(self.touchpad)
	self.onTouchpadModeChangedConn = VRService.TouchpadModeChanged:connect(function(...) --[[ Line: 114 ]]
		-- upvalues: self (copy)
		self:onTouchpadModeChanged(...)
	end)
	self.model = CreateFunction("Model")({ Name = "ViveController", Archivable = false })
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
	self.scale = 1
	self.parts = {}
	
	for Name, value in pairs(config) do
		local ScaledScale: vector = vector.create(0.032999999821186066, 0.032999999821186066, 0.032999999821186066)
		
		if value.scale then
			ScaledScale *= value.scale
		end
		local Parent = CreateFunction("Part")({
			Anchored = true,
			CanCollide = false,
			CanQuery = false,
			CanTouch = false,
			Parent = self.model,
			Name = Name,
			Material = Granite,
			Size = value.size or vector.create(0.05000000074505806, 0.05000000074505806, 0.05000000074505806),
			CFrame = self.origin.CFrame * value.offset
		})
		local _ = CreateFunction("SpecialMesh")({
			Name = "Mesh",
			Parent = Parent,
			MeshId = value.meshId,
			TextureId = value.textureId,
			Scale = ScaledScale
		})
		local _ = CreateFunction("Weld")({
			Name = "Weld",
			Parent = Parent,
			Part0 = self.origin,
			Part1 = Parent,
			C0 = value.offset
		})
		self.parts[Name] = Parent
	end
	local Parent = CreateFunction("Part")({
		Name = "TrackpadIndicator",
		Anchored = true,
		Transparency = 1,
		Size = vector.create(0.05000000074505806, 0.05000000074505806, 0.05000000074505806),
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		Parent = self.model,
		Material = Enum.Material.Neon,
		BrickColor = BrickColor.new("Institutional white"),
		Shape = Enum.PartType.Ball
	})
	CreateFunction("Weld")({
		Name = "Weld",
		Parent = Parent,
		Part0 = self.origin,
		Part1 = Parent,
		C0 = config.Trackpad.offset
	})
	self.parts.TrackpadIndicator = Parent
	self.model.PrimaryPart = self.origin
	self:onTouchpadModeChanged(self.touchpad, VRService:GetTouchpadMode(self.touchpad))
	
	return self
end

function ViveController:setPartVisible(p1, p2) --[[ Line: 200 ]]
	local Part = self.parts[p1]
	
	if Part then
		Part.Transparency = if p2 then 0 else 1
	end
end

function ViveController:setABXYEnabled(p1) --[[ Line: 207 ]]
	self:setPartVisible("ButtonA", p1)
	self:setPartVisible("ButtonB", p1)
	self:setPartVisible("ButtonX", p1)
	self:setPartVisible("ButtonY", p1)
end

function ViveController:setCFrame(CF) --[[ Line: 214 ]]
	self.model:SetPrimaryPartCFrame(CF)
end

function ViveController:setCFrameAndScale(CF, Scale) --[[ Line: 218 ]]
	-- upvalues: config (copy)
	self.model:SetPrimaryPartCFrame(CF)
	
	if self.scale ~= Scale then
		self.scale = Scale
		
		for i, value in pairs(config) do
			local Part = self.parts[i]
			
			if Part then
				local ScaledScale: vector = vector.create(0.032999999821186066, 0.032999999821186066, 0.032999999821186066)
				
				if value.scale then
					ScaledScale *= value.scale
				end
				local Mesh = Part:FindFirstChild("Mesh")
				local Weld = Part:FindFirstChild("Weld")
				local ScaledOffset = CFrame.new(value.offset.p * self.scale) * (value.offset - value.offset.p)
				Part.CFrame = CF * ScaledOffset
				
				if Mesh then
					Mesh.Scale = ScaledScale * self.scale
				end
				if Weld then
					Weld.C0 = ScaledOffset
				end
			end
		end
	end
end

function ViveController:setButtonState(p1, p2) --[[ Line: 247 ]]
	-- upvalues: config (copy)
	local Entry = config[p1]
	
	if not Entry then return end
	local Offset = Entry.offset
	local MoveOffset = Entry.moveOffset
	
	if Offset and MoveOffset then
		local ScaledOffset = CFrame.new(Offset.p * self.scale) * (Offset - Offset.p)
		local ScaledMoveOffset = CFrame.new(MoveOffset.p * self.scale) * (MoveOffset - MoveOffset.p)
		local Part = self.parts[p1]
		
		if Part then
			local Mesh = Part:FindFirstChild("Mesh")
			local Weld = Part:FindFirstChild("Weld")
			
			if Weld then
				if p2 then
					Part.CFrame = self.origin.CFrame * ScaledOffset * ScaledMoveOffset
					Weld.C0 = ScaledOffset * ScaledMoveOffset
				else
					Part.CFrame = self.origin.CFrame * ScaledOffset
					Weld.C0 = ScaledOffset
				end
			end
			if Mesh then
				if p2 then
					Mesh.VertexColor = vector.create(0.5, 0.5, 0.5)
					
					return
				end
				Mesh.VertexColor = vector.create(1, 1, 1)
			end
		end
	end
end

function ViveController:setTriggerState(Z: number) --[[ Line: 284 ]]
	-- upvalues: config (copy)
	local Offset = config.Trigger.offset
	local ScaledOffset = CFrame.new(Offset.p * self.scale) * (Offset - Offset.p)
	local Trigger = self.parts.Trigger
	local Weld = Trigger:FindFirstChild("Weld")
	
	if Weld then
		local _Vector3 = Vector3.new(0, 0.05 * self.scale, -0.025 * self.scale)
		local ScaledScaledOffset = ScaledOffset * CFrame.new(_Vector3) * CFrame.Angles(Z * -0.3490658503988659 + 0, 0, 0) * CFrame.new(-_Vector3)
		Trigger.CFrame = self.origin.CFrame * ScaledScaledOffset
		Weld.C0 = ScaledScaledOffset
	end
end

function ViveController:setTrackpadState(Position) --[[ Line: 302 ]]
	-- upvalues: config (copy)
	local TrackpadIndicator = self.parts.TrackpadIndicator
	local Weld = TrackpadIndicator:FindFirstChild("Weld")
	local Offset = config.Trackpad.offset
	local ScaledOffset = CFrame.new(Offset.p * self.scale) * (Offset - Offset.p)
	
	if Weld then
		local ScaledScaledOffset = ScaledOffset * CFrame.new(0, 0.01 * self.scale, 0) * (CFrame.Angles(0.11344640137963143, 0, 0) * CFrame.new(0, 0.002 * self.scale * Position.magnitude ^ 3, 0)):toWorldSpace(CFrame.new(Vector3.new(Position.X, 0, -Position.Y) * 0.055))
		TrackpadIndicator.CFrame = self.origin.CFrame * ScaledScaledOffset
		Weld.C0 = ScaledScaledOffset
	end
end

function ViveController:onButtonInputChanged(Input, p1) --[[ Line: 318 ]]
	if self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.ButtonR3 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.ButtonL3 then
		self:setButtonState("Trackpad", p1)
		
		return
	end
	if self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.ButtonR1 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.ButtonL1 then
		self:setButtonState("LeftGrip", p1)
		self:setButtonState("RightGrip", p1)
		
		return
	end
	if self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.ButtonStart or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.ButtonSelect then
		self:setButtonState("MenuButton", p1)
		
		return
	end
	if self.touchpadMode == Enum.VRTouchpadMode.ABXY then
		if Input.KeyCode == Enum.KeyCode.ButtonA then
			self:setButtonState("ButtonA", p1)
			
			return
		end
		if Input.KeyCode == Enum.KeyCode.ButtonB then
			self:setButtonState("ButtonB", p1)
			
			return
		end
		if Input.KeyCode == Enum.KeyCode.ButtonX then
			self:setButtonState("ButtonX", p1)
			
			return
		end
		if Input.KeyCode == Enum.KeyCode.ButtonY then
			self:setButtonState("ButtonY", p1)
			
			return
		end
	end
end

function ViveController:onInputBegan(Input) --[[ Line: 368 ]]
	self:onButtonInputChanged(Input, true)
	
	if self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.Thumbstick2 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.Thumbstick1 then
		self:setPartVisible("TrackpadIndicator", true)
	end
end

function ViveController:onInputChanged(Input) --[[ Line: 378 ]]
	if self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.ButtonR2 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.ButtonL2 then
		self:setTriggerState(Input.Position.Z)
	end
	if self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.Thumbstick2 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.Thumbstick1 then
		self:setTrackpadState(Input.Position)
	end
end

function ViveController:onInputEnded(Input) --[[ Line: 393 ]]
	self:onButtonInputChanged(Input, false)
	
	if self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.Thumbstick2 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.Thumbstick1 then
		self:setPartVisible("TrackpadIndicator", false)
	end
end

function ViveController:onTouchpadModeChanged(Touchpad, TouchpadMode) --[[ Line: 403 ]]
	if Touchpad ~= self.touchpad then return end
	self.touchpadMode = TouchpadMode
	
	if TouchpadMode == Enum.VRTouchpadMode.ABXY then
		self:setABXYEnabled(true)
		
		return
	else
		self:setABXYEnabled(false)
	end
end

function ViveController:destroy() --[[ Line: 417 ]]
	if self.onTouchpadModeChangedConn then
		self.onTouchpadModeChangedConn:disconnect()
		self.onTouchpadModeChangedConn = nil
	end
	self.model:Destroy()
end

function ViveController.getButtonPart(p1, p2) --[[ Line: 425 ]]
	-- upvalues: config1 (copy)
	local Entry = config1[p2]
	
	return if Entry then p1.parts[Entry] else nil
end

return ViveController