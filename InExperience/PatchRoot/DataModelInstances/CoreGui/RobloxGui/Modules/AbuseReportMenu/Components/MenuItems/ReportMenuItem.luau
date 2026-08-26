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

return function(p1)
	-- upvalues: useStyle (ref), getMenuItemDimensionsModule (ref), constantsModule (ref), reactModule (ref), textService (ref), appFonts (ref), cryoModule (ref)
	local var1 = useStyle()
	local var2 = if p1.label == "" or p1.isRightComponentFullWidth then 0 else var1.Tokens.Size.Size_150
	local theme = var1.Theme
	local var3 = getMenuItemDimensionsModule(p1.menuContainerWidth)
	local maxValue = math.max(p1.menuContainerWidth - constantsModule.MenuItemDynamicWidthOffset, var3.LeftWidth + var3.RightWidth)
	local var4, var5 = reactModule.useState(var1.Tokens.Size.Size_1000)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var1 (ref), textService (copy), p1 (ref), var3 (ref), appFonts (copy), maxValue (ref)
		var5(math.max(var1.Tokens.Size.Size_1000, textService:GetTextSize(p1.label, var3.TextSize, appFonts.default:getMedium(), Vector2.new(if p1.isSmallPortraitViewport then maxValue else var3.LeftWidth, 1e999)).Y))
	end, {})
	local t = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = if p1.isSmallPortraitViewport then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = if p1.isSmallPortraitViewport then UDim.new(0, var2) else UDim.new(0, 0)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var2),
			PaddingBottom = UDim.new(0, var2)
		})
	}
	t = if p1.isRightComponentFullWidth then cryoModule.Dictionary.join(t, {
		RightComponentWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(0, math.max(p1.menuContainerWidth - constantsModule.MenuItemDynamicWidthOffset, var3.LeftWidth + var3.RightWidth), 0, constantsModule.MenuItemHeight),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			RightComponent = p1.rightComponent
		})
	}) else cryoModule.Dictionary.join(t, {
		Label = if p1.label == "" and p1.isSmallPortraitViewport then nil else reactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = p1.label,
			Font = appFonts.default:getMedium(),
			TextColor3 = theme.TextEmphasis.Color,
			TextTransparency = theme.TextEmphasis.Transparency,
			TextSize = var3.TextSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = if p1.isSmallPortraitViewport then UDim2.new(0, maxValue, 0, 0) else UDim2.new(0, var3.LeftWidth, 0, var4),
			AutomaticSize = Enum.AutomaticSize.Y
		}),
		MiddleSpaceHolder = if p1.isSmallPortraitViewport then nil else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(0, math.max(0, p1.menuContainerWidth - var3.LeftWidth - var3.RightWidth - constantsModule.MenuItemDynamicWidthOffset), 0, constantsModule.MenuItemHeight)
		}),
		RightComponentWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = if p1.isSmallPortraitViewport then UDim2.new(0, maxValue, 0, 0) else UDim2.new(0, var3.RightWidth, 0, constantsModule.MenuItemHeight),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = if p1.isSmallPortraitViewport then Enum.HorizontalAlignment.Left else nil
			}),
			RightComponent = p1.rightComponent
		})
	})
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, if p1.heightOverride then p1.heightOverride else var4),
		AutomaticSize = if p1.isRightComponentFullWidth or p1.isSmallPortraitViewport then Enum.AutomaticSize.Y else nil,
		LayoutOrder = p1.layoutOrder
	}, t)
end