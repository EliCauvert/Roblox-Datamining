local vrCommon = script:FindFirstAncestor("VrCommon")
local create = require(vrCommon.Parent.AppCommonLib).Create
local fIntVRTouchControllerTransparencyModule = require(vrCommon.Flags.FIntVRTouchControllerTransparency)
local t = {
	[Enum.UserCFrame.RightHand] = {
		Body = {
			meshId = "rbxassetid://12954883737",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.14159265359, 0)
		},
		Grip = {
			meshId = "rbxassetid://12954884971",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.015, -0.078, 0.005) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(-0.01, 0.005, 0) * CFrame.Angles(0, 0, -0.12217304764)
		},
		Stick = {
			meshId = "rbxassetid://12954884012",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.056, 0.027, -0.074) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(0, -0.001, 0)
		},
		Trigger = {
			meshId = "rbxassetid://12954885295",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.014, -0.049, -0.131) * CFrame.Angles(0, 3.14159265359, 0)
		},
		MenuButton = {
			meshId = "rbxassetid://12954884231",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.07, 0.017, -0.017) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(0, -0.001, 0)
		},
		ButtonA = {
			meshId = "rbxassetid://12954884749",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(0.011, 0.014, -0.026) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(0, -0.005, 0)
		},
		ButtonB = {
			meshId = "rbxassetid://12954884464",
			textureId = "rbxassetid://12954905146",
			offset = CFrame.new(-0.013, 0.015, -0.07) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(0, -0.005, 0)
		}
	},
	[Enum.UserCFrame.LeftHand] = {
		Body = {
			meshId = "rbxassetid://12954878407",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.14159265359, 0)
		},
		Grip = {
			meshId = "rbxassetid://12954878772",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.015, -0.078, 0.005) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(0.0125, 0.005, 0.001)
		},
		Stick = {
			meshId = "rbxassetid://12954879211",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.056, 0.027, -0.074) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(0, -0.001, 0)
		},
		Trigger = {
			meshId = "rbxassetid://12954878599",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.014, -0.049, -0.131) * CFrame.Angles(0, 3.14159265359, 0)
		},
		MenuButton = {
			meshId = "rbxassetid://12954879390",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.07, 0.017, -0.017) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(0, -0.001, 0)
		},
		ButtonX = {
			meshId = "rbxassetid://12954879064",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(-0.011, 0.013, -0.026) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(0, -0.005, 0)
		},
		ButtonY = {
			meshId = "rbxassetid://12954878913",
			textureId = "rbxassetid://12954905425",
			offset = CFrame.new(0.013, 0.015, -0.07) * CFrame.Angles(0, 3.14159265359, 0),
			moveOffset = CFrame.new(0, -0.005, 0)
		}
	}
}
local t_1 = {
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
local granite = Enum.Material.Granite
local t_2 = {}
t_2.__index = t_2

function t_2.new(p0)
	-- upvalues: t_2 (ref), create (ref), t (ref), granite (ref), fIntVRTouchControllerTransparencyModule (ref)
	local tbl = setmetatable({}, t_2)
	tbl.userCFrame = p0
	tbl.model = create("Model")({ Name = "TouchController", Archivable = false })
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
	
	for i, v in pairs(t[p0]) do
		local var6 = Vector3.new(0.03200000152, 0.03200000152, 0.03200000152)
		
		if v.scale then
			var6 *= v.scale
		end
		local var7 = create("Part")({
			Anchored = true,
			CanCollide = false,
			CanQuery = false,
			CanTouch = false,
			Parent = tbl.model,
			Name = i,
			Material = granite,
			Size = v.size or Vector3.new(0.050000000745, 0.050000000745, 0.050000000745),
			CFrame = tbl.origin.CFrame * v.offset,
			Transparency = fIntVRTouchControllerTransparencyModule / 100
		})
		local _ = create("SpecialMesh")({
			Name = "Mesh",
			Parent = var7,
			MeshId = v.meshId,
			TextureId = v.textureId,
			Scale = var6
		})
		local _ = create("Weld")({
			Name = "Weld",
			Parent = var7,
			Part0 = tbl.origin,
			Part1 = var7,
			C0 = v.offset
		})
		tbl.parts[i] = var7
	end
	tbl.model.PrimaryPart = tbl.origin
	
	return tbl
end

function t_2:setCFrame(p1)
	if self.userCFrame == Enum.UserCFrame.RightHand then
		self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(-0.03, 0.08, -0.06))
		
		return
	end
	self.model:SetPrimaryPartCFrame(p1 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(0.03, 0.08, -0.06))
end

function t_2:setCFrameAndScale(p2, p3)
	-- upvalues: t (ref)
	self.model:SetPrimaryPartCFrame(p2 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(-0.03 * p3 * (if self.userCFrame == Enum.UserCFrame.RightHand then 1 else -1), 0.08 * p3, -0.06 * p3))
	
	if self.scale ~= p3 then
		self.scale = p3
		
		for i, v in pairs(t[self.userCFrame]) do
			local var8 = self.parts[i]
			
			if var8 then
				local var9 = Vector3.new(0.03200000152, 0.03200000152, 0.03200000152)
				
				if v.scale then
					var9 *= v.scale
				end
				local mesh = var8:FindFirstChild("Mesh")
				local weld = var8:FindFirstChild("Weld")
				local offset = v.offset
				local var12 = CFrame.new(offset.p * self.scale) * (offset - offset.p)
				var8.CFrame = self.origin.CFrame * var12
				
				if mesh then
					mesh.Scale = var9 * self.scale
				end
				if weld then
					weld.C0 = var12
				end
			end
		end
	end
end

function t_2:setButtonState(p4, p5)
	-- upvalues: t (ref)
	local var13 = t[self.userCFrame][p4]
	
	if not var13 then return end
	local offset = var13.offset
	local moveOffset = var13.moveOffset
	
	if offset and moveOffset then
		offset = CFrame.new(offset.p * self.scale) * (offset - offset.p)
		moveOffset = CFrame.new(moveOffset.p * self.scale) * (moveOffset - moveOffset.p)
		local var14 = self.parts[p4]
		
		if var14 then
			local mesh = var14:FindFirstChild("Mesh")
			local weld = var14:FindFirstChild("Weld")
			
			if weld then
				if p5 then
					var14.CFrame = self.origin.CFrame * offset * moveOffset
					weld.C0 = offset * moveOffset
				else
					var14.CFrame = self.origin.CFrame * offset
					weld.C0 = offset
				end
			end
			if mesh then
				if p5 then
					mesh.VertexColor = Vector3.new(0.5, 0.5, 0.5)
					
					return
				end
				mesh.VertexColor = Vector3.new(1, 1, 1)
			end
		end
	end
end

function t_2:setTriggerState(p6)
	-- upvalues: t (ref)
	local offset = t[self.userCFrame].Trigger.offset
	offset = CFrame.new(offset.p * self.scale) * (offset - offset.p)
	local trigger = self.parts.Trigger
	local weld = trigger:FindFirstChild("Weld")
	
	if weld then
		local var18 = Vector3.new(0, 0.050000000745, 0.025000000373) * self.scale
		local var19 = offset * CFrame.new(var18) * CFrame.Angles(p6 * 0.349065850399 + 0, 0, 0) * CFrame.new(-var18)
		trigger.CFrame = self.origin.CFrame * var19
		weld.C0 = var19
	end
end

function t_2:setStickState(p7)
	-- upvalues: t (ref)
	local offset = t[self.userCFrame].Stick.offset
	offset = CFrame.new(offset.p * self.scale) * (offset - offset.p)
	local stick = self.parts.Stick
	local weld = stick:FindFirstChild("Weld")
	
	if weld then
		local var21 = Vector3.new(-0.00079999998, -0.02690000087, 0.001300000004) * self.scale
		local var22 = offset * CFrame.new(var21) * CFrame.Angles(p7.Y * 0.349065850399 + 0, 0, p7.X * 0.349065850399 + 0) * CFrame.new(-var21)
		stick.CFrame = self.origin.CFrame * var22
		weld.C0 = var22
	end
end

function t_2:onInputPositionChanged(p8)
	if self.userCFrame == Enum.UserCFrame.RightHand and p8.KeyCode == Enum.KeyCode.ButtonR2 or self.userCFrame == Enum.UserCFrame.LeftHand and p8.KeyCode == Enum.KeyCode.ButtonL2 then
		self:setTriggerState(p8.Position.Z)
		
		return
	elseif self.userCFrame == Enum.UserCFrame.RightHand and p8.KeyCode == Enum.KeyCode.Thumbstick2 or self.userCFrame == Enum.UserCFrame.LeftHand and p8.KeyCode == Enum.KeyCode.Thumbstick1 then
		self:setStickState(p8.Position)
		
		return
	end
end

function t_2:onButtonInputChanged(p9, p10)
	-- upvalues: t_1 (ref)
	if self.userCFrame == Enum.UserCFrame.LeftHand and p9.KeyCode == Enum.KeyCode.ButtonL1 or self.userCFrame == Enum.UserCFrame.RightHand and p9.KeyCode == Enum.KeyCode.ButtonR1 or (self.userCFrame == Enum.UserCFrame.LeftHand and p9.KeyCode == Enum.KeyCode.ButtonL3 or self.userCFrame == Enum.UserCFrame.RightHand and p9.KeyCode == Enum.KeyCode.ButtonR3) or (self.userCFrame == Enum.UserCFrame.LeftHand and p9.KeyCode == Enum.KeyCode.ButtonSelect or self.userCFrame == Enum.UserCFrame.RightHand and p9.KeyCode == Enum.KeyCode.ButtonStart or (p9.KeyCode == Enum.KeyCode.ButtonA or p9.KeyCode == Enum.KeyCode.ButtonB or (p9.KeyCode == Enum.KeyCode.ButtonX or p9.KeyCode == Enum.KeyCode.ButtonY))) then
		self:setButtonState(t_1[p9.KeyCode], p10)
	end
end

function t_2:onInputBegan(p11)
	self:onButtonInputChanged(p11, true)
end

function t_2:onInputChanged(p12)
	self:onInputPositionChanged(p12)
end

function t_2:onInputEnded(p13)
	self:onInputPositionChanged(p13)
	self:onButtonInputChanged(p13, false)
end

function t_2.onTouchpadModeChanged(_, _, _) end

function t_2:destroy()
	self.model:Destroy()
end

function t_2:getButtonPart(p14)
	-- upvalues: t_1 (ref)
	local var23 = t_1[p14]
	
	return if var23 then self.parts[var23] else nil
end

return t_2