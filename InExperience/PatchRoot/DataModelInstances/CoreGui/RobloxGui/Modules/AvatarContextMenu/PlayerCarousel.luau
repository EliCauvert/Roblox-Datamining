local t = {}
t.__index = t
local guiService = game:GetService("GuiService")
local coreGuiService = game:GetService("CoreGui")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local color = Color3.fromRGB(0, 162, 255)
local color_1 = Color3.fromRGB(0, 0, 0)
local avatarContextMenu = coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu")
local var1 = nil
local var2 = nil
local var3 = nil
local t_1 = {}
local t_2 = {}

local function getSortedCarouselButtons()
	-- upvalues: var1 (write)
	local t = {}
	local t_1 = {}
	
	for i, v in ipairs(var1:GetChildren()) do
		if v:IsA("GuiObject") and v.Name ~= "_CarouselDivider" then
			table.insert(t_1, v)
			t[v] = i
		end
	end
	table.sort(t_1, function(p1, p2)
		-- upvalues: t (ref)
		return if p1.LayoutOrder == p2.LayoutOrder then t[p1] < t[p2] else p1.LayoutOrder < p2.LayoutOrder
	end)
	
	return t_1
end

local function CreateMenuCarousel(p1)
	-- upvalues: var1 (write), var2 (write), var3 (write), getSortedCarouselButtons (ref), color_1 (ref), guiService (ref), color (ref), t_1 (write), userInputService (ref)
	local playerCarousel = Instance.new("Frame")
	playerCarousel.Name = "PlayerCarousel"
	playerCarousel.AnchorPoint = Vector2.new(0.5, 0.5)
	playerCarousel.BackgroundTransparency = 1
	playerCarousel.Position = UDim2.new(0.5, 0, 0.5, 0)
	playerCarousel.Size = UDim2.new(1, 0, 0.28, 0)
	playerCarousel.ClipsDescendants = true
	local innerFrame = Instance.new("Frame")
	innerFrame.Name = "InnerFrame"
	innerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	innerFrame.BackgroundTransparency = 1
	innerFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	innerFrame.Size = UDim2.new(0.8, 0, 1, 0)
	innerFrame.ClipsDescendants = true
	innerFrame.Active = true
	innerFrame.Parent = playerCarousel
	var1 = Instance.new("Frame")
	var1.Name = "SelectedPlayer"
	var1.AnchorPoint = Vector2.new(0.5, 0.5)
	var1.BackgroundTransparency = 1
	var1.Position = UDim2.new(0.5, 0, 0.5, 0)
	var1.Size = UDim2.new(0, 100, 1, -10)
	var1.Parent = innerFrame
	var2 = Instance.new("UIPageLayout")
	var2.EasingDirection = Enum.EasingDirection.Out
	var2.EasingStyle = Enum.EasingStyle.Quad
	var2.Padding = UDim.new(0, 5)
	var2.TweenTime = 0.25
	var2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	var2.VerticalAlignment = Enum.VerticalAlignment.Center
	var2.TouchInputEnabled = false
	var2.Circular = true
	var2.SortOrder = Enum.SortOrder.LayoutOrder
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	UIAspectRatioConstraint.Parent = var1
	var3 = Instance.new("BindableEvent")
	var3.Name = "PlayerChanged"
	local var4 = nil
	var2:GetPropertyChangedSignal("CurrentPage"):Connect(function()
		-- upvalues: var2 (copy), getSortedCarouselButtons (copy), var4 (write), color_1 (copy), guiService (copy), color (copy), var3 (copy), t_1 (copy)
		if var2.CurrentPage then
			if var2.CurrentPage.Name ~= "_CarouselDivider" then
				var2.CurrentPage.BackgroundColor3 = color_1
				var4 = var2.CurrentPage
			elseif var4 == getSortedCarouselButtons()[1] then
				var2:Previous()
			else
				var2:Next()
			end
		end
		if guiService.SelectedCoreObject and guiService.SelectedCoreObject.Parent == var2.Parent then
			guiService.SelectedCoreObject.BackgroundColor3 = color
		end
		guiService.SelectedCoreObject = var2.CurrentPage
		
		if var2.CurrentPage then
			var3:Fire(t_1[var2.CurrentPage])
		end
	end)
	var2.Parent = var1
	local nextButton = Instance.new("ImageButton")
	nextButton.Name = "NextButton"
	nextButton.Image = p1.ScrollRightImage
	nextButton.BackgroundTransparency = 1
	nextButton.AnchorPoint = Vector2.new(1, 0.5)
	nextButton.Position = UDim2.new(1, -5, 0.5, 0)
	nextButton.Size = UDim2.new(0.3, 0, 0.3, 0)
	nextButton.Selectable = false
	nextButton.Parent = playerCarousel
	local UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint_1.DominantAxis = Enum.DominantAxis.Width
	UIAspectRatioConstraint_1.Parent = nextButton
	local prevButton = nextButton:Clone()
	prevButton.Name = "PrevButton"
	
	if p1.ScrollLeftImage == "" then
		prevButton.Rotation = 180
	else
		prevButton.Image = p1.ScrollLeftImage
	end
	prevButton.AnchorPoint = Vector2.new(0, 0.5)
	prevButton.Position = UDim2.new(0, 5, 0.5, 0)
	prevButton.Selectable = false
	prevButton.Parent = playerCarousel
	
	local function _(p2)
		-- upvalues: var2 (copy)
		if p2 then
			var2:Next()
			
			return
		end
		var2:Previous()
	end
	
	nextButton.MouseButton1Click:Connect(function()
		-- upvalues: var2 (copy)
		var2:Next()
	end)
	prevButton.MouseButton1Click:Connect(function()
		-- upvalues: var2 (copy)
		var2:Previous()
	end)
	
	local function checkButtonVisibility()
		-- upvalues: userInputService (copy), prevButton (ref), var1 (copy), nextButton (ref)
		local var5 = userInputService:GetLastInputType() == Enum.UserInputType.Touch
		prevButton.Visible = not var5 and #var1:GetChildren() > 3
		nextButton.Visible = not var5 and #var1:GetChildren() > 3
	end
	
	local var5 = userInputService:GetLastInputType() == Enum.UserInputType.Touch
	prevButton.Visible = not var5 and #var1:GetChildren() > 3
	nextButton.Visible = not var5 and #var1:GetChildren() > 3
	userInputService.LastInputTypeChanged:Connect(checkButtonVisibility)
	
	return playerCarousel
end

function t:UpdateGuiTheme(p1)
	self.rbxGui.NextButton.Image = p1.ScrollRightImage
	
	if p1.ScrollLeftImage == "" then
		self.rbxGui.PrevButton.Image = p1.ScrollRightImage
		self.rbxGui.PrevButton.Rotation = 180
		
		return
	end
	self.rbxGui.PrevButton.Image = p1.ScrollLeftImage
end

function t.FadeTowardsEdges(_)
	-- upvalues: var2 (write), getSortedCarouselButtons (ref)
	if not var2.CurrentPage then return end
	local var4 = getSortedCarouselButtons()
	local var5 = 0
	
	for i, v in ipairs(var4) do
		if v == var2.CurrentPage then
			var5 = i
			break
		end
	end
	for i_1, v in ipairs(var4) do
		local minValue = math.min((var5 - i_1) % #var4, (i_1 - var5) % #var4)
		
		if minValue >= 2 then
			v.ImageTransparency = 0.7
		elseif minValue == 1 then
			v.ImageTransparency = 0.4
		else
			v.ImageTransparency = 0
		end
	end
end

function t.AddCarouselDivider(_)
	-- upvalues: var1 (write)
	local carouselDivider = var1:FindFirstChild("_CarouselDivider")
	
	if carouselDivider then
		carouselDivider:Destroy()
	end
	if #var1:GetChildren() - 1 < 5 then
		return
	end
	local carouselDivider_1 = Instance.new("Frame")
	carouselDivider_1.Name = "_CarouselDivider"
	carouselDivider_1.Size = UDim2.new(1, 0, 1, 0)
	carouselDivider_1.BackgroundTransparency = 1
	carouselDivider_1.Parent = var1
	carouselDivider_1.LayoutOrder = 1000000
	local line = Instance.new("Frame")
	line.Name = "line"
	line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	line.BorderSizePixel = 0
	line.Position = UDim2.new(0.25, 0, 0, -3)
	line.Size = UDim2.new(0, 2, 1, 6)
	line.Parent = carouselDivider_1
	local var6 = line:Clone()
	var6.Position = UDim2.new(0.5, 0, 0, -3)
	var6.Parent = carouselDivider_1
	local var7 = line:Clone()
	var7.Position = UDim2.new(0.75, 0, 0, -3)
	var7.Parent = carouselDivider_1
end

function t:RemovePlayerEntry(p1)
	-- upvalues: t_2 (write), t_1 (write), var2 (write)
	local var6 = t_2[p1]
	
	if var6 then
		t_2[p1] = nil
		t_1[var6] = nil
		var6:Destroy()
		
		if var2 then
			var2:ApplyLayout()
		end
		self:FadeTowardsEdges()
	end
end

function t.ClearPlayerEntries(_)
	-- upvalues: t_1 (write), t_2 (write)
	for i in pairs(t_1) do
		i:Destroy()
	end
	t_1 = {}
	t_2 = {}
end

function t.CreatePlayerEntry(_, p1, p2)
	-- upvalues: t_2 (write), color_1 (ref), color (ref), tweenService (ref), t_1 (write), var2 (write), var1 (write), avatarContextMenu (ref), guiService (ref)
	local var6 = t_2[p1]
	
	if var6 then
		var6.LayoutOrder = p2
		
		return
	end
	local imageButton = Instance.new("ImageButton")
	imageButton.Name = p1.Name
	imageButton.BorderSizePixel = 0
	imageButton.LayoutOrder = p2
	imageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	imageButton.BackgroundTransparency = 0
	imageButton.Size = UDim2.new(1, 0, 1, 0)
	imageButton.SelectionLost:connect(function()
		-- upvalues: imageButton (ref), color_1 (copy)
		imageButton.BackgroundColor3 = color_1
	end)
	imageButton.SelectionGained:connect(function()
		-- upvalues: imageButton (ref), color (copy)
		imageButton.BackgroundColor3 = color
	end)
	local _ = nil
	local var7 = tweenService:Create(imageButton, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), { BackgroundColor3 = Color3.fromRGB(255, 255, 255) })
	var7:Play()
	t_1[imageButton] = p1
	t_2[p1] = imageButton
	imageButton.MouseButton1Click:Connect(function()
		-- upvalues: var2 (copy), imageButton (ref)
		var2:JumpTo(imageButton)
	end)
	imageButton.Parent = var1
	spawn(function()
		-- upvalues: avatarContextMenu (copy), imageButton (ref), p1 (ref), var7 (write), guiService (copy), color (copy), color_1 (copy)
		imageButton.Image = require(avatarContextMenu:WaitForChild("ContextMenuUtil")):GetHeadshotForPlayer(p1)
		var7:Cancel()
		var7 = nil
		
		if imageButton == guiService.SelectedCoreObject then
			imageButton.BackgroundColor3 = color
			
			return
		end
		imageButton.BackgroundColor3 = color_1
	end)
end

function t:SwitchToPlayerEntry(p1, p2)
	-- upvalues: t_2 (write), var2 (write)
	if not p1 then return end
	local var6 = t_2[p1]
	
	if not var6 then
		self:CreatePlayerEntry(p1, 0)
		var6 = t_2[p1]
	end
	if p2 then
		var2.TweenTime = 0
	end
	var2:JumpTo(var6)
	spawn(function()
		-- upvalues: var2 (copy)
		var2.TweenTime = 0.25
	end)
end

function t.OffsetPlayerEntry(_, p1)
	-- upvalues: var2 (write)
	if p1 == 0 then return end
	if p1 > 0 then
		var2:Next()
		
		return
	end
	var2:Previous()
end

function t.GetSelectedPlayer(_)
	-- upvalues: t_1 (write), var2 (write)
	return t_1[var2.CurrentPage]
end

function t.new(p1)
	-- upvalues: t (ref), CreateMenuCarousel (ref), var3 (write)
	local tbl = setmetatable({}, t)
	tbl.rbxGui = CreateMenuCarousel(p1)
	tbl.PlayerChanged = var3.Event
	var3.Event:Connect(function()
		-- upvalues: tbl (ref)
		tbl:FadeTowardsEdges()
	end)
	
	return tbl
end

return t