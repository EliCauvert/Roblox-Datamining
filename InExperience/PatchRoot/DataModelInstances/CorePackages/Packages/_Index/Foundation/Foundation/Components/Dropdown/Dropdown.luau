local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local baseMenuModule = require(foundation.Components.BaseMenu)
local popoverModule = require(foundation.Components.Popover)
local _ = require(foundation.Components.Types)
local flagsModule = require(foundation.Utility.Flags)
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
	variant = if flagsModule.FoundationDropdownVariant then inputVariantModule.Standard else nil,
	width = UDim.new(0, 400),
	size = inputSizeModule.Medium
}
local t_1 = { offset = 5, position = popoverSideModule.Bottom }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 80 | named "Dropdown" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), flagsModule (ref), inputVariantModule (ref), reactModule (ref), markSelectedItemModule (ref), popoverModule (ref), dropdownControlModule (ref), withCommonPropsModule (ref), popoverAlignModule (ref), t_1 (ref), radiusModule (ref), baseMenuModule (ref)
	local var16 = withDefaultsModule(p0, t)
	
	if flagsModule.FoundationDropdownVariant and var16.variant == nil then
		var16.variant = inputVariantModule.Standard
	end
	local var17, var18 = reactModule.useState(false)
	local var19 = reactModule.useRef(nil)
	local var20, var21 = reactModule.useState(nil)
	local var22 = reactModule.useCallback(function(p2) --[[ line: 89 ]]
		-- upvalues: var19 (ref), var21 (ref)
		var19.current = p2
		var21(p2)
	end, {})
	
	if flagsModule.FoundationDropdownSelectionProps then
		reactModule.useImperativeHandle(p1, function() --[[ line: 95 ]]
			-- upvalues: var20 (ref)
			return var20
		end, { var20 })
	end
	local var23, var24 = reactModule.useBinding(var16.width)
	local var25, var26 = markSelectedItemModule(var16.items, var16.value)
	local var27 = reactModule.useCallback(function() --[[ line: 105 ]]
		-- upvalues: var18 (ref)
		var18(function(p3) --[[ line: 106 ]]
			return not p3
		end)
	end, {})
	local var28 = reactModule.useCallback(function() --[[ line: 111 ]]
		-- upvalues: var18 (ref)
		var18(false)
	end, {})
	local var29 = reactModule.useCallback(function(p4) --[[ line: 115 ]]
		-- upvalues: var18 (ref), var16 (ref)
		var18(false)
		var16.onItemChanged(p4)
	end, { var16.onItemChanged })
	var16.onAbsoluteSizeChanged = reactModule.useCallback(function(p5) --[[ line: 120 ]]
		-- upvalues: p0 (ref), var24 (ref)
		if p0.onAbsoluteSizeChanged then
			p0.onAbsoluteSizeChanged(p5)
		end
		var24(UDim.new(0, p5.AbsoluteSize.X))
	end, { var24, p0.onAbsoluteSizeChanged })
	
	return reactModule.createElement(popoverModule.Root, {
		isOpen = var17,
		ref = if flagsModule.FoundationDropdownSelectionProps then nil else p1
	}, {
		DropdownControl = reactModule.createElement(dropdownControlModule, withCommonPropsModule(var16, {
			variant = if flagsModule.FoundationDropdownVariant then var16.variant else nil,
			onActivated = var27,
			hasError = var16.hasError,
			isDisabled = var16.isDisabled,
			item = var26,
			placeholder = var16.placeholder,
			isMenuOpen = var17,
			width = var16.width,
			size = var16.size,
			label = var16.label,
			hint = var16.hint,
			inputRef = if flagsModule.FoundationDropdownSelectionProps then var22 else var19,
			Selectable = if flagsModule.FoundationDropdownSelectionProps then var16.Selectable else nil,
			NextSelectionUp = if flagsModule.FoundationDropdownSelectionProps then var16.NextSelectionUp else nil,
			NextSelectionDown = if flagsModule.FoundationDropdownSelectionProps then var16.NextSelectionDown else nil,
			NextSelectionLeft = if flagsModule.FoundationDropdownSelectionProps then var16.NextSelectionLeft else nil,
			NextSelectionRight = if flagsModule.FoundationDropdownSelectionProps then var16.NextSelectionRight else nil
		})),
		Anchor = reactModule.createElement(popoverModule.Anchor, { anchorRef = var19 }),
		Menu = reactModule.createElement(popoverModule.Content, {
			hasArrow = false,
			align = popoverAlignModule.End,
			side = t_1,
			onPressedOutside = var28,
			radius = radiusModule.Medium,
			selection = var16.selection,
			selectionGroup = var16.selectionGroup
		}, reactModule.createElement(baseMenuModule.Root, {
			couldGrow = true,
			size = var16.size,
			width = var23,
			items = var25,
			maxHeight = var16.maxHeight,
			onActivated = var29,
			radius = radiusModule.Medium,
			testId = `{var16.testId}--menu`
		}))
	})
end))