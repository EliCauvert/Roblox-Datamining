local PlayerCarouselModule = {}
PlayerCarouselModule.__index = PlayerCarouselModule
local GuiService = game:GetService("GuiService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local _Color3 = Color3.fromRGB(0, 162, 255)
local _Color3_1 = Color3.fromRGB(0, 0, 0)
local AvatarContextMenu = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("AvatarContextMenu")
local Frame = nil
local PageLayout = nil
local BindableEvent = nil
local Keys = {}
local ImageButtons = {}

local function getSortedCarouselButtons()
	-- upvalues: Frame (ref)
	local t = {}
	local List = {}
	
	for i, Gui in ipairs(Frame:GetChildren()) do
		if Gui:IsA("GuiObject") and Gui.Name ~= "_CarouselDivider" then
			table.insert(List, Gui)
			t[Gui] = i
		end
	end
	table.sort(List, function(A: Frame, B: Frame): boolean
		-- upvalues: t (copy)
		return if A.LayoutOrder == B.LayoutOrder then t[A] < t[B] else A.LayoutOrder < B.LayoutOrder
	end)
	
	return List
end

local function CreateMenuCarousel(p1)
	-- upvalues: Frame (ref), PageLayout (ref), BindableEvent (ref), getSortedCarouselButtons (copy), _Color3_1 (copy), GuiService (copy), _Color3 (copy), Keys (ref), UserInputService (copy)
	local PlayerCarousel = Instance.new("Frame")
	PlayerCarousel.Name = "PlayerCarousel"
	PlayerCarousel.AnchorPoint = Vector2.new(0.5, 0.5)
	PlayerCarousel.BackgroundTransparency = 1
	PlayerCarousel.Position = UDim2.new(0.5, 0, 0.5, 0)
	PlayerCarousel.Size = UDim2.new(1, 0, 0.28, 0)
	PlayerCarousel.ClipsDescendants = true
	local InnerFrame = Instance.new("Frame")
	InnerFrame.Name = "InnerFrame"
	InnerFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	InnerFrame.BackgroundTransparency = 1
	InnerFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	InnerFrame.Size = UDim2.new(0.8, 0, 1, 0)
	InnerFrame.ClipsDescendants = true
	InnerFrame.Active = true
	InnerFrame.Parent = PlayerCarousel
	Frame = Instance.new("Frame")
	Frame.Name = "SelectedPlayer"
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundTransparency = 1
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(0, 100, 1, -10)
	Frame.Parent = InnerFrame
	PageLayout = Instance.new("UIPageLayout")
	PageLayout.EasingDirection = Enum.EasingDirection.Out
	PageLayout.EasingStyle = Enum.EasingStyle.Quad
	PageLayout.Padding = UDim.new(0, 5)
	PageLayout.TweenTime = 0.25
	PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	PageLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	PageLayout.TouchInputEnabled = false
	PageLayout.Circular = true
	PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	local AspectRatio = Instance.new("UIAspectRatioConstraint")
	AspectRatio.DominantAxis = Enum.DominantAxis.Height
	AspectRatio.Parent = Frame
	BindableEvent = Instance.new("BindableEvent")
	BindableEvent.Name = "PlayerChanged"
	local CurrentPage = nil
	PageLayout:GetPropertyChangedSignal("CurrentPage"):Connect(function()
		-- upvalues: PageLayout (upval), getSortedCarouselButtons (upval), CurrentPage (ref), _Color3_1 (upval), GuiService (upval), _Color3 (upval), BindableEvent (upval), Keys (upval)
		if PageLayout.CurrentPage then
			if PageLayout.CurrentPage.Name == "_CarouselDivider" then
				if CurrentPage == getSortedCarouselButtons()[1] then
					PageLayout:Previous()
				else
					PageLayout:Next()
				end
			else
				PageLayout.CurrentPage.BackgroundColor3 = _Color3_1
				CurrentPage = PageLayout.CurrentPage
			end
		end
		if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject.Parent == PageLayout.Parent then
			GuiService.SelectedCoreObject.BackgroundColor3 = _Color3
		end
		GuiService.SelectedCoreObject = PageLayout.CurrentPage
		
		if PageLayout.CurrentPage then
			BindableEvent:Fire(Keys[PageLayout.CurrentPage])
		end
	end)
	PageLayout.Parent = Frame
	local NextButton = Instance.new("ImageButton")
	NextButton.Name = "NextButton"
	NextButton.Image = p1.ScrollRightImage
	NextButton.BackgroundTransparency = 1
	NextButton.AnchorPoint = Vector2.new(1, 0.5)
	NextButton.Position = UDim2.new(1, -5, 0.5, 0)
	NextButton.Size = UDim2.new(0.3, 0, 0.3, 0)
	NextButton.Selectable = false
	NextButton.Parent = PlayerCarousel
	local AspectRatio1 = Instance.new("UIAspectRatioConstraint")
	AspectRatio1.DominantAxis = Enum.DominantAxis.Width
	AspectRatio1.Parent = NextButton
	local PrevButton = NextButton:Clone()
	PrevButton.Name = "PrevButton"
	
	if p1.ScrollLeftImage == "" then
		PrevButton.Rotation = 180
	else
		PrevButton.Image = p1.ScrollLeftImage
	end
	PrevButton.AnchorPoint = Vector2.new(0, 0.5)
	PrevButton.Position = UDim2.new(0, 5, 0.5, 0)
	PrevButton.Selectable = false
	PrevButton.Parent = PlayerCarousel
	
	local function _(p2)
		-- upvalues: PageLayout (upval)
		if p2 then
			PageLayout:Next()
			
			return
		else
			PageLayout:Previous()
		end
	end
	
	NextButton.MouseButton1Click:Connect(function()
		-- upvalues: PageLayout (upval)
		PageLayout:Next()
	end)
	PrevButton.MouseButton1Click:Connect(function()
		-- upvalues: PageLayout (upval)
		PageLayout:Previous()
	end)
	
	local function checkButtonVisibility()
		-- upvalues: UserInputService (upval), PrevButton (copy), Frame (upval), NextButton (copy)
		local IsLastInputTypeMatch = UserInputService:GetLastInputType() == Enum.UserInputType.Touch
		PrevButton.Visible = not IsLastInputTypeMatch and #Frame:GetChildren() > 3
		NextButton.Visible = not IsLastInputTypeMatch and #Frame:GetChildren() > 3
	end
	
	local IsLastInputTypeMatch = UserInputService:GetLastInputType() == Enum.UserInputType.Touch
	PrevButton.Visible = not IsLastInputTypeMatch and #Frame:GetChildren() > 3
	NextButton.Visible = not IsLastInputTypeMatch and #Frame:GetChildren() > 3
	UserInputService.LastInputTypeChanged:Connect(checkButtonVisibility)
	
	return PlayerCarousel
end

function PlayerCarouselModule:UpdateGuiTheme(p1)
	self.rbxGui.NextButton.Image = p1.ScrollRightImage
	
	if p1.ScrollLeftImage == "" then
		self.rbxGui.PrevButton.Image = p1.ScrollRightImage
		self.rbxGui.PrevButton.Rotation = 180
		
		return
	else
		self.rbxGui.PrevButton.Image = p1.ScrollLeftImage
	end
end

function PlayerCarouselModule:FadeTowardsEdges()
	-- upvalues: PageLayout (ref), getSortedCarouselButtons (copy)
	if not PageLayout.CurrentPage then return end
	local SortedCarouselButtons = getSortedCarouselButtons()
	local v1 = 0
	
	for i, sortedCarouselButton in ipairs(SortedCarouselButtons) do
		if sortedCarouselButton == PageLayout.CurrentPage then
			v1 = i
			break
		end
	end
	for i1, sortedCarouselButton1 in ipairs(SortedCarouselButtons) do
		local Smallest = math.min((v1 - i1) % #SortedCarouselButtons, (i1 - v1) % #SortedCarouselButtons)
		
		if Smallest >= 2 then
			sortedCarouselButton1.ImageTransparency = 0.7
		elseif Smallest == 1 then
			sortedCarouselButton1.ImageTransparency = 0.4
		else
			sortedCarouselButton1.ImageTransparency = 0
		end
	end
end

function PlayerCarouselModule:AddCarouselDivider()
	-- upvalues: Frame (ref)
	local CarouselDivider = Frame:FindFirstChild("_CarouselDivider")
	
	if CarouselDivider then
		CarouselDivider:Destroy()
	end
	if #Frame:GetChildren() - 1 >= 5 then
		local _CarouselDivider = Instance.new("Frame")
		_CarouselDivider.Name = "_CarouselDivider"
		_CarouselDivider.Size = UDim2.new(1, 0, 1, 0)
		_CarouselDivider.BackgroundTransparency = 1
		_CarouselDivider.Parent = Frame
		_CarouselDivider.LayoutOrder = 1000000
		local line = Instance.new("Frame")
		line.Name = "line"
		line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		line.BorderSizePixel = 0
		line.Position = UDim2.new(0.25, 0, 0, -3)
		line.Size = UDim2.new(0, 2, 1, 6)
		line.Parent = _CarouselDivider
		local LineClone = line:Clone()
		LineClone.Position = UDim2.new(0.5, 0, 0, -3)
		LineClone.Parent = _CarouselDivider
		local LineClone1 = line:Clone()
		LineClone1.Position = UDim2.new(0.75, 0, 0, -3)
		LineClone1.Parent = _CarouselDivider
		
		return
	end
end

function PlayerCarouselModule:RemovePlayerEntry(Key)
	-- upvalues: ImageButtons (ref), Keys (ref), PageLayout (ref)
	local ImageButton = ImageButtons[Key]
	
	if ImageButton then
		ImageButtons[Key] = nil
		Keys[ImageButton] = nil
		ImageButton:Destroy()
		
		if PageLayout then
			PageLayout:ApplyLayout()
		end
		self:FadeTowardsEdges()
	end
end

function PlayerCarouselModule:ClearPlayerEntries()
	-- upvalues: Keys (ref), ImageButtons (ref)
	for key in pairs(Keys) do
		key:Destroy()
	end
	Keys = {}
	ImageButtons = {}
end

function PlayerCarouselModule:CreatePlayerEntry(Key, LayoutOrder)
	-- upvalues: ImageButtons (ref), _Color3_1 (copy), _Color3 (copy), TweenService (copy), Keys (ref), PageLayout (ref), Frame (ref), AvatarContextMenu (copy), GuiService (copy)
	local ImageButton = ImageButtons[Key]
	
	if ImageButton then
		ImageButton.LayoutOrder = LayoutOrder
		
		return
	else
		local ImageButton1 = Instance.new("ImageButton")
		ImageButton1.Name = Key.Name
		ImageButton1.BorderSizePixel = 0
		ImageButton1.LayoutOrder = LayoutOrder
		ImageButton1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		ImageButton1.BackgroundTransparency = 0
		ImageButton1.Size = UDim2.new(1, 0, 1, 0)
		ImageButton1.SelectionLost:connect(function()
			-- upvalues: ImageButton1 (copy), _Color3_1 (upval)
			ImageButton1.BackgroundColor3 = _Color3_1
		end)
		ImageButton1.SelectionGained:connect(function()
			-- upvalues: ImageButton1 (copy), _Color3 (upval)
			ImageButton1.BackgroundColor3 = _Color3
		end)
		local Tween = nil
		Tween = TweenService:Create(ImageButton1, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true), { BackgroundColor3 = Color3.fromRGB(255, 255, 255) })
		Tween:Play()
		Keys[ImageButton1] = Key
		ImageButtons[Key] = ImageButton1
		ImageButton1.MouseButton1Click:Connect(function()
			-- upvalues: PageLayout (upval), ImageButton1 (copy)
			PageLayout:JumpTo(ImageButton1)
		end)
		ImageButton1.Parent = Frame
		spawn(function()
			-- upvalues: AvatarContextMenu (upval), ImageButton1 (copy), Key (copy), Tween (ref), GuiService (upval), _Color3 (upval), _Color3_1 (upval)
			ImageButton1.Image = require(AvatarContextMenu:WaitForChild("ContextMenuUtil")):GetHeadshotForPlayer(Key)
			Tween:Cancel()
			Tween = nil
			
			if ImageButton1 == GuiService.SelectedCoreObject then
				ImageButton1.BackgroundColor3 = _Color3
				
				return
			else
				ImageButton1.BackgroundColor3 = _Color3_1
			end
		end)
	end
end

function PlayerCarouselModule:SwitchToPlayerEntry(p1, p2)
	-- upvalues: ImageButtons (ref), PageLayout (ref)
	if not p1 then return end
	local ImageButton = ImageButtons[p1]
	
	if not ImageButton then
		self:CreatePlayerEntry(p1, 0)
		ImageButton = ImageButtons[p1]
	end
	if p2 then
		PageLayout.TweenTime = 0
	end
	PageLayout:JumpTo(ImageButton)
	spawn(function()
		-- upvalues: PageLayout (upval)
		PageLayout.TweenTime = 0.25
	end)
end

function PlayerCarouselModule:OffsetPlayerEntry(p1: number)
	-- upvalues: PageLayout (ref)
	if p1 == 0 then return end
	if p1 > 0 then
		PageLayout:Next()
		
		return
	else
		PageLayout:Previous()
	end
end

function PlayerCarouselModule:GetSelectedPlayer()
	-- upvalues: Keys (ref), PageLayout (ref)
	return Keys[PageLayout.CurrentPage]
end

function PlayerCarouselModule.new(p1)
	-- upvalues: PlayerCarouselModule (copy), CreateMenuCarousel (copy), BindableEvent (ref)
	local self = setmetatable({}, PlayerCarouselModule)
	self.rbxGui = CreateMenuCarousel(p1)
	self.PlayerChanged = BindableEvent.Event
	BindableEvent.Event:Connect(function()
		-- upvalues: self (copy)
		self:FadeTowardsEdges()
	end)
	
	return self
end

return PlayerCarouselModule