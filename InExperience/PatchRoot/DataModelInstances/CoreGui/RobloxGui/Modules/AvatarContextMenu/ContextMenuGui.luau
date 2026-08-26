local guiService = game:GetService("GuiService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local modules = robloxGui:WaitForChild("Modules")
local settings = modules:WaitForChild("Settings")
local avatarContextMenu = modules:WaitForChild("AvatarContextMenu")
local var1 = nil
local bindableEvent = Instance.new("BindableEvent")
local _ = require(avatarContextMenu:WaitForChild("ContextMenuUtil"))
local _ = require(settings:WaitForChild("Utility"))
local t = {}
t.__index = t

function t.CreateContextMenuHolder(_, _)
	-- upvalues: robloxGui (ref)
	local avatarContextMenu = Instance.new("Frame")
	avatarContextMenu.Name = "AvatarContextMenu"
	avatarContextMenu.Position = UDim2.new(0, 0, 0, 0)
	avatarContextMenu.Size = UDim2.new(1, 0, 1, 0)
	avatarContextMenu.BackgroundTransparency = 1
	avatarContextMenu.Parent = robloxGui
	avatarContextMenu.AutoLocalize = false
	
	return avatarContextMenu
end

function t.CreateLeaveMenuButton(p1, p2, p3)
	local function closeMenu()
		-- upvalues: p1 (ref)
		p1.CloseMenuFunc()
	end
	
	local closeMenuButton = Instance.new("ImageButton")
	closeMenuButton.Name = "CloseMenuButton"
	closeMenuButton.BackgroundTransparency = 1
	closeMenuButton.AnchorPoint = Vector2.new(1, 0)
	closeMenuButton.Position = UDim2.new(1, -10, 0, 10)
	closeMenuButton.Size = UDim2.new(0.05, 0, 0.1, 0)
	closeMenuButton.Image = p3.LeaveMenuImage
	closeMenuButton.Selectable = false
	closeMenuButton.Activated:Connect(closeMenu)
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	UIAspectRatioConstraint.AspectRatio = 1
	UIAspectRatioConstraint.Parent = closeMenuButton
	closeMenuButton.Parent = p2
	
	return closeMenuButton
end

local function _(p1)
	if p1 == nil then return end
	local var2 = nil
	workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: var2 (write), p1 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if var2 then
			var2:Disconnect()
		end
		var2 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(p1)
		p1()
	end)
	local currentCamera = workspace.CurrentCamera
	var2 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(p1)
	p1()
end

function t:CreateMenuFrame(p1)
	-- upvalues: guiService (ref)
	local menuSizeConstraint
	local var2 = self:CreateContextMenuHolder()
	local menu = Instance.new("ImageButton")
	menu.Name = "Menu"
	menu.AnchorPoint = p1.AnchorPoint
	menu.Size = p1.Size
	menu.Position = p1.OnScreenPosition
	menu.BackgroundTransparency = p1.BackgroundTransparency
	menu.BackgroundColor3 = p1.BackgroundColor
	menu.Image = p1.BackgroundImage
	menu.ScaleType = p1.BackgroundImageScaleType
	menu.SliceCenter = p1.BackgroundImageSliceCenter
	menu.AutoButtonColor = false
	menu.BorderSizePixel = 0
	menu.Selectable = false
	menu.Visible = false
	menu.Active = true
	menu.ClipsDescendants = true
	menu.Modal = true
	guiService:AddSelectionParent("AvatarContextMenuGroup", menu)
	local menuAspectRatio = Instance.new("UIAspectRatioConstraint")
	menuAspectRatio.AspectType = Enum.AspectType.ScaleWithParentSize
	menuAspectRatio.DominantAxis = Enum.DominantAxis.Height
	menuAspectRatio.Name = "MenuAspectRatio"
	menuAspectRatio.AspectRatio = p1.AspectRatio
	menuAspectRatio.Parent = menu
	
	local function updateAspectRatioForViewport()
		-- upvalues: menuAspectRatio (ref)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		
		if viewportSize.x < viewportSize.y then
			menuAspectRatio.DominantAxis = Enum.DominantAxis.Width
			
			return
		end
		menuAspectRatio.DominantAxis = Enum.DominantAxis.Height
	end
	
	if updateAspectRatioForViewport ~= nil then
		menuSizeConstraint = nil
		workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: menuSizeConstraint (write), updateAspectRatioForViewport (ref)
			local currentCamera = workspace.CurrentCamera
			
			if menuSizeConstraint then
				menuSizeConstraint:Disconnect()
			end
			var12 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateAspectRatioForViewport)
			updateAspectRatioForViewport()
		end)
		local currentCamera = workspace.CurrentCamera
		menuSizeConstraint = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateAspectRatioForViewport)
		local viewportSize = workspace.CurrentCamera.ViewportSize
		
		if viewportSize.x < viewportSize.y then
			menuAspectRatio.DominantAxis = Enum.DominantAxis.Width
		else
			menuAspectRatio.DominantAxis = Enum.DominantAxis.Height
		end
	end
	menuSizeConstraint = Instance.new("UISizeConstraint")
	menuSizeConstraint.Name = "MenuSizeConstraint"
	menuSizeConstraint.MaxSize = p1.MaxSize
	menuSizeConstraint.MinSize = p1.MinSize
	menuSizeConstraint.Parent = menu
	local content = Instance.new("Frame")
	content.Name = "Content"
	content.Size = UDim2.new(1, 0, 1, 0)
	content.BackgroundTransparency = 1
	content.Parent = menu
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Parent = content
	local contextActionList = Instance.new("ScrollingFrame")
	contextActionList.Name = "ContextActionList"
	contextActionList.AnchorPoint = Vector2.new(0.5, 1)
	contextActionList.BackgroundColor3 = p1.ButtonFrameColor
	contextActionList.BackgroundTransparency = p1.ButtonFrameTransparency
	contextActionList.BorderSizePixel = 0
	contextActionList.LayoutOrder = 2
	contextActionList.Size = UDim2.new(1, -12, 0.54, 0)
	contextActionList.CanvasSize = UDim2.new(0, 0, 0, 208)
	contextActionList.ScrollBarThickness = 4
	contextActionList.Selectable = false
	contextActionList.Parent = content
	local UIListLayout_1 = Instance.new("UIListLayout")
	UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Top
	UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		-- upvalues: contextActionList (ref), UIListLayout_1 (ref)
		contextActionList.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_1.AbsoluteContentSize.Y)
	end)
	UIListLayout_1.Parent = contextActionList
	local nameTag = Instance.new("TextButton")
	nameTag.Name = "NameTag"
	nameTag.AnchorPoint = Vector2.new(0.5, 1)
	nameTag.BackgroundColor3 = p1.NameTagColor
	nameTag.AutoButtonColor = false
	nameTag.BorderSizePixel = 0
	nameTag.LayoutOrder = 1
	nameTag.Size = UDim2.new(1, -12, 0.16, 0)
	nameTag.Font = p1.Font
	nameTag.TextColor3 = p1.TextColor
	nameTag.TextSize = 24 * p1.TextScale
	nameTag.Text = ""
	nameTag.TextXAlignment = Enum.TextXAlignment.Center
	nameTag.TextYAlignment = Enum.TextYAlignment.Center
	nameTag.Selectable = false
	nameTag.Parent = content
	local underline = Instance.new("Frame")
	underline.Name = "Underline"
	underline.BackgroundColor3 = p1.NameUnderlineColor
	underline.AnchorPoint = Vector2.new(0, 1)
	underline.BorderSizePixel = 0
	underline.Position = UDim2.new(0, 0, 1, 0)
	underline.Size = UDim2.new(1, 0, 0, 2)
	underline.Parent = nameTag
	self:CreateLeaveMenuButton(menu, p1)
	menu.Parent = var2
	self.ContextMenuFrame = menu
	
	return menu
end

function t:UpdateGuiTheme(p1)
	-- upvalues: var1 (write)
	self.ContextMenuFrame.Size = p1.Size
	self.ContextMenuFrame.AnchorPoint = p1.AnchorPoint
	self.ContextMenuFrame.BackgroundTransparency = p1.BackgroundTransparency
	self.ContextMenuFrame.BackgroundColor3 = p1.BackgroundColor
	self.ContextMenuFrame.Image = p1.BackgroundImage
	self.ContextMenuFrame.ScaleType = p1.BackgroundImageScaleType
	self.ContextMenuFrame.SliceCenter = p1.BackgroundImageSliceCenter
	self.ContextMenuFrame.CloseMenuButton.Image = p1.LeaveMenuImage
	self.ContextMenuFrame.MenuSizeConstraint.MaxSize = p1.MaxSize
	self.ContextMenuFrame.MenuSizeConstraint.MinSize = p1.MinSize
	self.ContextMenuFrame.MenuAspectRatio.AspectRatio = p1.AspectRatio
	local content = self.ContextMenuFrame.Content
	content.ContextActionList.BackgroundColor3 = p1.ButtonFrameColor
	content.ContextActionList.BackgroundTransparency = p1.ButtonFrameTransparency
	content.NameTag.BackgroundColor3 = p1.NameTagColor
	content.NameTag.Font = p1.Font
	content.NameTag.TextColor3 = p1.TextColor
	content.NameTag.TextSize = 24 * p1.TextScale
	content.NameTag.Underline.BackgroundColor3 = p1.NameUnderlineColor
	
	if var1 then
		var1:UpdateGuiTheme(p1)
	end
end

function t:BuildPlayerCarousel(p1, p2)
	-- upvalues: var1 (write), avatarContextMenu (ref), bindableEvent (ref)
	if not var1 then
		var1 = require(avatarContextMenu.PlayerCarousel).new(p2)
		var1.rbxGui.Parent = self.ContextMenuFrame.Content
	end
	var1:ClearPlayerEntries()
	
	if self.PlayerChangedConnection then
		self.PlayerChangedConnection:Disconnect()
	end
	self.PlayerChangedConnection = var1.PlayerChanged:Connect(function(p3)
		-- upvalues: self (ref), bindableEvent (copy)
		if p3 then
			self.ContextMenuFrame.Content.NameTag.Text = p3.Name
		else
			self.ContextMenuFrame.Content.NameTag.Text = ""
		end
		bindableEvent:Fire(p3)
	end)
	
	for i = 1, #p1 do
		var1:CreatePlayerEntry(p1[i][1], p1[i][2])
	end
	var1:FadeTowardsEdges()
	var1:AddCarouselDivider()
end

function t.RemovePlayerEntry(_, p3)
	-- upvalues: var1 (write)
	if var1 then
		var1:RemovePlayerEntry(p3)
		
		return
	end
end

function t.GetBottomScreenPaddingConstant(_)
	return 0.02
end

function t:SetCloseMenuFunc(p3)
	self.CloseMenuFunc = p3
end

function t.SwitchToPlayerEntry(_, p3, p4)
	-- upvalues: var1 (write)
	if var1 then
		var1:SwitchToPlayerEntry(p3, p4)
		
		return
	end
end

function t.OffsetPlayerEntry(_, p3)
	-- upvalues: var1 (write)
	if var1 then
		var1:OffsetPlayerEntry(p3)
		
		return
	end
end

function t.GetSelectedPlayer(_)
	-- upvalues: var1 (write)
	return if var1 then var1:GetSelectedPlayer() else nil
end

function t.new()
	-- upvalues: t (ref), bindableEvent (ref)
	local tbl = setmetatable({}, t)
	tbl.CloseMenuFunc = nil
	tbl.ContextMenuFrame = nil
	tbl.LastSetPlayerIcon = nil
	tbl.PlayerChangedConnection = nil
	tbl.SelectedPlayerChanged = bindableEvent.Event
	
	return tbl
end

return t.new()