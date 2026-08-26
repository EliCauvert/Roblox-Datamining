local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local workspaceService = game:GetService("Workspace")
local createTemporaryOverlayModule = require(script.Parent.CreateTemporaryOverlay)
local var1 = nil
local var2 = nil
local var3 = 0
local t = {}
local var4 = 1
local var5 = nil
local var6 = 50
local var7 = Vector3.new(0, 0, 0)
local var8 = nil

return {
	createSpectatorCamera = function(p1)
		-- upvalues: var6 (write), t (write), var4 (write), userInputService (ref), var2 (write), var7 (write), var8 (write), workspaceService (ref), runService (ref), var1 (write), createTemporaryOverlayModule (ref), var5 (write), var3 (write)
		local inputFrame = Instance.new("Frame")
		inputFrame.Name = "InputFrame"
		inputFrame.Size = UDim2.new(0.4, 0, 0.15, 0)
		inputFrame.AnchorPoint = Vector2.new(0.5, 0.5)
		inputFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
		inputFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		inputFrame.BackgroundTransparency = 0.4
		inputFrame.BorderSizePixel = 0
		inputFrame.Visible = false
		inputFrame.Parent = p1.screenGui
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
		speedLabel.Text = "Free Cam Speed (Current: " .. math.floor(var6) .. ") Between 10 And 20000"
		speedLabel.Parent = inputFrame
		local speedTextBox = Instance.new("TextBox")
		speedTextBox.Name = "SpeedTextBox"
		speedTextBox.Size = UDim2.new(0.9, 0, 0.25, 0)
		speedTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		speedTextBox.BackgroundTransparency = 0
		speedTextBox.Text = tostring(math.floor(var6))
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
		applyButton.MouseButton1Click:Connect(function()
			-- upvalues: speedTextBox (ref), var6 (copy), speedLabel (ref)
			local ok, status = pcall(tonumber, speedTextBox.Text)
			
			if ok and type(status) == "number" and (status >= 10 and status <= 20000) then
				var6 = status
				speedLabel.Text = "Free Cam Speed (Current: " .. math.floor(var6) .. ") Between 10 And 20000"
				
				return
			end
			warn("Invalid speed input: " .. speedTextBox.Text .. ". Please enter a number between 10 and 20000.")
			speedTextBox.Text = tostring(math.floor(var6))
		end)
		local var9 = false
		
		local function updateHumanoidList()
			-- upvalues: t (copy)
			t = {}
			
			for i, v in ipairs(workspace:GetDescendants()) do
				if v:IsA("Humanoid") then
					table.insert(t, v)
				end
			end
		end
		
		local function _()
			-- upvalues: updateHumanoidList (ref), t (copy), var4 (copy)
			updateHumanoidList()
			
			return if #t == 0 then nil else t[var4]
		end
		
		local _ = function()
			-- upvalues: updateHumanoidList (ref), t (copy), var4 (copy)
			updateHumanoidList()
			
			if #t == 0 then
				return nil
			end
			var4 = var4 % #t + 1
			
			return t[var4]
		end
		
		local _ = function(p2)
			-- upvalues: updateHumanoidList (ref), t (copy)
			updateHumanoidList()
			
			if #t == 0 then
				return nil
			end
			for i, v in ipairs(t) do
				if v.DisplayName == p2 then
					return v
				end
			end
			return nil
		end
		
		local function StepFreecam(p3)
			-- upvalues: var6 (copy), userInputService (copy), var2 (copy), var7 (copy), var8 (copy), workspaceService (copy)
			local var10 = if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then var6 * 3 else var6
			local var11 = Vector3.new(0, 0, 0)
			
			if userInputService:IsKeyDown(Enum.KeyCode.W) then
				var11 += var2.LookVector
			end
			if userInputService:IsKeyDown(Enum.KeyCode.S) then
				var11 -= var2.LookVector
			end
			if userInputService:IsKeyDown(Enum.KeyCode.D) then
				var11 += var2.RightVector
			end
			if userInputService:IsKeyDown(Enum.KeyCode.A) then
				var11 -= var2.RightVector
			end
			if userInputService:IsKeyDown(Enum.KeyCode.E) then
				var11 += Vector3.new(0, 1, 0)
			end
			if userInputService:IsKeyDown(Enum.KeyCode.Q) then
				var11 -= Vector3.new(0, 1, 0)
			end
			if var11.Magnitude > 0 then
				var11 = var11.Unit
			end
			local var12 = var11 * var10
			var7 = var7:Lerp(var12, 1 - math.exp(-10 * p3))
			
			if var12.Magnitude == 0 and var7.Magnitude < 0.1 then
				var7 = Vector3.new(0, 0, 0)
			end
			var2 += var7 * p3
			
			if userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
				userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
				local mouseDelta = userInputService:GetMouseDelta()
				local var13 = var8 == nil and (if mouseDelta.X <= 700 then mouseDelta.Y > 300 else true)
				local var14 = var8 ~= nil and (if math.abs(mouseDelta.X - var8.X) <= 300 then math.abs(mouseDelta.Y - var8.Y) > 150 else true)
				var8 = mouseDelta
				
				if not var13 and not var14 then
					var2 = CFrame.new(var2.Position) * (CFrame.Angles(0, math.rad(-mouseDelta.X * 0.4), 0) * var2.Rotation * CFrame.Angles(math.rad(-mouseDelta.Y * 0.4), 0, 0))
				end
			else
				userInputService.MouseBehavior = Enum.MouseBehavior.Default
			end
			workspaceService.CurrentCamera.CFrame = var2
		end
		
		local function setCameraMode(value)
			-- upvalues: runService (copy), userInputService (copy), inputFrame (ref), var1 (copy), workspaceService (copy), updateHumanoidList (ref), t (copy), setCameraMode (ref), createTemporaryOverlayModule (copy), p1 (ref), var2 (copy), StepFreecam (ref), var9 (write), speedTextBox (ref), var6 (copy), speedLabel (ref), var5 (copy), var4 (copy), var3 (copy)
			runService:UnbindFromRenderStep("Freecam")
			userInputService.MouseBehavior = Enum.MouseBehavior.Default
			inputFrame.Visible = false
			
			if var1 == nil then
				if workspaceService.CurrentCamera.CameraSubject == nil then
					value = math.max(1, value)
				else
					var1 = workspaceService.CurrentCamera.CameraSubject.DisplayName
				end
			end
			if value == 0 then
				local var10
				workspaceService.CurrentCamera.CameraType = Enum.CameraType.Custom
				local var11 = var1
				updateHumanoidList()
				
				if #t == 0 then
					var10 = nil
				else
					for i, v in ipairs(t) do
						if v.DisplayName == var11 then
							var10 = v
						end
					end
					var10 = nil
				end
				if var10 == nil then
					warn("Default humanoid not found: " .. tostring(var1))
					setCameraMode(1)
					
					return
				end
				workspaceService.CurrentCamera.CameraSubject = var10
				createTemporaryOverlayModule.showOverlay("Default Camera", 2, p1.screenGui)
				
				return
			elseif value == 1 then
				workspaceService.CurrentCamera.CameraType = Enum.CameraType.Scriptable
				workspaceService.CurrentCamera.CameraSubject = nil
				var2 = workspaceService.CurrentCamera.CFrame
				runService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
				inputFrame.Visible = var9
				speedTextBox.Text = tostring(math.floor(var6))
				speedLabel.Text = "Free Cam Speed (Current: " .. math.floor(var6) .. ") Between 10 And 20000"
				createTemporaryOverlayModule.showOverlay("Free Camera", 2, p1.screenGui)
				
				return
			elseif value == 2 then
				updateHumanoidList()
				var5 = if #t == 0 then nil else t[var4]
				
				if var5 then
					workspaceService.CurrentCamera.CameraType = Enum.CameraType.Follow
					workspaceService.CurrentCamera.CameraSubject = var5
					createTemporaryOverlayModule.showOverlay("Follow " .. var9.DisplayName, 2, p1.screenGui)
					
					return
				end
				var3 = 0
				setCameraMode(0)
			end
		end
		
		local _ = function()
			-- upvalues: var3 (copy), setCameraMode (ref)
			var3 = (var3 + 1) % 3
			setCameraMode(var3)
		end
		
		local function onInputBegan(p3, p4)
			-- upvalues: var3 (copy), setCameraMode (ref), updateHumanoidList (ref), t (copy), var4 (copy), var9 (write), inputFrame (ref), speedTextBox (ref)
			if p4 then return end
			if p3.KeyCode == Enum.KeyCode.C then
				var3 = (var3 + 1) % 3
				setCameraMode(var3)
			end
			if p3.KeyCode == Enum.KeyCode.N and var3 == 2 then
				updateHumanoidList()
				
				if #t ~= 0 then
					var4 = var4 % #t + 1
					local _ = t[var4]
				end
				setCameraMode(2)
			end
			if p3.KeyCode == Enum.KeyCode.V and var3 == 1 then
				var9 = not var9
				inputFrame.Visible = var9
				
				if var9 then
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