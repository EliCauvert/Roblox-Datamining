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

function t.GetHeadshotForPlayer(_, p1)
	return "rbxthumb://type=AvatarHeadShot&id=" .. p0.UserId .. "&w=150&h=150"
end

function t:HasOrGettingHeadShot(p1)
	return self.HeadShotUrlCache[p1] ~= nil
end

function t.FindPlayerFromPart(_, p1)
	-- upvalues: playersService (ref)
	if p1 and p1.Parent then
		local var1 = p1
		while var1 and not var1:IsA("Model") do
			var1 = var1.Parent
		end
		return if var1 then playersService:GetPlayerFromCharacter(var1) else nil
	end
end

function t.GetPlayerPosition(_, p2)
	if p2.Character then
		local humanoidRootPart = p2.Character:FindFirstChild("HumanoidRootPart")
		
		return if humanoidRootPart then humanoidRootPart.Position else nil
	end
end

local var2 = true

function t.DisablePlayerMovement(_)
	-- upvalues: var2 (write), contextActionService (ref)
	if var2 then
		var2 = false
		contextActionService:BindCoreActionAtPriority("AvatarContextMenuStopInput", function(_, p2)
			return if p2 == Enum.UserInputState.End then Enum.ContextActionResult.Pass else Enum.ContextActionResult.Sink
		end, false, Enum.ContextActionPriority.Low.Value, Enum.PlayerActions.CharacterForward, Enum.PlayerActions.CharacterBackward, Enum.PlayerActions.CharacterLeft, Enum.PlayerActions.CharacterRight, Enum.PlayerActions.CharacterJump, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
		
		return
	end
end

function t.EnablePlayerMovement(_)
	-- upvalues: var2 (write), contextActionService (ref)
	if var2 then
		return
	end
	var2 = true
	contextActionService:UnbindCoreAction("AvatarContextMenuStopInput")
end

function t.GetFriendStatus(_, p2)
	-- upvalues: localPlayer (write)
	local ok, status = pcall(function()
		-- upvalues: localPlayer (copy), p2 (ref)
		return localPlayer:GetFriendStatus(p2)
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

function t.GetCanChatWith(_, p2)
	-- upvalues: blockingUtilityModule (ref), t_1 (ref)
	return if blockingUtilityModule:IsPlayerBlockedByUserId(p2.UserId) then false else t_1[p2.UserId] == nil or t_1[p2.UserId]
end

local imageLabel = Instance.new("ImageLabel")
imageLabel.Image = ""
imageLabel.BackgroundTransparency = 1

local function MakeDefaultButton(p2, p3, p4, p5)
	-- upvalues: imageLabel (ref), userInputService (ref), guiService (ref)
	local imageButton = Instance.new("ImageButton")
	imageButton.Name = p2
	imageButton.Image = p5.ButtonImage
	imageButton.ScaleType = p5.ButtonImageScaleType
	imageButton.SliceCenter = p5.ButtonImageSliceCenter
	imageButton.BackgroundColor3 = p5.ButtonColor
	imageButton.BackgroundTransparency = p5.ButtonTransparency
	imageButton.AutoButtonColor = false
	imageButton.Size = p3
	imageButton.ZIndex = 2
	imageButton.SelectionImageObject = imageLabel
	imageButton.BorderSizePixel = 0
	local underline = Instance.new("Frame")
	underline.Name = "Underline"
	underline.BackgroundColor3 = p5.ButtonUnderlineColor
	underline.AnchorPoint = Vector2.new(0.5, 1)
	underline.BorderSizePixel = 0
	underline.Position = UDim2.new(0.5, 0, 1, 0)
	underline.Size = UDim2.new(0.95, 0, 0, 1)
	underline.Parent = imageButton
	
	if p4 then
		imageButton.MouseButton1Click:Connect(function()
			-- upvalues: p4 (ref), userInputService (copy)
			p4(userInputService:GetLastInputType())
		end)
	end
	local function _(p6)
		return if p6.UserInputType ~= Enum.UserInputType.MouseMovement then p6.UserInputType == Enum.UserInputType.Touch else true
	end
	
	local _ = function()
		-- upvalues: imageButton (ref), p5 (ref)
		imageButton.BackgroundColor3 = p5.ButtonHoverColor
		imageButton.BackgroundTransparency = p5.ButtonHoverTransparency
	end
	
	local _ = function()
		-- upvalues: imageButton (ref), p5 (ref)
		imageButton.BackgroundColor3 = p5.ButtonColor
		imageButton.BackgroundTransparency = p5.ButtonTransparency
	end
	
	imageButton.InputBegan:Connect(function(p6)
		-- upvalues: imageButton (ref), p5 (ref)
		if imageButton.Selectable then
			if if p6.UserInputType ~= Enum.UserInputType.MouseMovement then p6.UserInputType == Enum.UserInputType.Touch else true then
				imageButton.BackgroundColor3 = p5.ButtonHoverColor
				imageButton.BackgroundTransparency = p5.ButtonHoverTransparency
				p6:GetPropertyChangedSignal("UserInputState"):connect(function()
					-- upvalues: p6 (ref), imageButton (copy), p5 (copy)
					if p6.UserInputState == Enum.UserInputState.End then
						imageButton.BackgroundColor3 = p5.ButtonColor
						imageButton.BackgroundTransparency = p5.ButtonTransparency
					end
				end)
			end
		end
	end)
	imageButton.InputEnded:Connect(function(p6)
		-- upvalues: imageButton (ref), guiService (copy), p5 (ref)
		if imageButton.Selectable and guiService.SelectedCoreObject ~= imageButton then
			if if p6.UserInputType ~= Enum.UserInputType.MouseMovement then p6.UserInputType == Enum.UserInputType.Touch else true then
				imageButton.BackgroundColor3 = p5.ButtonColor
				imageButton.BackgroundTransparency = p5.ButtonTransparency
			end
		end
	end)
	imageButton.SelectionGained:Connect(function()
		-- upvalues: imageButton (ref), p5 (ref)
		imageButton.BackgroundColor3 = p5.ButtonHoverColor
		imageButton.BackgroundTransparency = p5.ButtonHoverTransparency
	end)
	imageButton.SelectionLost:Connect(function()
		-- upvalues: imageButton (ref), p5 (ref)
		imageButton.BackgroundColor3 = p5.ButtonColor
		imageButton.BackgroundTransparency = p5.ButtonTransparency
	end)
	local _ = guiService.Changed:Connect(function(p6)
		-- upvalues: guiService (copy), imageButton (ref), p5 (ref)
		if p6 ~= "SelectedCoreObject" then return end
		if guiService.SelectedCoreObject == nil or guiService.SelectedCoreObject ~= imageButton then
			imageButton.BackgroundColor3 = p5.ButtonColor
			imageButton.BackgroundTransparency = p5.ButtonTransparency
			
			return
		elseif imageButton.Selectable then
			imageButton.BackgroundColor3 = p5.ButtonHoverColor
			imageButton.BackgroundTransparency = p5.ButtonHoverTransparency
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
	local var3 = getViewportSize()
	
	return userInputService.TouchEnabled and (if var3.Y >= 500 then var3.X < 700 else true)
end

function t.MakeStyledButton(_, p2, p3, p4, p5, p6)
	-- upvalues: MakeDefaultButton (ref), getViewportSize (ref), userInputService (ref), guiService (ref)
	local var3 = MakeDefaultButton(p2, p4, p5, p6)
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = p2 .. "TextLabel"
	textLabel.BackgroundTransparency = 1
	textLabel.BorderSizePixel = 0
	textLabel.Size = UDim2.new(1, 0, 1, -8)
	textLabel.Position = UDim2.new(0, 0, 0, 0)
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextYAlignment = Enum.TextYAlignment.Center
	textLabel.Font = p6.Font
	textLabel.TextSize = 24 * p6.TextScale
	local var4 = getViewportSize()
	
	if userInputService.TouchEnabled and (if var4.Y >= 500 then var4.X < 700 else true) then
		textLabel.TextSize = 18 * p6.TextScale
	elseif guiService:IsTenFootInterface() then
		textLabel.TextSize = 36 * p6.TextScale
	end
	textLabel.Text = p3
	textLabel.TextScaled = true
	textLabel.TextWrapped = true
	textLabel.ZIndex = 2
	textLabel.Parent = var3
	Instance.new("UITextSizeConstraint", textLabel).MaxTextSize = textLabel.TextSize
	
	return var3, textLabel
end

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

return t.new()