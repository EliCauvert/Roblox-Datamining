local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local baseMenuModule = require(foundation.Components.BaseMenu)
local popoverModule = require(foundation.Components.Popover)
local _ = require(foundation.Components.Types)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local inputSizeModule = require(foundation.Enums.InputSize)
local inputVariantModule = require(foundation.Enums.InputVariant)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local radiusModule = require(foundation.Enums.Radius)
local dropdownControlModule = require(script.Parent.DropdownControl)
local markSelectedItemModule = require(script.Parent.markSelectedItem)
local t = {
	testId = "--foundation-dropdown",
	variant = inputVariantModule.Standard,
	width = UDim.new(0, 400),
	size = inputSizeModule.Medium
}
local t_1 = { offset = 5, position = popoverSideModule.Bottom }

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), markSelectedItemModule (ref), popoverModule (ref), dropdownControlModule (ref), withCommonPropsModule (ref), popoverAlignModule (ref), t_1 (ref), radiusModule (ref), baseMenuModule (ref)
	local var15 = withDefaultsModule(p0, t)
	local var16, var17 = reactModule.useState(false)
	local var18 = reactModule.useRef(nil)
	local var19, var20 = reactModule.useState(nil)
	local var21 = reactModule.useCallback(function(p2)
		-- upvalues: var18 (ref), var20 (ref)
		var18.current = p2
		var20(p2)
	end, {})
	reactModule.useImperativeHandle(p1, function()
		-- upvalues: var19 (ref)
		return var19
	end, { var19 })
	local var22, var23 = reactModule.useBinding(var15.width)
	local var24, var25 = markSelectedItemModule(var15.items, var15.value)
	local var26 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17(function(p3)
			return not p3
		end)
	end, {})
	local var27 = reactModule.useCallback(function()
		-- upvalues: var17 (ref)
		var17(false)
	end, {})
	local var28 = reactModule.useCallback(function(p4)
		-- upvalues: var17 (ref), var15 (ref)
		var17(false)
		var15.onItemChanged(p4)
	end, { var15.onItemChanged })
	var15.onAbsoluteSizeChanged = reactModule.useCallback(function(p5)
		-- upvalues: p0 (ref), var23 (ref)
		if p0.onAbsoluteSizeChanged then
			p0.onAbsoluteSizeChanged(p5)
		end
		var23(UDim.new(0, p5.AbsoluteSize.X))
	end, { var23, p0.onAbsoluteSizeChanged })
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var16 }, {
		DropdownControl = reactModule.createElement(dropdownControlModule, withCommonPropsModule(var15, {
			variant = var15.variant,
			onActivated = var26,
			hasError = var15.hasError,
			isDisabled = var15.isDisabled,
			item = var25,
			placeholder = var15.placeholder,
			isMenuOpen = var16,
			width = var15.width,
			size = var15.size,
			label = var15.label,
			hint = var15.hint,
			inputRef = var21,
			Selectable = var15.Selectable,
			NextSelectionUp = var15.NextSelectionUp,
			NextSelectionDown = var15.NextSelectionDown,
			NextSelectionLeft = var15.NextSelectionLeft,
			NextSelectionRight = var15.NextSelectionRight
		})),
		Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var18 }),
		Menu = reactModule.createElement(popoverModule.Content, {
			hasArrow = false,
			align = popoverAlignModule.End,
			side = t_1,
			onPressedOutside = var27,
			radius = radiusModule.Medium,
			selection = var15.selection,
			selectionGroup = var15.selectionGroup
		}, reactModule.createElement(baseMenuModule.Root, {
			couldGrow = true,
			size = var15.size,
			width = var22,
			items = var24,
			maxHeight = var15.maxHeight,
			onActivated = var28,
			radius = radiusModule.Medium,
			scrollingFrameRef = var15.scrollingFrameRef,
			testId = `{var15.testId}--menu`
		}))
	})
end))