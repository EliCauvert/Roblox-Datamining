local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local baseMenuModule = require(foundation.Components.BaseMenu)
local popoverModule = require(foundation.Components.Popover)
local _ = require(foundation.Components.Types)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local radiusModule = require(foundation.Enums.Radius)
local t = {
	testId = "--foundation-menu",
	size = require(foundation.Enums.InputSize).Medium,
	side = require(foundation.Enums.PopoverSide).Bottom,
	align = require(foundation.Enums.PopoverAlign).Start
}

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), popoverModule (ref), withCommonPropsModule (ref), radiusModule (ref), baseMenuModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var1.isOpen, testId = var1.testId }, {
		Anchor = reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(var1, { anchorRef = var1.anchorRef }), if var1.anchorRef then nil else var1.children),
		Content = reactModule.createElement(popoverModule.Content, {
			hasArrow = false,
			side = {
				position = var1.side,
				offset = var2.Stroke.Standard + var2.Padding.Small
			},
			align = var1.align,
			onPressedOutside = var1.onPressedOutside,
			backgroundStyle = var2.Color.Surface.Surface_200,
			radius = radiusModule.Medium,
			ref = p2,
			selection = var1.selection,
			selectionGroup = var1.selectionGroup
		}, reactModule.createElement(reactModule.Fragment, nil, {
			Menu = reactModule.createElement(baseMenuModule.Root, {
				items = var1.items,
				size = var1.size,
				width = var1.width,
				maxHeight = var1.maxHeight,
				onActivated = var1.onActivated,
				onNestedLeafActivated = var1.onPressedOutside,
				radius = radiusModule.Medium
			})
		}))
	})
end))