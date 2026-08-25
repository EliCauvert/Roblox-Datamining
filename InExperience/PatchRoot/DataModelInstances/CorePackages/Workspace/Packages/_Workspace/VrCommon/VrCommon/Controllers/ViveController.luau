local VRService = game:GetService("VRService")
local create = require(script:FindFirstAncestor("VrCommon").Parent.AppCommonLib).Create
local t = {
	Body = {
		size = Vector3.new(0.391000002623, 0.277000010014, 0.731000006199),
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
		moveOffset = CFrame.new(Vector3.new(0, -0.000997420982, -0.000071774441))
	},
	MenuButton = {
		meshId = "rbxassetid://433288124",
		textureId = "rbxassetid://433288134",
		offset = CFrame.new(0, 0.016, 0.068),
		moveOffset = CFrame.new(Vector3.new(0, -0.000999877811, 0.00001563049))
	},
	Trackpad = {
		meshId = "rbxassetid://433288821",
		textureId = "rbxassetid://433288836",
		offset = CFrame.new(0, 0, 0.163),
		moveOffset = CFrame.new(Vector3.new(0, -0.000993506867, -0.000113772287))
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
		offset = CFrame.new(0, 0.0115499999, 0.197307006) * CFrame.Angles(0, 3.14159265359, 0),
		moveOffset = CFrame.new(0, -0.005, 0)
	},
	ButtonB = {
		meshId = "rbxassetid://922454202",
		textureId = "rbxasset://textures/ui/VR/ButtonB.png",
		offset = CFrame.new(0.0391042456, 0.0154935224, 0.161779419) * CFrame.Angles(0, 3.14159265359, 0),
		moveOffset = CFrame.new(0, -0.005, 0)
	},
	ButtonX = {
		meshId = "rbxassetid://922453111",
		textureId = "rbxasset://textures/ui/VR/ButtonX.png",
		offset = CFrame.new(-0.0390719995, 0.0154770007, 0.161733001) * CFrame.Angles(0, 3.14159265359, 0),
		moveOffset = CFrame.new(0, -0.005, 0)
	},
	ButtonY = {
		meshId = "rbxassetid://922455502",
		textureId = "rbxasset://textures/ui/VR/ButtonY.png",
		offset = CFrame.new(0, 0.0197229274, 0.126810834) * CFrame.Angles(0, 3.14159265359, 0),
		moveOffset = CFrame.new(0, -0.005, 0)
	}
}
local t_1 = {
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
local granite = Enum.Material.Granite
local t_2 = {}
t_2.__index = t_2
local t_3 = {
	[Enum.UserCFrame.LeftHand] = Enum.VRTouchpad.Left,
	[Enum.UserCFrame.RightHand] = Enum.VRTouchpad.Right
}

function t_2.new(p0)
	-- upvalues: t_2 (ref), t_3 (ref), VRService (ref), create (ref), t (ref), granite (ref)
	local tbl = setmetatable({}, t_2)
	tbl.userCFrame = p0
	tbl.touchpad = t_3[tbl.userCFrame]
	tbl.touchpadMode = VRService:GetTouchpadMode(tbl.touchpad)
	tbl.onTouchpadModeChangedConn = VRService.TouchpadModeChanged:connect(function(...)
		-- upvalues: tbl (ref)
		tbl:onTouchpadModeChanged(...)
	end)
	tbl.model = create("Model")({ Name = "ViveController", Archivable = false })
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
	tbl.scale = 1
	tbl.parts = {}
	
	for i, v in pairs(t) do
		local var7 = Vector3.new(0.032999999821, 0.032999999821, 0.032999999821)
		
		if v.scale then
			var7 *= v.scale
		end
		local var8 = create("Part")({
			Anchored = true,
			CanCollide = false,
			CanQuery = false,
			CanTouch = false,
			Parent = tbl.model,
			Name = i,
			Material = granite,
			Size = v.size or Vector3.new(0.050000000745, 0.050000000745, 0.050000000745),
			CFrame = tbl.origin.CFrame * v.offset
		})
		local _ = create("SpecialMesh")({
			Name = "Mesh",
			Parent = var8,
			MeshId = v.meshId,
			TextureId = v.textureId,
			Scale = var7
		})
		local _ = create("Weld")({
			Name = "Weld",
			Parent = var8,
			Part0 = tbl.origin,
			Part1 = var8,
			C0 = v.offset
		})
		tbl.parts[i] = var8
	end
	local var6 = create("Part")({
		Name = "TrackpadIndicator",
		Anchored = true,
		Transparency = 1,
		Size = Vector3.new(0.050000000745, 0.050000000745, 0.050000000745),
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		Parent = tbl.model,
		Material = Enum.Material.Neon,
		BrickColor = BrickColor.new("Institutional white"),
		Shape = Enum.PartType.Ball
	})
	create("Weld")({
		Name = "Weld",
		Parent = var6,
		Part0 = tbl.origin,
		Part1 = var6,
		C0 = t.Trackpad.offset
	})
	tbl.parts.TrackpadIndicator = var6
	tbl.model.PrimaryPart = tbl.origin
	tbl:onTouchpadModeChanged(tbl.touchpad, VRService:GetTouchpadMode(tbl.touchpad))
	
	return tbl
end

function t_2:setPartVisible(p1, p2)
	local var9 = self.parts[p1]
	
	if var9 then
		var9.Transparency = if p2 then 0 else 1
	end
end

function t_2:setABXYEnabled(p3)
	self:setPartVisible("ButtonA", p3)
	self:setPartVisible("ButtonB", p3)
	self:setPartVisible("ButtonX", p3)
	self:setPartVisible("ButtonY", p3)
end

function t_2:setCFrame(p4)
	self.model:SetPrimaryPartCFrame(p4)
end

function t_2:setCFrameAndScale(p5, p6)
	-- upvalues: t (ref)
	self.model:SetPrimaryPartCFrame(p5)
	
	if self.scale ~= p6 then
		self.scale = p6
		
		for i, v in pairs(t) do
			local var10 = self.parts[i]
			
			if var10 then
				local var11 = Vector3.new(0.032999999821, 0.032999999821, 0.032999999821)
				
				if v.scale then
					var11 *= v.scale
				end
				local mesh = var10:FindFirstChild("Mesh")
				local weld = var10:FindFirstChild("Weld")
				local var14 = CFrame.new(v.offset.p * self.scale) * (v.offset - v.offset.p)
				var10.CFrame = p5 * var14
				
				if mesh then
					mesh.Scale = var11 * self.scale
				end
				if weld then
					weld.C0 = var14
				end
			end
		end
	end
end

function t_2:setButtonState(p7, p8)
	-- upvalues: t (ref)
	local var15 = t[p7]
	
	if not var15 then return end
	local offset = var15.offset
	local moveOffset = var15.moveOffset
	
	if offset and moveOffset then
		offset = CFrame.new(offset.p * self.scale) * (offset - offset.p)
		moveOffset = CFrame.new(moveOffset.p * self.scale) * (moveOffset - moveOffset.p)
		local var16 = self.parts[p7]
		
		if var16 then
			local mesh = var16:FindFirstChild("Mesh")
			local weld = var16:FindFirstChild("Weld")
			
			if weld then
				if p8 then
					var16.CFrame = self.origin.CFrame * offset * moveOffset
					weld.C0 = offset * moveOffset
				else
					var16.CFrame = self.origin.CFrame * offset
					weld.C0 = offset
				end
			end
			if mesh then
				if p8 then
					mesh.VertexColor = Vector3.new(0.5, 0.5, 0.5)
					
					return
				end
				mesh.VertexColor = Vector3.new(1, 1, 1)
			end
		end
	end
end

function t_2:setTriggerState(p9)
	-- upvalues: t (ref)
	local offset = t.Trigger.offset
	offset = CFrame.new(offset.p * self.scale) * (offset - offset.p)
	local trigger = self.parts.Trigger
	local weld = trigger:FindFirstChild("Weld")
	
	if weld then
		local vector3 = Vector3.new(0, 0.05 * self.scale, -0.025 * self.scale)
		local var21 = offset * CFrame.new(vector3) * CFrame.Angles(p9 * -0.349065850399 + 0, 0, 0) * CFrame.new(-vector3)
		trigger.CFrame = self.origin.CFrame * var21
		weld.C0 = var21
	end
end

function t_2:setTrackpadState(p10)
	-- upvalues: t (ref)
	local trackpadIndicator = self.parts.TrackpadIndicator
	local weld = trackpadIndicator:FindFirstChild("Weld")
	local offset = t.Trackpad.offset
	offset = CFrame.new(offset.p * self.scale) * (offset - offset.p)
	
	if weld then
		local var23 = offset * CFrame.new(0, 0.01 * self.scale, 0) * (CFrame.Angles(0.11344640138, 0, 0) * CFrame.new(0, 0.002 * self.scale * p10.magnitude ^ 3, 0)):toWorldSpace(CFrame.new(Vector3.new(p10.X, 0, -p10.Y) * 0.055))
		trackpadIndicator.CFrame = self.origin.CFrame * var23
		weld.C0 = var23
	end
end

function t_2:onButtonInputChanged(p11, p12)
	if self.userCFrame == Enum.UserCFrame.RightHand and p11.KeyCode == Enum.KeyCode.ButtonR3 or self.userCFrame == Enum.UserCFrame.LeftHand and p11.KeyCode == Enum.KeyCode.ButtonL3 then
		self:setButtonState("Trackpad", p12)
		
		return
	elseif self.userCFrame == Enum.UserCFrame.RightHand and p11.KeyCode == Enum.KeyCode.ButtonR1 or self.userCFrame == Enum.UserCFrame.LeftHand and p11.KeyCode == Enum.KeyCode.ButtonL1 then
		self:setButtonState("LeftGrip", p12)
		self:setButtonState("RightGrip", p12)
		
		return
	elseif self.userCFrame == Enum.UserCFrame.RightHand and p11.KeyCode == Enum.KeyCode.ButtonStart or self.userCFrame == Enum.UserCFrame.LeftHand and p11.KeyCode == Enum.KeyCode.ButtonSelect then
		self:setButtonState("MenuButton", p12)
		
		return
	elseif self.touchpadMode == Enum.VRTouchpadMode.ABXY then
		if p11.KeyCode == Enum.KeyCode.ButtonA then
			self:setButtonState("ButtonA", p12)
			
			return
		elseif p11.KeyCode == Enum.KeyCode.ButtonB then
			self:setButtonState("ButtonB", p12)
			
			return
		elseif p11.KeyCode == Enum.KeyCode.ButtonX then
			self:setButtonState("ButtonX", p12)
			
			return
		elseif p11.KeyCode == Enum.KeyCode.ButtonY then
			self:setButtonState("ButtonY", p12)
			
			return
		end
	end
end

function t_2:onInputBegan(p13)
	self:onButtonInputChanged(p13, true)
	
	if self.userCFrame == Enum.UserCFrame.RightHand and p13.KeyCode == Enum.KeyCode.Thumbstick2 or self.userCFrame == Enum.UserCFrame.LeftHand and p13.KeyCode == Enum.KeyCode.Thumbstick1 then
		self:setPartVisible("TrackpadIndicator", true)
	end
end

function t_2:onInputChanged(p14)
	if self.userCFrame == Enum.UserCFrame.RightHand and p14.KeyCode == Enum.KeyCode.ButtonR2 or self.userCFrame == Enum.UserCFrame.LeftHand and p14.KeyCode == Enum.KeyCode.ButtonL2 then
		self:setTriggerState(p14.Position.Z)
	end
	if self.userCFrame == Enum.UserCFrame.RightHand and p14.KeyCode == Enum.KeyCode.Thumbstick2 or self.userCFrame == Enum.UserCFrame.LeftHand and p14.KeyCode == Enum.KeyCode.Thumbstick1 then
		self:setTrackpadState(p14.Position)
	end
end

function t_2:onInputEnded(p15)
	self:onButtonInputChanged(p15, false)
	
	if self.userCFrame == Enum.UserCFrame.RightHand and p15.KeyCode == Enum.KeyCode.Thumbstick2 or self.userCFrame == Enum.UserCFrame.LeftHand and p15.KeyCode == Enum.KeyCode.Thumbstick1 then
		self:setPartVisible("TrackpadIndicator", false)
	end
end

function t_2:onTouchpadModeChanged(p16, p17)
	if p16 ~= self.touchpad then return end
	self.touchpadMode = p17
	
	if p17 == Enum.VRTouchpadMode.ABXY then
		self:setABXYEnabled(true)
		
		return
	end
	self:setABXYEnabled(false)
end

function t_2:destroy()
	if self.onTouchpadModeChangedConn then
		self.onTouchpadModeChangedConn:disconnect()
		self.onTouchpadModeChangedConn = nil
	end
	self.model:Destroy()
end

function t_2:getButtonPart(p18)
	-- upvalues: t_1 (ref)
	local var24 = t_1[p18]
	
	return if var24 then self.parts[var24] else nil
end

return t_2