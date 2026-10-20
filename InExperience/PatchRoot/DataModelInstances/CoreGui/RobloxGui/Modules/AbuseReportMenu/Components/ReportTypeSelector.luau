local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local GetMenuItemDimensionsModule = require(AbuseReportMenu.Components.getMenuItemDimensions)
local GetMenuItemSizingsModule = require(AbuseReportMenu.Utility.getMenuItemSizings)
local TextButton = UIBloxModule.App.Button.TextButton
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize

return function(p1)
	-- upvalues: UseStyleFunction (copy), GetMenuItemDimensionsModule (copy), GetMenuItemSizingsModule (copy), ConstantsModule (copy), ReactModule (copy), AppFonts (copy), IconButton (copy), IconSize (copy), Images (copy), TextButton (copy)
	local Size200 = UseStyleFunction().Tokens.Size.Size_200
	local MenuItemDimensionsModule = GetMenuItemDimensionsModule(p1.menuWidth)
	local MenuItemSizingsModule = GetMenuItemSizingsModule()
	local MenuItemHeightTight = ConstantsModule.MenuItemHeightTight
	local Largest = math.max(p1.menuWidth - ConstantsModule.MenuItemDynamicWidthOffset, MenuItemDimensionsModule.LeftWidth + MenuItemDimensionsModule.RightWidth)
	local IsSmallPortraitViewport = p1.isSmallPortraitViewport
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = if IsSmallPortraitViewport then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = if IsSmallPortraitViewport then UDim.new(0, Size200) else UDim.new(0, 0)
		}),
		Label = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			TextTransparency = 0,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = p1.label,
			Font = AppFonts.default:getMedium(),
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = MenuItemDimensionsModule.TextSize,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = if IsSmallPortraitViewport then UDim2.fromOffset(Largest, 0) else UDim2.new(0, MenuItemDimensionsModule.LeftWidth, 0, ConstantsModule.MenuItemHeight)
		}),
		MiddleWidthHolder = if IsSmallPortraitViewport then nil else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, math.max(0, p1.menuWidth - MenuItemDimensionsModule.LeftWidth - MenuItemDimensionsModule.RightWidth - 100), 0, ConstantsModule.MenuItemHeight)
		}),
		Container = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = if IsSmallPortraitViewport then UDim2.fromOffset(Largest, MenuItemHeightTight) else UDim2.new(0, MenuItemDimensionsModule.RightWidth, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = if IsSmallPortraitViewport then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			LeftChevron = if p1.isSelectionDisabled then nil else ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				size = UDim2.fromOffset(32, 32),
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/cycleLeft"],
				onActivated = p1.onClickLeft
			}),
			ButtonContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(0, MenuItemDimensionsModule.RightWidth - 64, 0, 0)
			}, {
				ToggleButton = ReactModule.createElement(TextButton, {
					layoutOrder = 2,
					size = UDim2.new(1, 0, 1, 0),
					text = p1.abuseType,
					onActivated = p1.onClickRight,
					isDisabled = p1.isSelectionDisabled,
					fontStyle = MenuItemSizingsModule.FontStyle,
					verticalPadding = MenuItemSizingsModule.ButtonInsideVerticalPadding
				})
			}),
			RightChevron = if p1.isSelectionDisabled then nil else ReactModule.createElement(IconButton, {
				layoutOrder = 3,
				size = UDim2.fromOffset(32, 32),
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/cycleRight"],
				onActivated = p1.onClickRight
			})
		})
	})
end