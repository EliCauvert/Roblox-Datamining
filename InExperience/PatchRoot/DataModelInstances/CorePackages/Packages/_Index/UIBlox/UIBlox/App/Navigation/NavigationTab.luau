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
local view = foundationModule.View
local migrateBadgeVariantModule = require(parent.Utility.migrateBadgeVariant)
local vector2 = Vector2.new(1e999, 1e999)
local t = {
	hasLabel = false,
	isChecked = false,
	badgeValue = nil,
	layout = navigationTabLayoutModule.Stacked
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: cryoModule (ref), t (ref), useStyleModule (ref), reactModule (ref), textService (ref), vector2 (ref), UIBloxConfigModule (ref), isBuilderIcon (ref), view (ref), icon (ref), inputSize (ref), label (ref), navigationTabLayoutModule (ref), statusIndicator (ref), migrateBadgeVariantModule (ref), stateLayerModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local tokens = useStyleModule().Tokens
	local var2, var3 = reactModule.useBinding(UDim2.new())
	local var4 = reactModule.useCallback(function(p3)
		-- upvalues: var3 (ref)
		var3(UDim2.fromOffset(p3.AbsoluteSize.X, p3.AbsoluteSize.Y))
	end, {})
	local _ = nil
	local value = nil
	
	if var1.labelTypography then
		value = var1.labelTypography.FontSize
		
		if value ~= nil and typeof(value) ~= "number" then
			value = value:getValue()
		end
	end
	local var5
	local var6 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), textService (copy), value (write), vector2 (copy)
		if var1.hasLabel and var1.labelText and var1.labelTypography then
			local labelTextTextSize = textService:GetTextSize(var1.labelText, value, var1.labelTypography.Font, vector2)
			
			return UDim2.new(0, labelTextTextSize.X + 2, 0, labelTextTextSize.Y + 2)
		end
		return nil
	end, {
		var1.hasLabel,
		var1.labelText,
		var1.labelTypography,
		value
	})
	local _ = nil
	local uDim2 = UDim2.fromOffset(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_700 else tokens.Global.Size_350, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_700 else tokens.Global.Size_350)
	
	if var1.renderIcon then
		var5 = var1.renderIcon(var1.isChecked)
	else
		local var7 = if var1.isChecked and var1.iconCheckedImage then var1.iconCheckedImage else var1.iconImage
		local var8 = if var1.isChecked then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Icon.Emphasis elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default else tokens.Semantic.Color.Icon.Default
		local name = nil
		local variant = nil
		
		if UIBloxConfigModule.addFoundationNavigationTabIcon then
			if typeof(var7) == "string" then
				if isBuilderIcon(var7) then
					name = var7
				end
			elseif typeof(var7) == "table" and var7.name ~= nil and isBuilderIcon(var7.name) then
				name = var7.name
				variant = var7.variant
			end
		end
		var5 = if UIBloxConfigModule.addFoundationNavigationTabIcon and name ~= nil then reactModule.createElement(view, { tag = "size-0-0 auto-xy padding-xxsmall" }, {
			Icon = reactModule.createElement(icon, {
				name = name,
				size = inputSize.Large,
				variant = variant,
				style = var8
			})
		}) else reactModule.createElement(label, {
			BackgroundTransparency = 1,
			Size = uDim2,
			Image = var7,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = var8.Color3,
			ImageTransparency = var8.Transparency
		})
	end
	if var1.layout == navigationTabLayoutModule.Stacked and var1.badgeValue ~= nil then
		var5 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = uDim2
		}, {
			Icon = var5,
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
		local var9 = if var1.isChecked then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Emphasis else tokens.Semantic.Color.Text.Emphasis elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default else tokens.Semantic.Color.Text.Default
		textLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = false,
			AutomaticSize = if var6 then nil else Enum.AutomaticSize.XY,
			Size = var6,
			TextXAlignment = Enum.TextXAlignment.Center,
			Text = var1.labelText,
			Font = if var1.labelTypography then var1.labelTypography.Font else nil,
			TextSize = if var1.labelTypography then var1.labelTypography.FontSize else nil,
			LineHeight = if var1.labelTypography then var1.labelTypography.LineHeight else nil,
			TextColor3 = var9.Color3,
			TextTransparency = var9.Transparency
		})
	end
	local frame = nil
	local uDim = nil
	
	if var1.layout == navigationTabLayoutModule.Stacked then
		uDim = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Radius.Medium else tokens.Semantic.Radius.Medium)
		frame = reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1200 else tokens.Global.Space_600, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1200 else tokens.Global.Space_600),
			[reactModule.Change.AbsoluteSize] = var4
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
			Icon = var5,
			Label = textLabel
		})
	elseif var1.layout == navigationTabLayoutModule.Inline then
		uDim = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_300 else tokens.Semantic.Radius.Large)
		local var10 = if var1.isChecked then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.State.Press else tokens.Semantic.Color.State.Standard.Pressed else { Transparency = 1, Color3 = nil }
		frame = reactModule.createElement("Frame", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = var10.Transparency,
			BackgroundColor3 = var10.Color3,
			Size = UDim2.fromOffset(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1200 else tokens.Global.Space_600, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1000 else tokens.Global.Space_500),
			[reactModule.Change.AbsoluteSize] = var4
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
			Icon = var5,
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
		Size = var2,
		AnchorPoint = var1.anchorPoint,
		Position = var1.position,
		LayoutOrder = var1.layoutOrder
	}, {
		Contents = frame,
		StateLayer = reactModule.createElement(stateLayerModule, {
			affordance = "Background",
			zIndex = 10,
			cornerRadius = uDim,
			onActivated = var1.onActivated,
			onStateChanged = var1.onStateChanged
		})
	})
end)