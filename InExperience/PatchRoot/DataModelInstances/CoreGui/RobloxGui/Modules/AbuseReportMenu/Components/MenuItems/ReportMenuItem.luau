local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local textService = game:GetService("TextService")
local corePackagesService = game:GetService("CorePackages")
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)
local useStyle = UIBloxModule.Core.Style.useStyle
local constantsModule = require(abuseReportMenu.Components.Constants)
local getMenuItemDimensionsModule = require(abuseReportMenu.Components.getMenuItemDimensions)

return function(p0) --[[ line: 23 | named "DropdownReportMenuItem" ]]
	-- upvalues: useStyle (ref), getMenuItemDimensionsModule (ref), constantsModule (ref), reactModule (ref), textService (ref), appFonts (ref), cryoModule (ref)
	local var8 = useStyle()
	local var9 = if p0.label == "" or p0.isRightComponentFullWidth then 0 else var8.Tokens.Size.Size_150
	local theme = var8.Theme
	local var10 = getMenuItemDimensionsModule(p0.menuContainerWidth)
	local maxValue = math.max(p0.menuContainerWidth - constantsModule.MenuItemDynamicWidthOffset, var10.LeftWidth + var10.RightWidth)
	local var12, var13 = reactModule.useState(var8.Tokens.Size.Size_1000)
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: var13 (ref), var8 (ref), textService (copy), p0 (ref), var10 (ref), appFonts (copy), maxValue (ref)
		var13(math.max(var8.Tokens.Size.Size_1000, textService:GetTextSize(p0.label, var10.TextSize, appFonts.default:getMedium(), Vector2.new(if p0.isSmallPortraitViewport then maxValue else var10.LeftWidth, 1e999)).Y))
	end, {})
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = if p0.isSmallPortraitViewport then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = if p0.isSmallPortraitViewport then UDim.new(0, var9) else UDim.new(0, 0)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var9),
			PaddingBottom = UDim.new(0, var9)
		})
	}
	t = if p0.isRightComponentFullWidth then cryoModule.Dictionary.join(t, {
		RightComponentWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(0, math.max(p0.menuContainerWidth - constantsModule.MenuItemDynamicWidthOffset, var10.LeftWidth + var10.RightWidth), 0, constantsModule.MenuItemHeight),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			RightComponent = p0.rightComponent
		})
	}) else cryoModule.Dictionary.join(t, {
		Label = if p0.label == "" and p0.isSmallPortraitViewport then nil else reactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = p0.label,
			Font = appFonts.default:getMedium(),
			TextColor3 = theme.TextEmphasis.Color,
			TextTransparency = theme.TextEmphasis.Transparency,
			TextSize = var10.TextSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = if p0.isSmallPortraitViewport then UDim2.new(0, maxValue, 0, 0) else UDim2.new(0, var10.LeftWidth, 0, var12),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		MiddleSpaceHolder = if p0.isSmallPortraitViewport then nil else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, math.max(0, p0.menuContainerWidth - var10.LeftWidth - var10.RightWidth - constantsModule.MenuItemDynamicWidthOffset), 0, constantsModule.MenuItemHeight)
		}),
		RightComponentWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = if p0.isSmallPortraitViewport then UDim2.new(0, maxValue, 0, 0) else UDim2.new(0, var10.RightWidth, 0, constantsModule.MenuItemHeight),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = if p0.isSmallPortraitViewport then Enum.HorizontalAlignment.Left else nil
			}),
			RightComponent = p0.rightComponent
		})
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, if p0.heightOverride then p0.heightOverride else var12),
		AutomaticSize = if p0.isRightComponentFullWidth or p0.isSmallPortraitViewport then Enum.AutomaticSize.Y else nil,
		LayoutOrder = p0.layoutOrder
	}, t)
end