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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), markSelectedItemModule (ref), popoverModule (ref), dropdownControlModule (ref), withCommonPropsModule (ref), popoverAlignModule (ref), t_1 (ref), radiusModule (ref), baseMenuModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2, var3 = reactModule.useState(false)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(nil)
	local var7 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref), var6 (ref)
		var4.current = p3
		var6(p3)
	end, {})
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var5 (ref)
		return var5
	end, { var5 })
	local var8, var9 = reactModule.useBinding(var1.width)
	local var10, var11 = markSelectedItemModule(var1.items, var1.value)
	local var12 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(function(p3)
			return not p3
		end)
	end, {})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var3 (ref)
		var3(false)
	end, {})
	local var14 = reactModule.useCallback(function(p3)
		-- upvalues: var3 (ref), var1 (ref)
		var3(false)
		var1.onItemChanged(p3)
	end, { var1.onItemChanged })
	var1.onAbsoluteSizeChanged = reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), var9 (ref)
		if p1.onAbsoluteSizeChanged then
			p1.onAbsoluteSizeChanged(p3)
		end
		var9(UDim.new(0, p3.AbsoluteSize.X))
	end, { var9, p1.onAbsoluteSizeChanged })
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var2 }, {
		DropdownControl = reactModule.createElement(dropdownControlModule, withCommonPropsModule(var1, {
			variant = var1.variant,
			onActivated = var12,
			hasError = var1.hasError,
			isDisabled = var1.isDisabled,
			item = var11,
			placeholder = var1.placeholder,
			isMenuOpen = var2,
			width = var1.width,
			size = var1.size,
			label = var1.label,
			hint = var1.hint,
			inputRef = var7,
			Selectable = var1.Selectable,
			NextSelectionUp = var1.NextSelectionUp,
			NextSelectionDown = var1.NextSelectionDown,
			NextSelectionLeft = var1.NextSelectionLeft,
			NextSelectionRight = var1.NextSelectionRight
		})),
		Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var4 }),
		Menu = reactModule.createElement(popoverModule.Content, {
			hasArrow = false,
			align = popoverAlignModule.End,
			side = t_1,
			onPressedOutside = var13,
			radius = radiusModule.Medium,
			selection = var1.selection,
			selectionGroup = var1.selectionGroup
		}, reactModule.createElement(baseMenuModule.Root, {
			couldGrow = true,
			size = var1.size,
			width = var8,
			items = var10,
			maxHeight = var1.maxHeight,
			onActivated = var14,
			radius = radiusModule.Medium,
			scrollingFrameRef = var1.scrollingFrameRef,
			testId = `{var1.testId}--menu`
		}))
	})
end))