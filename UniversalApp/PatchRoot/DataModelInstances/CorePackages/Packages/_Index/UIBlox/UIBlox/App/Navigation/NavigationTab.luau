local textService = game:GetService("TextService")
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local UIBloxConfigModule = require(parent.UIBloxConfig)
local stateLayerModule = require(parent.Core.Control.StateLayer)
local useStyleModule = require(parent.Core.Style.useStyle)
local label = require(parent.Core.ImageSet.ImageSetComponent).Label
local navigationTabLayoutModule = require(parent.App.Navigation.Enum.NavigationTabLayout)
local _ = require(parent.App.ImageSet.ImagesTypes)
local _ = require(parent.App.Style.StyleTypes)
local isBuilderIcon = foundationModule.Utility.isBuilderIcon
local inputSize = foundationModule.Enums.InputSize
local icon = foundationModule.Icon
local statusIndicator = foundationModule.StatusIndicator
local migrateBadgeVariantModule = require(parent.Utility.migrateBadgeVariant)
local vector2 = Vector2.new(1e999, 1e999)
local t = {
	hasLabel = false,
	isChecked = false,
	badgeValue = nil,
	layout = navigationTabLayoutModule.Stacked
}

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), textService (ref), vector2 (ref), UIBloxConfigModule (ref), isBuilderIcon (ref), icon (ref), inputSize (ref), label (ref), navigationTabLayoutModule (ref), statusIndicator (ref), migrateBadgeVariantModule (ref), stateLayerModule (ref)
	local var11 = cryoModule.Dictionary.join(t, p0)
	local tokens = useStyleModule().Tokens
	local var12, var13 = reactModule.useBinding(UDim2.new())
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref)
		var13(UDim2.fromOffset(p2.AbsoluteSize.X, p2.AbsoluteSize.Y))
	end, {})
	local _ = nil
	local value = nil
	
	if var11.labelTypography then
		value = var11.labelTypography.FontSize
		
		if value ~= nil and typeof(value) ~= "number" then
			value = value:getValue()
		end
	end
	local var20
	local var16 = reactModule.useMemo(function()
		-- upvalues: var11 (ref), textService (copy), value (write), vector2 (copy)
		if var11.hasLabel and var11.labelText and var11.labelTypography then
			local labelTextTextSize = textService:GetTextSize(var11.labelText, value, var11.labelTypography.Font, vector2)
			
			return UDim2.new(0, labelTextTextSize.X + 2, 0, labelTextTextSize.Y + 2)
		end
		return nil
	end, {
		var11.hasLabel,
		var11.labelText,
		var11.labelTypography,
		value
	})
	local _ = nil
	local uDim2 = UDim2.fromOffset(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_700 else tokens.Global.Size_350, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_700 else tokens.Global.Size_350)
	
	if var11.renderIcon then
		var20 = var11.renderIcon(var11.isChecked)
	else
		local var18 = if var11.isChecked and var11.iconCheckedImage then var11.iconCheckedImage else var11.iconImage
		local var19 = if var11.isChecked then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Icon.Emphasis elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default else tokens.Semantic.Color.Icon.Default
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
		var20 = if UIBloxConfigModule.addFoundationNavigationTabIcon and name ~= nil then reactModule.createElement(icon, {
			name = name,
			size = inputSize.Large,
			variant = variant,
			style = var19
		}) else reactModule.createElement(label, {
			BackgroundTransparency = 1,
			Size = uDim2,
			Image = var18,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = var19.Color3,
			ImageTransparency = var19.Transparency
		})
	end
	if var11.layout == navigationTabLayoutModule.Stacked and var11.badgeValue ~= nil then
		var20 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = uDim2
		}, {
			Icon = var20,
			Badge = reactModule.createElement(statusIndicator, {
				Position = UDim2.fromScale(1, 0),
				AnchorPoint = Vector2.new(0.6, 0.35),
				value = tonumber(var11.badgeValue),
				variant = migrateBadgeVariantModule(var11.badgeVariant),
				max = if tonumber(var11.badgeValue) then 99 else nil
			})
		})
	end
	local textLabel = nil
	
	if var11.hasLabel and var11.labelText then
		local var22 = if var11.isChecked then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Text.Emphasis elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default else tokens.Semantic.Color.Text.Default
		textLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = false,
			AutomaticSize = if var16 then nil else Enum.AutomaticSize.XY,
			Size = var16,
			TextXAlignment = Enum.TextXAlignment.Center,
			Text = var11.labelText,
			Font = if var11.labelTypography then var11.labelTypography.Font else nil,
			TextSize = if var11.labelTypography then var11.labelTypography.FontSize else nil,
			LineHeight = if var11.labelTypography then var11.labelTypography.LineHeight else nil,
			TextColor3 = var22.Color3,
			TextTransparency = var22.Transparency
		})
	end
	local frame = nil
	local uDim = nil
	
	if var11.layout == navigationTabLayoutModule.Stacked then
		uDim = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Medium else tokens.Semantic.Radius.Medium)
		frame = reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1200 else tokens.Global.Space_600, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1200 else tokens.Global.Space_600),
			[reactModule.Change.AbsoluteSize] = var14
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100),
				PaddingBottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Space_100)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = if UIBloxConfigModule.removeStackedNavigationTabIconLabelSpacing then nil else UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50)
			}),
			Icon = var20,
			Label = textLabel
		})
	elseif var11.layout == navigationTabLayoutModule.Inline then
		uDim = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Semantic.Radius.Large)
		local var25 = if var11.isChecked then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.State.Press else tokens.Semantic.Color.State.Standard.Pressed else { Transparency = 1, Color3 = nil }
		frame = reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = var25.Transparency,
			BackgroundColor3 = var25.Color3,
			Size = UDim2.fromOffset(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1200 else tokens.Global.Space_600, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1000 else tokens.Global.Space_500),
			[reactModule.Change.AbsoluteSize] = var14
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50),
				PaddingBottom = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_100 else tokens.Global.Space_50),
				PaddingLeft = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Space_150),
				PaddingRight = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Space_150)
			}),
			UIListLayout = reactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Global.Space_150)
			}),
			UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
			Icon = var20,
			Label = textLabel,
			Badge = if var11.badgeValue ~= nil then nil else reactModule.createElement(statusIndicator, {
				LayoutOrder = 3,
				value = tonumber(var11.badgeValue),
				variant = migrateBadgeVariantModule(var11.badgeVariant),
				max = if tonumber(var11.badgeValue) then 99 else nil
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = p1,
		Size = var12,
		AnchorPoint = var11.anchorPoint,
		Position = var11.position,
		LayoutOrder = var11.layoutOrder
	}, {
		Contents = frame,
		StateLayer = reactModule.createElement(stateLayerModule, {
			affordance = "Background",
			zIndex = 10,
			cornerRadius = uDim,
			onActivated = var11.onActivated,
			onStateChanged = var11.onStateChanged
		})
	})
end)