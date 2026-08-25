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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), popoverModule (ref), withCommonPropsModule (ref), radiusModule (ref), baseMenuModule (ref)
	local var9 = withDefaultsModule(p0, t)
	local var10 = useTokensModule()
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var9.isOpen, testId = var9.testId }, {
		Anchor = reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(var9, { anchorRef = var9.anchorRef }), if var9.anchorRef then nil else var9.children),
		Content = reactModule.createElement(popoverModule.Content, {
			hasArrow = false,
			side = {
				position = var9.side,
				offset = var10.Stroke.Standard + var10.Padding.Small
			},
			align = var9.align,
			onPressedOutside = var9.onPressedOutside,
			backgroundStyle = var10.Color.Surface.Surface_200,
			radius = radiusModule.Medium,
			ref = p1,
			selection = var9.selection,
			selectionGroup = var9.selectionGroup
		}, reactModule.createElement(reactModule.Fragment, nil, {
			Menu = reactModule.createElement(baseMenuModule.Root, {
				items = var9.items,
				size = var9.size,
				width = var9.width,
				maxHeight = var9.maxHeight,
				onActivated = var9.onActivated,
				onNestedLeafActivated = var9.onPressedOutside,
				radius = radiusModule.Medium
			})
		}))
	})
end))