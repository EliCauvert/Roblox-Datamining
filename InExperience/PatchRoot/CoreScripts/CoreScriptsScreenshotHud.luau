local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local RobloxGui = CoreGui.RobloxGui
local CaptureMasterModule = require(RobloxGui.Modules.CaptureMaster)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local PermissionsProtocol = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol
local PromiseModule = require(CorePackages.Packages.Promise)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts

if require(RobloxGui.Modules.Flags.GetFFlagScreenshotHudApi)() then
	local ScreenshotHud = GuiService:WaitForChild("ScreenshotHud")
	local config = {
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
	local v1 = nil
	local v2 = nil
	local List = {}
	local List1 = {}
	local ActivatedConnection = nil
	local HasGamepad = false
	
	local function createFrame(List, ScreenshotHudFrame)
		local Frame = Instance.new("Frame")
		Frame.BackgroundColor3 = Color3.new(1, 1, 1)
		Frame.BackgroundTransparency = 1
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0, 0, 0, 0)
		Frame.Size = UDim2.new(1, 0, 1, 0)
		
		for i, value in pairs(List) do
			Frame[i] = value
		end
		Frame.Parent = ScreenshotHudFrame
		
		return Frame
	end
	
	local function createImageLabel(Image, List, Parent)
		local Image1 = Instance.new("ImageLabel")
		Image1.Image = Image
		Image1.BackgroundTransparency = 1
		Image1.BorderSizePixel = 0
		Image1.Position = UDim2.new(0, 0, 0, 0)
		Image1.Size = UDim2.new(1, 0, 1, 0)
		
		for i, value in pairs(List) do
			Image1[i] = value
		end
		Image1.Parent = Parent
		
		return Image1
	end
	
	local function createImageButton(Image, List, Parent)
		local ImageButton = Instance.new("ImageButton")
		ImageButton.Image = Image
		ImageButton.BackgroundTransparency = 1
		ImageButton.BorderSizePixel = 0
		ImageButton.Position = UDim2.new(0, 0, 0, 0)
		ImageButton.Size = UDim2.new(1, 0, 1, 0)
		
		for i, value in pairs(List) do
			ImageButton[i] = value
		end
		ImageButton.Parent = Parent
		
		return ImageButton
	end
	
	local function createTextLabel(Text, List, Parent)
		-- upvalues: AppFonts (copy)
		local Label = Instance.new("TextLabel")
		Label.Text = Text
		Label.BackgroundTransparency = 1
		Label.BorderSizePixel = 0
		Label.Font = AppFonts.default:getMedium()
		Label.Position = UDim2.new(0, 0, 0, 0)
		Label.Size = UDim2.new(1, 0, 1, 0)
		Label.TextColor3 = Color3.new(1, 1, 1)
		Label.TextSize = 20
		
		for i, value in pairs(List) do
			Label[i] = value
		end
		Label.Parent = Parent
		
		return Label
	end
	
	local GuiInset, GuiInset2 = GuiService:GetGuiInset()
	local ScreenshotHudFrame = createFrame({
		Name = "ScreenshotHudFrame",
		Visible = false,
		Position = UDim2.new(0, -GuiInset.X, 0, -GuiInset.Y),
		Size = UDim2.new(1, GuiInset.X + GuiInset2.X, 1, GuiInset.Y + GuiInset2.Y)
	}, RobloxGui)
	local ScreenshotHudContent = createFrame({
		Name = "ScreenshotHudContent",
		Visible = false,
		Position = UDim2.new(0, GuiInset.X, 0, GuiInset.Y),
		Size = UDim2.new(1, -GuiInset.X - GuiInset2.X, 1, -GuiInset.Y - GuiInset2.Y)
	}, ScreenshotHudFrame)
	local ImageButton = createImageButton("", {
		AutoButtonColor = false,
		BackgroundTransparency = 0.5,
		Name = "CameraButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 180, 109),
		Position = UDim2.new(0.5, 0, 1, -50),
		Size = UDim2.fromOffset(64, 64)
	}, nil)
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, 32)
	Corner.Parent = ImageButton
	local ImageLabel = createImageLabel("", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = config.Default.BackgroundColor3,
		BackgroundTransparency = config.Default.BackgroundTransparency,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(52, 52)
	}, ImageButton)
	local Corner1 = Instance.new("UICorner")
	Corner1.CornerRadius = UDim.new(0, 26)
	Corner1.Parent = ImageLabel
	local CameraPng = createImageLabel("rbxasset://textures/ui/ScreenshotHud/Camera.png", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(32, 32)
	}, ImageLabel)
	local ImageButton1 = createImageButton("", {
		BackgroundTransparency = 0,
		Name = "CloseButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(7, 7, 8),
		Position = UDim2.new(0.5, -66, 1, -50),
		Size = UDim2.fromOffset(48, 48)
	}, nil)
	local Corner2 = Instance.new("UICorner")
	Corner2.CornerRadius = UDim.new(0, 24)
	Corner2.Parent = ImageButton1
	local _ = createImageLabel("rbxasset://textures/ui/ScreenshotHud/Close.png", {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(32, 32)
	}, ImageButton1)
	local ImageButton2 = createImageButton("", {
		BackgroundTransparency = 0,
		Name = "CameraButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(0, 180, 109),
		Position = UDim2.new(1, -94, 1, -78),
		Size = UDim2.fromOffset(140, 36)
	}, nil)
	local Corner3 = Instance.new("UICorner")
	Corner3.CornerRadius = UDim.new(0, 18)
	Corner3.Parent = ImageButton2
	local _ = createImageLabel("rbxasset://textures/ui/Controls/xboxY.png", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 6, 0.5, 0),
		Size = UDim2.fromOffset(24, 24)
	}, ImageButton2)
	local _ = createTextLabel(RobloxTranslatorModule:FormatByKey("CoreScripts.ScreenshotHud.Action.TakePhoto"), {
		TextScaled = true,
		TextWrapped = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 30, 0.5, 0),
		Size = UDim2.new(1, -36, 0, 20)
	}, ImageButton2)
	local ImageButton3 = createImageButton("", {
		BackgroundTransparency = 0,
		Name = "CloseButton",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(7, 7, 8),
		Position = UDim2.new(1, -228, 1, -78),
		Size = UDim2.fromOffset(104, 36)
	}, nil)
	local Corner4 = Instance.new("UICorner")
	Corner4.CornerRadius = UDim.new(0, 18)
	Corner4.Parent = ImageButton3
	local _ = createImageLabel("rbxasset://textures/ui/Controls/xboxB.png", {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 6, 0.5, 0),
		Size = UDim2.fromOffset(24, 24)
	}, ImageButton3)
	local _ = createTextLabel(RobloxTranslatorModule:FormatByKey("CoreScripts.ScreenshotHud.Action.Cancel"), {
		TextScaled = true,
		TextWrapped = true,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 30, 0.5, 0),
		Size = UDim2.new(1, -36, 0, 20)
	}, ImageButton3)
	local FlashOverlay = createFrame({
		Active = true,
		BackgroundTransparency = 0.5,
		Name = "FlashOverlay",
		Visible = false,
		ZIndex = 3
	}, ScreenshotHudFrame)
	
	local function checkOrRequestExternalStoragePermissions()
		-- upvalues: PermissionsProtocol (copy), PromiseModule (copy)
		return PermissionsProtocol.default:checkOrRequestPermissions({ PermissionsProtocol.Permissions.WRITE_MEDIA_STORAGE }):andThen(function(Result)
			-- upvalues: PermissionsProtocol (upval), PromiseModule (upval)
			return Result == PermissionsProtocol.Status.AUTHORIZED and PromiseModule.resolve() or PromiseModule.reject()
		end)
	end
	
	local function getEnabledPlayerScreenGuis()
		-- upvalues: Players (copy)
		local List = {}
		
		for _, ScreenGui in ipairs((Players.LocalPlayer.PlayerGui:GetDescendants())) do
			if ScreenGui:IsA("ScreenGui") and ScreenGui.Enabled then
				table.insert(List, ScreenGui)
			end
		end
		return List
	end
	
	local function getEnabledCoreGuiTypes()
		-- upvalues: StarterGui (copy)
		local CoreGuiTypes = {}
		
		for _, enumItem in ipairs(Enum.CoreGuiType:GetEnumItems()) do
			if StarterGui:GetCoreGuiEnabled(enumItem) then
				table.insert(CoreGuiTypes, enumItem)
			end
		end
		return CoreGuiTypes
	end
	
	local function v51() end
	
	local function onCameraButtonActivated()
		-- upvalues: UserInputService (copy), checkOrRequestExternalStoragePermissions (copy), v51 (ref), CaptureMasterModule (copy)
		if UserInputService:GetPlatform() == Enum.Platform.Android then
			checkOrRequestExternalStoragePermissions():andThen(v51, function()
				-- upvalues: CaptureMasterModule (upval)
				CaptureMasterModule:ShowPermissionToast()
			end)
			
			return
		else
			v51()
		end
	end
	
	v51 = function()
		-- upvalues: CaptureMasterModule (copy), ActivatedConnection (ref), ScreenshotHud (copy), getEnabledPlayerScreenGuis (copy), getEnabledCoreGuiTypes (copy), StarterGui (copy), ProximityPromptService (copy), ScreenshotHudContent (copy), Players (copy), CoreGui (copy), FlashOverlay (copy), ImageButton (copy), onCameraButtonActivated (copy), RbxAnalyticsService (copy)
		CaptureMasterModule:DismissNotification()
		
		if ActivatedConnection then
			ActivatedConnection:Disconnect()
			ActivatedConnection = nil
		end
		local Flag = false
		local Flag1 = false
		local v3 = nil
		
		if ScreenshotHud.HidePlayerGuiForCaptures then
			v3 = getEnabledPlayerScreenGuis()
			
			for _, value in ipairs(v3) do
				value.Enabled = false
			end
			Flag1 = true
		end
		local CoreGuiTypes = nil
		
		if ScreenshotHud.HideCoreGuiForCaptures then
			CoreGuiTypes = getEnabledCoreGuiTypes()
			
			for _, coreGuiType in ipairs(CoreGuiTypes) do
				StarterGui:SetCoreGuiEnabled(coreGuiType, false)
			end
			Flag = true
		end
		local Enabled = ProximityPromptService.Enabled
		ProximityPromptService.Enabled = false
		ScreenshotHudContent.Visible = false
		wait(0.2)
		local DisplayDistanceTypes = {}
		
		for _, player in pairs(Players:GetPlayers()) do
			local Humanoid = player.Character and player.Character:WaitForChild("Humanoid")
			
			if Humanoid then
				DisplayDistanceTypes[Humanoid] = Humanoid.DisplayDistanceType
				Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			end
		end
		CoreGui:TakeScreenshot()
		wait(0.2)
		ScreenshotHudContent.Visible = true
		FlashOverlay.Visible = true
		wait(0.2)
		FlashOverlay.Visible = false
		
		if not ActivatedConnection then
			ActivatedConnection = ImageButton.Activated:connect(onCameraButtonActivated)
		end
		ProximityPromptService.Enabled = Enabled
		
		for _, player1 in pairs(Players:GetPlayers()) do
			local Humanoid = player1.Character and player1.Character:WaitForChild("Humanoid")
			
			if Humanoid and DisplayDistanceTypes[Humanoid] then
				Humanoid.DisplayDistanceType = DisplayDistanceTypes[Humanoid]
			end
		end
		if Flag1 then
			for _, value1 in ipairs(v3) do
				value1.Enabled = true
			end
		end
		if Flag then
			for _, coreGuiType1 in ipairs(CoreGuiTypes) do
				StarterGui:SetCoreGuiEnabled(coreGuiType1, true)
			end
		end
		if ScreenshotHud.CloseWhenScreenshotTaken then
			ScreenshotHud.Visible = false
		end
		RbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "TakeScreenshot", { pid = tostring(game.PlaceId) })
	end
	
	local function _(p1): boolean
		return p1.Name:match("^Gamepad*") ~= nil
	end
	
	local function updateGamepadButtons()
		-- upvalues: v1 (ref), v2 (ref), HasGamepad (ref), ImageButton2 (copy), ImageButton (copy), ImageButton3 (copy), ImageButton1 (copy), ScreenshotHudContent (copy), ScreenshotHud (copy)
		if v1 then
			v1.Parent = nil
		end
		if v2 then
			v2.Parent = nil
		end
		v1 = if HasGamepad then ImageButton2 else ImageButton
		v2 = if HasGamepad then ImageButton3 else ImageButton1
		v1.Parent = ScreenshotHudContent
		v2.Parent = ScreenshotHudContent
		
		if ScreenshotHud.CameraButtonPosition ~= UDim2.fromOffset(0, 0) then
			v1.Position = ScreenshotHud.CameraButtonPosition
		end
		if ScreenshotHud.CloseButtonPosition ~= UDim2.fromOffset(0, 0) then
			v2.Position = ScreenshotHud.CloseButtonPosition
		end
	end
	
	local function onLastInputTypeChanged(LastInputType)
		-- upvalues: UserInputService (copy), HasGamepad (ref), updateGamepadButtons (copy)
		local HasGamepad1 = (if LastInputType then LastInputType else UserInputService:GetLastInputType()).Name:match("^Gamepad*") ~= nil
		
		if HasGamepad ~= HasGamepad1 then
			HasGamepad = HasGamepad1
			updateGamepadButtons()
		end
	end
	
	local function setupConnections()
		-- upvalues: ImageButton (copy), ImageLabel (copy), config (copy), List (ref), ActivatedConnection (ref), onCameraButtonActivated (copy), ImageButton1 (copy), ScreenshotHud (copy), ContextActionService (copy), List1 (ref), UserInputService (copy), HasGamepad (ref), updateGamepadButtons (copy), onLastInputTypeChanged (copy)
		table.insert(List, (ImageButton.InputBegan:Connect(function(Input)
			-- upvalues: ImageLabel (upval), config (upval)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				ImageLabel.BackgroundColor3 = config.Hovered.BackgroundColor3
				ImageLabel.BackgroundTransparency = config.Hovered.BackgroundTransparency
				
				return
			end
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				ImageLabel.BackgroundColor3 = config.Pressed.BackgroundColor3
				ImageLabel.BackgroundTransparency = config.Pressed.BackgroundTransparency
			end
		end)))
		table.insert(List, (ImageButton.InputEnded:Connect(function()
			-- upvalues: ImageLabel (upval), config (upval)
			ImageLabel.BackgroundColor3 = config.Default.BackgroundColor3
			ImageLabel.BackgroundTransparency = config.Default.BackgroundTransparency
		end)))
		
		if ActivatedConnection then
			ActivatedConnection:Disconnect()
			ActivatedConnection = nil
		end
		ActivatedConnection = ImageButton.Activated:connect(onCameraButtonActivated)
		table.insert(List, ActivatedConnection)
		table.insert(List, (ImageButton1.Activated:connect(function()
			-- upvalues: ScreenshotHud (upval)
			ScreenshotHud.Visible = false
		end)))
		ContextActionService:BindAction("ScreenshotHudGamepadClose", function(_, InputState, InputObject)
			-- upvalues: ScreenshotHud (upval)
			if InputState == Enum.UserInputState.End and InputObject.UserInputType.Name:match("^Gamepad*") ~= nil then
				ScreenshotHud.Visible = false
			end
		end, false, Enum.KeyCode.ButtonB)
		table.insert(List1, "ScreenshotHudGamepadClose")
		ContextActionService:BindAction("ScreenshotHudGamepadCamera", function(_, InputState, InputObject)
			-- upvalues: onCameraButtonActivated (upval)
			if InputState == Enum.UserInputState.End and InputObject.UserInputType.Name:match("^Gamepad*") ~= nil then
				onCameraButtonActivated()
			end
		end, false, Enum.KeyCode.ButtonY)
		table.insert(List1, "ScreenshotHudGamepadCamera")
		local HasGamepad1 = UserInputService:GetLastInputType().Name:match("^Gamepad*") ~= nil
		
		if HasGamepad ~= HasGamepad1 then
			HasGamepad = HasGamepad1
			updateGamepadButtons()
		end
		table.insert(List, (UserInputService.LastInputTypeChanged:Connect(onLastInputTypeChanged)))
	end
	
	local function disconnectAll()
		-- upvalues: List (ref), List1 (ref), ContextActionService (copy)
		for _, Connection in ipairs(List) do
			Connection:Disconnect()
		end
		List = {}
		
		for _, value in ipairs(List1) do
			ContextActionService:UnbindAction(value)
		end
		List1 = {}
	end
	
	local function screenshotHudEnabled(Visible)
		-- upvalues: ScreenshotHudFrame (copy), ScreenshotHud (copy), disconnectAll (copy), ScreenshotHudContent (copy), FlashOverlay (copy), setupConnections (copy), CaptureMasterModule (copy), RbxAnalyticsService (copy)
		ScreenshotHudFrame.Visible = ScreenshotHud.Visible
		disconnectAll()
		
		if ScreenshotHud.Visible then
			ScreenshotHudContent.Visible = true
			FlashOverlay.Visible = false
			setupConnections()
			CaptureMasterModule:Start()
		end
		RbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "ScreenshotHudEnabled", { pid = tostring(game.PlaceId), enabled = Visible })
	end
	
	ScreenshotHud:GetPropertyChangedSignal("Visible"):Connect(function()
		-- upvalues: screenshotHudEnabled (copy), ScreenshotHud (copy)
		screenshotHudEnabled(ScreenshotHud.Visible)
	end)
	ScreenshotHud:GetPropertyChangedSignal("CameraButtonIcon"):Connect(function()
		-- upvalues: CameraPng (copy), ScreenshotHud (copy), RbxAnalyticsService (copy)
		CameraPng.Image = ScreenshotHud.CameraButtonIcon or "rbxasset://textures/ui/ScreenshotHud/Camera.png"
		RbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "CameraButtonIcon", {
			pid = tostring(game.PlaceId),
			icon = ScreenshotHud.CameraButtonIcon
		})
	end)
	ScreenshotHud:GetPropertyChangedSignal("CameraButtonPosition"):Connect(function()
		-- upvalues: v1 (ref), ScreenshotHud (copy), RbxAnalyticsService (copy)
		v1.Position = ScreenshotHud.CameraButtonPosition
		RbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "CameraButtonPosition", {
			pid = tostring(game.PlaceId),
			position = tostring(ScreenshotHud.CameraButtonPosition)
		})
	end)
	ScreenshotHud:GetPropertyChangedSignal("CloseButtonPosition"):Connect(function()
		-- upvalues: v2 (ref), ScreenshotHud (copy), RbxAnalyticsService (copy)
		v2.Position = ScreenshotHud.CloseButtonPosition
		RbxAnalyticsService:SendEventDeferred("client", "screenshotHud", "CloseButtonPosition", {
			pid = tostring(game.PlaceId),
			position = tostring(ScreenshotHud.CloseButtonPosition)
		})
	end)
	updateGamepadButtons()
	screenshotHudEnabled(ScreenshotHud.Visible)
	
	return
end