local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BaseMenuModule = require(Foundation.Components.BaseMenu)
local PopoverModule = require(Foundation.Components.Popover)
local _ = require(Foundation.Components.Types)
local FlagsModule = require(Foundation.Utility.Flags)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local InputVariantModule = require(Foundation.Enums.InputVariant)
local PopoverAlignModule = require(Foundation.Enums.PopoverAlign)
local RadiusModule = require(Foundation.Enums.Radius)
local DropdownControlModule = require(script.Parent.DropdownControl)
local MarkSelectedItemModule = require(script.Parent.markSelectedItem)
local config = {
	testId = "--foundation-dropdown",
	variant = if FlagsModule.FoundationDropdownVariant then InputVariantModule.Standard else nil,
	width = UDim.new(0, 400),
	size = require(Foundation.Enums.InputSize).Medium
}
local Side = {
	offset = 5,
	position = require(Foundation.Enums.PopoverSide).Bottom
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), FlagsModule (copy), InputVariantModule (copy), ReactModule (copy), MarkSelectedItemModule (copy), PopoverModule (copy), DropdownControlModule (copy), WithCommonPropsModule (copy), PopoverAlignModule (copy), Side (copy), RadiusModule (copy), BaseMenuModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	if FlagsModule.FoundationDropdownVariant and WithDefaultsModuleResult.variant == nil then
		WithDefaultsModuleResult.variant = InputVariantModule.Standard
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		UseRefResult.current = Current
		UseStateResult2_1(Current)
	end, {})
	
	if FlagsModule.FoundationDropdownSelectionProps then
		ReactModule.useImperativeHandle(p2, function()
			-- upvalues: UseStateResult1 (copy)
			return UseStateResult1
		end, { UseStateResult1 })
	end
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(WithDefaultsModuleResult.width)
	local MarkSelectedItemModuleResult, MarkSelectedItemModuleResult2 = MarkSelectedItemModule(WithDefaultsModuleResult.items, WithDefaultsModuleResult.value)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p3): boolean
			return not p3
		end)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(false)
		WithDefaultsModuleResult.onItemChanged(p3)
	end, { WithDefaultsModuleResult.onItemChanged })
	WithDefaultsModuleResult.onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
		-- upvalues: p1 (copy), UseBindingResult2 (copy)
		if p1.onAbsoluteSizeChanged then
			p1.onAbsoluteSizeChanged(Frame)
		end
		UseBindingResult2(UDim.new(0, Frame.AbsoluteSize.X))
	end, { UseBindingResult2, p1.onAbsoluteSizeChanged })
	
	return ReactModule.createElement(PopoverModule.Root, {
		isOpen = UseStateResult,
		ref = if FlagsModule.FoundationDropdownSelectionProps then nil else p2
	}, {
		DropdownControl = ReactModule.createElement(DropdownControlModule, WithCommonPropsModule(WithDefaultsModuleResult, {
			variant = if FlagsModule.FoundationDropdownVariant then WithDefaultsModuleResult.variant else nil,
			onActivated = UseResult1,
			hasError = WithDefaultsModuleResult.hasError,
			isDisabled = WithDefaultsModuleResult.isDisabled,
			item = MarkSelectedItemModuleResult2,
			placeholder = WithDefaultsModuleResult.placeholder,
			isMenuOpen = UseStateResult,
			width = WithDefaultsModuleResult.width,
			size = WithDefaultsModuleResult.size,
			label = WithDefaultsModuleResult.label,
			hint = WithDefaultsModuleResult.hint,
			inputRef = if FlagsModule.FoundationDropdownSelectionProps then UseResult else UseRefResult,
			Selectable = if FlagsModule.FoundationDropdownSelectionProps then WithDefaultsModuleResult.Selectable else nil,
			NextSelectionUp = if FlagsModule.FoundationDropdownSelectionProps then WithDefaultsModuleResult.NextSelectionUp else nil,
			NextSelectionDown = if FlagsModule.FoundationDropdownSelectionProps then WithDefaultsModuleResult.NextSelectionDown else nil,
			NextSelectionLeft = if FlagsModule.FoundationDropdownSelectionProps then WithDefaultsModuleResult.NextSelectionLeft else nil,
			NextSelectionRight = if FlagsModule.FoundationDropdownSelectionProps then WithDefaultsModuleResult.NextSelectionRight else nil
		})),
		Anchor = ReactModule.createElement(PopoverModule.Anchor, { anchorRef = UseRefResult }),
		Menu = ReactModule.createElement(PopoverModule.Content, {
			hasArrow = false,
			align = PopoverAlignModule.End,
			side = Side,
			onPressedOutside = UseResult2,
			radius = RadiusModule.Medium,
			selection = WithDefaultsModuleResult.selection,
			selectionGroup = WithDefaultsModuleResult.selectionGroup
		}, ReactModule.createElement(BaseMenuModule.Root, {
			couldGrow = true,
			size = WithDefaultsModuleResult.size,
			width = UseBindingResult,
			items = MarkSelectedItemModuleResult,
			maxHeight = WithDefaultsModuleResult.maxHeight,
			onActivated = UseResult3,
			radius = RadiusModule.Medium,
			testId = `{WithDefaultsModuleResult.testId}--menu`
		}))
	})
end))