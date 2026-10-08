local textService = game:GetService("TextService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local UIBloxConfigModule = require(parent.UIBloxConfig)
local loggerModule = require(parent.Logger)
local controlStateModule = require(parent.Core.Control.Enum.ControlState)
local stateLayerModule = require(parent.Core.Control.StateLayer)
local useStyleModule = require(parent.Core.Style.useStyle)
local label = require(parent.Core.ImageSet.ImageSetComponent).Label
local navigationTabLayoutModule = require(parent.App.Navigation.Enum.NavigationTabLayout)
local _ = require(parent.App.ImageSet.ImagesTypes)
local _ = require(parent.App.Style.StyleTypes)
local getTextSizeModule = require(parent.Core.Text.GetTextSize)
local isBuilderIcon = foundationModule.Utility.isBuilderIcon
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local radius = foundationModule.Enums.Radius
local icon = foundationModule.Icon
local popover = foundationModule.Popover
local statusIndicator = foundationModule.StatusIndicator
local text = foundationModule.Text
local view = foundationModule.View
local migrateBadgeVariantModule = require(parent.Utility.migrateBadgeVariant)
local vector2 = Vector2.new(1e999, 1e999)
local t = {
	hasLabel = false,
	isChecked = false,
	badgeValue = nil,
	layout = navigationTabLayoutModule.Stacked,
	tooltipSide = popoverSide.Right,
	tooltipAlign = popoverAlign.Center
}

local function NavigationTabTooltip(p1)
	-- upvalues: useStyleModule (ref), reactModule (ref), popover (ref), radius (ref), view (ref), text (ref)
	local tokens = useStyleModule().Tokens
	
	return reactModule.createElement(popover.Root, { isOpen = p1.isOpen }, {
		Anchor = reactModule.createElement(popover.Anchor, { anchorRef = p1.anchorRef }),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = false,
			selectionGroup = false,
			align = p1.align,
			side = {
				position = p1.side,
				offset = p1.offset or tokens.Size.Size_200
			},
			radius = radius.Small,
			backgroundStyle = tokens.Inverse.Surface.Surface_0
		}, reactModule.createElement(view, { tag = "auto-xy padding-x-small padding-y-xsmall" }, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-body-small content-inverse-emphasis",
				Text = p1.labelText
			})
		}))
	})
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), UIBloxConfigModule (ref), navigationTabLayoutModule (ref), reactModule (ref), loggerModule (ref), controlStateModule (ref), foundationFontFaceMigration (ref), getTextSizeModule (ref), vector2 (ref), textService (ref), isBuilderIcon (ref), view (ref), icon (ref), inputSize (ref), label (ref), statusIndicator (ref), migrateBadgeVariantModule (ref), normalizeFontFace (ref), stateLayerModule (ref), NavigationTabTooltip (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local tokens = useStyleModule().Tokens
	local var2 = UIBloxConfigModule.addNavigationTabTooltipAndTruncation and (var1.layout == navigationTabLayoutModule.Stacked and (if var1.width == nil then var1.fillWidth == true else true))
	local var3 = if var1.width then var1.width.Scale else 0
	local var4 = if var1.width then var1.width.Offset else 0
	local var5, var6 = reactModule.useBinding(Vector2.zero)
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: var5 (ref), var2 (ref), var6 (ref)
		local var8
		local absoluteSize = p3.AbsoluteSize
		local value = var5:getValue()
		
		if var2 then
			var8 = value.Y ~= absoluteSize.Y
			var8 = nil
		else
			var8 = value ~= absoluteSize
		end
		if var8 then
			var6(absoluteSize)
		end
	end, { var2 })
	local var8 = reactModule.useMemo(function()
		-- upvalues: var5 (ref), var2 (ref), var3 (ref), var4 (ref)
		return var5:map(function(p3)
			-- upvalues: var2 (copy), var3 (copy), var4 (copy)
			return if var2 then UDim2.new(var3, var4, 0, p3.Y) else UDim2.fromOffset(p3.X, p3.Y)
		end)
	end, { var2, var3, var4 })
	local var9 = reactModule.useRef(nil)
	local var10, var11 = reactModule.useState(false)
	local var12 = UIBloxConfigModule.addNavigationTabTooltipAndTruncation and (var1.enableTooltip and (var1.layout == navigationTabLayoutModule.Stacked and (var1.hasLabel and var1.labelText ~= nil)))
	
	if UIBloxConfigModule.addNavigationTabTooltipAndTruncation and var1.enableTooltip and (not var1.hasLabel or var1.labelText == nil) then
		loggerModule:warning("NavigationTab enableTooltip requires hasLabel and labelText")
	end
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		if var13.current then
			task.cancel(var13.current)
			var13.current = nil
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var14 (ref)
		return var14
	end, { var14 })
	local var15 = reactModule.useCallback(function(p3, p4)
		-- upvalues: var1 (ref), var12 (ref), var14 (ref), controlStateModule (copy), var11 (ref), tokens (ref), var13 (ref)
		if var1.onStateChanged then
			var1.onStateChanged(p3, p4)
		end
		if not var12 then return end
		var14()
		
		if p4 == controlStateModule.Hover or p4 == controlStateModule.Selected or p4 == controlStateModule.SelectedPressed then
			local var16 = nil
			var13.current = task.delay(tokens.Time.Time_500, function()
				-- upvalues: var13 (copy), var16 (write), var11 (copy)
				if var13.current == var16 then
					var13.current = nil
					var11(true)
					
					return
				end
			end)
			
			return
		end
		var11(false)
	end, { var1.onStateChanged, var12, var14, tokens.Time.Time_500 })
	local _ = nil
	local value = nil
	
	if var1.labelTypography then
		value = var1.labelTypography.FontSize
		
		if value ~= nil and typeof(value) ~= "number" then
			value = value:getValue()
		end
	end
	local var16
	local var17 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), foundationFontFaceMigration (copy), getTextSizeModule (copy), value (write), vector2 (copy), textService (copy)
		if var1.hasLabel and var1.labelText and var1.labelTypography then
			local var18 = if foundationFontFaceMigration then getTextSizeModule(var1.labelText, value, var1.labelTypography.Font, vector2) else textService:GetTextSize(var1.labelText, value, var1.labelTypography.Font, vector2)
			
			return UDim2.new(0, var18.X + 2, 0, var18.Y + 2)
		end
		return nil
	end, {
		var1.hasLabel,
		var1.labelText,
		var1.labelTypography,
		value
	})
	local _ = nil
	local uDim2 = UDim2.fromOffset(tokens.Size.Size_700, tokens.Size.Size_700)
	
	if var1.renderIcon then
		var16 = var1.renderIcon(var1.isChecked)
	else
		local var18 = if var1.isChecked and var1.iconCheckedImage then var1.iconCheckedImage else var1.iconImage
		local var19 = if var1.isChecked then tokens.Color.Content.Emphasis else tokens.Color.Content.Default
		local name = nil
		local variant = nil
		
		if UIBloxConfigModule.addFoundationNavigationTabIcon then
			if typeof(var18) == "string" then
				if isBuilderIcon(var18) then
					name = var18
				end
			elseif typeof(var18) == "table" and var18.name ~= nil and isBuilderIcon(var18.name) then
				name = var18.name
				variant = var18.variant
			end
		end
		var16 = if UIBloxConfigModule.addFoundationNavigationTabIcon and name ~= nil then reactModule.createElement(view, { tag = "size-0-0 auto-xy padding-xxsmall" }, {
			Icon = reactModule.createElement(icon, {
				name = name,
				size = inputSize.Large,
				variant = variant,
				style = var19
			})
		}) else reactModule.createElement(label, {
			BackgroundTransparency = 1,
			Size = uDim2,
			Image = var18,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = var19.Color3,
			ImageTransparency = var19.Transparency
		})
	end
	if var1.layout == navigationTabLayoutModule.Stacked and var1.badgeValue ~= nil then
		var16 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = uDim2
		}, {
			Icon = var16,
			Badge = reactModule.createElement(statusIndicator, {
				Position = UDim2.fromScale(1, 0),
				AnchorPoint = Vector2.new(0.6, 0.35),
				value = tonumber(var1.badgeValue),
				variant = migrateBadgeVariantModule(var1.badgeVariant),
				max = if tonumber(var1.badgeValue) then 99 else nil
			})
		})
	end
	local textLabel = nil
	
	if var1.hasLabel and var1.labelText then
		local var20 = if var1.isChecked then tokens.Color.Content.Emphasis else tokens.Color.Content.Default
		textLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = false,
			AutomaticSize = if var2 then Enum.AutomaticSize.Y elseif var17 then nil else Enum.AutomaticSize.XY,
			Size = if var2 then UDim2.fromScale(1, 0) else var17,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextTruncate = if var2 then Enum.TextTruncate.AtEnd else nil,
			Text = var1.labelText,
			Font = if foundationFontFaceMigration or var1.labelTypography == nil then nil else var1.labelTypography.Font,
			FontFace = if foundationFontFaceMigration and var1.labelTypography then normalizeFontFace(var1.labelTypography.Font) else nil,
			TextSize = if var1.labelTypography then var1.labelTypography.FontSize else nil,
			LineHeight = if var1.labelTypography then var1.labelTypography.LineHeight else nil,
			TextColor3 = var20.Color3,
			TextTransparency = var20.Transparency
		}, {
			UITextSizeConstraint = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation and var1.labelMaxTextSize then reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var1.labelMaxTextSize }) else nil
		})
	end
	local frame = nil
	local uDim = nil
	
	if var1.layout == navigationTabLayoutModule.Stacked then
		uDim = UDim.new(0, tokens.Radius.Medium)
		local size1200 = tokens.Size.Size_1200
		frame = reactModule.createElement("Frame", {
			AutomaticSize = if var2 then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			Size = if var2 then UDim2.new(1, 0, 0, size1200) else UDim2.fromOffset(size1200, size1200),
			ref = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation then var9 else nil,
			[reactModule.Change.AbsoluteSize] = var7
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, tokens.Size.Size_200),
				PaddingBottom = UDim.new(0, tokens.Size.Size_200)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = if UIBloxConfigModule.removeStackedNavigationTabIconLabelSpacing then nil else UDim.new(0, tokens.Size.Size_100)
			}),
			Icon = var16,
			Label = textLabel
		})
	elseif var1.layout == navigationTabLayoutModule.Inline then
		uDim = UDim.new(0, tokens.Size.Size_300)
		local var21 = if var1.isChecked then tokens.Color.State.Press else { Transparency = 1, Color3 = nil }
		frame = reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = var21.Transparency,
			BackgroundColor3 = var21.Color3,
			Size = UDim2.fromOffset(tokens.Size.Size_1200, tokens.Size.Size_1000),
			[reactModule.Change.AbsoluteSize] = var7
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, tokens.Size.Size_100),
				PaddingBottom = UDim.new(0, tokens.Size.Size_100),
				PaddingLeft = UDim.new(0, tokens.Size.Size_300),
				PaddingRight = UDim.new(0, tokens.Size.Size_300)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, tokens.Size.Size_300)
			}),
			UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
			Icon = var16,
			Label = textLabel,
			Badge = if var1.badgeValue ~= nil then nil else reactModule.createElement(statusIndicator, {
				LayoutOrder = 3,
				value = tonumber(var1.badgeValue),
				variant = migrateBadgeVariantModule(var1.badgeVariant),
				max = if tonumber(var1.badgeValue) then 99 else nil
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = p2,
		Size = var8,
		AnchorPoint = var1.anchorPoint,
		Position = var1.position,
		LayoutOrder = var1.layoutOrder
	}, {
		UIFlexItem = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation and var1.layout == navigationTabLayoutModule.Stacked and var1.fillWidth then reactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
		Contents = frame,
		StateLayer = reactModule.createElement(stateLayerModule, {
			affordance = "Background",
			zIndex = 10,
			cornerRadius = uDim,
			onActivated = var1.onActivated,
			onStateChanged = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation then var15 else var1.onStateChanged
		}),
		Tooltip = if UIBloxConfigModule.addNavigationTabTooltipAndTruncation and var12 then reactModule.createElement(NavigationTabTooltip, {
			isOpen = var10,
			anchorRef = var9,
			labelText = var1.labelText,
			side = var1.tooltipSide,
			align = var1.tooltipAlign,
			offset = var1.tooltipOffset
		}) else nil
	})
end)