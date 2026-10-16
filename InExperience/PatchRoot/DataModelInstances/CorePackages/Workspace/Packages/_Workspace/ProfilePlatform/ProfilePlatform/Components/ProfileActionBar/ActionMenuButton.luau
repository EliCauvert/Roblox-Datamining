local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useComposedRef = require(parent.ReactUtils).useComposedRef
local fFlagProfileGamepadPrimaryActionFocusModule = require(profilePlatform.Flags.FFlagProfileGamepadPrimaryActionFocus)
local button = foundationModule.Button
local menu = foundationModule.Menu
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: reactModule (ref), fFlagProfileGamepadPrimaryActionFocusModule (ref), useComposedRef (ref), button (ref), buttonVariant (ref), fillBehavior (ref), inputSize (ref), menu (ref), popoverAlign (ref), popoverSide (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(nil)
	local var4 = if fFlagProfileGamepadPrimaryActionFocusModule then var3 else p1.buttonRef or var3
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		TriggerButton = reactModule.createElement(button, {
			onActivated = reactModule.useCallback(function()
				-- upvalues: var2 (ref), var1 (ref), p1 (ref)
				var2(function(p2)
					return not p2
				end)
				
				if not var1 and p1.onMenuOpened then
					p1.onMenuOpened()
				end
			end, { var1, p1.onMenuOpened }),
			text = p1.text,
			variant = p1.variant or buttonVariant.Emphasis,
			width = UDim.new(1, 0),
			fillBehavior = fillBehavior.Fill,
			size = inputSize.Medium,
			ref = if fFlagProfileGamepadPrimaryActionFocusModule then useComposedRef(var4, p1.buttonRef) else var4,
			LayoutOrder = p1.LayoutOrder
		}),
		ActionMenu = if var1 then reactModule.createElement(menu, {
			isOpen = true,
			align = popoverAlign.Start,
			anchorRef = var4,
			items = p1.menuItems,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				var2(false)
			end, {}),
			onPressedOutside = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				var2(false)
			end, {}),
			side = popoverSide.Top,
			size = inputSize.Medium
		}) else nil
	})
end