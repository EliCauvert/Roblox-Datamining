local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BaseMenuModule = require(Foundation.Components.BaseMenu)
local PopoverModule = require(Foundation.Components.Popover)
local _ = require(Foundation.Components.Types)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local PopoverAlignModule = require(Foundation.Enums.PopoverAlign)
local RadiusModule = require(Foundation.Enums.Radius)
local DropdownControlModule = require(script.Parent.DropdownControl)
local MarkSelectedItemModule = require(script.Parent.markSelectedItem)
local config = {
	testId = "--foundation-dropdown",
	variant = require(Foundation.Enums.InputVariant).Standard,
	width = UDim.new(0, 400),
	size = require(Foundation.Enums.InputSize).Medium
}
local Side = {
	offset = 5,
	position = require(Foundation.Enums.PopoverSide).Bottom
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2) --[[ Line: 82 | Named "Dropdown" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), MarkSelectedItemModule (copy), PopoverModule (copy), DropdownControlModule (copy), WithCommonPropsModule (copy), PopoverAlignModule (copy), Side (copy), RadiusModule (copy), BaseMenuModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 87 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		UseRefResult.current = Current
		UseStateResult2_1(Current)
	end, {})
	ReactModule.useImperativeHandle(p2, function() --[[ Line: 91 ]]
		-- upvalues: UseStateResult1 (copy)
		return UseStateResult1
	end, { UseStateResult1 })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(WithDefaultsModuleResult.width)
	local MarkSelectedItemModuleResult, MarkSelectedItemModuleResult2 = MarkSelectedItemModule(WithDefaultsModuleResult.items, WithDefaultsModuleResult.value)
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 100 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p3): boolean --[[ Line: 101 ]]
			return not p3
		end)
	end, {})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 106 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p3) --[[ Line: 110 ]]
		-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(false)
		WithDefaultsModuleResult.onItemChanged(p3)
	end, { WithDefaultsModuleResult.onItemChanged })
	WithDefaultsModuleResult.onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 115 ]]
		-- upvalues: p1 (copy), UseBindingResult2 (copy)
		if p1.onAbsoluteSizeChanged then
			p1.onAbsoluteSizeChanged(Frame)
		end
		UseBindingResult2(UDim.new(0, Frame.AbsoluteSize.X))
	end, { UseBindingResult2, p1.onAbsoluteSizeChanged })
	
	return ReactModule.createElement(PopoverModule.Root, { isOpen = UseStateResult }, {
		DropdownControl = ReactModule.createElement(DropdownControlModule, WithCommonPropsModule(WithDefaultsModuleResult, {
			variant = WithDefaultsModuleResult.variant,
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
			inputRef = UseResult,
			Selectable = WithDefaultsModuleResult.Selectable,
			NextSelectionUp = WithDefaultsModuleResult.NextSelectionUp,
			NextSelectionDown = WithDefaultsModuleResult.NextSelectionDown,
			NextSelectionLeft = WithDefaultsModuleResult.NextSelectionLeft,
			NextSelectionRight = WithDefaultsModuleResult.NextSelectionRight
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
			scrollingFrameRef = WithDefaultsModuleResult.scrollingFrameRef,
			testId = `{WithDefaultsModuleResult.testId}--menu`
		}))
	})
end))