local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local AvatarIconModule = require(Foundation.Components.AvatarIcon)
local AvatarIconSizeModule = require(Foundation.Enums.AvatarIconSize)
local IconModule = require(Foundation.Components.Icon)
local IconSizeModule = require(Foundation.Enums.IconSize)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local StatusIndicatorModule = require(Foundation.Components.StatusIndicator)
local StatusIndicatorSizeModule = require(Foundation.Enums.StatusIndicatorSize)
local StatusIndicatorVariantModule = require(Foundation.Enums.StatusIndicatorVariant)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return ReactModule.memo(ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ViewModule (copy), AvatarIconModule (copy), AvatarIconSizeModule (copy), IconModule (copy), BuilderIconsModule (copy), IconSizeModule (copy), StateLayerAffordanceModule (copy), StatusIndicatorModule (copy), StatusIndicatorVariantModule (copy), StatusIndicatorSizeModule (copy), TextModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local Item = Frame.item
	
	return ReactModule.createElement(ViewModule, {
		tag = "fill auto-y",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = function()
			-- upvalues: Frame (copy), Item (copy)
			Frame.onActivated(Item.id)
		end,
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		ref = Ref,
		testId = Frame.testId
	}, {
		Content = ReactModule.createElement(ViewModule, {
			tag = {
				["col align-x-center"] = true,
				["gap-xxsmall size-full-0 auto-y"] = not Frame.isCapsule,
				["align-y-center"] = Frame.isCapsule,
				["gap-xsmall size-full-1400"] = Frame.isCapsule and Frame.hasLabel,
				["size-full-1200"] = Frame.isCapsule and not Frame.hasLabel
			},
			padding = if Frame.isCapsule then nil else {
				top = UDim.new(0, UseTokensModuleResult.Padding.XXSmall + UseTokensModuleResult.Padding.Small),
				bottom = UDim.new(0, UseTokensModuleResult.Padding.XXSmall + UseTokensModuleResult.Padding.Small)
			},
			testId = `{Frame.testId}--content`
		}, {
			Media = ReactModule.createElement(ViewModule, { LayoutOrder = 1, tag = "size-600" }, {
				Icon = if typeof(Item.icon) == "table" and Item.icon.type == "Avatar" then ReactModule.createElement(ViewModule, {
					tag = {
						["auto-xy radius-circle"] = true,
						["stroke-thick stroke-system-contrast"] = Frame.isActive,
						["stroke-standard stroke-emphasis"] = not Frame.isActive
					},
					testId = `{Frame.testId}--avatar-ring`
				}, {
					Avatar = ReactModule.createElement(AvatarIconModule, {
						userId = Item.icon.userId,
						size = AvatarIconSizeModule.Large,
						testId = `{Frame.testId}--avatar`
					})
				}) elseif typeof(Item.icon) == "string" then ReactModule.createElement(IconModule, {
					name = Item.icon,
					variant = if Frame.isActive then BuilderIconsModule.IconVariant.Filled else BuilderIconsModule.IconVariant.Regular,
					size = IconSizeModule.Large,
					style = UseTokensModuleResult.Color.Content.Emphasis,
					testId = `{Frame.testId}--icon`
				}) else nil,
				Status = if Item.indicator then ReactModule.createElement(StatusIndicatorModule, if Item.indicator.value == nil then {
					ZIndex = 2,
					variant = StatusIndicatorVariantModule.Emphasis,
					size = StatusIndicatorSizeModule.Small,
					mask = if Frame.isCapsule then nil else UseTokensModuleResult.Color.Common.NavigationBar,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = if Frame.isCapsule then UDim2.fromScale(1, 0) else UDim2.new(1, -UseTokensModuleResult.Size.Size_50, 0, UseTokensModuleResult.Size.Size_50),
					testId = `{Frame.testId}--status`
				} else {
					ZIndex = 2,
					value = Item.indicator.value,
					max = Item.indicator.max or 99,
					variant = StatusIndicatorVariantModule.Emphasis,
					size = StatusIndicatorSizeModule.Small,
					mask = if Frame.isCapsule then nil else UseTokensModuleResult.Color.Common.NavigationBar,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = if Frame.isCapsule then UDim2.new(1, -UseTokensModuleResult.Size.Size_100, 0, 0) else UDim2.new(1, -UseTokensModuleResult.Size.Size_150, 0, UseTokensModuleResult.Size.Size_50),
					testId = `{Frame.testId}--status`
				}) else nil
			}),
			Label = if Frame.hasLabel then ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-caption-small text-align-x-center text-truncate-end content-emphasis",
				Text = Item.text,
				testId = `{Frame.testId}--label`
			}) else nil
		})
	})
end))