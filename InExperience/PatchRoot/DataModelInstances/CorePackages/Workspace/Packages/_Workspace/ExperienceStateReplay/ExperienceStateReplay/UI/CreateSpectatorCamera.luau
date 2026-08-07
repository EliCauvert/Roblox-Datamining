local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local workspaceService = game:GetService("Workspace")
local createTemporaryOverlayModule = require(script.Parent.CreateTemporaryOverlay)
local var4 = nil
local var5 = nil
local var6 = 0
local t = {}
local var8 = 1
local var9 = nil
local var10 = 50
local var11 = Vector3.new(0, 0, 0)
local var12 = nil

return {
	createSpectatorCamera = function(p0) --[[ line: 41 ]]
		-- upvalues: var10 (write), t (write), var8 (write), userInputService (ref), var5 (write), var11 (write), var12 (write), workspaceService (ref), runService (ref), var4 (write), createTemporaryOverlayModule (ref), var9 (write), var6 (write)
		local inputFrame = Instance.new("Frame")
		inputFrame.Name = "InputFrame"
		inputFrame.Size = UDim2.new(0.4, 0, 0.15, 0)
		inputFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		inputFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		inputFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		inputFrame.BackgroundTransparency = 0.4
		inputFrame.BorderSizePixel = 0
		inputFrame.Visible = false
		inputFrame.Parent = p0.screenGui
		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 5)
		UIListLayout.Parent = inputFrame
		local speedLabel = Instance.new("TextLabel")
		speedLabel.Name = "SpeedLabel"
		speedLabel.Size = UDim2.new(0.9, 0, 0.3, 0)
		speedLabel.BackgroundTransparency = 1
		speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		speedLabel.Font = Enum.Font.SourceSans
		speedLabel.TextScaled = true
		speedLabel.Text = "Free Cam Speed (Current: " .. math.floor(var10) .. ") Between 10 And 20000"
		speedLabel.Parent = inputFrame
		local speedTextBox = Instance.new("TextBox")
		speedTextBox.Name = "SpeedTextBox"
		speedTextBox.Size = UDim2.new(0.9, 0, 0.25, 0)
		speedTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		speedTextBox.BackgroundTransparency = 0
		speedTextBox.Text = tostring(math.floor(var10))
		speedTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		speedTextBox.TextScaled = true
		speedTextBox.Font = Enum.Font.SourceSans
		speedTextBox.ClearTextOnFocus = true
		speedTextBox.TextXAlignment = Enum.TextXAlignment.Center
		speedTextBox.Parent = inputFrame
		local applyButton = Instance.new("TextButton")
		applyButton.Name = "ApplyButton"
		applyButton.Size = UDim2.new(0.9, 0, 0.25, 0)
		applyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
		applyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		applyButton.Text = "Apply Speed"
		applyButton.Font = Enum.Font.SourceSansBold
		applyButton.TextScaled = true
		applyButton.Parent = inputFrame
		applyButton.MouseButton1Click:Connect(function() --[[ line: 106 ]]
			-- upvalues: speedTextBox (ref), var10 (copy), speedLabel (ref)
			local ok, status = pcall(tonumber, speedTextBox.Text)
			
			if ok and type(status) == "number" and (status >= 10 and status <= 20000) then
				var10 = status
				speedLabel.Text = "Free Cam Speed (Current: " .. math.floor(var10) .. ") Between 10 And 20000"
				
				return
			end
			warn("Invalid speed input: " .. speedTextBox.Text .. ". Please enter a number between 10 and 20000.")
			speedTextBox.Text = tostring(math.floor(var10))
		end)
		local var18 = false
		
		local function updateHumanoidList() --[[ line: 126 ]]
			-- upvalues: t (copy)
			t = {}
			
			for i, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("Humanoid") then
					table.insert(t, v)
				end
			end
		end
		
		local function _() --[[ line: 138 | named "getCurrentHumanoid" ]]
			-- upvalues: updateHumanoidList (ref), t (copy), var8 (copy)
			updateHumanoidList()
			
			return if #t == 0 then nil else t[var8]
		end
		
		local _ = function() --[[ line: 147 | named "getNextHumanoid" ]]
			-- upvalues: updateHumanoidList (ref), t (copy), var8 (copy)
			updateHumanoidList()
			
			if #t == 0 then
				return nil
			end
			var8 = var8 % #t + 1
			
			return t[var8]
		end
		
		local _ = function(p1) --[[ line: 159 | named "getHumanoidWithName" ]]
			-- upvalues: updateHumanoidList (ref), t (copy)
			updateHumanoidList()
			
			if #t == 0 then
				return nil
			end
			for i, v in ipairs(t) do
				if v.DisplayName == p1 then
					return v
				end
			end
			return nil
		end
		
		local function StepFreecam(p2) --[[ line: 177 ]]
			-- upvalues: var10 (copy), userInputService (copy), var5 (copy), var11 (copy), var12 (copy), workspaceService (copy)
			local var23 = if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then var10 * 3 else var10
			local var24 = Vector3.new(0, 0, 0)
			
			if userInputService:IsKeyDown(Enum.KeyCode.W) then
				var24 += var5.LookVector
			end
			if userInputService:IsKeyDown(Enum.KeyCode.S) then
				var24 -= var5.LookVector
			end
			if userInputService:IsKeyDown(Enum.KeyCode.D) then
				var24 += var5.RightVector
			end
			if userInputService:IsKeyDown(Enum.KeyCode.A) then
				var24 -= var5.RightVector
			end
			if userInputService:IsKeyDown(Enum.KeyCode.E) then
				var24 += Vector3.new(0, 1, 0)
			end
			if userInputService:IsKeyDown(Enum.KeyCode.Q) then
				var24 -= Vector3.new(0, 1, 0)
			end
			if var24.Magnitude > 0 then
				var24 = var24.Unit
			end
			local var25 = var24 * var23
			var11 = var11:Lerp(var25, 1 - math.exp(-10 * p2))
			
			if var25.Magnitude == 0 and var11.Magnitude < 0.1 then
				var11 = Vector3.new(0, 0, 0)
			end
			var5 += var11 * p2
			
			if userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
				userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
				local mouseDelta = userInputService:GetMouseDelta()
				local var27 = var12 == nil and (if mouseDelta.X <= 700 then mouseDelta.Y > 300 else true)
				local var28 = var12 ~= nil and (if math.abs(mouseDelta.X - var12.X) <= 300 then math.abs(mouseDelta.Y - var12.Y) > 150 else true)
				var12 = mouseDelta
				
				if not var27 and not var28 then
					var5 = CFrame.new(var5.Position) * (CFrame.Angles(0, math.rad(-mouseDelta.X * 0.4), 0) * var5.Rotation * CFrame.Angles(math.rad(-mouseDelta.Y * 0.4), 0, 0))
				end
			else
				userInputService.MouseBehavior = Enum.MouseBehavior.Default
			end
			workspaceService.CurrentCamera.CFrame = var5
		end
		
		local function setCameraMode(value) --[[ line: 270 ]]
			-- upvalues: runService (copy), userInputService (copy), inputFrame (ref), var4 (copy), workspaceService (copy), updateHumanoidList (ref), t (copy), setCameraMode (ref), createTemporaryOverlayModule (copy), p0 (ref), var5 (copy), StepFreecam (ref), var18 (write), speedTextBox (ref), var10 (copy), speedLabel (ref), var9 (copy), var8 (copy), var6 (copy)
			runService:UnbindFromRenderStep("Freecam")
			userInputService.MouseBehavior = Enum.MouseBehavior.Default
			inputFrame.Visible = false
			
			if var4 == nil then
				if workspaceService.CurrentCamera.CameraSubject == nil then
					value = math.max(1, value)
				else
					var4 = workspaceService.CurrentCamera.CameraSubject.DisplayName
				end
			end
			if value == 0 then
				local var30
				workspaceService.CurrentCamera.CameraType = Enum.CameraType.Custom
				local var29 = var4
				updateHumanoidList()
				
				if #t == 0 then
					var30 = nil
				else
					for i, v in ipairs(t) do
						if v.DisplayName == var29 then
							var30 = v
						end
					end
					var30 = nil
				end
				if var30 == nil then
					warn("Default humanoid not found: " .. tostring(var4))
					setCameraMode(1)
					
					return
				end
				workspaceService.CurrentCamera.CameraSubject = var30
				createTemporaryOverlayModule.showOverlay("Default Camera", 2, p0.screenGui)
				
				return
			elseif value == 1 then
				workspaceService.CurrentCamera.CameraType = Enum.CameraType.Scriptable
				workspaceService.CurrentCamera.CameraSubject = nil
				var5 = workspaceService.CurrentCamera.CFrame
				runService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
				inputFrame.Visible = var18
				speedTextBox.Text = tostring(math.floor(var10))
				speedLabel.Text = "Free Cam Speed (Current: " .. math.floor(var10) .. ") Between 10 And 20000"
				createTemporaryOverlayModule.showOverlay("Free Camera", 2, p0.screenGui)
				
				return
			elseif value == 2 then
				updateHumanoidList()
				var9 = if #t == 0 then nil else t[var8]
				
				if var9 then
					workspaceService.CurrentCamera.CameraType = Enum.CameraType.Follow
					workspaceService.CurrentCamera.CameraSubject = var9
					createTemporaryOverlayModule.showOverlay("Follow " .. var9.DisplayName, 2, p0.screenGui)
					
					return
				end
				var6 = 0
				setCameraMode(0)
			end
		end
		
		local _ = function() --[[ line: 342 | named "cycleCameraMode" ]]
			-- upvalues: var6 (copy), setCameraMode (ref)
			var6 = (var6 + 1) % 3
			setCameraMode(var6)
		end
		
		local function onInputBegan(p3, p4) --[[ line: 348 ]]
			-- upvalues: var6 (copy), setCameraMode (ref), updateHumanoidList (ref), t (copy), var8 (copy), var18 (write), inputFrame (ref), speedTextBox (ref)
			if p4 then return end
			if p3.KeyCode == Enum.KeyCode.C then
				var6 = (var6 + 1) % 3
				setCameraMode(var6)
			end
			if p3.KeyCode == Enum.KeyCode.N and var6 == 2 then
				updateHumanoidList()
				
				if #t ~= 0 then
					var8 = var8 % #t + 1
					local _ = t[var8]
				end
				setCameraMode(2)
			end
			if p3.KeyCode == Enum.KeyCode.V and var6 == 1 then
				var18 = not var18
				inputFrame.Visible = var18
				
				if var18 then
					speedTextBox:CaptureFocus()
					
					return
				end
				speedTextBox:ReleaseFocus()
			end
		end
		
		updateHumanoidList()
		userInputService.InputBegan:Connect(onInputBegan)
	end
}