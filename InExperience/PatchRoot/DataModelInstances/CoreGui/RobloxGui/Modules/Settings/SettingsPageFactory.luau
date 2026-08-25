local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local tweenService = game:GetService("TweenService")
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local themeModule = require(robloxGui.Modules.Settings.Theme)
local appCommonLibModule = require(corePackagesService.Workspace.Packages.AppCommonLib)
local create = appCommonLibModule.Create
local signal = appCommonLibModule.Signal
robloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local var1 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local getFFlagFixIGMTabTransitionsModule = require(script.Parent.Flags.GetFFlagFixIGMTabTransitions)
local fFlagIEMSettingsGroupsModule = require(script.Parent.Flags.FFlagIEMSettingsGroups)
local fFlagIEMFocusNavSupportNewButtonsModule = require(script.Parent.Flags.FFlagIEMFocusNavSupportNewButtons)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagIEMTabFocusNav = sharedFlagsModule.FFlagIEMTabFocusNav
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagIEMFocusNavPeoplePageToButtons = sharedFlagsModule.FFlagIEMFocusNavPeoplePageToButtons

local function Initialize()
	-- upvalues: fFlagEnableSideSheet (ref), signal (ref), fFlagIEMTabFocusNav (ref), create (ref), utilityModule (ref), var1 (ref), themeModule (ref), fFlagIEMFocusNavPeoplePageToButtons (ref), guiService (ref), httpService (ref), fFlagIEMSettingsGroupsModule (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), coreGuiService (ref), userGameSettingsService (ref), getFFlagFixIGMTabTransitionsModule (ref), tweenService (ref)
	local hidden = {
		HubRef = nil,
		LastSelectedObject = nil,
		TabPosition = 0,
		Active = false,
		OpenStateChangedCount = 0,
		ShouldShowBottomBar = not fFlagEnableSideSheet,
		ShouldShowHubBar = true,
		ShouldDisableDefaultScroll = false,
		IsPageClipped = true,
		SelectARow = nil,
		LastSelectableObjectsUpdated = signal.new(),
		LastSelectableObjects = {},
		PageNextSelectionDown = nil
	}
	
	if fFlagIEMTabFocusNav then
		hidden.FirstSelectableObjectsUpdated = signal.new()
		hidden.FirstSelectableObjects = {}
	end
	local t_1 = {}
	local var1 = false
	hidden.TabHeader = create("TextButton")({
		Name = "Header",
		Text = "",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.2, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Selectable = if fFlagIEMTabFocusNav then true else false
	})
	
	if utilityModule:IsSmallTouchScreen() then
		hidden.TabHeader.Size = UDim2.new(0, 84, 1, 0)
	elseif var1 then
		hidden.TabHeader.Size = UDim2.new(0, 220, 1, 0)
	end
	if fFlagIEMTabFocusNav then
		local function switchToPage()
			-- upvalues: hidden (ref)
			if hidden.HubRef and hidden.HubRef.Pages.CurrentPage ~= hidden then
				hidden.HubRef:SwitchToPage(hidden, true)
			end
		end
		
		hidden.TabHeader.Activated:connect(switchToPage)
		hidden.TabHeader.SelectionGained:connect(switchToPage)
	else
		hidden.TabHeader.MouseButton1Click:connect(function()
			-- upvalues: hidden (ref)
			if hidden.HubRef then
				hidden.HubRef:SwitchToPage(hidden, true)
			end
		end)
	end
	local var2 = create("TextLabel")({
		Name = "Icon",
		BackgroundTransparency = 1,
		Text = "",
		TextScaled = true,
		TextTransparency = 0.5,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0, 10, 0.5, -18),
		TextColor3 = Color3.new(1, 1, 1),
		Parent = hidden.TabHeader
	})
	local _ = create("UIAspectRatioConstraint")({
		Name = "AspectRatioConstraint",
		AspectRatio = 1,
		Parent = var2
	})
	local var3 = create("TextLabel")({
		Name = "Title",
		Text = "",
		BackgroundTransparency = 1,
		TextTransparency = 0.5,
		Font = themeModule.font(Enum.Font.SourceSansBold, "Button"),
		TextColor3 = Color3.new(1, 1, 1),
		Size = UDim2.new(1.05, 0, 1, 0),
		Position = UDim2.new(1.2, themeModule.TabHeaderIconPadding, 0, -2),
		TextXAlignment = Enum.TextXAlignment.Left
	})
	var3.TextSize = themeModule.textSize(24)
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = themeModule.textSize(24)
	var3.Parent = var2
	
	if utilityModule:IsPortrait() and utilityModule:IsSmallTouchScreen() then
		UITextSizeConstraint.Parent = var3
	end
	if utilityModule:IsSmallTouchScreen() then
		var3.TextSize = themeModule.textSize(18)
		UITextSizeConstraint.MaxTextSize = themeModule.textSize(18)
	elseif var1 then
		var3.TextSize = themeModule.textSize(48)
		UITextSizeConstraint.MaxTextSize = themeModule.textSize(48)
	end
	local _ = create("ImageLabel")({
		Name = "TabSelection",
		Visible = false,
		BorderSizePixel = 0,
		BackgroundColor3 = themeModule.color("TabSelection"),
		BackgroundTransparency = themeModule.transparency("TabSelection"),
		Size = UDim2.new(1, -2, 0, 2),
		Position = UDim2.new(0, 3, 1, -2),
		Parent = hidden.TabHeader
	})
	local var4 = create("Frame")({
		Name = "TabLabel",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Parent = hidden.TabHeader
	})
	create("UIListLayout")({
		Name = "Layout",
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10),
		Parent = var4
	})
	var2.Parent = var4
	var3.Parent = var4
	var3.Size = UDim2.new(0, 0, 0, 0)
	var3.AutomaticSize = Enum.AutomaticSize.XY
	utilityModule:OnResized(hidden.TabHeader, function()
		-- upvalues: hidden (ref), utilityModule (copy), var2 (ref), var1 (copy), themeModule (copy), var4 (ref), var3 (ref)
		if not hidden.TabHeader then return end
		if utilityModule:IsSmallTouchScreen() then
			var2.Size = UDim2.new(0, 34, 0, 28)
		elseif var1 then
			var2.Size = UDim2.new(0, 88, 0, 74)
		else
			local iconSize = themeModule.getIconSize(themeModule.IconSize.Medium)
			var2.Size = UDim2.fromOffset(iconSize, iconSize)
		end
		local layout = var4.Layout
		
		if utilityModule:IsPortrait() then
			if utilityModule:IsSmallTouchScreen() then
				var3.FontSize = themeModule.fontSize(Enum.FontSize.Size14)
			end
			var2.Size = UDim2.new(0, 22, 0, 22)
			layout.FillDirection = Enum.FillDirection.Vertical
			layout.Padding = UDim.new(0, 0)
		elseif utilityModule:IsSmallTouchScreen() then
			var3.FontSize = themeModule.fontSize(Enum.FontSize.Size18)
		end
		layout.FillDirection = Enum.FillDirection.Horizontal
		layout.Padding = UDim.new(0, 10)
		var2.Size = UDim2.fromOffset(var2.Size.X.Offset * 0.666666666667, var2.Size.Y.Offset * 0.666666666667)
	end)
	hidden.Page = create("Frame")({
		Name = "Page",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
	create("UIPadding")({
		PaddingLeft = UDim.new(0, 12),
		PaddingRight = UDim.new(0, 11),
		Parent = hidden.Page
	})
	hidden.PageListLayout = create("UIListLayout")({
		Name = "RowListLayout",
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = hidden.Page
	})
	
	if fFlagIEMFocusNavPeoplePageToButtons then
		hidden.Page.SelectionGroup = true
	else
		guiService:AddSelectionParent(httpService:GenerateGUID(false), hidden.Page)
	end
	hidden.Displaying = Instance.new("BindableEvent")
	hidden.Displaying.Name = "Displaying"
	hidden.Displayed = Instance.new("BindableEvent")
	hidden.Displayed.Name = "Displayed"
	hidden.Displayed.Event:connect(function()
		-- upvalues: hidden (ref)
		if hidden.HubRef.Shield.Visible then
			hidden:SelectARow()
			
			return
		end
	end)
	hidden.Hidden = Instance.new("BindableEvent")
	hidden.Hidden.Event:connect(function()
		-- upvalues: guiService (copy), hidden (ref)
		if guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(hidden.Page) then
			guiService.SelectedCoreObject = nil
		end
	end)
	hidden.Hidden.Name = "Hidden"
	
	function hidden.getValueChangerFrame(_, p1)
		local _ = nil
		
		return if type(p1) == "table" then if p1.SliderFrame then p1.SliderFrame else p1.SelectorFrame or p1.DropDownFrame else p1
	end
	
	function hidden.SelectARow(_, p1)
		-- upvalues: fFlagIEMTabFocusNav (copy), guiService (copy), hidden (ref), t_1 (ref), fFlagIEMSettingsGroupsModule (copy), fFlagIEMFocusNavSupportNewButtonsModule (copy), coreGuiService (copy)
		if fFlagIEMTabFocusNav and not p1 and guiService.SelectedCoreObject == hidden.TabHeader then return end
		if p1 or not guiService.SelectedCoreObject or not guiService.SelectedCoreObject:IsDescendantOf(hidden.Page) then
			if hidden.LastSelectedObject then
				guiService.SelectedCoreObject = hidden.LastSelectedObject
				
				return
			elseif t_1 and #t_1 > 0 then
				local valueChangerValueChangerFrame
				local _ = nil
				
				if fFlagIEMSettingsGroupsModule then
					local var1 = 1e999
					local valueChanger = t_1[1].ValueChanger
					
					for i, v in t_1 do
						if v.SelectionFrame and v.SelectionFrame.LayoutOrder < var1 then
							var1 = v.SelectionFrame.LayoutOrder
							valueChanger = v
						end
					end
					valueChangerValueChangerFrame = hidden:getValueChangerFrame(valueChanger.ValueChanger)
				else
					valueChangerValueChangerFrame = hidden:getValueChangerFrame(t_1[1].ValueChanger)
				end
				guiService.SelectedCoreObject = valueChangerValueChangerFrame
				
				return
			elseif hidden.PageNextSelectionDown and (not fFlagIEMFocusNavSupportNewButtonsModule or hidden.PageNextSelectionDown:IsDescendantOf(coreGuiService)) then
				guiService.SelectedCoreObject = hidden.PageNextSelectionDown
			end
		end
	end
	
	function hidden.Display(_, p1, p2)
		-- upvalues: hidden (ref), var2 (ref), var3 (ref), userGameSettingsService (copy), getFFlagFixIGMTabTransitionsModule (copy), var1 (write), tweenService (copy)
		hidden.OpenStateChangedCount += 1
		
		if hidden.TabHeader then
			hidden.TabHeader.TabSelection.Visible = true
			var2.TextTransparency = 0
			var3.TextTransparency = 0
		end
		hidden.Page.Parent = p1
		hidden.Page.Visible = true
		hidden.Displaying:Fire()
		local uDim2 = UDim2.new(0, 0, 0, 0)
		
		local var1 = function()
			-- upvalues: userGameSettingsService (copy), p1 (ref), getFFlagFixIGMTabTransitionsModule (copy), hidden (copy), uDim2 (ref), var1 (copy)
			if userGameSettingsService.ReducedMotion then
				p1.InnerCanvasGroupShow.Visible = false
			end
			if getFFlagFixIGMTabTransitionsModule() then
				if userGameSettingsService.ReducedMotion then
					p1.InnerCanvasGroupShow.GroupTransparency = 0
				end
				hidden.Page.Position = uDim2
			end
			hidden.Page.Visible = true
			var1 = true
			hidden.Displayed:Fire()
		end
		
		if p2 then
			hidden.Page.Position = uDim2
			
			if userGameSettingsService.ReducedMotion then
				p1.InnerCanvasGroupShow.Visible = false
			end
			if getFFlagFixIGMTabTransitionsModule() then
				if userGameSettingsService.ReducedMotion then
					p1.InnerCanvasGroupShow.GroupTransparency = 0
				end
				hidden.Page.Position = uDim2
			end
			hidden.Page.Visible = true
			var1 = true
			hidden.Displayed:Fire()
			
			return
		elseif userGameSettingsService.ReducedMotion then
			hidden.Page.Position = uDim2
			p1.InnerCanvasGroupShow.GroupTransparency = 1
			p1.InnerCanvasGroupShow.Visible = true
			hidden.Page.Parent = p1.InnerCanvasGroupShow
			hidden.Page.Visible = true
			local innerCanvasGroupShow = tweenService:Create(p1.InnerCanvasGroupShow, TweenInfo.new(0.25), { GroupTransparency = 0 })
			innerCanvasGroupShow:Play()
			innerCanvasGroupShow.Completed:Connect(function()
				-- upvalues: hidden (copy), p1 (ref), userGameSettingsService (copy), getFFlagFixIGMTabTransitionsModule (copy), uDim2 (ref), var1 (copy)
				hidden.Page.Parent = p1
				
				if userGameSettingsService.ReducedMotion then
					p1.InnerCanvasGroupShow.Visible = false
				end
				if getFFlagFixIGMTabTransitionsModule() then
					if userGameSettingsService.ReducedMotion then
						p1.InnerCanvasGroupShow.GroupTransparency = 0
					end
					hidden.Page.Position = uDim2
				end
				hidden.Page.Visible = true
				var1 = true
				hidden.Displayed:Fire()
			end)
			
			return
		end
		hidden.Page:TweenPositionInternal(uDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, var1)
	end
	
	function hidden.Hide(_, p1, p2, p3, p4, p5, p6)
		-- upvalues: hidden (ref), var2 (ref), var3 (ref), userGameSettingsService (copy), var1 (write), tweenService (copy)
		hidden.OpenStateChangedCount += 1
		
		if hidden.TabHeader then
			hidden.TabHeader.TabSelection.Visible = false
			var2.TextTransparency = 0.5
			var3.TextTransparency = 0.5
		end
		if hidden.Page.Parent then
			local uDim2 = UDim2.new(1 * p1, 0, 0, 0)
			
			local var1 = function()
				-- upvalues: userGameSettingsService (copy), p6 (ref), p5 (ref), hidden (copy), p2 (ref), var1 (copy)
				if userGameSettingsService.ReducedMotion and p6 then
					p5.InnerCanvasGroupHide.Visible = false
				end
				hidden.Page.Visible = false
				hidden.Page.Position = UDim2.new(hidden.TabPosition - p2, 0, 0, 0)
				var1 = false
				hidden.Hidden:Fire()
			end
			
			local var2 = function()
				-- upvalues: p3 (ref), hidden (copy), uDim2 (ref), userGameSettingsService (copy), p6 (ref), p5 (ref), p2 (ref), var1 (copy), tweenService (copy), var1 (ref)
				if p3 then
					hidden.Page.Position = uDim2
					
					if userGameSettingsService.ReducedMotion and p6 then
						p5.InnerCanvasGroupHide.Visible = false
					end
					hidden.Page.Visible = false
					hidden.Page.Position = UDim2.new(hidden.TabPosition - p2, 0, 0, 0)
					var1 = false
					hidden.Hidden:Fire()
					
					return
				elseif userGameSettingsService.ReducedMotion and p6 then
					p5.InnerCanvasGroupHide.GroupTransparency = 0
					p5.InnerCanvasGroupHide.Visible = true
					hidden.Page.Parent = p5.InnerCanvasGroupHide
					local innerCanvasGroupHide = tweenService:Create(p5.InnerCanvasGroupHide, TweenInfo.new(0.25), { GroupTransparency = 1 })
					innerCanvasGroupHide:Play()
					innerCanvasGroupHide.Completed:Connect(function()
						-- upvalues: hidden (copy), p5 (copy), uDim2 (copy), userGameSettingsService (copy), p6 (copy), p2 (copy), var1 (copy)
						hidden.Page.Parent = p5
						hidden.Page.Position = uDim2
						
						if userGameSettingsService.ReducedMotion and p6 then
							p5.InnerCanvasGroupHide.Visible = false
						end
						hidden.Page.Visible = false
						hidden.Page.Position = UDim2.new(hidden.TabPosition - p2, 0, 0, 0)
						var1 = false
						hidden.Hidden:Fire()
					end)
					
					return
				end
				hidden.Page:TweenPositionInternal(uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, var1)
			end
			
			if p4 then
				local openStateChangedCount = hidden.OpenStateChangedCount
				delay(p4, function()
					-- upvalues: openStateChangedCount (ref), hidden (copy), var2 (ref)
					if openStateChangedCount == hidden.OpenStateChangedCount then
						var2()
					end
				end)
				
				return
			end
			var2()
		end
	end
	
	function hidden.GetDisplayed(_)
		-- upvalues: var1 (write)
		return var1
	end
	
	function hidden.GetVisibility(_)
		-- upvalues: hidden (ref)
		return hidden.Page.Parent
	end
	
	function hidden.GetTabHeader(_)
		-- upvalues: hidden (ref)
		return hidden.TabHeader
	end
	
	function hidden.GetRows(_)
		-- upvalues: t_1 (ref)
		return t_1
	end
	
	function hidden.SetHub(_, p1)
		-- upvalues: hidden (ref), t_1 (ref)
		hidden.HubRef = p1
		
		for i, v in next, t_1 do
			if type(v.ValueChanger) == "table" then
				v.ValueChanger.HubRef = hidden.HubRef
			end
		end
	end
	
	function hidden.GetSize(_)
		-- upvalues: hidden (ref)
		return hidden.Page.AbsoluteSize
	end
	
	function hidden.AddRow(_, p1, p2, p3, p4)
		-- upvalues: t_1 (ref), hidden (ref)
		t_1[#t_1 + 1] = { SelectionFrame = p1, Label = p2, ValueChanger = p3 }
		local var1 = if p1 then p1.Size.Y.Offset else 0
		
		if p4 then
			hidden.Page.Size = UDim2.new(1, 0, 0, hidden.Page.Size.Y.Offset + var1 + p4)
		else
			hidden.Page.Size = UDim2.new(1, 0, 0, hidden.Page.Size.Y.Offset + var1)
		end
		if hidden.HubRef and type(p3) == "table" then
			p3.HubRef = hidden.HubRef
		end
	end
	
	return hidden
end

return {
	CreateNewPage = function(_)
		-- upvalues: Initialize (ref)
		return Initialize()
	end
}