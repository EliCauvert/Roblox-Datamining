local t = {}
t.__index = t
local guiService = game:GetService("GuiService")
local coreGuiService = game:GetService("CoreGui")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local color = Color3.fromRGB(0, 162, 255)
local color_1 = Color3.fromRGB(0, 0, 0)
local avatarContextMenu = coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu")
local var8 = nil
local var9 = nil
local var10 = nil
local t_1 = {}
local t_2 = {}

local function getSortedCarouselButtons() --[[ line: 34 ]]
	-- upvalues: var8 (write)
	local t = {}
	local t_1 = {}
	
	for i, v in ipairs(var8:GetChildren()) do
		if v:IsA("GuiObject") and v.Name ~= "_CarouselDivider" then
			table.insert(t_1, v)
			t[v] = i
		end
	end
	table.sort(t_1, function(p0, p1) --[[ line: 43 ]]
		-- upvalues: t (ref)
		return if p0.LayoutOrder == p1.LayoutOrder then t[p0] < t[p1] else p0.LayoutOrder < p1.LayoutOrder
	end)
	
	return t_1
end

local function CreateMenuCarousel(p2) --[[ line: 52 ]]
	-- upvalues: var8 (write), var9 (write), var10 (write), getSortedCarouselButtons (ref), color_1 (ref), guiService (ref), color (ref), t_1 (write), userInputService (ref)
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
	var8 = Instance.new("Frame")
	var8.Name = "SelectedPlayer"
	var8.AnchorPoint = Vector2.new(0.5, 0.5)
	var8.BackgroundTransparency = 1
	var8.Position = UDim2.new(0.5, 0, 0.5, 0)
	var8.Size = UDim2.new(0, 100, 1, -10)
	var8.Parent = innerFrame
	var9 = Instance.new("UIPageLayout")
	var9.EasingDirection = Enum.EasingDirection.Out
	var9.EasingStyle = Enum.EasingStyle.Quad
	var9.Padding = UDim.new(0, 5)
	var9.TweenTime = 0.25
	var9.HorizontalAlignment = Enum.HorizontalAlignment.Center
	var9.VerticalAlignment = Enum.VerticalAlignment.Center
	var9.TouchInputEnabled = false
	var9.Circular = true
	var9.SortOrder = Enum.SortOrder.LayoutOrder
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	UIAspectRatioConstraint.Parent = var8
	var10 = Instance.new("BindableEvent")
	var10.Name = "PlayerChanged"
	local var20 = nil
	var9:GetPropertyChangedSignal("CurrentPage"):Connect(function() --[[ line: 98 ]]
		-- upvalues: var9 (copy), getSortedCarouselButtons (copy), var20 (write), color_1 (copy), guiService (copy), color (copy), var10 (copy), t_1 (copy)
		if var9.CurrentPage then
			if var9.CurrentPage.Name ~= "_CarouselDivider" then
				var9.CurrentPage.BackgroundColor3 = color_1
				var20 = var9.CurrentPage
			elseif var20 == getSortedCarouselButtons()[1] then
				var9:Previous()
			else
				var9:Next()
			end
		end
		if guiService.SelectedCoreObject and guiService.SelectedCoreObject.Parent == var9.Parent then
			guiService.SelectedCoreObject.BackgroundColor3 = color
		end
		guiService.SelectedCoreObject = var9.CurrentPage
		
		if var9.CurrentPage then
			var10:Fire(t_1[var9.CurrentPage])
		end
	end)
	var9.Parent = var8
	local nextButton = Instance.new("ImageButton")
	nextButton.Name = "NextButton"
	nextButton.Image = p2.ScrollRightImage
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
	
	if p2.ScrollLeftImage == "" then
		prevButton.Rotation = 180
	else
		prevButton.Image = p2.ScrollLeftImage
	end
	prevButton.AnchorPoint = Vector2.new(0, 0.5)
	prevButton.Position = UDim2.new(0, 5, 0.5, 0)
	prevButton.Selectable = false
	prevButton.Parent = playerCarousel
	
	local function _(p3) --[[ line: 146 | named "moveChangePage" ]]
		-- upvalues: var9 (copy)
		if p3 then
			var9:Next()
			
			return
		end
		var9:Previous()
	end
	
	nextButton.MouseButton1Click:Connect(function() --[[ line: 154 ]]
		-- upvalues: var9 (copy)
		var9:Next()
	end)
	prevButton.MouseButton1Click:Connect(function() --[[ line: 155 ]]
		-- upvalues: var9 (copy)
		var9:Previous()
	end)
	
	local function checkButtonVisibility() --[[ line: 159 ]]
		-- upvalues: userInputService (copy), prevButton (ref), var8 (copy), nextButton (ref)
		local var26 = userInputService:GetLastInputType() == Enum.UserInputType.Touch
		prevButton.Visible = not var26 and #var8:GetChildren() > 3
		nextButton.Visible = not var26 and #var8:GetChildren() > 3
	end
	
	local var25 = userInputService:GetLastInputType() == Enum.UserInputType.Touch
	prevButton.Visible = not var25 and #var8:GetChildren() > 3
	nextButton.Visible = not var25 and #var8:GetChildren() > 3
	userInputService.LastInputTypeChanged:Connect(checkButtonVisibility)
	
	return playerCarousel
end

function t:UpdateGuiTheme(p4) --[[ line: 170 ]]
	self.rbxGui.NextButton.Image = p4.ScrollRightImage
	
	if p4.ScrollLeftImage == "" then
		self.rbxGui.PrevButton.Image = p4.ScrollRightImage
		self.rbxGui.PrevButton.Rotation = 180
		
		return
	end
	self.rbxGui.PrevButton.Image = p4.ScrollLeftImage
end

function t.FadeTowardsEdges(_) --[[ line: 181 ]]
	-- upvalues: var9 (write), getSortedCarouselButtons (ref)
	if not var9.CurrentPage then return end
	local var27 = getSortedCarouselButtons()
	local var28 = 0
	
	for i, v in ipairs(var27) do
		if v == var9.CurrentPage then
			var28 = i
			break
		end
	end
	for i_1, v in ipairs(var27) do
		local minValue = math.min((var28 - i_1) % #var27, (i_1 - var28) % #var27)
		
		if minValue >= 2 then
			v.ImageTransparency = 0.7
		elseif minValue == 1 then
			v.ImageTransparency = 0.4
		else
			v.ImageTransparency = 0
		end
	end
end

function t.AddCarouselDivider(_) --[[ line: 209 ]]
	-- upvalues: var8 (write)
	local carouselDivider = var8:FindFirstChild("_CarouselDivider")
	
	if carouselDivider then
		carouselDivider:Destroy()
	end
	if #var8:GetChildren() - 1 < 5 then
		return
	end
	local carouselDivider_1 = Instance.new("Frame")
	carouselDivider_1.Name = "_CarouselDivider"
	carouselDivider_1.Size = UDim2.new(1, 0, 1, 0)
	carouselDivider_1.BackgroundTransparency = 1
	carouselDivider_1.Parent = var8
	carouselDivider_1.LayoutOrder = 1000000
	local line = Instance.new("Frame")
	line.Name = "line"
	line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	line.BorderSizePixel = 0
	line.Position = UDim2.new(0.25, 0, 0, -3)
	line.Size = UDim2.new(0, 2, 1, 6)
	line.Parent = carouselDivider_1
	local var33 = line:Clone()
	var33.Position = UDim2.new(0.5, 0, 0, -3)
	var33.Parent = carouselDivider_1
	local var34 = line:Clone()
	var34.Position = UDim2.new(0.75, 0, 0, -3)
	var34.Parent = carouselDivider_1
end

function t:RemovePlayerEntry(p5) --[[ line: 244 ]]
	-- upvalues: t_2 (write), t_1 (write), var9 (write)
	local var35 = t_2[p5]
	
	if var35 then
		t_2[p5] = nil
		t_1[var35] = nil
		var35:Destroy()
		
		if var9 then
			var9:ApplyLayout()
		end
		self:FadeTowardsEdges()
	end
end

function t.ClearPlayerEntries(_) --[[ line: 259 ]]
	-- upvalues: t_1 (write), t_2 (write)
	for i in pairs(t_1) do
		i:Destroy()
	end
	t_1 = {}
	t_2 = {}
end

function t.CreatePlayerEntry(_, p6, p7) --[[ line: 268 ]]
	-- upvalues: t_2 (write), color_1 (ref), color (ref), tweenService (ref), t_1 (write), var9 (write), var8 (write), avatarContextMenu (ref), guiService (ref)
	local var36 = t_2[p6]
	
	if var36 then
		var36.LayoutOrder = p7
		
		return
	end
	local imageButton = Instance.new("ImageButton")
	imageButton.Name = p6.Name
	imageButton.BorderSizePixel = 0
	imageButton.LayoutOrder = p7
	imageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	imageButton.BackgroundTransparency = 0
	imageButton.Size = UDim2.new(1, 0, 1, 0)
	imageButton.SelectionLost:connect(function() --[[ line: 283 ]]
		-- upvalues: imageButton (ref), color_1 (copy)
		imageButton.BackgroundColor3 = color_1
	end)
	imageButton.SelectionGained:connect(function() --[[ line: 284 ]]
		-- upvalues: imageButton (ref), color (copy)
		imageButton.BackgroundColor3 = color
	end)
	local _ = nil
	local var38 = tweenService:Create(imageButton, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), { BackgroundColor3 = Color3.fromRGB(255, 255, 255) })
	var38:Play()
	t_1[imageButton] = p6
	t_2[p6] = imageButton
	imageButton.MouseButton1Click:Connect(function() --[[ line: 298 ]]
		-- upvalues: var9 (copy), imageButton (ref)
		var9:JumpTo(imageButton)
	end)
	imageButton.Parent = var8
	spawn(function() --[[ line: 304 ]]
		-- upvalues: avatarContextMenu (copy), imageButton (ref), p6 (ref), var38 (write), guiService (copy), color (copy), color_1 (copy)
		imageButton.Image = require(avatarContextMenu:WaitForChild("ContextMenuUtil")):GetHeadshotForPlayer(p6)
		var38:Cancel()
		var38 = nil
		
		if imageButton == guiService.SelectedCoreObject then
			imageButton.BackgroundColor3 = color
			
			return
		end
		imageButton.BackgroundColor3 = color_1
	end)
end

function t:SwitchToPlayerEntry(p8, p9) --[[ line: 317 ]]
	-- upvalues: t_2 (write), var9 (write)
	if not p8 then return end
	local var39 = t_2[p8]
	
	if not var39 then
		self:CreatePlayerEntry(p8, 0)
		var39 = t_2[p8]
	end
	if p9 then
		var9.TweenTime = 0
	end
	var9:JumpTo(var39)
	spawn(function() --[[ line: 330 ]]
		-- upvalues: var9 (copy)
		var9.TweenTime = 0.25
	end)
end

function t.OffsetPlayerEntry(_, p10) --[[ line: 335 ]]
	-- upvalues: var9 (write)
	if p10 == 0 then return end
	if p10 > 0 then
		var9:Next()
		
		return
	end
	var9:Previous()
end

function t.GetSelectedPlayer(_) --[[ line: 345 ]]
	-- upvalues: t_1 (write), var9 (write)
	return t_1[var9.CurrentPage]
end

function t.new(p11) --[[ line: 349 ]]
	-- upvalues: t (ref), CreateMenuCarousel (ref), var10 (write)
	local tbl = setmetatable({}, t)
	tbl.rbxGui = CreateMenuCarousel(p11)
	tbl.PlayerChanged = var10.Event
	var10.Event:Connect(function() --[[ line: 355 ]]
		-- upvalues: tbl (ref)
		tbl:FadeTowardsEdges()
	end)
	
	return tbl
end

return t