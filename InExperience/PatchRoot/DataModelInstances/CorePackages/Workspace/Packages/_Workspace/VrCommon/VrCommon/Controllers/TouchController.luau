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

function t_2.new(p1)
	-- upvalues: t_2 (ref), create (ref), t (ref), granite (ref), fIntVRTouchControllerTransparencyModule (ref)
	local tbl = setmetatable({}, t_2)
	tbl.userCFrame = p1
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
	
	for i, v in pairs(t[p1]) do
		local var1 = Vector3.new(0.03200000152, 0.03200000152, 0.03200000152)
		
		if v.scale then
			var1 *= v.scale
		end
		local var2 = create("Part")({
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
			Parent = var2,
			MeshId = v.meshId,
			TextureId = v.textureId,
			Scale = var1
		})
		local _ = create("Weld")({
			Name = "Weld",
			Parent = var2,
			Part0 = tbl.origin,
			Part1 = var2,
			C0 = v.offset
		})
		tbl.parts[i] = var2
	end
	tbl.model.PrimaryPart = tbl.origin
	
	return tbl
end

function t_2:setCFrame(p2)
	if self.userCFrame == Enum.UserCFrame.RightHand then
		self.model:SetPrimaryPartCFrame(p2 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(-0.03, 0.08, -0.06))
		
		return
	end
	self.model:SetPrimaryPartCFrame(p2 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(0.03, 0.08, -0.06))
end

function t_2:setCFrameAndScale(p2, p3)
	-- upvalues: t (ref)
	self.model:SetPrimaryPartCFrame(p2 * CFrame.Angles(0.349065850399, 0, 0) * CFrame.new(-0.03 * p3 * (if self.userCFrame == Enum.UserCFrame.RightHand then 1 else -1), 0.08 * p3, -0.06 * p3))
	
	if self.scale ~= p3 then
		self.scale = p3
		
		for i, v in pairs(t[self.userCFrame]) do
			local var3 = self.parts[i]
			
			if var3 then
				local var4 = Vector3.new(0.03200000152, 0.03200000152, 0.03200000152)
				
				if v.scale then
					var4 *= v.scale
				end
				local mesh = var3:FindFirstChild("Mesh")
				local weld = var3:FindFirstChild("Weld")
				local offset = v.offset
				local var5 = CFrame.new(offset.p * self.scale) * (offset - offset.p)
				var3.CFrame = self.origin.CFrame * var5
				
				if mesh then
					mesh.Scale = var4 * self.scale
				end
				if weld then
					weld.C0 = var5
				end
			end
		end
	end
end

function t_2:setButtonState(p4, p5)
	-- upvalues: t (ref)
	local var6 = t[self.userCFrame][p4]
	
	if not var6 then return end
	local offset = var6.offset
	local moveOffset = var6.moveOffset
	
	if offset and moveOffset then
		offset = CFrame.new(offset.p * self.scale) * (offset - offset.p)
		moveOffset = CFrame.new(moveOffset.p * self.scale) * (moveOffset - moveOffset.p)
		local var7 = self.parts[p4]
		
		if var7 then
			local mesh = var7:FindFirstChild("Mesh")
			local weld = var7:FindFirstChild("Weld")
			
			if weld then
				if p5 then
					var7.CFrame = self.origin.CFrame * offset * moveOffset
					weld.C0 = offset * moveOffset
				else
					var7.CFrame = self.origin.CFrame * offset
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

function t_2:setTriggerState(p4)
	-- upvalues: t (ref)
	local offset = t[self.userCFrame].Trigger.offset
	offset = CFrame.new(offset.p * self.scale) * (offset - offset.p)
	local trigger = self.parts.Trigger
	local weld = trigger:FindFirstChild("Weld")
	
	if weld then
		local var6 = Vector3.new(0, 0.050000000745, 0.025000000373) * self.scale
		local var7 = offset * CFrame.new(var6) * CFrame.Angles(p4 * 0.349065850399 + 0, 0, 0) * CFrame.new(-var6)
		trigger.CFrame = self.origin.CFrame * var7
		weld.C0 = var7
	end
end

function t_2:setStickState(p4)
	-- upvalues: t (ref)
	local offset = t[self.userCFrame].Stick.offset
	offset = CFrame.new(offset.p * self.scale) * (offset - offset.p)
	local stick = self.parts.Stick
	local weld = stick:FindFirstChild("Weld")
	
	if weld then
		local var6 = Vector3.new(-0.00079999998, -0.02690000087, 0.001300000004) * self.scale
		local var7 = offset * CFrame.new(var6) * CFrame.Angles(p4.Y * 0.349065850399 + 0, 0, p4.X * 0.349065850399 + 0) * CFrame.new(-var6)
		stick.CFrame = self.origin.CFrame * var7
		weld.C0 = var7
	end
end

function t_2:onInputPositionChanged(p4)
	if self.userCFrame == Enum.UserCFrame.RightHand and p4.KeyCode == Enum.KeyCode.ButtonR2 or self.userCFrame == Enum.UserCFrame.LeftHand and p4.KeyCode == Enum.KeyCode.ButtonL2 then
		self:setTriggerState(p4.Position.Z)
		
		return
	elseif self.userCFrame == Enum.UserCFrame.RightHand and p4.KeyCode == Enum.KeyCode.Thumbstick2 or self.userCFrame == Enum.UserCFrame.LeftHand and p4.KeyCode == Enum.KeyCode.Thumbstick1 then
		self:setStickState(p4.Position)
		
		return
	end
end

function t_2:onButtonInputChanged(p4, p5)
	-- upvalues: t_1 (ref)
	if self.userCFrame == Enum.UserCFrame.LeftHand and p4.KeyCode == Enum.KeyCode.ButtonL1 or self.userCFrame == Enum.UserCFrame.RightHand and p4.KeyCode == Enum.KeyCode.ButtonR1 or (self.userCFrame == Enum.UserCFrame.LeftHand and p4.KeyCode == Enum.KeyCode.ButtonL3 or self.userCFrame == Enum.UserCFrame.RightHand and p4.KeyCode == Enum.KeyCode.ButtonR3) or (self.userCFrame == Enum.UserCFrame.LeftHand and p4.KeyCode == Enum.KeyCode.ButtonSelect or self.userCFrame == Enum.UserCFrame.RightHand and p4.KeyCode == Enum.KeyCode.ButtonStart or (p4.KeyCode == Enum.KeyCode.ButtonA or p4.KeyCode == Enum.KeyCode.ButtonB or (p4.KeyCode == Enum.KeyCode.ButtonX or p4.KeyCode == Enum.KeyCode.ButtonY))) then
		self:setButtonState(t_1[p4.KeyCode], p5)
	end
end

function t_2:onInputBegan(p4)
	self:onButtonInputChanged(p4, true)
end

function t_2:onInputChanged(p4)
	self:onInputPositionChanged(p4)
end

function t_2:onInputEnded(p4)
	self:onInputPositionChanged(p4)
	self:onButtonInputChanged(p4, false)
end

function t_2.onTouchpadModeChanged(_, _, _) end

function t_2:destroy()
	self.model:Destroy()
end

function t_2:getButtonPart(p4)
	-- upvalues: t_1 (ref)
	local var6 = t_1[p4]
	
	return if var6 then self.parts[var6] else nil
end

return t_2