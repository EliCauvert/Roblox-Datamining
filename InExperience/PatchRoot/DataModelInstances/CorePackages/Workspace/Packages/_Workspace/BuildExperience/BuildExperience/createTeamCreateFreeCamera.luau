local function createInputAction(p1, p2, p3, p4)
	local inputAction = Instance.new("InputAction")
	inputAction.Name = p2
	inputAction.Type = p3
	
	for i, v in p4 do
		local inputBinding = Instance.new("InputBinding")
		inputBinding.KeyCode = v.KeyCode or Enum.KeyCode.None
		inputBinding.PrimaryModifier = v.PrimaryModifier or Enum.KeyCode.None
		inputBinding.Up = v.Up or Enum.KeyCode.None
		inputBinding.Down = v.Down or Enum.KeyCode.None
		inputBinding.Left = v.Left or Enum.KeyCode.None
		inputBinding.Right = v.Right or Enum.KeyCode.None
		inputBinding.Vector2Scale = v.Vector2Scale or Vector2.one
		inputBinding.Parent = inputAction
	end
	inputAction.Parent = p1
	
	return inputAction
end

local function getFocusCFrame(p5, p6, p7, p8, p9, p10, p11)
	local rotation = CFrame.lookAt(Vector3.new(0.5, 0.5, 1), Vector3.new(0, 0, 0)).Rotation
	
	if p7 == nil or p8.X <= 1 or p8.Y <= 1 then
		local maxValue = math.max(10, p6 * 2.5)
		
		return CFrame.lookAt(p5 + Vector3.new(maxValue * 0.5, maxValue * 0.5, maxValue), p5)
	end
	local width = p7.Width
	local height = p7.Height
	
	if width <= 1 or height <= 1 then
		return nil
	end
	local minValue = math.min(32, width / 4, height / 4)
	local var1 = math.tan(math.rad(p9) / 2) * 2 / p8.Y
	local var2 = (p7.Min.X + minValue - p8.X / 2) * var1
	local var3 = (p7.Max.X - minValue - p8.X / 2) * var1
	local var4 = (p8.Y / 2 - p7.Max.Y + minValue) * var1
	local var5 = (p8.Y / 2 - p7.Min.Y - minValue) * var1
	local var6 = (var2 + var3) / 2
	local var7 = (var4 + var5) / 2
	local maxValue = math.max(10, p6 * math.sqrt(1 + var2 * var2) / (var6 - var2), p6 * math.sqrt(1 + var3 * var3) / (var3 - var6), p6 * math.sqrt(1 + var4 * var4) / (var7 - var4), p6 * math.sqrt(1 + var5 * var5) / (var5 - var7))
	
	if p11 and p10 ~= nil then
		local boundingBox, boundingBox_1 = p10:GetBoundingBox()
		local var8 = 10
		
		for i_2 = -1, 1, 2 do
			for i_1 = -1, 1, 2 do
				for i = -1, 1, 2 do
					local var9 = rotation:VectorToObjectSpace(boundingBox:PointToWorldSpace(boundingBox_1 * Vector3.new(i_2, i_1, i) / 2) - p5)
					var8 = math.max(var8, var9.Z + 1, ((-var9.X) - var2 * var9.Z) / (var6 - var2), (var9.X + var3 * var9.Z) / (var3 - var6), ((-var9.Y) - var4 * var9.Z) / (var7 - var4), (var9.Y + var5 * var9.Z) / (var5 - var7))
				end
			end
		end
		maxValue = math.max(maxValue / 1.5, var8)
	end
	return CFrame.new(p5 - rotation:VectorToWorldSpace(Vector3.new(var6 * maxValue, var7 * maxValue, -maxValue))) * rotation
end

local function getRecenteredCFrame(p12, p13, p14, p15, p16)
	local var10 = -p13:PointToObjectSpace(p12).Z
	
	if var10 <= 0 or p14.Width <= 1 or (p14.Height <= 1 or p15.X <= 1) or p15.Y <= 1 then
		return nil
	end
	local var11 = math.tan(math.rad(p16) / 2) * 2 / p15.Y
	local var12 = (p14.Min + p14.Max) / 2
	local rotation = p13.Rotation
	
	return CFrame.new(p12 - rotation:VectorToWorldSpace(Vector3.new((var12.X - p15.X / 2) * var11 * var10, (p15.Y / 2 - var12.Y) * var11 * var10, -var10))) * rotation
end

return function(p12, p13, p14, p15, p16)
	-- upvalues: createInputAction (ref), getRecenteredCFrame (ref), getFocusCFrame (ref)
	p15 = p15 or game:GetService("GuiService")
	p16 = p16 or createInputAction
	p12.CameraType = Enum.CameraType.Scriptable
	p12.CFrame = CFrame.new(0, 150, 300) * CFrame.Angles(-0.261799387799, 0, 0)
	local var10 = 0
	local var11, var12 = p12.CFrame:ToEulerAnglesYXZ()
	local var13 = nil
	local var14 = 0
	local var15 = nil
	local var16 = false
	local var17 = false
	local var18 = nil
	local var19 = nil
	local viewportSize = p12.ViewportSize
	local fieldOfView = p12.FieldOfView
	local var20 = 0
	local var21 = false
	local var22 = nil
	local var23 = nil
	local t = {}
	local var24 = false
	
	local function _()
		-- upvalues: p14 (ref), p13 (ref)
		return p14.getIsOpen() or (p14.getIsChatOpen() or p13:GetFocusedTextBox() ~= nil)
	end
	
	local teamCreateFreeCamera = Instance.new("InputContext")
	teamCreateFreeCamera.Name = "TeamCreateFreeCamera"
	teamCreateFreeCamera.Priority = 1000
	teamCreateFreeCamera.Sink = true
	teamCreateFreeCamera.Enabled = not (p14.getIsOpen() or (p14.getIsChatOpen() or p13:GetFocusedTextBox() ~= nil))
	teamCreateFreeCamera.Parent = game:GetService("CoreGui")
	local var25 = p16(teamCreateFreeCamera, "Move", Enum.InputActionType.Direction2D, {
		{
			Up = Enum.KeyCode.W,
			Down = Enum.KeyCode.S,
			Left = Enum.KeyCode.A,
			Right = Enum.KeyCode.D
		},
		{ KeyCode = Enum.KeyCode.Thumbstick1 }
	})
	local var26 = p16(teamCreateFreeCamera, "Elevate", Enum.InputActionType.Direction1D, {
		{ Up = Enum.KeyCode.E, Down = Enum.KeyCode.Q },
		{ Up = Enum.KeyCode.ButtonR2, Down = Enum.KeyCode.ButtonL2 }
	})
	local var27 = p16(teamCreateFreeCamera, "Sprint", Enum.InputActionType.Bool, {
		{ KeyCode = Enum.KeyCode.LeftShift },
		{ KeyCode = Enum.KeyCode.RightShift }
	})
	local var28 = p16(teamCreateFreeCamera, "Look", Enum.InputActionType.Bool, { { KeyCode = Enum.KeyCode.MouseRightButton } })
	local var29 = p16(teamCreateFreeCamera, "Pan", Enum.InputActionType.Direction2D, {
		{
			KeyCode = Enum.KeyCode.MouseDelta,
			PrimaryModifier = Enum.KeyCode.MouseRightButton,
			Vector2Scale = Vector2.new(-0.003, -0.003)
		},
		{
			KeyCode = Enum.KeyCode.TrackpadPan,
			Vector2Scale = Vector2.new(-0.042, -0.042)
		},
		{
			KeyCode = Enum.KeyCode.Thumbstick2,
			Vector2Scale = Vector2.new(-2.5, 2.5)
		}
	})
	
	local _ = function(p17)
		-- upvalues: t (ref)
		for i, v in t do
			if v then
				return true
			end
		end
		return p17
	end
	
	local touchStartedConnection = p13.TouchStarted:Connect(function(p18, p19)
		-- upvalues: var24 (write), t (ref), p14 (ref), p13 (ref), var23 (write), var22 (write)
		if var24 then return end
		t[p18] = p19 or (p14.getIsOpen() or (p14.getIsChatOpen() or p13:GetFocusedTextBox() ~= nil))
		
		if t[p18] then
			var23 = nil
			var22 = nil
		end
	end)
	local touchEndedConnection = p13.TouchEnded:Connect(function(p18)
		-- upvalues: t (ref)
		t[p18] = nil
	end)
	local touchPanConnection = p13.TouchPan:Connect(function(p18, p19, _, p20, p21)
		-- upvalues: var24 (write), t (ref), p14 (ref), p13 (ref), var22 (write), var23 (write), var16 (write), var18 (write), var12 (write), var11 (write), p12 (ref)
		local var30
		if not var24 then
			for i, v in t do
				if v then
					var30 = true
					if var30 or (p14.getIsOpen() or (p14.getIsChatOpen() or p13:GetFocusedTextBox() ~= nil)) or (#p18 ~= 1 or var22 ~= nil) or (p20 == Enum.UserInputState.End or p20 == Enum.UserInputState.Cancel) then
						var23 = nil
						
						return
					end
					if p20 == Enum.UserInputState.Begin then
						var23 = p19
						
						return
					elseif p20 == Enum.UserInputState.Change and var23 ~= nil then
						var30 = p19 - var23
						var23 = p19
						
						if var30.Magnitude > 0 then
							var16 = false
							var18 = nil
						end
						var12 -= var30.X * 0.003
						var11 = math.clamp(var11 - var30.Y * 0.003, -1.567654734141, 1.567654734141)
						p12.CFrame = CFrame.new(p12.CFrame.Position) * CFrame.fromEulerAnglesYXZ(var11, var12, 0)
					end
					return
				end
			end
			var30 = p21
		end
	end)
	local touchPinchConnection = p13.TouchPinch:Connect(function(_, p22, _, p23, p24)
		-- upvalues: var24 (write), t (ref), p14 (ref), p13 (ref), var22 (write), var23 (write), p12 (ref), var13 (write), var16 (write), var18 (write)
		if not var24 then
			local var31
			for i, v in t do
				if v then
					var31 = true
					if var31 or (p14.getIsOpen() or (p14.getIsChatOpen() or p13:GetFocusedTextBox() ~= nil)) or (p23 == Enum.UserInputState.End or p23 == Enum.UserInputState.Cancel) then
						var22 = nil
						
						return
					end
					if p22 <= 0 or p22 >= 1e999 then return end
					if p23 == Enum.UserInputState.Begin then
						var23 = nil
						var22 = {
							cframe = p12.CFrame,
							distance = if var13 ~= nil then 300 else math.max(1, (p12.CFrame.Position - var13).Magnitude),
							scale = p22
						}
						
						return
					elseif p23 == Enum.UserInputState.Change and var22 ~= nil then
						if p22 ~= var22.scale then
							var16 = false
							var18 = nil
						end
						p12.CFrame = CFrame.new(var22.cframe.Position + var22.cframe.LookVector * (var22.distance - math.clamp(var22.distance * (var22.scale / p22) ^ 0.35, 1, 100000))) * var22.cframe.Rotation
					end
					return
				end
			end
			var31 = p24
		end
	end)
	
	return {
		step = function(p25)
			-- upvalues: var24 (write), p14 (ref), p12 (ref), p15 (ref), p13 (ref), var19 (write), viewportSize (write), fieldOfView (write), var20 (write), var21 (write), var13 (write), var15 (write), var16 (write), var18 (write), var10 (write), var14 (write), var17 (write), var22 (write), var23 (write), getRecenteredCFrame (copy), getFocusCFrame (copy), var11 (write), var12 (write), teamCreateFreeCamera (ref), var28 (ref), var29 (ref), var27 (ref), var25 (ref), var26 (ref)
			if var24 then return end
			local worldViewportRect = p14.getWorldViewportRect()
			local worldChatTop = p14.getWorldChatTop()
			local worldChatLeft = p14.getWorldChatLeft()
			local viewportSize_1 = p12.ViewportSize
			local rect = nil
			
			if worldViewportRect ~= nil then
				local guiInset = p15:GetGuiInset()
				local rect_1 = Rect.new(worldViewportRect.Min + guiInset, worldViewportRect.Max + guiInset)
				
				if worldChatTop ~= nil then
					worldChatTop += guiInset.Y
				end
				if worldChatLeft ~= nil then
					worldChatLeft += guiInset.X
				end
				rect_1 = Vector2.new(math.clamp(rect_1.Min.X, 0, viewportSize_1.X), math.clamp(rect_1.Min.Y, 0, viewportSize_1.Y))
				local maxValue = math.max(rect_1.X, math.min(viewportSize_1.X, rect_1.Max.X, worldChatLeft or 1e999))
				local minValue = math.min(viewportSize_1.Y, rect_1.Max.Y)
				worldViewportRect = Rect.new(rect_1, Vector2.new(maxValue, math.max(rect_1.Y, math.min(minValue, worldChatTop or 1e999))))
				rect = Rect.new(rect_1, Vector2.new(maxValue, math.max(math.min(minValue, if worldChatTop ~= nil then 1e999 else worldChatTop + (if p13.OnScreenKeyboardVisible then p13.OnScreenKeyboardSize.Y else 0)), math.min(minValue, rect_1.Y + (minValue - rect_1.Y) * 0.3))))
			end
			if worldViewportRect == var19 and viewportSize_1 == viewportSize and p12.FieldOfView == fieldOfView then
				var20 += p25
			else
				var19 = worldViewportRect
				viewportSize = viewportSize_1
				fieldOfView = p12.FieldOfView
				var20 = 0
				var21 = true
			end
			local focusRequest = p14.getFocusRequest()
			
			if focusRequest == nil then
				var13 = nil
				var15 = nil
				var16 = false
				var18 = nil
			end
			if (focusRequest ~= nil and focusRequest.token ~= var10) and focusRequest ~= nil then
				var10 = focusRequest.token
				var18 = nil
				var13 = focusRequest.position
				var14 = focusRequest.radius
				var15 = focusRequest.model
				var16 = true
				var17 = false
				var21 = true
				var22 = nil
				var23 = nil
				var20 = 0
			end
			if var13 ~= nil and (worldViewportRect ~= nil and (not p14.getIsChatOpen() or (if worldChatTop == nil then worldChatLeft ~= nil else true))) and (var16 and var21) and var20 >= 0.1 then
				var21 = false
				var22 = nil
				var23 = nil
				local var32 = if var17 then getRecenteredCFrame(var13, if var18 ~= nil then p12.CFrame else var18.target, worldViewportRect, viewportSize_1, p12.FieldOfView) else getFocusCFrame(var13, var14, rect, viewportSize_1, p12.FieldOfView, var15, if worldChatTop == nil then worldChatLeft ~= nil else true)
				
				if var32 ~= nil then
					var17 = true
					var18 = { elapsed = 0, start = p12.CFrame, target = var32 }
				end
			end
			if var18 ~= nil then
				var18.elapsed += p25
				local clampedValue = math.clamp(var18.elapsed / 0.25, 0, 1)
				p12.CFrame = if clampedValue == 1 then var18.target else var18.start:Lerp(var18.target, clampedValue * clampedValue * (3 - clampedValue * 2))
				local var33, var34 = p12.CFrame:ToEulerAnglesYXZ()
				var11 = var33
				var12 = var34
				
				if clampedValue == 1 then
					var18 = nil
				end
			end
			teamCreateFreeCamera.Enabled = not (p14.getIsOpen() or (p14.getIsChatOpen() or p13:GetFocusedTextBox() ~= nil))
			
			if not teamCreateFreeCamera.Enabled then
				var22 = nil
				var23 = nil
				p13.MouseBehavior = Enum.MouseBehavior.Default
				
				return
			end
			p13.MouseBehavior = if var28:GetState() then Enum.MouseBehavior.LockCurrentPosition else Enum.MouseBehavior.Default
			local var35 = var29:GetState() * p25
			
			if var35.Magnitude > 0 then
				var16 = false
				var18 = nil
			end
			var12 += var35.X
			var11 = math.clamp(var11 + var35.Y, -1.567654734141, 1.567654734141)
			local cFrame = CFrame.fromEulerAnglesYXZ(var11, var12, 0)
			local state = var25:GetState()
			local var36 = p12.CFrame.Position + (cFrame.RightVector * state.X + cFrame.LookVector * state.Y + Vector3.new(0, 1, 0) * var26:GetState()) * (p25 * 50 * (if var27:GetState() then 5 else 1))
			
			if var36 ~= p12.CFrame.Position then
				var16 = false
				var18 = nil
			end
			p12.CFrame = CFrame.new(var36) * cFrame
		end,
		destroy = function()
			-- upvalues: var24 (write), teamCreateFreeCamera (ref), var18 (write), var22 (write), var23 (write), t (ref), touchStartedConnection (ref), touchEndedConnection (ref), touchPanConnection (ref), touchPinchConnection (ref), p13 (ref)
			var24 = true
			teamCreateFreeCamera:Destroy()
			var18 = nil
			var22 = nil
			var23 = nil
			table.clear(t)
			touchStartedConnection:Disconnect()
			touchEndedConnection:Disconnect()
			touchPanConnection:Disconnect()
			touchPinchConnection:Disconnect()
			p13.MouseBehavior = Enum.MouseBehavior.Default
		end
	}
end