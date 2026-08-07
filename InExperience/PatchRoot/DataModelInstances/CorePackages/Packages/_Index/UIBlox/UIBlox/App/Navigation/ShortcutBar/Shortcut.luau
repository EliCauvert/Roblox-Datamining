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

local function renderIcon(p0, p1) --[[ line: 43 ]]
	-- upvalues: foundationModule (ref), UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), reactModule (ref), keyLabelModule (ref), imageSetComponentModule (ref), progressIconAnimatedModule (ref)
	local layoutOrder = p0.layoutOrder
	local itemProps = p0.itemProps
	local var13 = if UIBloxConfigModule.useTokenizedShortcutBar then foundationModule.Hooks.useTokens().Size.Size_600 else getIconSizeModule(iconSizeModule.Medium)
	local hasProgress = itemProps.hasProgress
	local var14 = if hasProgress then itemProps else nil
	local icon = itemProps.icon
	local x = nil
	local isEnumItem = typeof(icon) == "EnumItem"
	local var16 = typeof(icon) == "table" and #icon > 0
	
	if isEnumItem or var16 then
		x = Enum.AutomaticSize.X
	end
	local var17
	local _ = nil
	
	if isEnumItem then
		var17 = reactModule.createElement(keyLabelModule, { iconThemeKey = "IconEmphasis", keyCode = icon })
	elseif var16 then
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
		var17 = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, t)
	else
		var17 = reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = icon,
			ImageColor3 = p1.Theme.TextEmphasis.Color,
			ImageTransparency = p1.Theme.TextEmphasis.Transparency
		})
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Size = UDim2.fromOffset(var13, var13),
		AutomaticSize = x
	}, {
		ProgressIcon = if hasProgress then reactModule.createElement(progressIconAnimatedModule, var14) else nil,
		Image = if hasProgress then nil else var17
	})
end

return function(p2) --[[ line: 119 | named "Shortcut" ]]
	-- upvalues: object (ref), t (ref), t_1 (ref), useStyleModule (ref), foundationModule (ref), reactModule (ref), UIBloxConfigModule (ref), genericTextLabelModule (ref), renderIcon (ref)
	local var19 = object.assign({}, t, p2)
	local var20 = object.assign({}, t_1, var19.publicProps)
	local var21 = useStyleModule()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = var19.index,
		Size = if UIBloxConfigModule.enableShortcutCustomization then var19.size else UDim2.fromOffset(0, 0),
		AutomaticSize = if UIBloxConfigModule.enableShortcutCustomization then var19.automaticSize else Enum.AutomaticSize.XY
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var19.iconLabelGap)
		}),
		ActionText = if var20.actionText then reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var19.actionTextSpacingLeading)
			}),
			Label = reactModule.createElement(genericTextLabelModule, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = var20.actionText,
				colorStyle = var21.Theme.TextEmphasis,
				fontStyle = var21.Font.SubHeader1
			})
		}) else nil,
		Icon = if UIBloxConfigModule.enableShortcutCustomization and var19.renderIcon then var19.renderIcon({ layoutOrder = 2 }) else renderIcon({ layoutOrder = 2, itemProps = var20 }, var21),
		LabelText = reactModule.createElement(genericTextLabelModule, {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = var20.text,
			TextSize = if UIBloxConfigModule.enableShortcutCustomization and var19.labelTextSize then var19.labelTextSize elseif UIBloxConfigModule.useTokenizedShortcutBar then foundationModule.Hooks.useTokens().FontSize.FontSize_50 else nil,
			colorStyle = if UIBloxConfigModule.enableShortcutCustomization and var19.labelColorStyle then var19.labelColorStyle else var21.Theme.TextEmphasis,
			fontStyle = if UIBloxConfigModule.enableShortcutCustomization and var19.labelFontStyle then var19.labelFontStyle else var21.Font.SubHeader1
		})
	})
end