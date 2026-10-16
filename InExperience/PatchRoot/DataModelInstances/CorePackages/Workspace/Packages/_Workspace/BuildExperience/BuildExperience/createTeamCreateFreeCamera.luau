local function createInputAction(Parent, Name, Type, Inputs) --[[ Line: 53 ]]
	local InputAction = Instance.new("InputAction")
	InputAction.Name = Name
	InputAction.Type = Type
	
	for _, input in Inputs do
		local InputBinding = Instance.new("InputBinding")
		InputBinding.KeyCode = input.KeyCode or Enum.KeyCode.None
		InputBinding.PrimaryModifier = input.PrimaryModifier or Enum.KeyCode.None
		InputBinding.Up = input.Up or Enum.KeyCode.None
		InputBinding.Down = input.Down or Enum.KeyCode.None
		InputBinding.Left = input.Left or Enum.KeyCode.None
		InputBinding.Right = input.Right or Enum.KeyCode.None
		InputBinding.Vector2Scale = input.Vector2Scale or Vector2.one
		InputBinding.Parent = InputAction
	end
	InputAction.Parent = Parent
	
	return InputAction
end

local function getFocusCFrame(Target, Radius: number, p1, Vector, Degrees: number, Model: Model, p2): CFrame? --[[ Line: 77 ]]
	local Rotation = CFrame.lookAt(vector.create(0.5, 0.5, 1), vector.create(0, 0, 0)).Rotation
	
	if p1 == nil or Vector.X <= 1 or Vector.Y <= 1 then
		local Z = math.max(10, Radius * 2.5)
		
		return CFrame.lookAt(Target + Vector3.new(Z * 0.5, Z * 0.5, Z), Target)
	end
	local Width: number = p1.Width
	local Height: number = p1.Height
	
	if Width <= 1 or Height <= 1 then
		return nil
	end
	local Smallest = math.min(32, Width / 4, Height / 4)
	local TangentRatio = math.tan(math.rad(Degrees) / 2) * 2 / Vector.Y
	local ScaledX = (p1.Min.X + Smallest - Vector.X / 2) * TangentRatio
	local ScaledX1 = (p1.Max.X - Smallest - Vector.X / 2) * TangentRatio
	local ScaledY = (Vector.Y / 2 - p1.Max.Y + Smallest) * TangentRatio
	local ScaledY1 = (Vector.Y / 2 - p1.Min.Y - Smallest) * TangentRatio
	local ScaledXRatio = (ScaledX + ScaledX1) / 2
	local ScaledYRatio = (ScaledY + ScaledY1) / 2
	local Largest = math.max(10, Radius * math.sqrt(1 + ScaledX * ScaledX) / (ScaledXRatio - ScaledX), Radius * math.sqrt(1 + ScaledX1 * ScaledX1) / (ScaledX1 - ScaledXRatio), Radius * math.sqrt(1 + ScaledY * ScaledY) / (ScaledYRatio - ScaledY), Radius * math.sqrt(1 + ScaledY1 * ScaledY1) / (ScaledY1 - ScaledYRatio))
	
	if p2 and Model ~= nil then
		local BoundingCFrame, BoundingSize = Model:GetBoundingBox()
		local Largest1 = 10
		
		for X = -1, 1, 2 do
			for Y = -1, 1, 2 do
				for Z1 = -1, 1, 2 do
					local Vector1 = Rotation:VectorToObjectSpace(BoundingCFrame:PointToWorldSpace(BoundingSize * Vector3.new(X, Y, Z1) / 2) - Target)
					Largest1 = math.max(Largest1, Vector1.Z + 1, (-Vector1.X - ScaledX * Vector1.Z) / (ScaledXRatio - ScaledX), (Vector1.X + ScaledX1 * Vector1.Z) / (ScaledX1 - ScaledXRatio), (-Vector1.Y - ScaledY * Vector1.Z) / (ScaledYRatio - ScaledY), (Vector1.Y + ScaledY1 * Vector1.Z) / (ScaledY1 - ScaledYRatio))
				end
			end
		end
		Largest = math.max(Largest / 1.5, Largest1)
	end
	return CFrame.new(Target - Rotation:VectorToWorldSpace((Vector3.new(ScaledXRatio * Largest, ScaledYRatio * Largest, -Largest)))) * Rotation
end

local function getRecenteredCFrame(Position, CF, WorldViewportRect, Vector, Degrees: number): CFrame? --[[ Line: 136 ]]
	local Negated = -CF:PointToObjectSpace(Position).Z
	
	if Negated <= 0 or WorldViewportRect.Width <= 1 or WorldViewportRect.Height <= 1 or Vector.X <= 1 or Vector.Y <= 1 then
		return nil
	else
		local TangentRatio = math.tan(math.rad(Degrees) / 2) * 2 / Vector.Y
		local MinRatio = (WorldViewportRect.Min + WorldViewportRect.Max) / 2
		local Rotation = CF.Rotation
		
		return CFrame.new(Position - Rotation:VectorToWorldSpace((Vector3.new((MinRatio.X - Vector.X / 2) * TangentRatio * Negated, (Vector.Y / 2 - MinRatio.Y) * TangentRatio * Negated, -Negated)))) * Rotation
	end
end

return function(Camera: Camera, UserInputService: UserInputService, p3, p4, p5) --[[ Line: 160 | Named "createTeamCreateFreeCamera" ]]
	-- upvalues: createInputAction (copy), getRecenteredCFrame (copy), getFocusCFrame (copy)
	local P16 = p4 or game:GetService("GuiService")
	local Callback = p5 or createInputAction
	Camera.CameraType = Enum.CameraType.Scriptable
	Camera.CFrame = CFrame.new(0, 150, 300) * CFrame.Angles(-0.2617993877991494, 0, 0)
	local Token = 0
	local Rx, Ry = Camera.CFrame:ToEulerAnglesYXZ()
	local Position = nil
	local Radius = 0
	local Model = nil
	local Flag = false
	local Flag1 = false
	local Config = nil
	local WorldViewportRect = nil
	local ViewportSize = Camera.ViewportSize
	local FieldOfView = Camera.FieldOfView
	local Total = 0
	local Flag2 = false
	local Config1 = nil
	local v1 = nil
	local Tbl = {}
	local Flag3 = false
	
	local function _() --[[ Line: 190 | Named "isInputBlocked" ]]
		-- upvalues: p3 (copy), UserInputService (copy)
		return p3.getIsOpen() or UserInputService:GetFocusedTextBox() ~= nil
	end
	
	local function isChatUsingInput(): boolean --[[ Line: 196 ]]
		-- upvalues: p3 (copy), P16 (copy), UserInputService (copy)
		if not p3.getIsChatOpen() then
			return false
		elseif P16.SelectedObject == nil then
			local WorldChatTop = p3.getWorldChatTop()
			local WorldChatLeft = p3.getWorldChatLeft()
			local GuiInset = P16:GetGuiInset()
			local MouseLocation = UserInputService:GetMouseLocation()
			
			return if WorldChatTop == nil then WorldChatLeft ~= nil and WorldChatLeft + GuiInset.X <= MouseLocation.X else WorldChatTop + GuiInset.Y <= MouseLocation.Y or WorldChatLeft ~= nil and WorldChatLeft + GuiInset.X <= MouseLocation.X
		else
			return true
		end
	end
	
	local TeamCreateFreeCamera = Instance.new("InputContext")
	TeamCreateFreeCamera.Name = "TeamCreateFreeCamera"
	TeamCreateFreeCamera.Priority = 1000
	TeamCreateFreeCamera.Sink = true
	TeamCreateFreeCamera.Enabled = not (p3.getIsOpen() or UserInputService:GetFocusedTextBox() ~= nil)
	TeamCreateFreeCamera.Parent = game:GetService("CoreGui")
	local Move = Callback(TeamCreateFreeCamera, "Move", Enum.InputActionType.Direction2D, {
		{
			Up = Enum.KeyCode.W,
			Down = Enum.KeyCode.S,
			Left = Enum.KeyCode.A,
			Right = Enum.KeyCode.D
		},
		{
			Up = Enum.KeyCode.Up,
			Down = Enum.KeyCode.Down,
			Left = Enum.KeyCode.Left,
			Right = Enum.KeyCode.Right
		},
		{ KeyCode = Enum.KeyCode.Thumbstick1 }
	})
	local Elevate = Callback(TeamCreateFreeCamera, "Elevate", Enum.InputActionType.Direction1D, {
		{ Up = Enum.KeyCode.E, Down = Enum.KeyCode.Q },
		{ Up = Enum.KeyCode.ButtonR2, Down = Enum.KeyCode.ButtonL2 }
	})
	local Sprint = Callback(TeamCreateFreeCamera, "Sprint", Enum.InputActionType.Bool, {
		{ KeyCode = Enum.KeyCode.LeftShift },
		{ KeyCode = Enum.KeyCode.RightShift }
	})
	local Look = Callback(TeamCreateFreeCamera, "Look", Enum.InputActionType.Bool, { { KeyCode = Enum.KeyCode.MouseRightButton } })
	local Pan = Callback(TeamCreateFreeCamera, "Pan", Enum.InputActionType.Direction2D, {
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
	
	local _ = function(p6) --[[ Line: 248 | Named "isTouchGestureBlocked" ]]
		-- upvalues: Tbl (copy)
		for _, value in Tbl do
			if value then
				return true
			end
		end
		return p6
	end
	
	local TouchStartedConnection = UserInputService.TouchStarted:Connect(function(Touch, GameProcessedEvent) --[[ Line: 258 ]]
		-- upvalues: Flag3 (ref), Tbl (copy), p3 (copy), UserInputService (copy), v1 (ref), Config1 (ref)
		if Flag3 then return end
		Tbl[Touch] = GameProcessedEvent or (p3.getIsOpen() or UserInputService:GetFocusedTextBox() ~= nil)
		
		if Tbl[Touch] then
			v1 = nil
			Config1 = nil
		end
	end)
	local TouchEndedConnection = UserInputService.TouchEnded:Connect(function(Hit) --[[ Line: 269 ]]
		-- upvalues: Tbl (copy)
		Tbl[Hit] = nil
	end)
	local TouchPanConnection = UserInputService.TouchPan:Connect(function(TouchPositions, TotalTranslation, _, UserInputState, p7) --[[ Line: 274 ]]
		-- upvalues: Flag3 (ref), Tbl (copy), p3 (copy), UserInputService (copy), Config1 (ref), v1 (ref), Flag (ref), Config (ref), Ry (ref), Rx (ref), Camera (copy)
		if not Flag3 then
			local v2 = nil
			for _, value in Tbl do
				if value then
					v2 = true
					if not v2 and (not p3.getIsOpen() and UserInputService:GetFocusedTextBox() == nil and #TouchPositions == 1 and Config1 == nil and UserInputState ~= Enum.UserInputState.End and UserInputState ~= Enum.UserInputState.Cancel) then
						if UserInputState == Enum.UserInputState.Begin then
							v1 = TotalTranslation
							
							return
						end
						if UserInputState == Enum.UserInputState.Change and v1 ~= nil then
							local TotalTranslationDelta = TotalTranslation - v1
							v1 = TotalTranslation
							
							if TotalTranslationDelta.Magnitude > 0 then
								Flag = false
								Config = nil
							end
							Ry -= TotalTranslationDelta.X * 0.003
							Rx = math.clamp(Rx - TotalTranslationDelta.Y * 0.003, -1.5676547341413067, 1.5676547341413067)
							Camera.CFrame = CFrame.new(Camera.CFrame.Position) * CFrame.fromEulerAnglesYXZ(Rx, Ry, 0)
						end
						return
					end
				else
					continue
				end
			end
			v2 = p7
		end
		v1 = nil
	end)
	local TouchPinchConnection = UserInputService.TouchPinch:Connect(function(_, Scale: number, _, UserInputState, p8) --[[ Line: 310 ]]
		-- upvalues: Flag3 (ref), Tbl (copy), p3 (copy), UserInputService (copy), Config1 (ref), v1 (ref), Camera (copy), Position (ref), Flag (ref), Config (ref)
		if not Flag3 then
			local v3 = nil
			for _, value in Tbl do
				if value then
					v3 = true
					if not v3 and (not p3.getIsOpen() and UserInputService:GetFocusedTextBox() == nil and UserInputState ~= Enum.UserInputState.End and UserInputState ~= Enum.UserInputState.Cancel) then
						if Scale <= 0 or Scale >= 1e999 then return end
						if UserInputState == Enum.UserInputState.Begin then
							v1 = nil
							Config1 = {
								cframe = Camera.CFrame,
								distance = if Position == nil then 300 else math.max(1, (Camera.CFrame.Position - Position).Magnitude),
								scale = Scale
							}
							
							return
						end
						if UserInputState == Enum.UserInputState.Change and Config1 ~= nil then
							if Scale ~= Config1.scale then
								Flag = false
								Config = nil
							end
							Camera.CFrame = CFrame.new(Config1.cframe.Position + Config1.cframe.LookVector * (Config1.distance - math.clamp(Config1.distance * (Config1.scale / Scale) ^ 0.35, 1, 100000))) * Config1.cframe.Rotation
						end
						return
					end
				else
					continue
				end
			end
			v3 = p8
		end
		Config1 = nil
	end)
	
	return {
		step = function(Amount: number) --[[ Line: 353 ]]
			-- upvalues: Flag3 (ref), p3 (copy), Camera (copy), P16 (copy), UserInputService (copy), WorldViewportRect (ref), ViewportSize (ref), FieldOfView (ref), Total (ref), Flag2 (ref), Position (ref), Model (ref), Flag (ref), Config (ref), Token (ref), Radius (ref), Flag1 (ref), Config1 (ref), v1 (ref), getRecenteredCFrame (upval), getFocusCFrame (upval), Rx (ref), Ry (ref), TeamCreateFreeCamera (copy), isChatUsingInput (copy), Look (copy), Pan (copy), Sprint (copy), Move (copy), Elevate (copy)
			if Flag3 then return end
			local WorldViewportRect1 = p3.getWorldViewportRect()
			local WorldChatTop = p3.getWorldChatTop()
			local WorldChatLeft = p3.getWorldChatLeft()
			local ViewportSize1 = Camera.ViewportSize
			local v4: Rect? = nil
			
			if WorldViewportRect1 ~= nil then
				local GuiInset = P16:GetGuiInset()
				local _Rect = Rect.new(WorldViewportRect1.Min + GuiInset, WorldViewportRect1.Max + GuiInset)
				
				if WorldChatTop ~= nil then
					WorldChatTop += GuiInset.Y
				end
				if WorldChatLeft ~= nil then
					WorldChatLeft += GuiInset.X
				end
				local _Vector2 = Vector2.new(math.clamp(_Rect.Min.X, 0, ViewportSize1.X), (math.clamp(_Rect.Min.Y, 0, ViewportSize1.Y)))
				local Largest = math.max(_Vector2.X, (math.min(ViewportSize1.X, _Rect.Max.X, WorldChatLeft or 1e999)))
				local Smallest = math.min(ViewportSize1.Y, _Rect.Max.Y)
				WorldViewportRect1 = Rect.new(_Vector2, Vector2.new(Largest, (math.max(_Vector2.Y, (math.min(Smallest, WorldChatTop or 1e999))))))
				local Y = if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardSize.Y else 0
				v4 = Rect.new(_Vector2, Vector2.new(Largest, (math.max(math.min(Smallest, if WorldChatTop == nil then 1e999 else WorldChatTop + Y), (math.min(Smallest, _Vector2.Y + (Smallest - _Vector2.Y) * 0.3))))))
			end
			if WorldViewportRect1 == WorldViewportRect and ViewportSize1 == ViewportSize and Camera.FieldOfView == FieldOfView then
				Total += Amount
			else
				WorldViewportRect = WorldViewportRect1
				ViewportSize = ViewportSize1
				FieldOfView = Camera.FieldOfView
				Total = 0
				Flag2 = true
			end
			local FocusRequest = p3.getFocusRequest()
			
			if FocusRequest == nil then
				Position = nil
				Model = nil
				Flag = false
				Config = nil
			end
			if FocusRequest ~= nil and FocusRequest.token ~= Token and FocusRequest ~= nil then
				Token = FocusRequest.token
				Config = nil
				Position = FocusRequest.position
				Radius = FocusRequest.radius
				Model = FocusRequest.model
				Flag = true
				Flag1 = false
				Flag2 = true
				Config1 = nil
				v1 = nil
				Total = 0
			end
			local Inverted: boolean = WorldViewportRect1 ~= nil and (not p3.getIsChatOpen() or (WorldChatTop ~= nil or WorldChatLeft ~= nil))
			
			if Position ~= nil and Inverted and Flag and Flag2 and Total >= 0.1 then
				Flag2 = false
				Config1 = nil
				v1 = nil
				local RecenteredCFrame = if Flag1 then getRecenteredCFrame(Position, if Config == nil then Camera.CFrame else Config.target, WorldViewportRect1, ViewportSize1, Camera.FieldOfView) else getFocusCFrame(Position, Radius, v4, ViewportSize1, Camera.FieldOfView, Model, WorldChatTop ~= nil or WorldChatLeft ~= nil)
				
				if RecenteredCFrame ~= nil then
					Flag1 = true
					Config = {
						elapsed = 0,
						start = Camera.CFrame,
						target = RecenteredCFrame
					}
				end
			end
			if Config ~= nil then
				local Config2 = Config
				Config2.elapsed += Amount
				local ClampedValue = math.clamp(Config.elapsed / 0.25, 0, 1)
				local ScaledClampedValue = ClampedValue * ClampedValue * (3 - ClampedValue * 2)
				Camera.CFrame = if ClampedValue == 1 then Config.target else Config.start:Lerp(Config.target, ScaledClampedValue)
				Rx, Ry = Camera.CFrame:ToEulerAnglesYXZ()
				
				if ClampedValue == 1 then
					Config = nil
				end
			end
			local IsOpen = p3.getIsOpen() or UserInputService:GetFocusedTextBox() ~= nil
			TeamCreateFreeCamera.Enabled = not IsOpen and not isChatUsingInput()
			
			if TeamCreateFreeCamera.Enabled then
				UserInputService.MouseBehavior = if Look:GetState() then Enum.MouseBehavior.LockCurrentPosition else Enum.MouseBehavior.Default
				local ScaledState = Pan:GetState() * Amount
				
				if ScaledState.Magnitude > 0 then
					Flag = false
					Config = nil
				end
				Ry += ScaledState.X
				Rx = math.clamp(Rx + ScaledState.Y, -1.5676547341413067, 1.5676547341413067)
				local _CFrame = CFrame.fromEulerAnglesYXZ(Rx, Ry, 0)
				local State = Move:GetState()
				local NewPosition = Camera.CFrame.Position + (_CFrame.RightVector * State.X + _CFrame.LookVector * State.Y + vector.create(0, 1, 0) * Elevate:GetState()) * (Amount * 50 * (if Sprint:GetState() then 5 else 1))
				
				if NewPosition ~= Camera.CFrame.Position then
					Flag = false
					Config = nil
				end
				Camera.CFrame = CFrame.new(NewPosition) * _CFrame
				
				return
			else
				if IsOpen then
					Config1 = nil
					v1 = nil
				end
				UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			end
		end,
		destroy = function() --[[ Line: 519 ]]
			-- upvalues: Flag3 (ref), TeamCreateFreeCamera (copy), Config (ref), Config1 (ref), v1 (ref), Tbl (copy), TouchStartedConnection (copy), TouchEndedConnection (copy), TouchPanConnection (copy), TouchPinchConnection (copy), UserInputService (copy)
			Flag3 = true
			TeamCreateFreeCamera:Destroy()
			Config = nil
			Config1 = nil
			v1 = nil
			table.clear(Tbl)
			TouchStartedConnection:Disconnect()
			TouchEndedConnection:Disconnect()
			TouchPanConnection:Disconnect()
			TouchPinchConnection:Disconnect()
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		end
	}
end