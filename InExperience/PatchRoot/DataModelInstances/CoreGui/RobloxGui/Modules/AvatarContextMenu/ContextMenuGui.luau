local guiService = game:GetService("GuiService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local modules = robloxGui:WaitForChild("Modules")
local settings = modules:WaitForChild("Settings")
local avatarContextMenu = modules:WaitForChild("AvatarContextMenu")
local var5 = nil
local bindableEvent = Instance.new("BindableEvent")
local _ = require(avatarContextMenu:WaitForChild("ContextMenuUtil"))
local _ = require(settings:WaitForChild("Utility"))
local t = {}
t.__index = t

function t.CreateContextMenuHolder(_, _) --[[ line: 33 ]]
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

function t.CreateLeaveMenuButton(p0, p1, p2) --[[ line: 44 ]]
	local function closeMenu() --[[ line: 45 ]]
		-- upvalues: p0 (ref)
		p0.CloseMenuFunc()
	end
	
	local closeMenuButton = Instance.new("ImageButton")
	closeMenuButton.Name = "CloseMenuButton"
	closeMenuButton.BackgroundTransparency = 1
	closeMenuButton.AnchorPoint = Vector2.new(1, 0)
	closeMenuButton.Position = UDim2.new(1, -10, 0, 10)
	closeMenuButton.Size = UDim2.new(0.05, 0, 0.1, 0)
	closeMenuButton.Image = p2.LeaveMenuImage
	closeMenuButton.Selectable = false
	closeMenuButton.Activated:Connect(closeMenu)
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.AspectType = Enum.AspectType.FitWithinMaxSize
	UIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height
	UIAspectRatioConstraint.AspectRatio = 1
	UIAspectRatioConstraint.Parent = closeMenuButton
	closeMenuButton.Parent = p1
	
	return closeMenuButton
end

local function _(p3) --[[ line: 71 | named "listenToViewportChange" ]]
	if p3 == nil then return end
	local var12 = nil
	workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 76 | named "updateCamera" ]]
		-- upvalues: var12 (write), p3 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if var12 then
			var12:Disconnect()
		end
		var12 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(p3)
		p3()
	end)
	local currentCamera = workspace.CurrentCamera
	var12 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(p3)
	p3()
end

function t:CreateMenuFrame(p4) --[[ line: 89 ]]
	-- upvalues: guiService (ref)
	local menuSizeConstraint
	local var13 = self:CreateContextMenuHolder()
	local menu = Instance.new("ImageButton")
	menu.Name = "Menu"
	menu.AnchorPoint = p4.AnchorPoint
	menu.Size = p4.Size
	menu.Position = p4.OnScreenPosition
	menu.BackgroundTransparency = p4.BackgroundTransparency
	menu.BackgroundColor3 = p4.BackgroundColor
	menu.Image = p4.BackgroundImage
	menu.ScaleType = p4.BackgroundImageScaleType
	menu.SliceCenter = p4.BackgroundImageSliceCenter
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
	menuAspectRatio.AspectRatio = p4.AspectRatio
	menuAspectRatio.Parent = menu
	
	local function updateAspectRatioForViewport() --[[ line: 120 ]]
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
		workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 76 | named "updateCamera" ]]
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
	menuSizeConstraint.MaxSize = p4.MaxSize
	menuSizeConstraint.MinSize = p4.MinSize
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
	contextActionList.BackgroundColor3 = p4.ButtonFrameColor
	contextActionList.BackgroundTransparency = p4.ButtonFrameTransparency
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
	UIListLayout_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ line: 166 ]]
		-- upvalues: contextActionList (ref), UIListLayout_1 (ref)
		contextActionList.CanvasSize = UDim2.new(0, 0, 0, UIListLayout_1.AbsoluteContentSize.Y)
	end)
	UIListLayout_1.Parent = contextActionList
	local nameTag = Instance.new("TextButton")
	nameTag.Name = "NameTag"
	nameTag.AnchorPoint = Vector2.new(0.5, 1)
	nameTag.BackgroundColor3 = p4.NameTagColor
	nameTag.AutoButtonColor = false
	nameTag.BorderSizePixel = 0
	nameTag.LayoutOrder = 1
	nameTag.Size = UDim2.new(1, -12, 0.16, 0)
	nameTag.Font = p4.Font
	nameTag.TextColor3 = p4.TextColor
	nameTag.TextSize = 24 * p4.TextScale
	nameTag.Text = ""
	nameTag.TextXAlignment = Enum.TextXAlignment.Center
	nameTag.TextYAlignment = Enum.TextYAlignment.Center
	nameTag.Selectable = false
	nameTag.Parent = content
	local underline = Instance.new("Frame")
	underline.Name = "Underline"
	underline.BackgroundColor3 = p4.NameUnderlineColor
	underline.AnchorPoint = Vector2.new(0, 1)
	underline.BorderSizePixel = 0
	underline.Position = UDim2.new(0, 0, 1, 0)
	underline.Size = UDim2.new(1, 0, 0, 2)
	underline.Parent = nameTag
	self:CreateLeaveMenuButton(menu, p4)
	menu.Parent = var13
	self.ContextMenuFrame = menu
	
	return menu
end

function t:UpdateGuiTheme(p5) --[[ line: 206 ]]
	-- upvalues: var5 (write)
	self.ContextMenuFrame.Size = p5.Size
	self.ContextMenuFrame.AnchorPoint = p5.AnchorPoint
	self.ContextMenuFrame.BackgroundTransparency = p5.BackgroundTransparency
	self.ContextMenuFrame.BackgroundColor3 = p5.BackgroundColor
	self.ContextMenuFrame.Image = p5.BackgroundImage
	self.ContextMenuFrame.ScaleType = p5.BackgroundImageScaleType
	self.ContextMenuFrame.SliceCenter = p5.BackgroundImageSliceCenter
	self.ContextMenuFrame.CloseMenuButton.Image = p5.LeaveMenuImage
	self.ContextMenuFrame.MenuSizeConstraint.MaxSize = p5.MaxSize
	self.ContextMenuFrame.MenuSizeConstraint.MinSize = p5.MinSize
	self.ContextMenuFrame.MenuAspectRatio.AspectRatio = p5.AspectRatio
	local content = self.ContextMenuFrame.Content
	content.ContextActionList.BackgroundColor3 = p5.ButtonFrameColor
	content.ContextActionList.BackgroundTransparency = p5.ButtonFrameTransparency
	content.NameTag.BackgroundColor3 = p5.NameTagColor
	content.NameTag.Font = p5.Font
	content.NameTag.TextColor3 = p5.TextColor
	content.NameTag.TextSize = 24 * p5.TextScale
	content.NameTag.Underline.BackgroundColor3 = p5.NameUnderlineColor
	
	if var5 then
		var5:UpdateGuiTheme(p5)
	end
end

function t:BuildPlayerCarousel(p6, p7) --[[ line: 239 ]]
	-- upvalues: var5 (write), avatarContextMenu (ref), bindableEvent (ref)
	if not var5 then
		var5 = require(avatarContextMenu.PlayerCarousel).new(p7)
		var5.rbxGui.Parent = self.ContextMenuFrame.Content
	end
	var5:ClearPlayerEntries()
	
	if self.PlayerChangedConnection then
		self.PlayerChangedConnection:Disconnect()
	end
	self.PlayerChangedConnection = var5.PlayerChanged:Connect(function(p8) --[[ line: 251 ]]
		-- upvalues: self (ref), bindableEvent (copy)
		if p8 then
			self.ContextMenuFrame.Content.NameTag.Text = p8.Name
		else
			self.ContextMenuFrame.Content.NameTag.Text = ""
		end
		bindableEvent:Fire(p8)
	end)
	
	for i = 1, #p6 do
		var5:CreatePlayerEntry(p6[i][1], p6[i][2])
	end
	var5:FadeTowardsEdges()
	var5:AddCarouselDivider()
end

function t.RemovePlayerEntry(_, p9) --[[ line: 267 ]]
	-- upvalues: var5 (write)
	if var5 then
		var5:RemovePlayerEntry(p9)
		
		return
	end
end

function t.GetBottomScreenPaddingConstant(_) --[[ line: 273 ]]
	return 0.02
end

function t:SetCloseMenuFunc(p10) --[[ line: 277 ]]
	self.CloseMenuFunc = p10
end

function t.SwitchToPlayerEntry(_, p11, p12) --[[ line: 281 ]]
	-- upvalues: var5 (write)
	if var5 then
		var5:SwitchToPlayerEntry(p11, p12)
		
		return
	end
end

function t.OffsetPlayerEntry(_, p13) --[[ line: 286 ]]
	-- upvalues: var5 (write)
	if var5 then
		var5:OffsetPlayerEntry(p13)
		
		return
	end
end

function t.GetSelectedPlayer(_) --[[ line: 291 ]]
	-- upvalues: var5 (write)
	return if var5 then var5:GetSelectedPlayer() else nil
end

function t.new() --[[ line: 296 ]]
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