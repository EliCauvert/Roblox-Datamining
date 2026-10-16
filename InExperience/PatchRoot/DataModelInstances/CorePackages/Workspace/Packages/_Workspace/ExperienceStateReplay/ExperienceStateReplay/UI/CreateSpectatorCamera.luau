local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CreateTemporaryOverlayModule = require(script.Parent.CreateTemporaryOverlay)
local DisplayName = nil
local CF = nil
local v1 = 0
local Players = {}
local v2 = 1
local CameraSubject = nil
local Value = 50
local Interpolated: vector = vector.create(0, 0, 0)
local Vector = nil

return {
	createSpectatorCamera = function(p1) --[[ Line: 41 ]]
		-- upvalues: Value (ref), Players (ref), v2 (ref), UserInputService (copy), CF (ref), Interpolated (ref), Vector (ref), Workspace (copy), RunService (copy), DisplayName (ref), CreateTemporaryOverlayModule (copy), CameraSubject (ref), v1 (ref)
		local InputFrame = Instance.new("Frame")
		InputFrame.Name = "InputFrame"
		InputFrame.Size = UDim2.new(0.4, 0, 0.15, 0)
		InputFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		InputFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		InputFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		InputFrame.BackgroundTransparency = 0.4
		InputFrame.BorderSizePixel = 0
		InputFrame.Visible = false
		InputFrame.Parent = p1.screenGui
		local ListLayout = Instance.new("UIListLayout")
		ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		ListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		ListLayout.Padding = UDim.new(0, 5)
		ListLayout.Parent = InputFrame
		local SpeedLabel = Instance.new("TextLabel")
		SpeedLabel.Name = "SpeedLabel"
		SpeedLabel.Size = UDim2.new(0.9, 0, 0.3, 0)
		SpeedLabel.BackgroundTransparency = 1
		SpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		SpeedLabel.Font = Enum.Font.SourceSans
		SpeedLabel.TextScaled = true
		SpeedLabel.Text = "Free Cam Speed (Current: " .. math.floor(Value) .. ") Between 10 And 20000"
		SpeedLabel.Parent = InputFrame
		local SpeedTextBox = Instance.new("TextBox")
		SpeedTextBox.Name = "SpeedTextBox"
		SpeedTextBox.Size = UDim2.new(0.9, 0, 0.25, 0)
		SpeedTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		SpeedTextBox.BackgroundTransparency = 0
		SpeedTextBox.Text = tostring((math.floor(Value)))
		SpeedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		SpeedTextBox.TextScaled = true
		SpeedTextBox.Font = Enum.Font.SourceSans
		SpeedTextBox.ClearTextOnFocus = true
		SpeedTextBox.TextXAlignment = Enum.TextXAlignment.Center
		SpeedTextBox.Parent = InputFrame
		local ApplyButton = Instance.new("TextButton")
		ApplyButton.Name = "ApplyButton"
		ApplyButton.Size = UDim2.new(0.9, 0, 0.25, 0)
		ApplyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
		ApplyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		ApplyButton.Text = "Apply Speed"
		ApplyButton.Font = Enum.Font.SourceSansBold
		ApplyButton.TextScaled = true
		ApplyButton.Parent = InputFrame
		ApplyButton.MouseButton1Click:Connect(function() --[[ Line: 106 ]]
			-- upvalues: SpeedTextBox (copy), Value (upval), SpeedLabel (copy)
			local Success, Result = pcall(tonumber, SpeedTextBox.Text)
			
			if Success and type(Result) == "number" and Result >= 10 and Result <= 20000 then
				Value = Result
				SpeedLabel.Text = "Free Cam Speed (Current: " .. math.floor(Value) .. ") Between 10 And 20000"
				
				return
			else
				warn("Invalid speed input: " .. SpeedTextBox.Text .. ". Please enter a number between 10 and 20000.")
				SpeedTextBox.Text = tostring((math.floor(Value)))
			end
		end)
		local Inverted = false
		
		local function updateHumanoidList() --[[ Line: 126 ]]
			-- upvalues: Players (upval)
			Players = {}
			
			for _, Humanoid in ipairs(workspace:GetDescendants()) do
				if Humanoid:IsA("Humanoid") then
					table.insert(Players, Humanoid)
				end
			end
		end
		
		local function _() --[[ Line: 138 | Named "getCurrentHumanoid" ]]
			-- upvalues: updateHumanoidList (copy), Players (upval), v2 (upval)
			updateHumanoidList()
			
			return if #Players == 0 then nil else Players[v2]
		end
		
		local _ = function() --[[ Line: 147 | Named "getNextHumanoid" ]]
			-- upvalues: updateHumanoidList (copy), Players (upval), v2 (upval)
			updateHumanoidList()
			
			if #Players == 0 then
				return nil
			else
				v2 = v2 % #Players + 1
				
				return Players[v2]
			end
		end
		
		local _ = function(DisplayName) --[[ Line: 159 | Named "getHumanoidWithName" ]]
			-- upvalues: updateHumanoidList (copy), Players (upval)
			updateHumanoidList()
			
			if #Players == 0 then
				return nil
			end
			for _, player in ipairs(Players) do
				if player.DisplayName == DisplayName then
					return player
				end
			end
			return nil
		end
		
		local function StepFreecam(DeltaTime: number) --[[ Line: 177 ]]
			-- upvalues: Value (upval), UserInputService (upval), CF (upval), Interpolated (upval), Vector (upval), Workspace (upval)
			local ScaledValue = if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then Value * 3 else Value
			local Total = vector.create(0, 0, 0)
			
			if UserInputService:IsKeyDown(Enum.KeyCode.W) then
				Total += CF.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then
				Total -= CF.LookVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then
				Total += CF.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then
				Total -= CF.RightVector
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.E) then
				Total += vector.create(0, 1, 0)
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.Q) then
				Total -= vector.create(0, 1, 0)
			end
			if Total.Magnitude > 0 then
				Total = Total.Unit
			end
			local ScaledTotal: vector = Total * ScaledValue
			Interpolated = Interpolated:Lerp(ScaledTotal, 1 - math.exp(-10 * DeltaTime))
			
			if ScaledTotal.Magnitude == 0 and Interpolated.Magnitude < 0.1 then
				Interpolated = vector.create(0, 0, 0)
			end
			CF += Interpolated * DeltaTime
			
			if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
				UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
				local MouseDelta = UserInputService:GetMouseDelta()
				local IsXAbove: boolean = Vector == nil and (MouseDelta.X > 700 or MouseDelta.Y > 300)
				local IsMagnitudeAbove: boolean = Vector ~= nil and (math.abs(MouseDelta.X - Vector.X) > 300 or math.abs(MouseDelta.Y - Vector.Y) > 150)
				Vector = MouseDelta
				
				if not IsXAbove and not IsMagnitudeAbove then
					CF = CFrame.new(CF.Position) * (CFrame.Angles(0, math.rad(-MouseDelta.X * 0.4), 0) * CF.Rotation * CFrame.Angles(math.rad(-MouseDelta.Y * 0.4), 0, 0))
				end
			else
				UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			end
			Workspace.CurrentCamera.CFrame = CF
		end
		
		local function setCameraMode(p2: number) --[[ Line: 270 ]]
			-- upvalues: RunService (upval), UserInputService (upval), InputFrame (copy), DisplayName (upval), Workspace (upval), updateHumanoidList (copy), Players (upval), setCameraMode (copy), CreateTemporaryOverlayModule (upval), p1 (copy), CF (upval), StepFreecam (copy), Inverted (ref), SpeedTextBox (copy), Value (upval), SpeedLabel (copy), CameraSubject (upval), v2 (upval), v1 (upval)
			RunService:UnbindFromRenderStep("Freecam")
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
			InputFrame.Visible = false
			
			if DisplayName == nil then
				if Workspace.CurrentCamera.CameraSubject == nil then
					p2 = math.max(1, p2)
				else
					DisplayName = Workspace.CurrentCamera.CameraSubject.DisplayName
				end
			end
			if p2 == 0 then
				Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
				local DisplayName1 = DisplayName
				updateHumanoidList()
				local CameraSubject1 = nil
				
				if #Players == 0 then
					CameraSubject1 = nil
				else
					CameraSubject1 = nil
					
					for _, player in ipairs(Players) do
						if player.DisplayName == DisplayName1 then
							CameraSubject1 = player
							break
						end
					end
				end
				if CameraSubject1 == nil then
					warn("Default humanoid not found: " .. tostring(DisplayName))
					setCameraMode(1)
					
					return
				else
					Workspace.CurrentCamera.CameraSubject = CameraSubject1
					CreateTemporaryOverlayModule.showOverlay("Default Camera", 2, p1.screenGui)
					
					return
				end
			elseif p2 == 1 then
				Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
				Workspace.CurrentCamera.CameraSubject = nil
				CF = Workspace.CurrentCamera.CFrame
				RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
				InputFrame.Visible = Inverted
				SpeedTextBox.Text = tostring((math.floor(Value)))
				SpeedLabel.Text = "Free Cam Speed (Current: " .. math.floor(Value) .. ") Between 10 And 20000"
				CreateTemporaryOverlayModule.showOverlay("Free Camera", 2, p1.screenGui)
				
				return
			else
				if p2 == 2 then
					updateHumanoidList()
					CameraSubject = if #Players == 0 then nil else Players[v2]
					
					if CameraSubject then
						Workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
						Workspace.CurrentCamera.CameraSubject = CameraSubject
						CreateTemporaryOverlayModule.showOverlay("Follow " .. CameraSubject.DisplayName, 2, p1.screenGui)
						
						return
					else
						v1 = 0
						setCameraMode(0)
					end
				end
			end
		end
		
		local _ = function() --[[ Line: 342 | Named "cycleCameraMode" ]]
			-- upvalues: v1 (upval), setCameraMode (copy)
			v1 = (v1 + 1) % 3
			setCameraMode(v1)
		end
		
		local function onInputBegan(Input, GameProcessed) --[[ Line: 348 ]]
			-- upvalues: v1 (upval), setCameraMode (copy), updateHumanoidList (copy), Players (upval), v2 (upval), Inverted (ref), InputFrame (copy), SpeedTextBox (copy)
			if GameProcessed then return end
			if Input.KeyCode == Enum.KeyCode.C then
				v1 = (v1 + 1) % 3
				setCameraMode(v1)
			end
			if Input.KeyCode == Enum.KeyCode.N and v1 == 2 then
				updateHumanoidList()
				
				if #Players ~= 0 then
					v2 = v2 % #Players + 1
					local _ = Players[v2]
				end
				setCameraMode(2)
			end
			if Input.KeyCode == Enum.KeyCode.V and v1 == 1 then
				Inverted = not Inverted
				InputFrame.Visible = Inverted
				
				if Inverted then
					SpeedTextBox:CaptureFocus()
					
					return
				end
				SpeedTextBox:ReleaseFocus()
			end
		end
		
		updateHumanoidList()
		UserInputService.InputBegan:Connect(onInputBegan)
	end
}