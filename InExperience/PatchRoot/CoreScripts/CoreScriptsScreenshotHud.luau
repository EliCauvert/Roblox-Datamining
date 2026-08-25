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
	local var14 = nil
	local var15 = nil
	local t_1 = {}
	local t_2 = {}
	local var18 = nil
	local var19 = false
	
	local function createFrame(p0, p1)
		local frame = Instance.new("Frame")
		frame.BackgroundColor3 = Color3.new(1, 1, 1)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.Position = UDim2.new(0, 0, 0, 0)
		frame.Size = UDim2.new(1, 0, 1, 0)
		
		for i, v in pairs(p0) do
			frame[i] = v
		end
		frame.Parent = p1
		
		return frame
	end
	
	local function createImageLabel(p2, p3, p4)
		local imageLabel = Instance.new("ImageLabel")
		imageLabel.Image = p2
		imageLabel.BackgroundTransparency = 1
		imageLabel.BorderSizePixel = 0
		imageLabel.Position = UDim2.new(0, 0, 0, 0)
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		
		for i, v in pairs(p3) do
			imageLabel[i] = v
		end
		imageLabel.Parent = p4
		
		return imageLabel
	end
	
	local function createImageButton(p5, p6, p7)
		local imageButton = Instance.new("ImageButton")
		imageButton.Image = p5
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.Position = UDim2.new(0, 0, 0, 0)
		imageButton.Size = UDim2.new(1, 0, 1, 0)
		
		for i, v in pairs(p6) do
			imageButton[i] = v
		end
		imageButton.Parent = p7
		
		return imageButton
	end
	
	local function createTextLabel(p8, p9, p10)
		-- upvalues: appFonts (ref)
		local textLabel = Instance.new("TextLabel")
		textLabel.Text = p8
		textLabel.BackgroundTransparency = 1
		textLabel.BorderSizePixel = 0
		textLabel.Font = appFonts.default:getMedium()
		textLabel.Position = UDim2.new(0, 0, 0, 0)
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.TextColor3 = Color3.new(1, 1, 1)
		textLabel.TextSize = 20
		
		for i, v in pairs(p9) do
			textLabel[i] = v
		end
		textLabel.Parent = p10
		
		return textLabel
	end
	
	local guiInset, guiInset_1 = guiService:GetGuiInset()
	local var26 = createFrame({
		Name = "ScreenshotHudFrame",
		Visible = false,
		Position = UDim2.new(0, -guiInset.X, 0, -guiInset.Y),
		Size = UDim2.new(1, guiInset.X + guiInset_1.X, 1, guiInset.Y + guiInset_1.Y)
	}, robloxGui)
	local var27 = createFrame({
		Name = "ScreenshotHudContent",
		Visible = false,
		Position = UDim2.new(0, guiInset.X, 0, guiInset.Y),
		Size = UDim2.new(1, (-guiInset.X) - guiInset_1.X, 1, (-guiInset.Y) - guiInset_1.Y)
	}, var26)
	local var28 = createImageButton("", {
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
	UICorner.Parent = var28
	local var30 = createImageLabel("", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = t.Default.BackgroundColor3,
		BackgroundTransparency = t.Default.BackgroundTransparency,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(52, 52)
	}, var28)
	local UICorner_1 = Instance.new("UICorner")
	UICorner_1.CornerRadius = UDim.new(0, 26)
	UICorner_1.Parent = var30
	local var32 = createImageLabel("rbxasset://textures/ui/ScreenshotHud/Camera.png", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(32, 32)
	}, var30)
	local var33 = createImageButton("", {
		BackgroundTransparency = 0,
		Name = "CloseButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(7, 7, 8),
		Position = UDim2.new(0.5, -66, 1, -50),
		Size = UDim2.fromOffset(48, 48)
	}, nil)
	local UICorner_2 = Instance.new("UICorner")
	UICorner_2.CornerRadius = UDim.new(0, 24)
	UICorner_2.Parent = var33
	local _ = createImageLabel("rbxasset://textures/ui/ScreenshotHud/Close.png", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(32, 32)
	}, var33)
	local var35 = createImageButton("", {
		BackgroundTransparency = 0,
		Name = "CameraButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 180, 109),
		Position = UDim2.new(1, -94, 1, -78),
		Size = UDim2.fromOffset(140, 36)
	}, nil)
	local UICorner_3 = Instance.new("UICorner")
	UICorner_3.CornerRadius = UDim.new(0, 18)
	UICorner_3.Parent = var35
	local _ = createImageLabel("rbxasset://textures/ui/Controls/xboxY.png", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 6, 0.5, 0),
		Size = UDim2.fromOffset(24, 24)
	}, var35)
	local _ = createTextLabel(robloxTranslatorModule:FormatByKey("CoreScripts.ScreenshotHud.Action.TakePhoto"), {
		TextScaled = true,
		TextWrapped = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 30, 0.5, 0),
		Size = UDim2.new(1, -36, 0, 20)
	}, var35)
	local var37 = createImageButton("", {
		BackgroundTransparency = 0,
		Name = "CloseButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(7, 7, 8),
		Position = UDim2.new(1, -228, 1, -78),
		Size = UDim2.fromOffset(104, 36)
	}, nil)
	local UICorner_4 = Instance.new("UICorner")
	UICorner_4.CornerRadius = UDim.new(0, 18)
	UICorner_4.Parent = var37
	local _ = createImageLabel("rbxasset://textures/ui/Controls/xboxB.png", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 6, 0.5, 0),
		Size = UDim2.fromOffset(24, 24)
	}, var37)
	local _ = createTextLabel(robloxTranslatorModule:FormatByKey("CoreScripts.ScreenshotHud.Action.Cancel"), {
		TextScaled = true,
		TextWrapped = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 30, 0.5, 0),
		Size = UDim2.new(1, -36, 0, 20)
	}, var37)
	local var39 = createFrame({
		Active = true,
		BackgroundTransparency = 0.5,
		Name = "FlashOverlay",
		Visible = false,
		ZIndex = 3
	}, var26)
	
	local function checkOrRequestExternalStoragePermissions()
		-- upvalues: permissionsProtocol (ref), promiseModule (ref)
		return permissionsProtocol.default:checkOrRequestPermissions({ permissionsProtocol.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(p11)
			-- upvalues: permissionsProtocol (copy), promiseModule (copy)
			return p11 == permissionsProtocol.Status.AUTHORIZED and promiseModule.resolve() or promiseModule.reject()
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
	
	local var43 = function() end
	
	local function onCameraButtonActivated()
		-- upvalues: userInputService (ref), checkOrRequestExternalStoragePermissions (ref), var43 (write), captureMasterModule (ref)
		if userInputService:GetPlatform() == Enum.Platform.Android then
			checkOrRequestExternalStoragePermissions():andThen(var43, function()
				-- upvalues: captureMasterModule (copy)
				captureMasterModule:ShowPermissionToast()
			end)
			
			return
		end
		var43()
	end
	
	var43 = function()
		-- upvalues: captureMasterModule (ref), var18 (write), screenshotHud (ref), getEnabledPlayerScreenGuis (ref), getEnabledCoreGuiTypes (ref), starterGuiService (ref), proximityPromptService (ref), var27 (ref), playersService (ref), coreGuiService (ref), var39 (ref), var28 (ref), onCameraButtonActivated (ref), rbxAnalyticsService (ref)
		captureMasterModule:DismissNotification()
		
		if var18 then
			var18:Disconnect()
			var18 = nil
		end
		local var56 = false
		local var57 = false
		local var58 = nil
		
		if screenshotHud.HidePlayerGuiForCaptures then
			var58 = getEnabledPlayerScreenGuis()
			
			for i, v in ipairs(var58) do
				v.Enabled = false
			end
			var57 = true
		end
		local var59 = nil
		
		if screenshotHud.HideCoreGuiForCaptures then
			var59 = getEnabledCoreGuiTypes()
			
			for i, v in ipairs(var59) do
				starterGuiService:SetCoreGuiEnabled(v, false)
			end
			var56 = true
		end
		local enabled = proximityPromptService.Enabled
		proximityPromptService.Enabled = false
		var27.Visible = false
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
		var27.Visible = true
		var39.Visible = true
		wait(0.2)
		var39.Visible = false
		var18 = var18 or var28.Activated:connect(onCameraButtonActivated)
		proximityPromptService.Enabled = enabled
		
		for i, v_1 in pairs(playersService:GetPlayers()) do
			local humanoid = v_1.Character and v_1.Character:WaitForChild("Humanoid")
			
			if humanoid and t[humanoid] then
				humanoid.DisplayDistanceType = t[humanoid]
			end
		end
		if var57 then
			for i, v_2 in ipairs(var58) do
				v_2.Enabled = true
			end
		end
		if var56 then
			for i, v_2 in ipairs(var59) do
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
		-- upvalues: var14 (write), var15 (write), var19 (write), var35 (ref), var28 (ref), var37 (ref), var33 (ref), var27 (ref), screenshotHud (ref)
		if var14 then
			var14.Parent = nil
		end
		if var15 then
			var15.Parent = nil
		end
		var14 = if var19 then var35 else var28
		var15 = if var19 then var37 else var33
		var14.Parent = var27
		var15.Parent = var27
		
		if screenshotHud.CameraButtonPosition ~= UDim2.fromOffset(0, 0) then
			var14.Position = screenshotHud.CameraButtonPosition
		end
		if screenshotHud.CloseButtonPosition ~= UDim2.fromOffset(0, 0) then
			var15.Position = screenshotHud.CloseButtonPosition
		end
	end
	
	local function onLastInputTypeChanged(p13)
		-- upvalues: userInputService (ref), var19 (write), updateGamepadButtons (ref)
		local var63 = (p13 or userInputService:GetLastInputType()).Name:match("^Gamepad*") ~= nil
		
		if var19 ~= var63 then
			var19 = var63
			updateGamepadButtons()
		end
	end
	
	local function setupConnections()
		-- upvalues: var28 (ref), var30 (ref), t (ref), t_1 (write), var18 (write), onCameraButtonActivated (ref), var33 (ref), screenshotHud (ref), contextActionService (ref), t_2 (write), userInputService (ref), var19 (write), updateGamepadButtons (ref), onLastInputTypeChanged (ref)
		table.insert(t_1, var28.InputBegan:Connect(function(p14)
			-- upvalues: var30 (copy), t (copy)
			if p14.UserInputType == Enum.UserInputType.MouseMovement then
				var30.BackgroundColor3 = t.Hovered.BackgroundColor3
				var30.BackgroundTransparency = t.Hovered.BackgroundTransparency
				
				return
			elseif p14.UserInputType == Enum.UserInputType.MouseButton1 or p14.UserInputType == Enum.UserInputType.Touch then
				var30.BackgroundColor3 = t.Pressed.BackgroundColor3
				var30.BackgroundTransparency = t.Pressed.BackgroundTransparency
			end
		end))
		table.insert(t_1, var28.InputEnded:Connect(function()
			-- upvalues: var30 (copy), t (copy)
			var30.BackgroundColor3 = t.Default.BackgroundColor3
			var30.BackgroundTransparency = t.Default.BackgroundTransparency
		end))
		
		if var18 then
			var18:Disconnect()
			var18 = nil
		end
		var18 = var28.Activated:connect(onCameraButtonActivated)
		table.insert(t_1, var18)
		table.insert(t_1, var33.Activated:connect(function()
			-- upvalues: screenshotHud (copy)
			screenshotHud.Visible = false
		end))
		contextActionService:BindAction("ScreenshotHudGamepadClose", function(_, p15, p16)
			-- upvalues: screenshotHud (copy)
			if p15 == Enum.UserInputState.End and p16.UserInputType.Name:match("^Gamepad*") ~= nil then
				screenshotHud.Visible = false
			end
		end, false, Enum.KeyCode.ButtonB)
		table.insert(t_2, "ScreenshotHudGamepadClose")
		contextActionService:BindAction("ScreenshotHudGamepadCamera", function(_, p17, p18)
			-- upvalues: onCameraButtonActivated (copy)
			if p17 == Enum.UserInputState.End and p18.UserInputType.Name:match("^Gamepad*") ~= nil then
				onCameraButtonActivated()
			end
		end, false, Enum.KeyCode.ButtonY)
		table.insert(t_2, "ScreenshotHudGamepadCamera")
		local _ = nil
		local var64 = userInputService:GetLastInputType().Name:match("^Gamepad*") ~= nil
		
		if var19 ~= var64 then
			var19 = var64
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
	
	local function screenshotHudEnabled(p19)
		-- upvalues: var26 (ref), screenshotHud (ref), disconnectAll (ref), var27 (ref), var39 (ref), setupConnections (ref), captureMasterModule (ref), rbxAnalyticsService (ref)
		var26.Visible = screenshotHud.Visible
		disconnectAll()
		
		if screenshotHud.Visible then
			var27.Visible = true
			var39.Visible = false
			setupConnections()
			captureMasterModule:Start()
		end
		rbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "ScreenshotHudEnabled", { pid = tostring(game.PlaceId), enabled = p19 })
	end
	
	screenshotHud:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: screenshotHudEnabled (ref), screenshotHud (ref)
		screenshotHudEnabled(screenshotHud.Visible)
	end)
	screenshotHud:GetPropertyChangedSignal("CameraButtonIcon"):Connect(function()
		-- upvalues: var32 (ref), screenshotHud (ref), rbxAnalyticsService (ref)
		var32.Image = screenshotHud.CameraButtonIcon or "rbxasset://textures/ui/ScreenshotHud/Camera.png"
		rbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "CameraButtonIcon", {
			pid = tostring(game.PlaceId),
			icon = screenshotHud.CameraButtonIcon
		})
	end)
	screenshotHud:GetPropertyChangedSignal("CameraButtonPosition"):Connect(function()
		-- upvalues: var14 (write), screenshotHud (ref), rbxAnalyticsService (ref)
		var14.Position = screenshotHud.CameraButtonPosition
		rbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "CameraButtonPosition", {
			pid = tostring(game.PlaceId),
			position = tostring(screenshotHud.CameraButtonPosition)
		})
	end)
	screenshotHud:GetPropertyChangedSignal("CloseButtonPosition"):Connect(function()
		-- upvalues: var15 (write), screenshotHud (ref), rbxAnalyticsService (ref)
		var15.Position = screenshotHud.CloseButtonPosition
		rbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "CloseButtonPosition", {
			pid = tostring(game.PlaceId),
			position = tostring(screenshotHud.CloseButtonPosition)
		})
	end)
	updateGamepadButtons()
	screenshotHudEnabled(screenshotHud.Visible)
	
	return
end