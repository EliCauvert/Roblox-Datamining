local VrCommon = script:FindFirstAncestor("VrCommon")
local CreateFunction = require(VrCommon.Parent.AppCommonLib).Create
local FIntVRTouchControllerTransparencyModule = require(VrCommon.Flags.FIntVRTouchControllerTransparency)
local config = {
	[Enum.UserCFrame.RightHand] = {
		Body = {
			meshId = "rbxassetid://12954883737",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.141592653589793, 0)
		},
		Grip = {
			meshId = "rbxassetid://12954884971",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.015, -0.078, 0.005) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(-0.01, 0.005, 0) * CFrame.Angles(0, 0, -0.12217304763960307)
		},
		Stick = {
			meshId = "rbxassetid://12954884012",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.056, 0.027, -0.074) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(0, -0.001, 0)
		},
		Trigger = {
			meshId = "rbxassetid://12954885295",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.014, -0.049, -0.131) * CFrame.Angles(0, 3.141592653589793, 0)
		},
		MenuButton = {
			meshId = "rbxassetid://12954884231",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.07, 0.017, -0.017) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(0, -0.001, 0)
		},
		ButtonA = {
			meshId = "rbxassetid://12954884749",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.011, 0.014, -0.026) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(0, -0.005, 0)
		},
		ButtonB = {
			meshId = "rbxassetid://12954884464",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(-0.013, 0.015, -0.07) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(0, -0.005, 0)
		}
	},
	[Enum.UserCFrame.LeftHand] = {
		Body = {
			meshId = "rbxassetid://12954878407",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.141592653589793, 0)
		},
		Grip = {
			meshId = "rbxassetid://12954878772",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.015, -0.078, 0.005) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(0.0125, 0.005, 0.001)
		},
		Stick = {
			meshId = "rbxassetid://12954879211",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.056, 0.027, -0.074) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(0, -0.001, 0)
		},
		Trigger = {
			meshId = "rbxassetid://12954878599",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.014, -0.049, -0.131) * CFrame.Angles(0, 3.141592653589793, 0)
		},
		MenuButton = {
			meshId = "rbxassetid://12954879390",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.07, 0.017, -0.017) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(0, -0.001, 0)
		},
		ButtonX = {
			meshId = "rbxassetid://12954879064",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.011, 0.013, -0.026) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(0, -0.005, 0)
		},
		ButtonY = {
			meshId = "rbxassetid://12954878913",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(0.013, 0.015, -0.07) * CFrame.Angles(0, 3.141592653589793, 0),
			moveOffset = CFrame.new(0, -0.005, 0)
		}
	}
}
local config1 = {
	[Enum.KeyCode.ButtonL1] = "Grip",
	[Enum.KeyCode.ButtonL2] = "Trigger",
	[Enum.KeyCode.ButtonL3] = "Stick",
	[Enum.KeyCode.ButtonR1] = "Grip",
	[Enum.KeyCode.ButtonR2] = "Trigger",
	[Enum.KeyCode.ButtonR3] = "Stick",
	[Enum.KeyCode.Thumbstick1] = "Stick",
	[Enum.KeyCode.Thumbstick2] = "Stick",
	[Enum.KeyCode.ButtonSelect] = "MenuButton",
	[Enum.KeyCode.ButtonStart] = "MenuButton",
	[Enum.KeyCode.ButtonA] = "ButtonA",
	[Enum.KeyCode.ButtonB] = "ButtonB",
	[Enum.KeyCode.ButtonX] = "ButtonX",
	[Enum.KeyCode.ButtonY] = "ButtonY"
}
local Granite = Enum.Material.Granite
local TouchController = {}
TouchController.__index = TouchController

function TouchController.new(UserCFrame)
	-- upvalues: TouchController (copy), CreateFunction (copy), config (copy), Granite (copy), FIntVRTouchControllerTransparencyModule (copy)
	local self = setmetatable({}, TouchController)
	self.userCFrame = UserCFrame
	self.model = CreateFunction("Model")({ Name = "TouchController", Archivable = false })
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
	
	for Name, value in pairs(config[UserCFrame]) do
		local ScaledScale: vector = vector.create(0.03200000151991844, 0.03200000151991844, 0.03200000151991844)
		
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
			CFrame = self.origin.CFrame * value.offset,
			Transparency = FIntVRTouchControllerTransparencyModule / 100
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
	self.model.PrimaryPart = self.origin
	
	return self
end

function TouchController:setCFrame(p1)
	if self.userCFrame == Enum.UserCFrame.RightHand then
		self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(-0.03, 0.08, -0.06))
		
		return
	else
		self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(0.03, 0.08, -0.06))
	end
end

function TouchController:setCFrameAndScale(p1, Scale: number)
	-- upvalues: config (copy)
	self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(-0.03 * Scale * (if self.userCFrame == Enum.UserCFrame.RightHand then 1 else -1), 0.08 * Scale, -0.06 * Scale))
	
	if self.scale ~= Scale then
		self.scale = Scale
		
		for i, value in pairs(config[self.userCFrame]) do
			local Part = self.parts[i]
			
			if Part then
				local ScaledScale: vector = vector.create(0.03200000151991844, 0.03200000151991844, 0.03200000151991844)
				
				if value.scale then
					ScaledScale *= value.scale
				end
				local Mesh = Part:FindFirstChild("Mesh")
				local Weld = Part:FindFirstChild("Weld")
				local Offset = value.offset
				local ScaledOffset = CFrame.new(Offset.p * self.scale) * (Offset - Offset.p)
				Part.CFrame = self.origin.CFrame * ScaledOffset
				
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

function TouchController:setButtonState(p2, p3)
	-- upvalues: config (copy)
	local Entry = config[self.userCFrame][p2]
	
	if not Entry then return end
	local Offset = Entry.offset
	local MoveOffset = Entry.moveOffset
	
	if Offset and MoveOffset then
		local ScaledOffset = CFrame.new(Offset.p * self.scale) * (Offset - Offset.p)
		local ScaledMoveOffset = CFrame.new(MoveOffset.p * self.scale) * (MoveOffset - MoveOffset.p)
		local Part = self.parts[p2]
		
		if Part then
			local Mesh = Part:FindFirstChild("Mesh")
			local Weld = Part:FindFirstChild("Weld")
			
			if Weld then
				if p3 then
					Part.CFrame = self.origin.CFrame * ScaledOffset * ScaledMoveOffset
					Weld.C0 = ScaledOffset * ScaledMoveOffset
				else
					Part.CFrame = self.origin.CFrame * ScaledOffset
					Weld.C0 = ScaledOffset
				end
			end
			if Mesh then
				if p3 then
					Mesh.VertexColor = vector.create(0.5, 0.5, 0.5)
					
					return
				end
				Mesh.VertexColor = vector.create(1, 1, 1)
			end
		end
	end
end

function TouchController:setTriggerState(Z: number)
	-- upvalues: config (copy)
	local Offset = config[self.userCFrame].Trigger.offset
	local ScaledOffset = CFrame.new(Offset.p * self.scale) * (Offset - Offset.p)
	local Trigger = self.parts.Trigger
	local Weld = Trigger:FindFirstChild("Weld")
	
	if Weld then
		local ScaledScale = vector.create(0, 0.05000000074505806, 0.02500000037252903) * self.scale
		local ScaledScaledOffset = ScaledOffset * CFrame.new(ScaledScale) * CFrame.Angles(Z * 0.3490658503988659 + 0, 0, 0) * CFrame.new(-ScaledScale)
		Trigger.CFrame = self.origin.CFrame * ScaledScaledOffset
		Weld.C0 = ScaledScaledOffset
	end
end

function TouchController:setStickState(Position)
	-- upvalues: config (copy)
	local Offset = config[self.userCFrame].Stick.offset
	local ScaledOffset = CFrame.new(Offset.p * self.scale) * (Offset - Offset.p)
	local Stick = self.parts.Stick
	local Weld = Stick:FindFirstChild("Weld")
	
	if Weld then
		local ScaledScale = vector.create(-0.0007999999797903001, -0.026900000870227814, 0.0013000000035390258) * self.scale
		local ScaledScaledOffset = ScaledOffset * CFrame.new(ScaledScale) * CFrame.Angles(Position.Y * 0.3490658503988659 + 0, 0, Position.X * 0.3490658503988659 + 0) * CFrame.new(-ScaledScale)
		Stick.CFrame = self.origin.CFrame * ScaledScaledOffset
		Weld.C0 = ScaledScaledOffset
	end
end

function TouchController:onInputPositionChanged(Input)
	if self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.ButtonR2 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.ButtonL2 then
		self:setTriggerState(Input.Position.Z)
		
		return
	end
	if self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.Thumbstick2 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.Thumbstick1 then
		self:setStickState(Input.Position)
		
		return
	end
end

function TouchController:onButtonInputChanged(Input, p2)
	-- upvalues: config1 (copy)
	if self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.ButtonL1 or self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.ButtonR1 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.ButtonL3 or self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.ButtonR3 or self.userCFrame == Enum.UserCFrame.LeftHand and Input.KeyCode == Enum.KeyCode.ButtonSelect or self.userCFrame == Enum.UserCFrame.RightHand and Input.KeyCode == Enum.KeyCode.ButtonStart or Input.KeyCode == Enum.KeyCode.ButtonA or Input.KeyCode == Enum.KeyCode.ButtonB or Input.KeyCode == Enum.KeyCode.ButtonX or Input.KeyCode == Enum.KeyCode.ButtonY then
		self:setButtonState(config1[Input.KeyCode], p2)
	end
end

function TouchController:onInputBegan(Input)
	self:onButtonInputChanged(Input, true)
end

function TouchController:onInputChanged(Input)
	self:onInputPositionChanged(Input)
end

function TouchController:onInputEnded(Input)
	self:onInputPositionChanged(Input)
	self:onButtonInputChanged(Input, false)
end

function TouchController:onTouchpadModeChanged(_, _) end

function TouchController:destroy()
	self.model:Destroy()
end

function TouchController.getButtonPart(p2, p3)
	-- upvalues: config1 (copy)
	local Entry = config1[p3]
	
	return if Entry then p2.parts[Entry] else nil
end

return TouchController