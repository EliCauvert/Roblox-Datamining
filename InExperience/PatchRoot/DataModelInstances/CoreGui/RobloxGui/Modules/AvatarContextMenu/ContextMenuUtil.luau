local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local CorePackages = game:GetService("CorePackages")
local IsTenFootInterfaceFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isTenFootInterface
local _ = require(game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu").ThemeHandler)
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.PlayerAdded:Wait()
	LocalPlayer = Players.LocalPlayer
end
local Module = {}
Module.__index = Module

function Module:GetHeadshotForPlayer(Player): string
	return "rbxthumb://type=AvatarHeadShot&id=" .. Player.UserId .. "&w=150&h=150"
end

function Module:HasOrGettingHeadShot(p1): boolean
	return self.HeadShotUrlCache[p1] ~= nil
end

function Module:FindPlayerFromPart(Character)
	-- upvalues: Players (copy)
	if Character and Character.Parent then
		local Character1 = Character
		while Character1 and not Character1:IsA("Model") do
			Character1 = Character1.Parent
		end
		if Character1 then
			return Players:GetPlayerFromCharacter(Character1)
		end
	end
	return nil
end

function Module:GetPlayerPosition(Player: Player)
	if Player.Character then
		local HumanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")
		
		if HumanoidRootPart then
			return HumanoidRootPart.Position
		end
	end
	return nil
end

local Flag = true

function Module:DisablePlayerMovement()
	-- upvalues: Flag (ref), ContextActionService (copy)
	if Flag then
		Flag = false
		ContextActionService:BindCoreActionAtPriority("AvatarContextMenuStopInput", function(_, UserInputState)
			return if UserInputState == Enum.UserInputState.End then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink
		end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
		
		return
	end
end

function Module:EnablePlayerMovement()
	-- upvalues: Flag (ref), ContextActionService (copy)
	if not Flag then
		Flag = true
		ContextActionService:UnbindCoreAction("AvatarContextMenuStopInput")
		
		return
	end
end

function Module:GetFriendStatus(Player)
	-- upvalues: LocalPlayer (ref)
	local Success, Result = pcall(function()
		-- upvalues: LocalPlayer (upval), Player (copy)
		return LocalPlayer:GetFriendStatus(Player)
	end)
	
	return if Success then Result else Enum.FriendStatus.NotFriend
end

local t = {}
coroutine.wrap(function()
	-- upvalues: RobloxReplicatedStorage (copy), t (copy)
	RobloxReplicatedStorage:WaitForChild("CanChatWith", 1e999).OnClientEvent:Connect(function(...)
		-- upvalues: t (upval)
		local list = { ... }
		
		if #list == 1 then
			for i, value in pairs(list[1]) do
				t[i] = value
			end
			return
		elseif #list == 2 then
			t[list[1]] = list[2]
		end
	end)
end)()

function Module:GetCanChatWith(Player: Player)
	-- upvalues: BlockingUtilityModule (copy), t (copy)
	return not BlockingUtilityModule:IsPlayerBlockedByUserId(Player.UserId) and (t[Player.UserId] == nil or t[Player.UserId])
end

local Image = Instance.new("ImageLabel")
Image.Image = ""
Image.BackgroundTransparency = 1

local function MakeDefaultButton(Name, Size, Callback, p1)
	-- upvalues: Image (copy), UserInputService (copy), GuiService (copy)
	local ImageButton = Instance.new("ImageButton")
	ImageButton.Name = Name
	ImageButton.Image = p1.ButtonImage
	ImageButton.ScaleType = p1.ButtonImageScaleType
	ImageButton.SliceCenter = p1.ButtonImageSliceCenter
	ImageButton.BackgroundColor3 = p1.ButtonColor
	ImageButton.BackgroundTransparency = p1.ButtonTransparency
	ImageButton.AutoButtonColor = false
	ImageButton.Size = Size
	ImageButton.ZIndex = 2
	ImageButton.SelectionImageObject = Image
	ImageButton.BorderSizePixel = 0
	local Underline = Instance.new("Frame")
	Underline.Name = "Underline"
	Underline.BackgroundColor3 = p1.ButtonUnderlineColor
	Underline.AnchorPoint = Vector2.new(0.5, 1)
	Underline.BorderSizePixel = 0
	Underline.Position = UDim2.new(0.5, 0, 1, 0)
	Underline.Size = UDim2.new(0.95, 0, 0, 1)
	Underline.Parent = ImageButton
	
	if Callback then
		ImageButton.MouseButton1Click:Connect(function()
			-- upvalues: Callback (copy), UserInputService (upval)
			Callback(UserInputService:GetLastInputType())
		end)
	end
	local function _(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch
	end
	
	local _ = function()
		-- upvalues: ImageButton (copy), p1 (copy)
		ImageButton.BackgroundColor3 = p1.ButtonHoverColor
		ImageButton.BackgroundTransparency = p1.ButtonHoverTransparency
	end
	
	local _ = function()
		-- upvalues: ImageButton (copy), p1 (copy)
		ImageButton.BackgroundColor3 = p1.ButtonColor
		ImageButton.BackgroundTransparency = p1.ButtonTransparency
	end
	
	ImageButton.InputBegan:Connect(function(Input)
		-- upvalues: ImageButton (copy), p1 (copy)
		if ImageButton.Selectable and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
			ImageButton.BackgroundColor3 = p1.ButtonHoverColor
			ImageButton.BackgroundTransparency = p1.ButtonHoverTransparency
			Input:GetPropertyChangedSignal("UserInputState"):connect(function()
				-- upvalues: Input (copy), ImageButton (upval), p1 (upval)
				if Input.UserInputState == Enum.UserInputState.End then
					ImageButton.BackgroundColor3 = p1.ButtonColor
					ImageButton.BackgroundTransparency = p1.ButtonTransparency
				end
			end)
		end
	end)
	ImageButton.InputEnded:Connect(function(Input)
		-- upvalues: ImageButton (copy), GuiService (upval), p1 (copy)
		if ImageButton.Selectable and GuiService.SelectedCoreObject ~= ImageButton and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
			ImageButton.BackgroundColor3 = p1.ButtonColor
			ImageButton.BackgroundTransparency = p1.ButtonTransparency
		end
	end)
	ImageButton.SelectionGained:Connect(function()
		-- upvalues: ImageButton (copy), p1 (copy)
		ImageButton.BackgroundColor3 = p1.ButtonHoverColor
		ImageButton.BackgroundTransparency = p1.ButtonHoverTransparency
	end)
	ImageButton.SelectionLost:Connect(function()
		-- upvalues: ImageButton (copy), p1 (copy)
		ImageButton.BackgroundColor3 = p1.ButtonColor
		ImageButton.BackgroundTransparency = p1.ButtonTransparency
	end)
	local _ = GuiService.Changed:Connect(function(p2)
		-- upvalues: GuiService (upval), ImageButton (copy), p1 (copy)
		if p2 ~= "SelectedCoreObject" then return end
		if GuiService.SelectedCoreObject == nil or GuiService.SelectedCoreObject ~= ImageButton then
			ImageButton.BackgroundColor3 = p1.ButtonColor
			ImageButton.BackgroundTransparency = p1.ButtonTransparency
			
			return
		end
		if ImageButton.Selectable then
			ImageButton.BackgroundColor3 = p1.ButtonHoverColor
			ImageButton.BackgroundTransparency = p1.ButtonHoverTransparency
		end
	end)
	
	return ImageButton
end

local function getViewportSize()
	while not workspace.CurrentCamera do
		workspace.Changed:Wait()
	end
	assert(workspace.CurrentCamera, "")
	while workspace.CurrentCamera.ViewportSize == Vector2.new(0, 0) or workspace.CurrentCamera.ViewportSize == Vector2.new(1, 1) do
		workspace.CurrentCamera.Changed:Wait()
	end
	return workspace.CurrentCamera.ViewportSize
end

local function _(): boolean
	-- upvalues: getViewportSize (copy), UserInputService (copy)
	local ViewportSize = getViewportSize()
	
	return UserInputService.TouchEnabled and (ViewportSize.Y < 500 or ViewportSize.X < 700)
end

function Module:MakeStyledButton(Name, Text, Size, p1, p2)
	-- upvalues: MakeDefaultButton (copy), getViewportSize (copy), UserInputService (copy), IsTenFootInterfaceFunction (copy)
	local DefaultButton = MakeDefaultButton(Name, Size, p1, p2)
	local Label = Instance.new("TextLabel")
	Label.Name = Name .. "TextLabel"
	Label.BackgroundTransparency = 1
	Label.BorderSizePixel = 0
	Label.Size = UDim2.new(1, 0, 1, -8)
	Label.Position = UDim2.new(0, 0, 0, 0)
	Label.TextColor3 = Color3.fromRGB(255, 255, 255)
	Label.TextYAlignment = Enum.TextYAlignment.Center
	Label.Font = p2.Font
	Label.TextSize = 24 * p2.TextScale
	local ViewportSize = getViewportSize()
	
	if UserInputService.TouchEnabled and (ViewportSize.Y < 500 or ViewportSize.X < 700) then
		Label.TextSize = 18 * p2.TextScale
	elseif IsTenFootInterfaceFunction() then
		Label.TextSize = 36 * p2.TextScale
	end
	Label.Text = Text
	Label.TextScaled = true
	Label.TextWrapped = true
	Label.ZIndex = 2
	Label.Parent = DefaultButton
	Instance.new("UITextSizeConstraint", Label).MaxTextSize = Label.TextSize
	
	return DefaultButton, Label
end

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({}, Module))
end

return Module.new()