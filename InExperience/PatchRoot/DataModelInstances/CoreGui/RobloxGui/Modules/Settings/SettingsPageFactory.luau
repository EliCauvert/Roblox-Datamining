local GuiService = game:GetService("GuiService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local TweenService = game:GetService("TweenService")
local UtilityModule = require(RobloxGui.Modules.Settings.Utility)
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local AppCommonLibModule = require(CorePackages.Workspace.Packages.AppCommonLib)
local CreateFunction = AppCommonLibModule.Create
local Signal = AppCommonLibModule.Signal
RobloxGui:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local IsEnabled = require(RobloxGui.Modules.TenFootInterface):IsEnabled()
local GetFFlagFixIGMTabTransitionsModule = require(script.Parent.Flags.GetFFlagFixIGMTabTransitions)
local FFlagIEMSettingsGroupsModule = require(script.Parent.Flags.FFlagIEMSettingsGroups)
local FFlagIEMFocusNavSupportNewButtonsModule = require(script.Parent.Flags.FFlagIEMFocusNavSupportNewButtons)
local FFlagIEMTabFocusNav = require(CorePackages.Workspace.Packages.SharedFlags).FFlagIEMTabFocusNav
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)

local function Initialize() --[[ Line: 41 ]]
	-- upvalues: IsSideSheetEnabledModule (copy), Signal (copy), FFlagIEMTabFocusNav (copy), CreateFunction (copy), UtilityModule (copy), IsEnabled (copy), ThemeModule (copy), GuiService (copy), FFlagIEMSettingsGroupsModule (copy), FFlagIEMFocusNavSupportNewButtonsModule (copy), CoreGui (copy), UserGameSettings (copy), GetFFlagFixIGMTabTransitionsModule (copy), TweenService (copy)
	local config = {
		HubRef = nil,
		LastSelectedObject = nil,
		TabPosition = 0,
		Active = false,
		OpenStateChangedCount = 0,
		ShouldShowBottomBar = not IsSideSheetEnabledModule,
		ShouldShowHubBar = true,
		ShouldDisableDefaultScroll = false,
		IsPageClipped = true,
		SelectARow = nil,
		LastSelectableObjectsUpdated = Signal.new(),
		LastSelectableObjects = {},
		PageNextSelectionDown = nil
	}
	
	if FFlagIEMTabFocusNav then
		config.FirstSelectableObjectsUpdated = Signal.new()
		config.FirstSelectableObjects = {}
	end
	local t = {}
	local Flag = false
	config.TabHeader = CreateFunction("TextButton")({
		Name = "Header",
		Text = "",
		BackgroundTransparency = 1,
		Size = UDim2.new(0.2, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Selectable = if FFlagIEMTabFocusNav then true else false
	})
	
	if UtilityModule:IsSmallTouchScreen() then
		config.TabHeader.Size = UDim2.new(0, 84, 1, 0)
	elseif IsEnabled then
		config.TabHeader.Size = UDim2.new(0, 220, 1, 0)
	end
	if FFlagIEMTabFocusNav then
		local function switchToPage() --[[ Line: 78 ]]
			-- upvalues: config (copy)
			if config.HubRef and config.HubRef.Pages.CurrentPage ~= config then
				config.HubRef:SwitchToPage(config, true)
			end
		end
		
		config.TabHeader.Activated:connect(switchToPage)
		config.TabHeader.SelectionGained:connect(switchToPage)
	else
		config.TabHeader.MouseButton1Click:connect(function() --[[ Line: 86 ]]
			-- upvalues: config (copy)
			if config.HubRef then
				config.HubRef:SwitchToPage(config, true)
			end
		end)
	end
	local Label = CreateFunction("TextLabel")({
		Name = "Icon",
		BackgroundTransparency = 1,
		Text = "",
		TextScaled = true,
		TextTransparency = 0.5,
		Size = UDim2.new(0.5, 0, 0.5, 0),
		Position = UDim2.new(0, 10, 0.5, -18),
		TextColor3 = Color3.new(1, 1, 1),
		Parent = config.TabHeader
	})
	local _ = CreateFunction("UIAspectRatioConstraint")({
		Name = "AspectRatioConstraint",
		AspectRatio = 1,
		Parent = Label
	})
	local Label1 = CreateFunction("TextLabel")({
		Name = "Title",
		Text = "",
		BackgroundTransparency = 1,
		TextTransparency = 0.5,
		Font = ThemeModule.font(Enum.Font.SourceSansBold, "Button"),
		TextColor3 = Color3.new(1, 1, 1),
		Size = UDim2.new(1.05, 0, 1, 0),
		Position = UDim2.new(1.2, ThemeModule.TabHeaderIconPadding, 0, -2),
		TextXAlignment = Enum.TextXAlignment.Left
	})
	Label1.TextSize = ThemeModule.textSize(24)
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	UITextSizeConstraint.MaxTextSize = ThemeModule.textSize(24)
	Label1.Parent = Label
	
	if UtilityModule:IsPortrait() and UtilityModule:IsSmallTouchScreen() then
		UITextSizeConstraint.Parent = Label1
	end
	if UtilityModule:IsSmallTouchScreen() then
		Label1.TextSize = ThemeModule.textSize(18)
		UITextSizeConstraint.MaxTextSize = ThemeModule.textSize(18)
	elseif IsEnabled then
		Label1.TextSize = ThemeModule.textSize(48)
		UITextSizeConstraint.MaxTextSize = ThemeModule.textSize(48)
	end
	local _ = CreateFunction("ImageLabel")({
		Name = "TabSelection",
		Visible = false,
		BorderSizePixel = 0,
		BackgroundColor3 = ThemeModule.color("TabSelection"),
		BackgroundTransparency = ThemeModule.transparency("TabSelection"),
		Size = UDim2.new(1, -2, 0, 2),
		Position = UDim2.new(0, 3, 1, -2),
		Parent = config.TabHeader
	})
	local Parent = CreateFunction("Frame")({
		Name = "TabLabel",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0),
		Parent = config.TabHeader
	})
	CreateFunction("UIListLayout")({
		Name = "Layout",
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(0, 10),
		Parent = Parent
	})
	Label.Parent = Parent
	Label1.Parent = Parent
	Label1.Size = UDim2.new(0, 0, 0, 0)
	Label1.AutomaticSize = Enum.AutomaticSize.XY
	UtilityModule:OnResized(config.TabHeader, function() --[[ Line: 171 | Named "onResized" ]]
		-- upvalues: config (copy), UtilityModule (upval), Label (copy), IsEnabled (upval), ThemeModule (upval), Parent (copy), Label1 (copy)
		if not config.TabHeader then return end
		if UtilityModule:IsSmallTouchScreen() then
			Label.Size = UDim2.new(0, 34, 0, 28)
		elseif IsEnabled then
			Label.Size = UDim2.new(0, 88, 0, 74)
		else
			local IconSize = ThemeModule.getIconSize(ThemeModule.IconSize.Medium)
			Label.Size = UDim2.fromOffset(IconSize, IconSize)
		end
		local Layout = Parent.Layout
		
		if UtilityModule:IsPortrait() then
			if UtilityModule:IsSmallTouchScreen() then
				Label1.FontSize = ThemeModule.fontSize(Enum.FontSize.Size14)
			end
			Label.Size = UDim2.new(0, 22, 0, 22)
			Layout.FillDirection = Enum.FillDirection.Vertical
			Layout.Padding = UDim.new(0, 0)
		else
			if UtilityModule:IsSmallTouchScreen() then
				Label1.FontSize = ThemeModule.fontSize(Enum.FontSize.Size18)
			end
			Layout.FillDirection = Enum.FillDirection.Horizontal
			Layout.Padding = UDim.new(0, 10)
		end
		Label.Size = UDim2.fromOffset(Label.Size.X.Offset * 0.6666666666666666, Label.Size.Y.Offset * 0.6666666666666666)
	end)
	config.Page = CreateFunction("Frame")({
		Name = "Page",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	})
	CreateFunction("UIPadding")({
		PaddingLeft = UDim.new(0, 12),
		PaddingRight = UDim.new(0, 11),
		Parent = config.Page
	})
	config.PageListLayout = CreateFunction("UIListLayout")({
		Name = "RowListLayout",
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, 8),
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = config.Page
	})
	config.Page.SelectionGroup = true
	config.Displaying = Instance.new("BindableEvent")
	config.Displaying.Name = "Displaying"
	config.Displayed = Instance.new("BindableEvent")
	config.Displayed.Name = "Displayed"
	config.Displayed.Event:connect(function() --[[ Line: 242 ]]
		-- upvalues: config (copy)
		if config.HubRef.Shield.Visible then
			config:SelectARow()
			
			return
		end
	end)
	config.Hidden = Instance.new("BindableEvent")
	config.Hidden.Event:connect(function() --[[ Line: 250 ]]
		-- upvalues: GuiService (upval), config (copy)
		if GuiService.SelectedCoreObject and GuiService.SelectedCoreObject:IsDescendantOf(config.Page) then
			GuiService.SelectedCoreObject = nil
		end
	end)
	config.Hidden.Name = "Hidden"
	
	function config:getValueChangerFrame(ValueChanger) --[[ Line: 258 ]]
		return if type(ValueChanger) == "table" then ValueChanger.SliderFrame and ValueChanger.SliderFrame or (ValueChanger.SelectorFrame or ValueChanger.DropDownFrame) else ValueChanger
	end
	
	function config:SelectARow(p1) --[[ Line: 272 ]]
		-- upvalues: FFlagIEMTabFocusNav (upval), GuiService (upval), config (copy), t (copy), FFlagIEMSettingsGroupsModule (upval), FFlagIEMFocusNavSupportNewButtonsModule (upval), CoreGui (upval)
		if FFlagIEMTabFocusNav and not p1 and GuiService.SelectedCoreObject == config.TabHeader then return end
		if p1 or not GuiService.SelectedCoreObject or not GuiService.SelectedCoreObject:IsDescendantOf(config.Page) then
			if config.LastSelectedObject then
				GuiService.SelectedCoreObject = config.LastSelectedObject
				
				return
			end
			if t and #t > 0 then
				local ValueChangerFrame = nil
				if FFlagIEMSettingsGroupsModule then
					local LayoutOrder = 1e999
					local ValueChanger = t[1].ValueChanger
					
					for _, value in t do
						if value.SelectionFrame and value.SelectionFrame.LayoutOrder < LayoutOrder then
							LayoutOrder = value.SelectionFrame.LayoutOrder
							ValueChanger = value
						end
					end
					ValueChangerFrame = config:getValueChangerFrame(ValueChanger.ValueChanger)
				else
					ValueChangerFrame = config:getValueChangerFrame(t[1].ValueChanger)
				end
				GuiService.SelectedCoreObject = ValueChangerFrame
				
				return
			elseif config.PageNextSelectionDown and (not FFlagIEMFocusNavSupportNewButtonsModule or config.PageNextSelectionDown:IsDescendantOf(CoreGui)) then
				GuiService.SelectedCoreObject = config.PageNextSelectionDown
			end
		end
	end
	
	function config:Display(Parent, p2) --[[ Line: 310 ]]
		-- upvalues: config (copy), Label (copy), Label1 (copy), UserGameSettings (upval), GetFFlagFixIGMTabTransitionsModule (upval), Flag (ref), TweenService (upval)
		config.OpenStateChangedCount += 1
		
		if config.TabHeader then
			config.TabHeader.TabSelection.Visible = true
			Label.TextTransparency = 0
			Label1.TextTransparency = 0
		end
		config.Page.Parent = Parent
		config.Page.Visible = true
		config.Displaying:Fire()
		local _UDim2 = UDim2.new(0, 0, 0, 0)
		
		local function v33() --[[ Line: 325 ]]
			-- upvalues: UserGameSettings (upval), Parent (copy), GetFFlagFixIGMTabTransitionsModule (upval), config (upval), _UDim2 (copy), Flag (upval)
			if UserGameSettings.ReducedMotion then
				Parent.InnerCanvasGroupShow.Visible = false
			end
			if GetFFlagFixIGMTabTransitionsModule() then
				if UserGameSettings.ReducedMotion then
					Parent.InnerCanvasGroupShow.GroupTransparency = 0
				end
				config.Page.Position = _UDim2
			end
			config.Page.Visible = true
			Flag = true
			config.Displayed:Fire()
		end
		
		if p2 then
			config.Page.Position = _UDim2
			
			if UserGameSettings.ReducedMotion then
				Parent.InnerCanvasGroupShow.Visible = false
			end
			if GetFFlagFixIGMTabTransitionsModule() then
				if UserGameSettings.ReducedMotion then
					Parent.InnerCanvasGroupShow.GroupTransparency = 0
				end
				config.Page.Position = _UDim2
			end
			config.Page.Visible = true
			Flag = true
			config.Displayed:Fire()
			
			return
		elseif UserGameSettings.ReducedMotion then
			config.Page.Position = _UDim2
			Parent.InnerCanvasGroupShow.GroupTransparency = 1
			Parent.InnerCanvasGroupShow.Visible = true
			config.Page.Parent = Parent.InnerCanvasGroupShow
			config.Page.Visible = true
			local Tween = TweenService:Create(Parent.InnerCanvasGroupShow, TweenInfo.new(0.25), { GroupTransparency = 0 })
			Tween:Play()
			Tween.Completed:Connect(function() --[[ Line: 356 ]]
				-- upvalues: config (upval), Parent (copy), UserGameSettings (upval), GetFFlagFixIGMTabTransitionsModule (upval), _UDim2 (copy), Flag (upval)
				config.Page.Parent = Parent
				
				if UserGameSettings.ReducedMotion then
					Parent.InnerCanvasGroupShow.Visible = false
				end
				if GetFFlagFixIGMTabTransitionsModule() then
					if UserGameSettings.ReducedMotion then
						Parent.InnerCanvasGroupShow.GroupTransparency = 0
					end
					config.Page.Position = _UDim2
				end
				config.Page.Visible = true
				Flag = true
				config.Displayed:Fire()
			end)
			
			return
		else
			config.Page:TweenPositionInternal(_UDim2, Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.1, true, v33)
		end
	end
	
	function config:Hide(p2: number, p3, p4, p5, Parent, p6) --[[ Line: 371 ]]
		-- upvalues: config (copy), Label (copy), Label1 (copy), UserGameSettings (upval), Flag (ref), TweenService (upval)
		config.OpenStateChangedCount += 1
		
		if config.TabHeader then
			config.TabHeader.TabSelection.Visible = false
			Label.TextTransparency = 0.5
			Label1.TextTransparency = 0.5
		end
		if config.Page.Parent then
			local _UDim2 = UDim2.new(1 * p2, 0, 0, 0)
			
			local function v36() --[[ Line: 382 ]]
				-- upvalues: UserGameSettings (upval), p6 (copy), Parent (copy), config (upval), p3 (copy), Flag (upval)
				if UserGameSettings.ReducedMotion and p6 then
					Parent.InnerCanvasGroupHide.Visible = false
				end
				config.Page.Visible = false
				config.Page.Position = UDim2.new(config.TabPosition - p3, 0, 0, 0)
				Flag = false
				config.Hidden:Fire()
			end
			
			local function v37() --[[ Line: 392 ]]
				-- upvalues: p4 (copy), config (upval), _UDim2 (copy), UserGameSettings (upval), p6 (copy), Parent (copy), p3 (copy), Flag (upval), TweenService (upval), v36 (copy)
				if p4 then
					config.Page.Position = _UDim2
					
					if UserGameSettings.ReducedMotion and p6 then
						Parent.InnerCanvasGroupHide.Visible = false
					end
					config.Page.Visible = false
					config.Page.Position = UDim2.new(config.TabPosition - p3, 0, 0, 0)
					Flag = false
					config.Hidden:Fire()
					
					return
				elseif UserGameSettings.ReducedMotion and p6 then
					Parent.InnerCanvasGroupHide.GroupTransparency = 0
					Parent.InnerCanvasGroupHide.Visible = true
					config.Page.Parent = Parent.InnerCanvasGroupHide
					local Tween = TweenService:Create(Parent.InnerCanvasGroupHide, TweenInfo.new(0.25), { GroupTransparency = 1 })
					Tween:Play()
					Tween.Completed:Connect(function() --[[ Line: 408 ]]
						-- upvalues: config (upval), Parent (upval), _UDim2 (upval), UserGameSettings (upval), p6 (upval), p3 (upval), Flag (upval)
						config.Page.Parent = Parent
						config.Page.Position = _UDim2
						
						if UserGameSettings.ReducedMotion and p6 then
							Parent.InnerCanvasGroupHide.Visible = false
						end
						config.Page.Visible = false
						config.Page.Position = UDim2.new(config.TabPosition - p3, 0, 0, 0)
						Flag = false
						config.Hidden:Fire()
					end)
					
					return
				else
					config.Page:TweenPositionInternal(_UDim2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, v36)
				end
			end
			
			if p5 then
				local OpenStateChangedCount = config.OpenStateChangedCount
				delay(p5, function() --[[ Line: 427 ]]
					-- upvalues: OpenStateChangedCount (copy), config (upval), v37 (copy)
					if OpenStateChangedCount == config.OpenStateChangedCount then
						v37()
					end
				end)
				
				return
			else
				v37()
			end
		end
	end
	
	function config:GetDisplayed() --[[ Line: 438 ]]
		-- upvalues: Flag (ref)
		return Flag
	end
	
	function config:GetVisibility() --[[ Line: 442 ]]
		-- upvalues: config (copy)
		return config.Page.Parent
	end
	
	function config:GetTabHeader() --[[ Line: 446 ]]
		-- upvalues: config (copy)
		return config.TabHeader
	end
	
	function config:GetRows() --[[ Line: 450 ]]
		-- upvalues: t (copy)
		return t
	end
	
	function config:SetHub(HubRef) --[[ Line: 454 ]]
		-- upvalues: config (copy), t (copy)
		config.HubRef = HubRef
		
		for _, value in next, t do
			if type(value.ValueChanger) == "table" then
				value.ValueChanger.HubRef = config.HubRef
			end
		end
	end
	
	function config:GetSize() --[[ Line: 464 ]]
		-- upvalues: config (copy)
		return config.Page.AbsoluteSize
	end
	
	function config:AddRow(SelectionFrame, Label, ValueChanger, p2) --[[ Line: 468 ]]
		-- upvalues: t (copy), config (copy)
		t[#t + 1] = {
			SelectionFrame = SelectionFrame,
			Label = Label,
			ValueChanger = ValueChanger
		}
		local Offset = if SelectionFrame then SelectionFrame.Size.Y.Offset else 0
		
		if p2 then
			config.Page.Size = UDim2.new(1, 0, 0, config.Page.Size.Y.Offset + Offset + p2)
		else
			config.Page.Size = UDim2.new(1, 0, 0, config.Page.Size.Y.Offset + Offset)
		end
		if config.HubRef and type(ValueChanger) == "table" then
			ValueChanger.HubRef = config.HubRef
		end
	end
	
	return config
end

return {
	CreateNewPage = function(_) --[[ Line: 493 ]]
		-- upvalues: Initialize (copy)
		return (Initialize())
	end
}