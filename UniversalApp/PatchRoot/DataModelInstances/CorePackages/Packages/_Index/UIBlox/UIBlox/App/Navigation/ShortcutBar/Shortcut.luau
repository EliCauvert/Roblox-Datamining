local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local reactModule = require(parent_2.React)
local object = require(parent_2.LuauPolyfill).Object
local foundationModule = require(parent_2.Foundation)
local useStyleModule = require(parent_1.Core.Style.useStyle)
local imageSetComponentModule = require(parent_1.Core.ImageSet.ImageSetComponent)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local genericTextLabelModule = require(parent_1.Core.Text.GenericTextLabel.GenericTextLabel)
local keyLabelModule = require(parent.Menu.KeyLabel.KeyLabel)
local progressIconAnimatedModule = require(script.Parent.ProgressIconAnimated)
local _ = require(script.Parent.Types)
local t = {
	iconLabelGap = 6,
	actionTextSpacingLeading = 12,
	size = UDim2.fromOffset(0, 0),
	automaticSize = Enum.AutomaticSize.XY
}
local t_1 = {
	hasProgress = false,
	animationTriggerTime = 0.3,
	animationKeyHoldingTime = 1.5,
	animationCoolDownTime = 0.75
}

local function renderIcon(p1, p2)
	-- upvalues: foundationModule (ref), UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), reactModule (ref), keyLabelModule (ref), imageSetComponentModule (ref), progressIconAnimatedModule (ref)
	local layoutOrder = p1.layoutOrder
	local itemProps = p1.itemProps
	local var1 = if UIBloxConfigModule.useTokenizedShortcutBar then foundationModule.Hooks.useTokens().Size.Size_600 else getIconSizeModule(iconSizeModule.Medium)
	local hasProgress = itemProps.hasProgress
	local var2 = if hasProgress then itemProps else nil
	local icon = itemProps.icon
	local x = nil
	local isEnumItem = typeof(icon) == "EnumItem"
	local var3 = typeof(icon) == "table" and #icon > 0
	
	if isEnumItem or var3 then
		x = Enum.AutomaticSize.X
	end
	local var4
	local _ = nil
	
	if isEnumItem then
		var4 = reactModule.createElement(keyLabelModule, { iconThemeKey = "IconEmphasis", keyCode = icon })
	elseif var3 then
		local t = {
			Layout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		
		for i, v in icon do
			t["KeyLabel" .. i] = reactModule.createElement(keyLabelModule, {
				iconThemeKey = "IconEmphasis",
				keyCode = v,
				LayoutOrder = i
			})
		end
		var4 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, t)
	else
		var4 = reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = icon,
			ImageColor3 = p2.Theme.TextEmphasis.Color,
			ImageTransparency = p2.Theme.TextEmphasis.Transparency
		})
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Size = UDim2.fromOffset(var1, var1),
		AutomaticSize = x
	}, {
		ProgressIcon = if hasProgress then reactModule.createElement(progressIconAnimatedModule, var2) else nil,
		Image = if hasProgress then nil else var4
	})
end

return function(p3)
	-- upvalues: object (ref), t (ref), t_1 (ref), useStyleModule (ref), foundationModule (ref), reactModule (ref), UIBloxConfigModule (ref), genericTextLabelModule (ref), renderIcon (ref)
	local var5 = object.assign({}, t, p3)
	local var6 = object.assign({}, t_1, var5.publicProps)
	local var7 = useStyleModule()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = var5.index,
		Size = if UIBloxConfigModule.enableShortcutCustomization then var5.size else UDim2.fromOffset(0, 0),
		AutomaticSize = if UIBloxConfigModule.enableShortcutCustomization then var5.automaticSize else Enum.AutomaticSize.XY
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var5.iconLabelGap)
		}),
		ActionText = if var6.actionText then reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var5.actionTextSpacingLeading)
			}),
			Label = reactModule.createElement(genericTextLabelModule, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = var6.actionText,
				colorStyle = var7.Theme.TextEmphasis,
				fontStyle = var7.Font.SubHeader1
			})
		}) else nil,
		Icon = if UIBloxConfigModule.enableShortcutCustomization and var5.renderIcon then var5.renderIcon({ layoutOrder = 2 }) else renderIcon({ layoutOrder = 2, itemProps = var6 }, var7),
		LabelText = reactModule.createElement(genericTextLabelModule, {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = var6.text,
			TextSize = if UIBloxConfigModule.enableShortcutCustomization and var5.labelTextSize then var5.labelTextSize elseif UIBloxConfigModule.useTokenizedShortcutBar then foundationModule.Hooks.useTokens().FontSize.FontSize_50 else nil,
			colorStyle = if UIBloxConfigModule.enableShortcutCustomization and var5.labelColorStyle then var5.labelColorStyle else var7.Theme.TextEmphasis,
			fontStyle = if UIBloxConfigModule.enableShortcutCustomization and var5.labelFontStyle then var5.labelFontStyle else var7.Font.SubHeader1
		})
	})
end