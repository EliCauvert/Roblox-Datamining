local GuiService = game:GetService("GuiService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Modules = RobloxGui:WaitForChild("Modules")
local AvatarContextMenu = Modules:WaitForChild("AvatarContextMenu")
local NewResult = nil
local BindableEvent = Instance.new("BindableEvent")
local _ = require(AvatarContextMenu:WaitForChild("ContextMenuUtil"))
local _ = require(Modules:WaitForChild("Settings"):WaitForChild("Utility"))
local Module = {}
Module.__index = Module

function Module:CreateContextMenuHolder(_)
	-- upvalues: RobloxGui (copy)
	local AvatarContextMenu = Instance.new("Frame")
	AvatarContextMenu.Name = "AvatarContextMenu"
	AvatarContextMenu.Position = UDim2.new(0, 0, 0, 0)
	AvatarContextMenu.Size = UDim2.new(1, 0, 1, 0)
	AvatarContextMenu.BackgroundTransparency = 1
	AvatarContextMenu.Parent = RobloxGui
	AvatarContextMenu.AutoLocalize = false
	
	return AvatarContextMenu
end

function Module.CreateLeaveMenuButton(p1, Parent, Frame)
	local function closeMenu()
		-- upvalues: p1 (copy)
		p1.CloseMenuFunc()
	end
	
	local CloseMenuButton = Instance.new("ImageButton")
	CloseMenuButton.Name = "CloseMenuButton"
	CloseMenuButton.BackgroundTransparency = 1
	CloseMenuButton.AnchorPoint = Vector2.new(1, 0)
	CloseMenuButton.Position = UDim2.new(1, -10, 0, 10)
	CloseMenuButton.Size = UDim2.new(0.05, 0, 0.1, 0)
	CloseMenuButton.Image = Frame.LeaveMenuImage
	CloseMenuButton.Selectable = false
	CloseMenuButton.Activated:Connect(closeMenu)
	local AspectRatio = Instance.new("UIAspectRatioConstraint")
	AspectRatio.AspectType = Enum.AspectType.FitWithinMaxSize
	AspectRatio.DominantAxis = Enum.DominantAxis.Height
	AspectRatio.AspectRatio = 1
	AspectRatio.Parent = CloseMenuButton
	CloseMenuButton.Parent = Parent
	
	return CloseMenuButton
end

local function _(Callback: () -> ())
	if Callback == nil then return end
	local Connection = nil
	workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: Connection (ref), Callback (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if Connection then
			Connection:Disconnect()
		end
		Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(Callback)
		Callback()
	end)
	local CurrentCamera = workspace.CurrentCamera
	
	if Connection then
		Connection:Disconnect()
	end
	Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(Callback)
	Callback()
end

function Module:CreateMenuFrame(Frame: Frame)
	-- upvalues: GuiService (copy)
	local ContextMenuHolder = self:CreateContextMenuHolder()
	local Menu = Instance.new("ImageButton")
	Menu.Name = "Menu"
	Menu.AnchorPoint = Frame.AnchorPoint
	Menu.Size = Frame.Size
	Menu.Position = Frame.OnScreenPosition
	Menu.BackgroundTransparency = Frame.BackgroundTransparency
	Menu.BackgroundColor3 = Frame.BackgroundColor
	Menu.Image = Frame.BackgroundImage
	Menu.ScaleType = Frame.BackgroundImageScaleType
	Menu.SliceCenter = Frame.BackgroundImageSliceCenter
	Menu.AutoButtonColor = false
	Menu.BorderSizePixel = 0
	Menu.Selectable = false
	Menu.Visible = false
	Menu.Active = true
	Menu.ClipsDescendants = true
	Menu.Modal = true
	GuiService:AddSelectionParent("AvatarContextMenuGroup", Menu)
	local MenuAspectRatio = Instance.new("UIAspectRatioConstraint")
	MenuAspectRatio.AspectType = Enum.AspectType.ScaleWithParentSize
	MenuAspectRatio.DominantAxis = Enum.DominantAxis.Height
	MenuAspectRatio.Name = "MenuAspectRatio"
	MenuAspectRatio.AspectRatio = Frame.AspectRatio
	MenuAspectRatio.Parent = Menu
	
	local function updateAspectRatioForViewport()
		-- upvalues: MenuAspectRatio (copy)
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		
		if ViewportSize.x < ViewportSize.y then
			MenuAspectRatio.DominantAxis = Enum.DominantAxis.Width
			
			return
		else
			MenuAspectRatio.DominantAxis = Enum.DominantAxis.Height
		end
	end
	
	if updateAspectRatioForViewport ~= nil then
		local Connection = nil
		workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: Connection (ref), updateAspectRatioForViewport (copy)
			local CurrentCamera = workspace.CurrentCamera
			
			if Connection then
				Connection:Disconnect()
			end
			Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateAspectRatioForViewport)
			updateAspectRatioForViewport()
		end)
		local CurrentCamera = workspace.CurrentCamera
		
		if Connection then
			Connection:Disconnect()
		end
		Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateAspectRatioForViewport)
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		
		if ViewportSize.x < ViewportSize.y then
			MenuAspectRatio.DominantAxis = Enum.DominantAxis.Width
		else
			MenuAspectRatio.DominantAxis = Enum.DominantAxis.Height
		end
	end
	local MenuSizeConstraint = Instance.new("UISizeConstraint")
	MenuSizeConstraint.Name = "MenuSizeConstraint"
	MenuSizeConstraint.MaxSize = Frame.MaxSize
	MenuSizeConstraint.MinSize = Frame.MinSize
	MenuSizeConstraint.Parent = Menu
	local Content = Instance.new("Frame")
	Content.Name = "Content"
	Content.Size = UDim2.new(1, 0, 1, 0)
	Content.BackgroundTransparency = 1
	Content.Parent = Menu
	local ListLayout = Instance.new("UIListLayout")
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout.Parent = Content
	local ContextActionList = Instance.new("ScrollingFrame")
	ContextActionList.Name = "ContextActionList"
	ContextActionList.AnchorPoint = Vector2.new(0.5, 1)
	ContextActionList.BackgroundColor3 = Frame.ButtonFrameColor
	ContextActionList.BackgroundTransparency = Frame.ButtonFrameTransparency
	ContextActionList.BorderSizePixel = 0
	ContextActionList.LayoutOrder = 2
	ContextActionList.Size = UDim2.new(1, -12, 0.54, 0)
	ContextActionList.CanvasSize = UDim2.new(0, 0, 0, 208)
	ContextActionList.ScrollBarThickness = 4
	ContextActionList.Selectable = false
	ContextActionList.Parent = Content
	local ListLayout1 = Instance.new("UIListLayout")
	ListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout1.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout1.VerticalAlignment = Enum.VerticalAlignment.Top
	ListLayout1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		-- upvalues: ContextActionList (copy), ListLayout1 (copy)
		ContextActionList.CanvasSize = UDim2.new(0, 0, 0, ListLayout1.AbsoluteContentSize.Y)
	end)
	ListLayout1.Parent = ContextActionList
	local NameTag = Instance.new("TextButton")
	NameTag.Name = "NameTag"
	NameTag.AnchorPoint = Vector2.new(0.5, 1)
	NameTag.BackgroundColor3 = Frame.NameTagColor
	NameTag.AutoButtonColor = false
	NameTag.BorderSizePixel = 0
	NameTag.LayoutOrder = 1
	NameTag.Size = UDim2.new(1, -12, 0.16, 0)
	NameTag.Font = Frame.Font
	NameTag.TextColor3 = Frame.TextColor
	NameTag.TextSize = 24 * Frame.TextScale
	NameTag.Text = ""
	NameTag.TextXAlignment = Enum.TextXAlignment.Center
	NameTag.TextYAlignment = Enum.TextYAlignment.Center
	NameTag.Selectable = false
	NameTag.Parent = Content
	local Underline = Instance.new("Frame")
	Underline.Name = "Underline"
	Underline.BackgroundColor3 = Frame.NameUnderlineColor
	Underline.AnchorPoint = Vector2.new(0, 1)
	Underline.BorderSizePixel = 0
	Underline.Position = UDim2.new(0, 0, 1, 0)
	Underline.Size = UDim2.new(1, 0, 0, 2)
	Underline.Parent = NameTag
	self:CreateLeaveMenuButton(Menu, Frame)
	Menu.Parent = ContextMenuHolder
	self.ContextMenuFrame = Menu
	
	return Menu
end

function Module:UpdateGuiTheme(Frame: Frame)
	-- upvalues: NewResult (ref)
	self.ContextMenuFrame.Size = Frame.Size
	self.ContextMenuFrame.AnchorPoint = Frame.AnchorPoint
	self.ContextMenuFrame.BackgroundTransparency = Frame.BackgroundTransparency
	self.ContextMenuFrame.BackgroundColor3 = Frame.BackgroundColor
	self.ContextMenuFrame.Image = Frame.BackgroundImage
	self.ContextMenuFrame.ScaleType = Frame.BackgroundImageScaleType
	self.ContextMenuFrame.SliceCenter = Frame.BackgroundImageSliceCenter
	self.ContextMenuFrame.CloseMenuButton.Image = Frame.LeaveMenuImage
	self.ContextMenuFrame.MenuSizeConstraint.MaxSize = Frame.MaxSize
	self.ContextMenuFrame.MenuSizeConstraint.MinSize = Frame.MinSize
	self.ContextMenuFrame.MenuAspectRatio.AspectRatio = Frame.AspectRatio
	local Content = self.ContextMenuFrame.Content
	Content.ContextActionList.BackgroundColor3 = Frame.ButtonFrameColor
	Content.ContextActionList.BackgroundTransparency = Frame.ButtonFrameTransparency
	Content.NameTag.BackgroundColor3 = Frame.NameTagColor
	Content.NameTag.Font = Frame.Font
	Content.NameTag.TextColor3 = Frame.TextColor
	Content.NameTag.TextSize = 24 * Frame.TextScale
	Content.NameTag.Underline.BackgroundColor3 = Frame.NameUnderlineColor
	
	if NewResult then
		NewResult:UpdateGuiTheme(Frame)
	end
end

function Module:BuildPlayerCarousel(p1, p2)
	-- upvalues: NewResult (ref), AvatarContextMenu (copy), BindableEvent (copy)
	if not NewResult then
		NewResult = require(AvatarContextMenu.PlayerCarousel).new(p2)
		NewResult.rbxGui.Parent = self.ContextMenuFrame.Content
	end
	NewResult:ClearPlayerEntries()
	
	if self.PlayerChangedConnection then
		self.PlayerChangedConnection:Disconnect()
	end
	self.PlayerChangedConnection = NewResult.PlayerChanged:Connect(function(p3)
		-- upvalues: self (copy), BindableEvent (upval)
		if p3 then
			self.ContextMenuFrame.Content.NameTag.Text = p3.Name
		else
			self.ContextMenuFrame.Content.NameTag.Text = ""
		end
		BindableEvent:Fire(p3)
	end)
	
	for i = 1, #p1 do
		NewResult:CreatePlayerEntry(p1[i][1], p1[i][2])
	end
	NewResult:FadeTowardsEdges()
	NewResult:AddCarouselDivider()
end

function Module:RemovePlayerEntry(p3)
	-- upvalues: NewResult (ref)
	if NewResult then
		NewResult:RemovePlayerEntry(p3)
		
		return
	end
end

function Module:GetBottomScreenPaddingConstant(): number
	return 0.02
end

function Module:SetCloseMenuFunc(CloseMenuFunc)
	self.CloseMenuFunc = CloseMenuFunc
end

function Module:SwitchToPlayerEntry(p3, p4)
	-- upvalues: NewResult (ref)
	if NewResult then
		NewResult:SwitchToPlayerEntry(p3, p4)
		
		return
	end
end

function Module:OffsetPlayerEntry(p3)
	-- upvalues: NewResult (ref)
	if NewResult then
		NewResult:OffsetPlayerEntry(p3)
		
		return
	end
end

function Module:GetSelectedPlayer()
	-- upvalues: NewResult (ref)
	return if NewResult then NewResult:GetSelectedPlayer() else nil
end

function Module.new()
	-- upvalues: Module (copy), BindableEvent (copy)
	local self = setmetatable({}, Module)
	self.CloseMenuFunc = nil
	self.ContextMenuFrame = nil
	self.LastSetPlayerIcon = nil
	self.PlayerChangedConnection = nil
	self.SelectedPlayerChanged = BindableEvent.Event
	
	return self
end

return Module.new()