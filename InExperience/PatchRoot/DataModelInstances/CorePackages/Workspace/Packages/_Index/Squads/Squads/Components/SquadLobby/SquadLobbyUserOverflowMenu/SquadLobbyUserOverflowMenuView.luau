local Parent = script:FindFirstAncestor("Squads").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BuilderIconsModule = require(Parent.BuilderIcons)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), InputSize (copy), PopoverSide (copy), PopoverAlign (copy), BuilderIconsModule (copy), ButtonVariant (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	
	return if #p1.items == 0 then nil else ReactModule.createElement(FoundationModule.Menu, {
		ZIndex = 5,
		isOpen = p1.isOpen,
		items = p1.items,
		size = InputSize.Medium,
		side = PopoverSide.Bottom,
		align = PopoverAlign.End,
		onPressedOutside = p1.onClose,
		ref = p1.menuRef,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -UseTokensResult.Padding.Small, 0, UseTokensResult.Padding.Small),
		testId = `{p1.testId}--menu`
	}, {
		Trigger = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			icon = BuilderIconsModule.Icon.ThreeDotsHorizontal,
			size = InputSize.Small,
			variant = ButtonVariant.Utility,
			onActivated = p1.onTriggerActivated,
			testId = `{p1.testId}--trigger`
		})
	})
end