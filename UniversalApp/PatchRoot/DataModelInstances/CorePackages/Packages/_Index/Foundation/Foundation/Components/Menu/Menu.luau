local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local baseMenuModule = require(foundation.Components.BaseMenu)
local flagsModule = require(foundation.Utility.Flags)
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 67 | named "Menu" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), popoverModule (ref), withCommonPropsModule (ref), flagsModule (ref), radiusModule (ref), baseMenuModule (ref)
	local var10 = withDefaultsModule(p0, t)
	local var11 = useTokensModule()
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var10.isOpen, testId = var10.testId }, {
		Anchor = reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(var10, { anchorRef = var10.anchorRef }), if var10.anchorRef then nil else var10.children),
		Content = reactModule.createElement(popoverModule.Content, {
			hasArrow = false,
			side = {
				position = var10.side,
				offset = var11.Stroke.Standard + var11.Padding.Small
			},
			align = var10.align,
			onPressedOutside = var10.onPressedOutside,
			backgroundStyle = if flagsModule.FoundationBaseMenuBeta then var11.Color.Surface.Surface_200 else var11.Color.Surface.Surface_100,
			radius = radiusModule.Medium,
			ref = p1,
			selection = var10.selection,
			selectionGroup = var10.selectionGroup
		}, reactModule.createElement(reactModule.Fragment, nil, {
			Menu = reactModule.createElement(baseMenuModule.Root, {
				items = var10.items,
				size = var10.size,
				width = var10.width,
				maxHeight = var10.maxHeight,
				onActivated = var10.onActivated,
				onNestedLeafActivated = var10.onPressedOutside,
				radius = radiusModule.Medium
			})
		}))
	})
end))