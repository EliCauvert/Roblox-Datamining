local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local UIBloxConfigModule = require(Parent1.UIBloxConfig)
local ReactModule = require(Parent2.React)
local Object = require(Parent2.LuauPolyfill).Object
local FoundationModule = require(Parent2.Foundation)
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local ImageSetComponentModule = require(Parent1.Core.ImageSet.ImageSetComponent)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local GenericTextLabelModule = require(Parent1.Core.Text.GenericTextLabel.GenericTextLabel)
local KeyLabelModule = require(Parent.Menu.KeyLabel.KeyLabel)
local ProgressIconAnimatedModule = require(script.Parent.ProgressIconAnimated)
local _ = require(script.Parent.Types)
local config = {
	iconLabelGap = 6,
	actionTextSpacingLeading = 12,
	size = UDim2.fromOffset(0, 0),
	automaticSize = Enum.AutomaticSize.XY
}
local config1 = {
	hasProgress = false,
	animationTriggerTime = 0.3,
	animationKeyHoldingTime = 1.5,
	animationCoolDownTime = 0.75
}

local function renderIcon(p1, p2)
	-- upvalues: FoundationModule (copy), UIBloxConfigModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), ReactModule (copy), KeyLabelModule (copy), ImageSetComponentModule (copy), ProgressIconAnimatedModule (copy)
	local LayoutOrder = p1.layoutOrder
	local ItemProps = p1.itemProps
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Size600 = if UIBloxConfigModule.useTokenizedShortcutBar then UseTokensResult.Size.Size_600 else GetIconSizeModule(IconSizeModule.Medium)
	local HasProgress = ItemProps.hasProgress
	local ItemProps1 = if HasProgress then ItemProps else nil
	local Icon = ItemProps.icon
	local X = nil
	local IsEnumItem = typeof(Icon) == "EnumItem"
	local v1: boolean = typeof(Icon) == "table" and #Icon > 0
	
	if IsEnumItem or v1 then
		X = Enum.AutomaticSize.X
	end
	local Element = nil
	if IsEnumItem then
		Element = ReactModule.createElement(KeyLabelModule, { iconThemeKey = "IconEmphasis", keyCode = Icon })
	elseif v1 then
		local config = {
			Layout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			})
		}
		
		for LayoutOrder1, KeyCode in Icon do
			config["KeyLabel" .. LayoutOrder1] = ReactModule.createElement(KeyLabelModule, {
				iconThemeKey = "IconEmphasis",
				keyCode = KeyCode,
				LayoutOrder = LayoutOrder1
			})
		end
		Element = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, config)
	else
		Element = ReactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = Icon,
			ImageColor3 = p2.Theme.TextEmphasis.Color,
			ImageTransparency = p2.Theme.TextEmphasis.Transparency
		})
	end
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		Size = UDim2.fromOffset(Size600, Size600),
		AutomaticSize = X
	}, {
		ProgressIcon = if HasProgress then ReactModule.createElement(ProgressIconAnimatedModule, ItemProps1) else nil,
		Image = if HasProgress then nil else Element
	})
end

return function(p3)
	-- upvalues: Object (copy), config (copy), config1 (copy), UseStyleModule (copy), FoundationModule (copy), ReactModule (copy), UIBloxConfigModule (copy), GenericTextLabelModule (copy), renderIcon (copy)
	local AssignResult = Object.assign({}, config, p3)
	local AssignResult1 = Object.assign({}, config1, AssignResult.publicProps)
	local UseStyleModuleResult = UseStyleModule()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		LayoutOrder = AssignResult.index,
		Size = if UIBloxConfigModule.enableShortcutCustomization then AssignResult.size else UDim2.fromOffset(0, 0),
		AutomaticSize = if UIBloxConfigModule.enableShortcutCustomization then AssignResult.automaticSize else Enum.AutomaticSize.XY
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, AssignResult.iconLabelGap)
		}),
		ActionText = if AssignResult1.actionText then ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, AssignResult.actionTextSpacingLeading)
			}),
			Label = ReactModule.createElement(GenericTextLabelModule, {
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = AssignResult1.actionText,
				colorStyle = UseStyleModuleResult.Theme.TextEmphasis,
				fontStyle = UseStyleModuleResult.Font.SubHeader1
			})
		}) else nil,
		Icon = if UIBloxConfigModule.enableShortcutCustomization and AssignResult.renderIcon then AssignResult.renderIcon({ layoutOrder = 2 }) else renderIcon({ layoutOrder = 2, itemProps = AssignResult1 }, UseStyleModuleResult),
		LabelText = ReactModule.createElement(GenericTextLabelModule, {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = AssignResult1.text,
			TextSize = if UIBloxConfigModule.enableShortcutCustomization and AssignResult.labelTextSize then AssignResult.labelTextSize elseif UIBloxConfigModule.useTokenizedShortcutBar then UseTokensResult.FontSize.FontSize_50 else nil,
			colorStyle = if UIBloxConfigModule.enableShortcutCustomization and AssignResult.labelColorStyle then AssignResult.labelColorStyle else UseStyleModuleResult.Theme.TextEmphasis,
			fontStyle = if UIBloxConfigModule.enableShortcutCustomization and AssignResult.labelFontStyle then AssignResult.labelFontStyle else UseStyleModuleResult.Font.SubHeader1
		})
	})
end