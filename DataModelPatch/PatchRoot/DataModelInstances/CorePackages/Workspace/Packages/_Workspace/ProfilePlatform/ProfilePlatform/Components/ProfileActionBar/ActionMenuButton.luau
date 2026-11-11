local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local Menu = FoundationModule.Menu
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide

return function(Frame)
	-- upvalues: ReactModule (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy), InputSize (copy), Menu (copy), PopoverAlign (copy), PopoverSide (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local ButtonRef = Frame.buttonRef or UseRefResult
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		TriggerButton = ReactModule.createElement(Button, {
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy), UseStateResult (copy), Frame (copy)
				UseStateResult2(function(p1): boolean
					return not p1
				end)
				
				if not UseStateResult and Frame.onMenuOpened then
					Frame.onMenuOpened()
				end
			end, { UseStateResult, Frame.onMenuOpened }),
			text = Frame.text,
			variant = Frame.variant or ButtonVariant.Emphasis,
			width = UDim.new(1, 0),
			fillBehavior = FillBehavior.Fill,
			size = InputSize.Medium,
			ref = ButtonRef,
			LayoutOrder = Frame.LayoutOrder
		}),
		ActionMenu = if UseStateResult then ReactModule.createElement(Menu, {
			isOpen = true,
			align = PopoverAlign.Start,
			anchorRef = ButtonRef,
			items = Frame.menuItems,
			onActivated = UseResult1,
			onPressedOutside = UseResult,
			side = PopoverSide.Top,
			size = InputSize.Medium
		}) else nil
	})
end