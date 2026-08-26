local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local proximityPromptService = game:GetService("ProximityPromptService")
local starterGuiService = game:GetService("StarterGui")
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local robloxGui = coreGuiService.RobloxGui
local captureMasterModule = require(robloxGui.Modules.CaptureMaster)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local permissionsProtocol = require(corePackagesService.Workspace.Packages.PermissionsProtocol).PermissionsProtocol
local promiseModule = require(corePackagesService.Packages.Promise)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts

if require(robloxGui.Modules.Flags.GetFFlagScreenshotHudApi)() then
	local screenshotHud = guiService:WaitForChild("ScreenshotHud")
	local t = {
		Default = {
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(0, 180, 109)
		},
		Hovered = {
			BackgroundTransparency = 0,
			BackgroundColor3 = Color3.fromRGB(0, 232, 126)
		},
		Pressed = {
			BackgroundTransparency = 0.5,
			BackgroundColor3 = Color3.fromRGB(0, 232, 126)
		}
	}
	local var1 = nil
	local var2 = nil
	local t_1 = {}
	local t_2 = {}
	local var3 = nil
	local var4 = false
	
	local function createFrame(p1, p2)
		local frame = Instance.new("Frame")
		frame.BackgroundColor3 = Color3.new(1, 1, 1)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Position = UDim2.new(0, 0, 0, 0)
		frame.Size = UDim2.new(1, 0, 1, 0)
		
		for i, v in pairs(p1) do
			frame[i] = v
		end
		frame.Parent = p2
		
		return frame
	end
	
	local function createImageLabel(p3, p4, p5)
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Image = p3
		imageLabel.BackgroundTransparency = 1
		imageLabel.BorderSizePixel = 0
		imageLabel.Position = UDim2.new(0, 0, 0, 0)
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		
		for i, v in pairs(p4) do
			imageLabel[i] = v
		end
		imageLabel.Parent = p5
		
		return imageLabel
	end
	
	local function createImageButton(p6, p7, p8)
		local imageButton = Instance.new("ImageButton")
		imageButton.Image = p6
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.Position = UDim2.new(0, 0, 0, 0)
		imageButton.Size = UDim2.new(1, 0, 1, 0)
		
		for i, v in pairs(p7) do
			imageButton[i] = v
		end
		imageButton.Parent = p8
		
		return imageButton
	end
	
	local function createTextLabel(p9, p10, p11)
		-- upvalues: appFonts (ref)
		local textLabel = Instance.new("TextLabel")
		textLabel.Text = p9
		textLabel.BackgroundTransparency = 1
		textLabel.BorderSizePixel = 0
		textLabel.Font = appFonts.default:getMedium()
		textLabel.Position = UDim2.new(0, 0, 0, 0)
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.TextSize = 20
		
		for i, v in pairs(p10) do
			textLabel[i] = v
		end
		textLabel.Parent = p11
		
		return textLabel
	end
	
	local guiInset, guiInset_1 = guiService:GetGuiInset()
	local var5 = createFrame({
		Name = "ScreenshotHudFrame",
		Visible = false,
		Position = UDim2.new(0, -guiInset.X, 0, -guiInset.Y),
		Size = UDim2.new(1, guiInset.X + guiInset_1.X, 1, guiInset.Y + guiInset_1.Y)
	}, robloxGui)
	local var6 = createFrame({
		Name = "ScreenshotHudContent",
		Visible = false,
		Position = UDim2.new(0, guiInset.X, 0, guiInset.Y),
		Size = UDim2.new(1, (-guiInset.X) - guiInset_1.X, 1, (-guiInset.Y) - guiInset_1.Y)
	}, var5)
	local var7 = createImageButton("", {
		AutoButtonColor = false,
		BackgroundTransparency = 0.5,
		Name = "CameraButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 180, 109),
		Position = UDim2.new(0.5, 0, 1, -50),
		Size = UDim2.fromOffset(64, 64)
	}, nil)
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 32)
	UICorner.Parent = var7
	local var8 = createImageLabel("", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = t.Default.BackgroundColor3,
		BackgroundTransparency = t.Default.BackgroundTransparency,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(52, 52)
	}, var7)
	local UICorner_1 = Instance.new("UICorner")
	UICorner_1.CornerRadius = UDim.new(0, 26)
	UICorner_1.Parent = var8
	local var9 = createImageLabel("rbxasset://textures/ui/ScreenshotHud/Camera.png", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(32, 32)
	}, var8)
	local var10 = createImageButton("", {
		BackgroundTransparency = 0,
		Name = "CloseButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(7, 7, 8),
		Position = UDim2.new(0.5, -66, 1, -50),
		Size = UDim2.fromOffset(48, 48)
	}, nil)
	local UICorner_2 = Instance.new("UICorner")
	UICorner_2.CornerRadius = UDim.new(0, 24)
	UICorner_2.Parent = var10
	local _ = createImageLabel("rbxasset://textures/ui/ScreenshotHud/Close.png", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(32, 32)
	}, var10)
	local var11 = createImageButton("", {
		BackgroundTransparency = 0,
		Name = "CameraButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 180, 109),
		Position = UDim2.new(1, -94, 1, -78),
		Size = UDim2.fromOffset(140, 36)
	}, nil)
	local UICorner_3 = Instance.new("UICorner")
	UICorner_3.CornerRadius = UDim.new(0, 18)
	UICorner_3.Parent = var11
	local _ = createImageLabel("rbxasset://textures/ui/Controls/xboxY.png", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 6, 0.5, 0),
		Size = UDim2.fromOffset(24, 24)
	}, var11)
	local _ = createTextLabel(robloxTranslatorModule:FormatByKey("CoreScripts.ScreenshotHud.Action.TakePhoto"), {
		TextScaled = true,
		TextWrapped = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 30, 0.5, 0),
		Size = UDim2.new(1, -36, 0, 20)
	}, var11)
	local var12 = createImageButton("", {
		BackgroundTransparency = 0,
		Name = "CloseButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(7, 7, 8),
		Position = UDim2.new(1, -228, 1, -78),
		Size = UDim2.fromOffset(104, 36)
	}, nil)
	local UICorner_4 = Instance.new("UICorner")
	UICorner_4.CornerRadius = UDim.new(0, 18)
	UICorner_4.Parent = var12
	local _ = createImageLabel("rbxasset://textures/ui/Controls/xboxB.png", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 6, 0.5, 0),
		Size = UDim2.fromOffset(24, 24)
	}, var12)
	local _ = createTextLabel(robloxTranslatorModule:FormatByKey("CoreScripts.ScreenshotHud.Action.Cancel"), {
		TextScaled = true,
		TextWrapped = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 30, 0.5, 0),
		Size = UDim2.new(1, -36, 0, 20)
	}, var12)
	local var13 = createFrame({
		Active = true,
		BackgroundTransparency = 0.5,
		Name = "FlashOverlay",
		Visible = false,
		ZIndex = 3
	}, var5)
	
	local function checkOrRequestExternalStoragePermissions()
		-- upvalues: permissionsProtocol (ref), promiseModule (ref)
		return permissionsProtocol.default:checkOrRequestPermissions({ permissionsProtocol.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(p12)
			-- upvalues: permissionsProtocol (copy), promiseModule (copy)
			return p12 == permissionsProtocol.Status.AUTHORIZED and promiseModule.resolve() or promiseModule.reject()
		end)
	end
	
	local function getEnabledPlayerScreenGuis()
		-- upvalues: playersService (ref)
		local t = {}
		
		for i, v in ipairs(playersService.LocalPlayer.PlayerGui:GetDescendants()) do
			if v:IsA("ScreenGui") and v.Enabled then
				table.insert(t, v)
			end
		end
		return t
	end
	
	local function getEnabledCoreGuiTypes()
		-- upvalues: starterGuiService (ref)
		local t = {}
		
		for i, v in ipairs(Enum.CoreGuiType:GetEnumItems()) do
			if starterGuiService:GetCoreGuiEnabled(v) then
				table.insert(t, v)
			end
		end
		return t
	end
	
	local var14 = function() end
	
	local function onCameraButtonActivated()
		-- upvalues: userInputService (ref), checkOrRequestExternalStoragePermissions (ref), var14 (write), captureMasterModule (ref)
		if userInputService:GetPlatform() == Enum.Platform.Android then
			checkOrRequestExternalStoragePermissions():andThen(var14, function()
				-- upvalues: captureMasterModule (copy)
				captureMasterModule:ShowPermissionToast()
			end)
			
			return
		end
		var14()
	end
	
	var14 = function()
		-- upvalues: captureMasterModule (ref), var3 (write), screenshotHud (ref), getEnabledPlayerScreenGuis (ref), getEnabledCoreGuiTypes (ref), starterGuiService (ref), proximityPromptService (ref), var6 (ref), playersService (ref), coreGuiService (ref), var13 (ref), var7 (ref), onCameraButtonActivated (ref), rbxAnalyticsService (ref)
		captureMasterModule:DismissNotification()
		
		if var3 then
			var3:Disconnect()
			var3 = nil
		end
		local var15 = false
		local var16 = false
		local var17 = nil
		
		if screenshotHud.HidePlayerGuiForCaptures then
			var17 = getEnabledPlayerScreenGuis()
			
			for i, v in ipairs(var17) do
				v.Enabled = false
			end
			var16 = true
		end
		local var18 = nil
		
		if screenshotHud.HideCoreGuiForCaptures then
			var18 = getEnabledCoreGuiTypes()
			
			for i, v in ipairs(var18) do
				starterGuiService:SetCoreGuiEnabled(v, false)
			end
			var15 = true
		end
		local enabled = proximityPromptService.Enabled
		proximityPromptService.Enabled = false
		var6.Visible = false
		wait(0.2)
		local t = {}
		
		for i, v in pairs(playersService:GetPlayers()) do
			local humanoid = v.Character and v.Character:WaitForChild("Humanoid")
			
			if humanoid then
				t[humanoid] = humanoid.DisplayDistanceType
				humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			end
		end
		coreGuiService:TakeScreenshot()
		wait(0.2)
		var6.Visible = true
		var13.Visible = true
		wait(0.2)
		var13.Visible = false
		var3 = var3 or var7.Activated:connect(onCameraButtonActivated)
		proximityPromptService.Enabled = enabled
		
		for i, v_1 in pairs(playersService:GetPlayers()) do
			local humanoid = v_1.Character and v_1.Character:WaitForChild("Humanoid")
			
			if humanoid and t[humanoid] then
				humanoid.DisplayDistanceType = t[humanoid]
			end
		end
		if var16 then
			for i, v_2 in ipairs(var17) do
				v_2.Enabled = true
			end
		end
		if var15 then
			for i, v_2 in ipairs(var18) do
				starterGuiService:SetCoreGuiEnabled(v_2, true)
			end
		end
		if screenshotHud.CloseWhenScreenshotTaken then
			screenshotHud.Visible = false
		end
		rbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "TakeScreenshot", { pid = tostring(game.PlaceId) })
	end
	
	local function _(p12)
		return p12.Name:match("^Gamepad*") ~= nil
	end
	
	local function updateGamepadButtons()
		-- upvalues: var1 (write), var2 (write), var4 (write), var11 (ref), var7 (ref), var12 (ref), var10 (ref), var6 (ref), screenshotHud (ref)
		if var1 then
			var1.Parent = nil
		end
		if var2 then
			var2.Parent = nil
		end
		var1 = if var4 then var11 else var7
		var2 = if var4 then var12 else var10
		var1.Parent = var6
		var2.Parent = var6
		
		if screenshotHud.CameraButtonPosition ~= UDim2.fromOffset(0, 0) then
			var1.Position = screenshotHud.CameraButtonPosition
		end
		if screenshotHud.CloseButtonPosition ~= UDim2.fromOffset(0, 0) then
			var2.Position = screenshotHud.CloseButtonPosition
		end
	end
	
	local function onLastInputTypeChanged(p12)
		-- upvalues: userInputService (ref), var4 (write), updateGamepadButtons (ref)
		local var19 = (p12 or userInputService:GetLastInputType()).Name:match("^Gamepad*") ~= nil
		
		if var4 ~= var19 then
			var4 = var19
			updateGamepadButtons()
		end
	end
	
	local function setupConnections()
		-- upvalues: var7 (ref), var8 (ref), t (ref), t_1 (write), var3 (write), onCameraButtonActivated (ref), var10 (ref), screenshotHud (ref), contextActionService (ref), t_2 (write), userInputService (ref), var4 (write), updateGamepadButtons (ref), onLastInputTypeChanged (ref)
		table.insert(t_1, var7.InputBegan:Connect(function(p12)
			-- upvalues: var8 (copy), t (copy)
			if p12.UserInputType == Enum.UserInputType.MouseMovement then
				var8.BackgroundColor3 = t.Hovered.BackgroundColor3
				var8.BackgroundTransparency = t.Hovered.BackgroundTransparency
				
				return
			elseif p12.UserInputType == Enum.UserInputType.MouseButton1 or p12.UserInputType == Enum.UserInputType.Touch then
				var8.BackgroundColor3 = t.Pressed.BackgroundColor3
				var8.BackgroundTransparency = t.Pressed.BackgroundTransparency
			end
		end))
		table.insert(t_1, var7.InputEnded:Connect(function()
			-- upvalues: var8 (copy), t (copy)
			var8.BackgroundColor3 = t.Default.BackgroundColor3
			var8.BackgroundTransparency = t.Default.BackgroundTransparency
		end))
		
		if var3 then
			var3:Disconnect()
			var3 = nil
		end
		var3 = var7.Activated:connect(onCameraButtonActivated)
		table.insert(t_1, var3)
		table.insert(t_1, var10.Activated:connect(function()
			-- upvalues: screenshotHud (copy)
			screenshotHud.Visible = false
		end))
		contextActionService:BindAction("ScreenshotHudGamepadClose", function(_, p12, p13)
			-- upvalues: screenshotHud (copy)
			if p12 == Enum.UserInputState.End and p13.UserInputType.Name:match("^Gamepad*") ~= nil then
				screenshotHud.Visible = false
			end
		end, false, Enum.KeyCode.ButtonB)
		table.insert(t_2, "ScreenshotHudGamepadClose")
		contextActionService:BindAction("ScreenshotHudGamepadCamera", function(_, p12, p13)
			-- upvalues: onCameraButtonActivated (copy)
			if p12 == Enum.UserInputState.End and p13.UserInputType.Name:match("^Gamepad*") ~= nil then
				onCameraButtonActivated()
			end
		end, false, Enum.KeyCode.ButtonY)
		table.insert(t_2, "ScreenshotHudGamepadCamera")
		local _ = nil
		local var19 = userInputService:GetLastInputType().Name:match("^Gamepad*") ~= nil
		
		if var4 ~= var19 then
			var4 = var19
			updateGamepadButtons()
		end
		table.insert(t_1, userInputService.LastInputTypeChanged:Connect(onLastInputTypeChanged))
	end
	
	local function disconnectAll()
		-- upvalues: t_1 (write), t_2 (write), contextActionService (ref)
		for i, v in ipairs(t_1) do
			v:Disconnect()
			v = nil
		end
		t_1 = {}
		
		for i, v_1 in ipairs(t_2) do
			contextActionService:UnbindAction(v_1)
		end
		t_2 = {}
	end
	
	local function screenshotHudEnabled(p12)
		-- upvalues: var5 (ref), screenshotHud (ref), disconnectAll (ref), var6 (ref), var13 (ref), setupConnections (ref), captureMasterModule (ref), rbxAnalyticsService (ref)
		var5.Visible = screenshotHud.Visible
		disconnectAll()
		
		if screenshotHud.Visible then
			var6.Visible = true
			var13.Visible = false
			setupConnections()
			captureMasterModule:Start()
		end
		rbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "ScreenshotHudEnabled", { pid = tostring(game.PlaceId), enabled = p12 })
	end
	
	screenshotHud:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: screenshotHudEnabled (ref), screenshotHud (ref)
		screenshotHudEnabled(screenshotHud.Visible)
	end)
	screenshotHud:GetPropertyChangedSignal("CameraButtonIcon"):Connect(function()
		-- upvalues: var9 (ref), screenshotHud (ref), rbxAnalyticsService (ref)
		var9.Image = screenshotHud.CameraButtonIcon or "rbxasset://textures/ui/ScreenshotHud/Camera.png"
		rbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "CameraButtonIcon", {
			pid = tostring(game.PlaceId),
			icon = screenshotHud.CameraButtonIcon
		})
	end)
	screenshotHud:GetPropertyChangedSignal("CameraButtonPosition"):Connect(function()
		-- upvalues: var1 (write), screenshotHud (ref), rbxAnalyticsService (ref)
		var1.Position = screenshotHud.CameraButtonPosition
		rbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "CameraButtonPosition", {
			pid = tostring(game.PlaceId),
			position = tostring(screenshotHud.CameraButtonPosition)
		})
	end)
	screenshotHud:GetPropertyChangedSignal("CloseButtonPosition"):Connect(function()
		-- upvalues: var2 (write), screenshotHud (ref), rbxAnalyticsService (ref)
		var2.Position = screenshotHud.CloseButtonPosition
		rbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "CloseButtonPosition", {
			pid = tostring(game.PlaceId),
			position = tostring(screenshotHud.CloseButtonPosition)
		})
	end)
	updateGamepadButtons()
	screenshotHudEnabled(screenshotHud.Visible)
	
	return
end