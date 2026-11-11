local TenFootUiGlobalNav = script:FindFirstAncestor("TenFootUiGlobalNav")
local Parent = TenFootUiGlobalNav.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local AppHeaderBar = require(Parent.AppHeaderBar).AppHeaderBar
local NavigationBar = UIBloxModule.App.Navigation.NavigationBar
local NavigationTab = UIBloxModule.App.Navigation.NavigationTab
local NavigationBarAlignment = UIBloxModule.App.Navigation.Enum.NavigationBarAlignment
local NavigationTabLayout = UIBloxModule.App.Navigation.Enum.NavigationTabLayout
local Placement = UIBloxModule.App.Navigation.Enum.Placement
local UtilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local LuaAppFix10ftGlobalNavAppHeaderBarSelection = game:DefineFastFlag("LuaAppFix10ftGlobalNavAppHeaderBarSelection", false)
local _ = require(TenFootUiGlobalNav.Components.GlobalNav.GlobalNav)
local FFlagEnableConsoleRobloxLogo = require(Parent.SharedFlags).FFlagEnableConsoleRobloxLogo

return (ReactModule.forwardRef(function(p1, _)
	-- upvalues: Parent (copy), UseDesignTokensFunction (copy), ReactModule (copy), NavigationTab (copy), Placement (copy), NavigationTabLayout (copy), NavigationBar (copy), NavigationBarAlignment (copy), LuaAppFix10ftGlobalNavAppHeaderBarSelection (copy), FFlagEnableConsoleRobloxLogo (copy), CryoModule (copy), UtilityActionIcon (copy), AppHeaderBar (copy)
	local FlyoutLeftHeader = require(Parent.FlyoutSidePanel).Components.FlyoutLeftHeader
	local TabGroupProps = p1.tabGroupProps
	local OptionGroupProps = p1.optionGroupProps
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2)
		return {
			safeAreaMargin = p2.Size.Size_1600,
			tabGroupHeight = p2.Size.Size_1200,
			tabLabelFontStyle = p2.Typography.HeadingSmall,
			defaultSpacing = p2.Size.Size_800
		}
	end)
	local SelectionEntry = if TabGroupProps and TabGroupProps.selection then TabGroupProps.selection[1] else nil
	local UseResult = ReactModule.useCallback(function(p2, IsChecked)
		-- upvalues: ReactModule (upval), NavigationTab (upval), Placement (upval), UseDesignTokensResult (copy), NavigationTabLayout (upval)
		return ReactModule.createElement(NavigationTab, {
			hasLabel = true,
			iconImage = p2.icon,
			renderIcon = if p2.iconComponent == nil then nil else function(Selected)
				-- upvalues: ReactModule (upval), p2 (copy), Placement (upval)
				return ReactModule.createElement(p2.iconComponent, {
					pressed = false,
					hovered = false,
					placement = Placement.Bottom,
					selected = Selected
				})
			end,
			labelText = p2.title,
			labelTypography = UseDesignTokensResult.tabLabelFontStyle,
			isChecked = IsChecked,
			layout = NavigationTabLayout.Inline,
			onActivated = p2.onActivated
		})
	end, { UseDesignTokensResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), TabGroupProps (copy), NavigationBar (upval), NavigationBarAlignment (upval), UseDesignTokensResult (copy), LuaAppFix10ftGlobalNavAppHeaderBarSelection (upval), SelectionEntry (copy), UseResult (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			TabGroup = if TabGroupProps then ReactModule.createElement(NavigationBar, {
				maxWidth = 1e999,
				alignment = NavigationBarAlignment.Left,
				size = UDim2.new(0, 0, 0, UseDesignTokensResult.tabGroupHeight),
				automaticSize = Enum.AutomaticSize.X,
				selection = if LuaAppFix10ftGlobalNavAppHeaderBarSelection then SelectionEntry else TabGroupProps.selection,
				items = TabGroupProps.items,
				renderItem = UseResult,
				spacing = UDim.new(0, UseDesignTokensResult.defaultSpacing),
				paddings = if TabGroupProps.padding then {
					Left = TabGroupProps.padding.left or 0,
					Top = TabGroupProps.padding.top or 0,
					Right = TabGroupProps.padding.right or 0,
					Bottom = TabGroupProps.padding.bottom or 0
				} else nil,
				backgroundColor = { Transparency = 1 }
			}) else nil
		})
	end, if LuaAppFix10ftGlobalNavAppHeaderBarSelection then {
		UseResult,
		TabGroupProps,
		UseDesignTokensResult,
		SelectionEntry
	} else { UseResult, TabGroupProps, UseDesignTokensResult })
	local UseResult2 = if FFlagEnableConsoleRobloxLogo then ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), FlyoutLeftHeader (copy)
		return ReactModule.createElement(FlyoutLeftHeader, {
			alwaysShowLogo = true,
			isRobloxLogoEnabled = true,
			isFlyoutEntrypointEnabled = false
		})
	end, {}) else nil
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		AppHeaderBarLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		AppHeaderBar = ReactModule.createElement(AppHeaderBar, {
			automaticHeight = true,
			onMedia = false,
			renderNavigation = if FFlagEnableConsoleRobloxLogo then UseResult2 else UseResult1,
			renderCenter = if FFlagEnableConsoleRobloxLogo then UseResult1 else nil,
			renderUtilities = ReactModule.useCallback(function()
				-- upvalues: CryoModule (upval), OptionGroupProps (copy), ReactModule (upval), UtilityActionIcon (upval), UseDesignTokensResult (copy)
				return ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AutomaticSize = Enum.AutomaticSize.X
				}, CryoModule.Dictionary.join({
					UILayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, UseDesignTokensResult.defaultSpacing)
					})
				}, (CryoModule.List.map(if OptionGroupProps then OptionGroupProps.items else {}, function(p2, LayoutOrder)
					-- upvalues: ReactModule (upval), UtilityActionIcon (upval)
					return ReactModule.createElement(UtilityActionIcon, {
						disableOutset = true,
						icon = p2.icon,
						tooltipText = p2.label,
						layoutOrder = LayoutOrder,
						onActivated = p2.onActivated
					})
				end))))
			end, { OptionGroupProps, UseDesignTokensResult }),
			shouldRenderCenter = if FFlagEnableConsoleRobloxLogo then true else nil,
			paddingLeft = UDim.new(0, UseDesignTokensResult.safeAreaMargin),
			paddingRight = UDim.new(0, UseDesignTokensResult.safeAreaMargin),
			groupTransparencyLeft = if FFlagEnableConsoleRobloxLogo then {
				transparency = p1.animationProps.logoGroupTransparency,
				guiObjectRef = p1.animationProps.logoGroupRef
			} else {
				transparency = p1.animationProps.tabGroupTransparency,
				guiObjectRef = p1.animationProps.tabGroupRef
			},
			groupTransparencyCenter = if FFlagEnableConsoleRobloxLogo then {
				transparency = p1.animationProps.tabGroupTransparency,
				guiObjectRef = p1.animationProps.tabGroupRef
			} else nil,
			groupTransparencyRight = {
				transparency = p1.animationProps.optionGroupTransparency,
				guiObjectRef = p1.animationProps.optionGroupRef
			},
			backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) }
		})
	})
end))