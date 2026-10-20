local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BaseMenuModule = require(Foundation.Components.BaseMenu)
local PopoverModule = require(Foundation.Components.Popover)
local _ = require(Foundation.Components.Types)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local RadiusModule = require(Foundation.Enums.Radius)
local config = {
	testId = "--foundation-menu",
	size = require(Foundation.Enums.InputSize).Medium,
	side = require(Foundation.Enums.PopoverSide).Bottom,
	align = require(Foundation.Enums.PopoverAlign).Start
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), PopoverModule (copy), WithCommonPropsModule (copy), RadiusModule (copy), BaseMenuModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	
	return ReactModule.createElement(PopoverModule.Root, {
		isOpen = WithDefaultsModuleResult.isOpen,
		testId = WithDefaultsModuleResult.testId
	}, {
		Anchor = ReactModule.createElement(PopoverModule.Anchor, WithCommonPropsModule(WithDefaultsModuleResult, { anchorRef = WithDefaultsModuleResult.anchorRef }), if WithDefaultsModuleResult.anchorRef then nil else WithDefaultsModuleResult.children),
		Content = ReactModule.createElement(PopoverModule.Content, {
			hasArrow = false,
			side = {
				position = WithDefaultsModuleResult.side,
				offset = UseTokensModuleResult.Stroke.Standard + UseTokensModuleResult.Padding.Small
			},
			align = WithDefaultsModuleResult.align,
			onPressedOutside = WithDefaultsModuleResult.onPressedOutside,
			backgroundStyle = UseTokensModuleResult.Color.Surface.Surface_200,
			radius = RadiusModule.Medium,
			ref = Ref,
			selection = WithDefaultsModuleResult.selection,
			selectionGroup = WithDefaultsModuleResult.selectionGroup
		}, ReactModule.createElement(ReactModule.Fragment, nil, {
			Menu = ReactModule.createElement(BaseMenuModule.Root, {
				items = WithDefaultsModuleResult.items,
				size = WithDefaultsModuleResult.size,
				width = WithDefaultsModuleResult.width,
				maxHeight = WithDefaultsModuleResult.maxHeight,
				onActivated = WithDefaultsModuleResult.onActivated,
				onNestedLeafActivated = WithDefaultsModuleResult.onPressedOutside,
				radius = RadiusModule.Medium
			})
		}))
	})
end))