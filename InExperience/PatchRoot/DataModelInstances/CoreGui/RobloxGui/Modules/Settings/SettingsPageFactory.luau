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
local var10 = require(robloxGui.Modules.TenFootInterface):IsEnabled()
local getFFlagFixIGMTabTransitionsModule = require(script.Parent.Flags.GetFFlagFixIGMTabTransitions)
local fFlagIEMSettingsGroupsModule = require(script.Parent.Flags.FFlagIEMSettingsGroups)
local fFlagIEMFocusNavSupportNewButtonsModule = require(script.Parent.Flags.FFlagIEMFocusNavSupportNewButtons)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagIEMFocusNavToButtons = sharedFlagsModule.FFlagIEMFocusNavToButtons
local fFlagIEMTabFocusNav = sharedFlagsModule.FFlagIEMTabFocusNav
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagIEMFocusNavPeoplePageToButtons = sharedFlagsModule.FFlagIEMFocusNavPeoplePageToButtons
local fFlagIEMSettingsPageDisplaying = sharedFlagsModule.FFlagIEMSettingsPageDisplaying

local function Initialize() --[[ line: 46 ]]
	-- upvalues: fFlagEnableSideSheet (ref), fFlagIEMFocusNavToButtons (ref), signal (ref), fFlagIEMTabFocusNav (ref), create (ref), utilityModule (ref), var10 (ref), themeModule (ref), fFlagIEMFocusNavPeoplePageToButtons (ref), guiService (ref), httpService (ref), fFlagIEMSettingsGroupsModule (ref), fFlagIEMFocusNavSupportNewButtonsModule (ref), coreGuiService (ref), fFlagIEMSettingsPageDisplaying (ref), userGameSettingsService (ref), getFFlagFixIGMTabTransitionsModule (ref), tweenService (ref)
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
		SelectARow = nil
	}
	
	if fFlagIEMFocusNavToButtons then
		hidden.LastSelectableObjectsUpdated = signal.new()
		hidden.LastSelectableObjects = {}
		hidden.PageNextSelectionDown = nil
	end
	if fFlagIEMTabFocusNav then
		hidden.FirstSelectableObjectsUpdated = signal.new()
		hidden.FirstSelectableObjects = {}
	end
	local t_1 = {}
	local var18 = false
	hidden.TabHeader = create("TextButton")({
		Name = "Header",
		Text = "",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.2, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Selectable = if fFlagIEMTabFocusNav then true elseif fFlagIEMFocusNavToButtons then false else nil
	})
	
	if utilityModule:IsSmallTouchScreen() then
		hidden.TabHeader.Size = UDim2.new(0, 84, 1, 0)
	elseif var10 then
		hidden.TabHeader.Size = UDim2.new(0, 220, 1, 0)
	end
	if fFlagIEMTabFocusNav then
		local function switchToPage() --[[ line: 85 ]]
			-- upvalues: hidden (ref)
			if hidden.HubRef and hidden.HubRef.Pages.CurrentPage ~= hidden then
				hidden.HubRef:SwitchToPage(hidden, true)
			end
		end
		
		hidden.TabHeader.Activated:connect(switchToPage)
		hidden.TabHeader.SelectionGained:connect(switchToPage)
	else
		hidden.TabHeader.MouseButton1Click:connect(function() --[[ line: 93 ]]
			-- upvalues: hidden (ref)
			if hidden.HubRef then
				hidden.HubRef:SwitchToPage(hidden, true)
			end
		end)
	end
	local var20 = create("TextLabel")({
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
		Parent = var20
	})
	local var21 = create("TextLabel")({
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
	var21.TextSize = themeModule.textSize(24)
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = themeModule.textSize(24)
	var21.Parent = var20
	
	if utilityModule:IsPortrait() and utilityModule:IsSmallTouchScreen() then
		UITextSizeConstraint.Parent = var21
	end
	if utilityModule:IsSmallTouchScreen() then
		var21.TextSize = themeModule.textSize(18)
		UITextSizeConstraint.MaxTextSize = themeModule.textSize(18)
	elseif var10 then
		var21.TextSize = themeModule.textSize(48)
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
	local var23 = create("Frame")({
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
		Parent = var23
	})
	var20.Parent = var23
	var21.Parent = var23
	var21.Size = UDim2.new(0, 0, 0, 0)
	var21.AutomaticSize = Enum.AutomaticSize.XY
	utilityModule:OnResized(hidden.TabHeader, function() --[[ line: 178 | named "onResized" ]]
		-- upvalues: hidden (ref), utilityModule (copy), var20 (ref), var10 (copy), themeModule (copy), var23 (ref), var21 (ref)
		if not hidden.TabHeader then return end
		if utilityModule:IsSmallTouchScreen() then
			var20.Size = UDim2.new(0, 34, 0, 28)
		elseif var10 then
			var20.Size = UDim2.new(0, 88, 0, 74)
		else
			local iconSize = themeModule.getIconSize(themeModule.IconSize.Medium)
			var20.Size = UDim2.fromOffset(iconSize, iconSize)
		end
		local layout = var23.Layout
		
		if utilityModule:IsPortrait() then
			if utilityModule:IsSmallTouchScreen() then
				var21.FontSize = themeModule.fontSize(Enum.FontSize.Size14)
			end
			var20.Size = UDim2.new(0, 22, 0, 22)
			layout.FillDirection = Enum.FillDirection.Vertical
			layout.Padding = UDim.new(0, 0)
		elseif utilityModule:IsSmallTouchScreen() then
			var21.FontSize = themeModule.fontSize(Enum.FontSize.Size18)
		end
		layout.FillDirection = Enum.FillDirection.Horizontal
		layout.Padding = UDim.new(0, 10)
		var20.Size = UDim2.fromOffset(var20.Size.X.Offset * 0.666666666667, var20.Size.Y.Offset * 0.666666666667)
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
	hidden.Displayed.Event:connect(function() --[[ line: 255 ]]
		-- upvalues: hidden (ref)
		if hidden.HubRef.Shield.Visible then
			hidden:SelectARow()
			
			return
		end
	end)
	hidden.Hidden = Instance.new("BindableEvent")
	hidden.Hidden.Event:connect(function() --[[ line: 263 ]]
		-- upvalues: guiService (copy), hidden (ref)
		if guiService.SelectedCoreObject and guiService.SelectedCoreObject:IsDescendantOf(hidden.Page) then
			guiService.SelectedCoreObject = nil
		end
	end)
	hidden.Hidden.Name = "Hidden"
	
	function hidden.getValueChangerFrame(_, p0) --[[ line: 271 ]]
		local _ = nil
		
		return if type(p0) == "table" then if p0.SliderFrame then p0.SliderFrame else p0.SelectorFrame or p0.DropDownFrame else p0
	end
	
	function hidden.SelectARow(_, p1) --[[ line: 285 ]]
		-- upvalues: fFlagIEMTabFocusNav (copy), guiService (copy), hidden (ref), t_1 (ref), fFlagIEMSettingsGroupsModule (copy), fFlagIEMFocusNavToButtons (copy), fFlagIEMFocusNavSupportNewButtonsModule (copy), coreGuiService (copy)
		if fFlagIEMTabFocusNav and not p1 and guiService.SelectedCoreObject == hidden.TabHeader then return end
		if p1 or not guiService.SelectedCoreObject or not guiService.SelectedCoreObject:IsDescendantOf(hidden.Page) then
			if hidden.LastSelectedObject then
				guiService.SelectedCoreObject = hidden.LastSelectedObject
				
				return
			elseif t_1 and #t_1 > 0 then
				local valueChangerValueChangerFrame
				local _ = nil
				
				if fFlagIEMSettingsGroupsModule then
					local var25 = 1e999
					local valueChanger = t_1[1].ValueChanger
					
					for i, v in t_1 do
						if v.SelectionFrame and v.SelectionFrame.LayoutOrder < var25 then
							var25 = v.SelectionFrame.LayoutOrder
							valueChanger = v
						end
					end
					valueChangerValueChangerFrame = hidden:getValueChangerFrame(valueChanger.ValueChanger)
				else
					valueChangerValueChangerFrame = hidden:getValueChangerFrame(t_1[1].ValueChanger)
				end
				guiService.SelectedCoreObject = valueChangerValueChangerFrame
				
				return
			elseif fFlagIEMFocusNavToButtons and hidden.PageNextSelectionDown and (not fFlagIEMFocusNavSupportNewButtonsModule or hidden.PageNextSelectionDown:IsDescendantOf(coreGuiService)) then
				guiService.SelectedCoreObject = hidden.PageNextSelectionDown
			end
		end
	end
	
	function hidden.Display(_, p2, p3) --[[ line: 324 ]]
		-- upvalues: hidden (ref), var20 (ref), var21 (ref), fFlagIEMSettingsPageDisplaying (copy), userGameSettingsService (copy), getFFlagFixIGMTabTransitionsModule (copy), var18 (write), tweenService (copy)
		hidden.OpenStateChangedCount += 1
		
		if hidden.TabHeader then
			hidden.TabHeader.TabSelection.Visible = true
			var20.TextTransparency = 0
			var21.TextTransparency = 0
		end
		hidden.Page.Parent = p2
		hidden.Page.Visible = true
		
		if fFlagIEMSettingsPageDisplaying then
			hidden.Displaying:Fire()
		end
		local uDim2 = UDim2.new(0, 0, 0, 0)
		
		local var28 = function() --[[ line: 341 ]]
			-- upvalues: userGameSettingsService (copy), p2 (ref), getFFlagFixIGMTabTransitionsModule (copy), hidden (copy), uDim2 (ref), var18 (copy)
			if userGameSettingsService.ReducedMotion then
				p2.InnerCanvasGroupShow.Visible = false
			end
			if getFFlagFixIGMTabTransitionsModule() then
				if userGameSettingsService.ReducedMotion then
					p2.InnerCanvasGroupShow.GroupTransparency = 0
				end
				hidden.Page.Position = uDim2
			end
			hidden.Page.Visible = true
			var18 = true
			hidden.Displayed:Fire()
		end
		
		if p3 then
			hidden.Page.Position = uDim2
			
			if userGameSettingsService.ReducedMotion then
				p2.InnerCanvasGroupShow.Visible = false
			end
			if getFFlagFixIGMTabTransitionsModule() then
				if userGameSettingsService.ReducedMotion then
					p2.InnerCanvasGroupShow.GroupTransparency = 0
				end
				hidden.Page.Position = uDim2
			end
			hidden.Page.Visible = true
			var18 = true
			hidden.Displayed:Fire()
			
			return
		elseif userGameSettingsService.ReducedMotion then
			hidden.Page.Position = uDim2
			p2.InnerCanvasGroupShow.GroupTransparency = 1
			p2.InnerCanvasGroupShow.Visible = true
			hidden.Page.Parent = p2.InnerCanvasGroupShow
			hidden.Page.Visible = true
			local innerCanvasGroupShow = tweenService:Create(p2.InnerCanvasGroupShow, TweenInfo.new(0.25), { GroupTransparency = 0 })
			innerCanvasGroupShow:Play()
			innerCanvasGroupShow.Completed:Connect(function() --[[ line: 372 ]]
				-- upvalues: hidden (copy), p2 (ref), userGameSettingsService (copy), getFFlagFixIGMTabTransitionsModule (copy), uDim2 (ref), var18 (copy)
				hidden.Page.Parent = p2
				
				if userGameSettingsService.ReducedMotion then
					p2.InnerCanvasGroupShow.Visible = false
				end
				if getFFlagFixIGMTabTransitionsModule() then
					if userGameSettingsService.ReducedMotion then
						p2.InnerCanvasGroupShow.GroupTransparency = 0
					end
					hidden.Page.Position = uDim2
				end
				hidden.Page.Visible = true
				var18 = true
				hidden.Displayed:Fire()
			end)
			
			return
		end
		hidden.Page:TweenPositionInternal(uDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, var28)
	end
	
	function hidden.Hide(_, p4, p5, p6, p7, p8, p9) --[[ line: 387 ]]
		-- upvalues: hidden (ref), var20 (ref), var21 (ref), userGameSettingsService (copy), var18 (write), tweenService (copy)
		hidden.OpenStateChangedCount += 1
		
		if hidden.TabHeader then
			hidden.TabHeader.TabSelection.Visible = false
			var20.TextTransparency = 0.5
			var21.TextTransparency = 0.5
		end
		if hidden.Page.Parent then
			local uDim2 = UDim2.new(1 * p4, 0, 0, 0)
			
			local var31 = function() --[[ line: 398 ]]
				-- upvalues: userGameSettingsService (copy), p9 (ref), p8 (ref), hidden (copy), p5 (ref), var18 (copy)
				if userGameSettingsService.ReducedMotion and p9 then
					p8.InnerCanvasGroupHide.Visible = false
				end
				hidden.Page.Visible = false
				hidden.Page.Position = UDim2.new(hidden.TabPosition - p5, 0, 0, 0)
				var18 = false
				hidden.Hidden:Fire()
			end
			
			local var32 = function() --[[ line: 408 ]]
				-- upvalues: p6 (ref), hidden (copy), uDim2 (ref), userGameSettingsService (copy), p9 (ref), p8 (ref), p5 (ref), var18 (copy), tweenService (copy), var31 (ref)
				if p6 then
					hidden.Page.Position = uDim2
					
					if userGameSettingsService.ReducedMotion and p9 then
						p8.InnerCanvasGroupHide.Visible = false
					end
					hidden.Page.Visible = false
					hidden.Page.Position = UDim2.new(hidden.TabPosition - p5, 0, 0, 0)
					var18 = false
					hidden.Hidden:Fire()
					
					return
				elseif userGameSettingsService.ReducedMotion and p9 then
					p8.InnerCanvasGroupHide.GroupTransparency = 0
					p8.InnerCanvasGroupHide.Visible = true
					hidden.Page.Parent = p8.InnerCanvasGroupHide
					local innerCanvasGroupHide = tweenService:Create(p8.InnerCanvasGroupHide, TweenInfo.new(0.25), { GroupTransparency = 1 })
					innerCanvasGroupHide:Play()
					innerCanvasGroupHide.Completed:Connect(function() --[[ line: 424 ]]
						-- upvalues: hidden (copy), p8 (copy), uDim2 (copy), userGameSettingsService (copy), p9 (copy), p5 (copy), var18 (copy)
						hidden.Page.Parent = p8
						hidden.Page.Position = uDim2
						
						if userGameSettingsService.ReducedMotion and p9 then
							p8.InnerCanvasGroupHide.Visible = false
						end
						hidden.Page.Visible = false
						hidden.Page.Position = UDim2.new(hidden.TabPosition - p5, 0, 0, 0)
						var18 = false
						hidden.Hidden:Fire()
					end)
					
					return
				end
				hidden.Page:TweenPositionInternal(uDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, var31)
			end
			
			if p7 then
				local openStateChangedCount = hidden.OpenStateChangedCount
				delay(p7, function() --[[ line: 443 ]]
					-- upvalues: openStateChangedCount (ref), hidden (copy), var32 (ref)
					if openStateChangedCount == hidden.OpenStateChangedCount then
						var32()
					end
				end)
				
				return
			end
			var32()
		end
	end
	
	function hidden.GetDisplayed(_) --[[ line: 454 ]]
		-- upvalues: var18 (write)
		return var18
	end
	
	function hidden.GetVisibility(_) --[[ line: 458 ]]
		-- upvalues: hidden (ref)
		return hidden.Page.Parent
	end
	
	function hidden.GetTabHeader(_) --[[ line: 462 ]]
		-- upvalues: hidden (ref)
		return hidden.TabHeader
	end
	
	function hidden.GetRows(_) --[[ line: 466 ]]
		-- upvalues: fFlagIEMFocusNavToButtons (copy), t_1 (ref)
		if fFlagIEMFocusNavToButtons then
			return t_1
		end
	end
	
	function hidden.SetHub(_, p10) --[[ line: 474 ]]
		-- upvalues: hidden (ref), t_1 (ref)
		hidden.HubRef = p10
		
		for i, v in next, t_1 do
			if type(v.ValueChanger) == "table" then
				v.ValueChanger.HubRef = hidden.HubRef
			end
		end
	end
	
	function hidden.GetSize(_) --[[ line: 484 ]]
		-- upvalues: hidden (ref)
		return hidden.Page.AbsoluteSize
	end
	
	function hidden.AddRow(_, p11, p12, p13, p14) --[[ line: 488 ]]
		-- upvalues: t_1 (ref), hidden (ref)
		t_1[#t_1 + 1] = { SelectionFrame = p11, Label = p12, ValueChanger = p13 }
		local var34 = if p11 then p11.Size.Y.Offset else 0
		
		if p14 then
			hidden.Page.Size = UDim2.new(1, 0, 0, hidden.Page.Size.Y.Offset + var34 + p14)
		else
			hidden.Page.Size = UDim2.new(1, 0, 0, hidden.Page.Size.Y.Offset + var34)
		end
		if hidden.HubRef and type(p13) == "table" then
			p13.HubRef = hidden.HubRef
		end
	end
	
	return hidden
end

return {
	CreateNewPage = function(_) --[[ line: 513 ]]
		-- upvalues: Initialize (ref)
		return Initialize()
	end
}