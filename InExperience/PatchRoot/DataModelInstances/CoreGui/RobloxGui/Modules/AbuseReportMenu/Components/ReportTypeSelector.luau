local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local fFlagRenameDeprecatedUIBloxTokens = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local reactModule = require(corePackagesService.Packages.React)
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local constantsModule = require(abuseReportMenu.Components.Constants)
local getMenuItemDimensionsModule = require(abuseReportMenu.Components.getMenuItemDimensions)
local getMenuItemSizingsModule = require(abuseReportMenu.Utility.getMenuItemSizings)
local textButton = UIBloxModule.App.Button.TextButton
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize

return function(p0) --[[ line: 31 ]]
	-- upvalues: useStyle (ref), fFlagRenameDeprecatedUIBloxTokens (ref), getMenuItemDimensionsModule (ref), getMenuItemSizingsModule (ref), constantsModule (ref), reactModule (ref), appFonts (ref), iconButton (ref), iconSize (ref), images (ref), textButton (ref)
	local var7 = useStyle()
	local var8 = if fFlagRenameDeprecatedUIBloxTokens then var7.Tokens.Size.Size_200 else var7.Tokens.Global.Size_100
	local var9 = getMenuItemDimensionsModule(p0.menuWidth)
	local var10 = getMenuItemSizingsModule()
	local menuItemHeightTight = constantsModule.MenuItemHeightTight
	local maxValue = math.max(p0.menuWidth - constantsModule.MenuItemDynamicWidthOffset, var9.LeftWidth + var9.RightWidth)
	local isSmallPortraitViewport = p0.isSmallPortraitViewport
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = if isSmallPortraitViewport then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = if isSmallPortraitViewport then UDim.new(0, var8) else UDim.new(0, 0)
		}),
		Label = reactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			TextTransparency = 0,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = p0.label,
			Font = appFonts.default:getMedium(),
			TextColor3 = Color3.new(1, 1, 1),
			TextSize = var9.TextSize,
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = if isSmallPortraitViewport then UDim2.fromOffset(maxValue, 0) else UDim2.new(0, var9.LeftWidth, 0, constantsModule.MenuItemHeight)
		}),
		MiddleWidthHolder = if isSmallPortraitViewport then nil else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, math.max(0, p0.menuWidth - var9.LeftWidth - var9.RightWidth - 100), 0, constantsModule.MenuItemHeight)
		}),
		Container = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = if isSmallPortraitViewport then UDim2.fromOffset(maxValue, menuItemHeightTight) else UDim2.new(0, var9.RightWidth, 1, 0)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = if isSmallPortraitViewport then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			LeftChevron = if p0.isSelectionDisabled then nil else reactModule.createElement(iconButton, {
				layoutOrder = 1,
				size = UDim2.fromOffset(32, 32),
				iconSize = iconSize.Medium,
				icon = images["icons/actions/cycleLeft"],
				onActivated = p0.onClickLeft
			}),
			ButtonContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.XY,
				Size = UDim2.new(0, var9.RightWidth - 64, 0, 0)
			}, {
				ToggleButton = reactModule.createElement(textButton, {
					layoutOrder = 2,
					size = UDim2.new(1, 0, 1, 0),
					text = p0.abuseType,
					onActivated = p0.onClickRight,
					isDisabled = p0.isSelectionDisabled,
					fontStyle = var10.FontStyle,
					verticalPadding = var10.ButtonInsideVerticalPadding
				})
			}),
			RightChevron = if p0.isSelectionDisabled then nil else reactModule.createElement(iconButton, {
				layoutOrder = 3,
				size = UDim2.fromOffset(32, 32),
				iconSize = iconSize.Medium,
				icon = images["icons/actions/cycleRight"],
				onActivated = p0.onClickRight
			})
		})
	})
end