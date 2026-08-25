local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local _ = require(coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu").ThemeHandler)
local blockingUtilityModule = require(game:GetService("CorePackages").Workspace.Packages.BlockingUtility)
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.PlayerAdded:Wait()
	localPlayer = playersService.LocalPlayer
end
local t = {}
t.__index = t

function t.GetHeadshotForPlayer(_, p0)
	return "rbxthumb://type=AvatarHeadShot&id=" .. p0.UserId .. "&w=150&h=150"
end

function t:HasOrGettingHeadShot(p1)
	return self.HeadShotUrlCache[p1] ~= nil
end

function t.FindPlayerFromPart(_, p2)
	-- upvalues: playersService (ref)
	if p2 and p2.Parent then
		local var13 = p2
		while var13 and not var13:IsA("Model") do
			var13 = var13.Parent
		end
		return if var13 then playersService:GetPlayerFromCharacter(var13) else nil
	end
end

function t.GetPlayerPosition(_, p3)
	if p3.Character then
		local humanoidRootPart = p3.Character:FindFirstChild("HumanoidRootPart")
		
		return if humanoidRootPart then humanoidRootPart.Position else nil
	end
end

local var8 = true

function t.DisablePlayerMovement(_)
	-- upvalues: var8 (write), contextActionService (ref)
	if var8 then
		var8 = false
		contextActionService:BindCoreActionAtPriority("AvatarContextMenuStopInput", function(_, p4)
			return if p4 == Enum.UserInputState.End then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink
		end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
		
		return
	end
end

function t.EnablePlayerMovement(_)
	-- upvalues: var8 (write), contextActionService (ref)
	if var8 then
		return
	end
	var8 = true
	contextActionService:UnbindCoreAction("AvatarContextMenuStopInput")
end

function t.GetFriendStatus(_, p5)
	-- upvalues: localPlayer (write)
	local ok, status = pcall(function()
		-- upvalues: localPlayer (copy), p5 (ref)
		return localPlayer:GetFriendStatus(p5)
	end)
	
	return if ok then status else Enum.FriendStatus.NotFriend
end

local t_1 = {}
coroutine.wrap(function()
	-- upvalues: robloxReplicatedStorageService (ref), t_1 (ref)
	robloxReplicatedStorageService:WaitForChild("CanChatWith", 1e999).OnClientEvent:Connect(function(...)
		-- upvalues: t_1 (copy)
		local list = { ... }
		
		if #list == 1 then
			for i, v in pairs(list[1]) do
				t_1[i] = v
			end
			return
		elseif #list == 2 then
			t_1[list[1]] = list[2]
		end
	end)
end)()

function t.GetCanChatWith(_, p6)
	-- upvalues: blockingUtilityModule (ref), t_1 (ref)
	return if blockingUtilityModule:IsPlayerBlockedByUserId(p6.UserId) then false else t_1[p6.UserId] == nil or t_1[p6.UserId]
end

local imageLabel = Instance.new("ImageLabel")
imageLabel.Image = ""
imageLabel.BackgroundTransparency = 1

local function MakeDefaultButton(p7, p8, p9, p10)
	-- upvalues: imageLabel (ref), userInputService (ref), guiService (ref)
	local imageButton = Instance.new("ImageButton")
	imageButton.Name = p7
	imageButton.Image = p10.ButtonImage
	imageButton.ScaleType = p10.ButtonImageScaleType
	imageButton.SliceCenter = p10.ButtonImageSliceCenter
	imageButton.BackgroundColor3 = p10.ButtonColor
	imageButton.BackgroundTransparency = p10.ButtonTransparency
	imageButton.AutoButtonColor = false
	imageButton.Size = p8
	imageButton.ZIndex = 2
	imageButton.SelectionImageObject = imageLabel
	imageButton.BorderSizePixel = 0
	local underline = Instance.new("Frame")
	underline.Name = "Underline"
	underline.BackgroundColor3 = p10.ButtonUnderlineColor
	underline.AnchorPoint = Vector2.new(0.5, 1)
	underline.BorderSizePixel = 0
	underline.Position = UDim2.new(0.5, 0, 1, 0)
	underline.Size = UDim2.new(0.95, 0, 0, 1)
	underline.Parent = imageButton
	
	if p9 then
		imageButton.MouseButton1Click:Connect(function()
			-- upvalues: p9 (ref), userInputService (copy)
			p9(userInputService:GetLastInputType())
		end)
	end
	local function _(p11)
		return if p11.UserInputType ~= Enum.UserInputType.MouseMovement then p11.UserInputType == Enum.UserInputType.Touch else true
	end
	
	local _ = function()
		-- upvalues: imageButton (ref), p10 (ref)
		imageButton.BackgroundColor3 = p10.ButtonHoverColor
		imageButton.BackgroundTransparency = p10.ButtonHoverTransparency
	end
	
	local _ = function()
		-- upvalues: imageButton (ref), p10 (ref)
		imageButton.BackgroundColor3 = p10.ButtonColor
		imageButton.BackgroundTransparency = p10.ButtonTransparency
	end
	
	imageButton.InputBegan:Connect(function(p12)
		-- upvalues: imageButton (ref), p10 (ref)
		if imageButton.Selectable then
			if if p12.UserInputType ~= Enum.UserInputType.MouseMovement then p12.UserInputType == Enum.UserInputType.Touch else true then
				imageButton.BackgroundColor3 = p10.ButtonHoverColor
				imageButton.BackgroundTransparency = p10.ButtonHoverTransparency
				p12:GetPropertyChangedSignal("UserInputState"):connect(function()
					-- upvalues: p12 (ref), imageButton (copy), p10 (copy)
					if p12.UserInputState == Enum.UserInputState.End then
						imageButton.BackgroundColor3 = p10.ButtonColor
						imageButton.BackgroundTransparency = p10.ButtonTransparency
					end
				end)
			end
		end
	end)
	imageButton.InputEnded:Connect(function(p13)
		-- upvalues: imageButton (ref), guiService (copy), p10 (ref)
		if imageButton.Selectable and guiService.SelectedCoreObject ~= imageButton then
			if if p13.UserInputType ~= Enum.UserInputType.MouseMovement then p13.UserInputType == Enum.UserInputType.Touch else true then
				imageButton.BackgroundColor3 = p10.ButtonColor
				imageButton.BackgroundTransparency = p10.ButtonTransparency
			end
		end
	end)
	imageButton.SelectionGained:Connect(function()
		-- upvalues: imageButton (ref), p10 (ref)
		imageButton.BackgroundColor3 = p10.ButtonHoverColor
		imageButton.BackgroundTransparency = p10.ButtonHoverTransparency
	end)
	imageButton.SelectionLost:Connect(function()
		-- upvalues: imageButton (ref), p10 (ref)
		imageButton.BackgroundColor3 = p10.ButtonColor
		imageButton.BackgroundTransparency = p10.ButtonTransparency
	end)
	local _ = guiService.Changed:Connect(function(p14)
		-- upvalues: guiService (copy), imageButton (ref), p10 (ref)
		if p14 ~= "SelectedCoreObject" then return end
		if guiService.SelectedCoreObject == nil or guiService.SelectedCoreObject ~= imageButton then
			imageButton.BackgroundColor3 = p10.ButtonColor
			imageButton.BackgroundTransparency = p10.ButtonTransparency
			
			return
		elseif imageButton.Selectable then
			imageButton.BackgroundColor3 = p10.ButtonHoverColor
			imageButton.BackgroundTransparency = p10.ButtonHoverTransparency
		end
	end)
	
	return imageButton
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

local function _()
	-- upvalues: getViewportSize (ref), userInputService (ref)
	local var18 = getViewportSize()
	
	return userInputService.TouchEnabled and (if var18.Y >= 500 then var18.X < 700 else true)
end

function t.MakeStyledButton(_, p15, p16, p17, p18, p19)
	-- upvalues: MakeDefaultButton (ref), getViewportSize (ref), userInputService (ref), guiService (ref)
	local var19 = MakeDefaultButton(p15, p17, p18, p19)
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = p15 .. "TextLabel"
	textLabel.BackgroundTransparency = 1
	textLabel.BorderSizePixel = 0
	textLabel.Size = UDim2.new(1, 0, 1, -8)
	textLabel.Position = UDim2.new(0, 0, 0, 0)
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	textLabel.Font = p19.Font
	textLabel.TextSize = 24 * p19.TextScale
	local var21 = getViewportSize()
	
	if userInputService.TouchEnabled and (if var21.Y >= 500 then var21.X < 700 else true) then
		textLabel.TextSize = 18 * p19.TextScale
	elseif guiService:IsTenFootInterface() then
		textLabel.TextSize = 36 * p19.TextScale
	end
	textLabel.Text = p16
	textLabel.TextScaled = true
	textLabel.TextWrapped = true
	textLabel.ZIndex = 2
	textLabel.Parent = var19
	Instance.new("UITextSizeConstraint", textLabel).MaxTextSize = textLabel.TextSize
	
	return var19, textLabel
end

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

return t.new()