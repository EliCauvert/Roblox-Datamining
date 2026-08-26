local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local menu = foundationModule.Menu
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide

return function(p1)
	-- upvalues: reactModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref), inputSize (ref), menu (ref), popoverAlign (ref), popoverSide (ref)
	local var1, var2 = reactModule.useState(false)
	local buttonRef = p1.buttonRef or reactModule.useRef(nil)
	
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
			ref = buttonRef,
			LayoutOrder = p1.LayoutOrder
		}),
		ActionMenu = if var1 then reactModule.createElement(menu, {
			isOpen = true,
			align = popoverAlign.Start,
			anchorRef = buttonRef,
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