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

return function(p0) --[[ line: 23 | named "ActionMenuButton" ]]
	-- upvalues: reactModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref), inputSize (ref), menu (ref), popoverAlign (ref), popoverSide (ref)
	local var2, var3 = reactModule.useState(false)
	local buttonRef = p0.buttonRef or reactModule.useRef(nil)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		TriggerButton = reactModule.createElement(button, {
			onActivated = reactModule.useCallback(function() --[[ line: 28 ]]
				-- upvalues: var3 (ref), var2 (ref), p0 (ref)
				var3(function(p1) --[[ line: 29 ]]
					return not p1
				end)
				
				if not var2 and p0.onMenuOpened then
					p0.onMenuOpened()
				end
			end, { var2, p0.onMenuOpened }),
			text = p0.text,
			variant = p0.variant or buttonVariant.Emphasis,
			width = UDim.new(1, 0),
			fillBehavior = fillBehavior.Fill,
			size = inputSize.Medium,
			ref = buttonRef,
			LayoutOrder = p0.LayoutOrder
		}),
		ActionMenu = if var2 then reactModule.createElement(menu, {
			isOpen = true,
			align = popoverAlign.Start,
			anchorRef = buttonRef,
			items = p0.menuItems,
			onActivated = reactModule.useCallback(function() --[[ line: 41 ]]
				-- upvalues: var3 (ref)
				var3(false)
			end, {}),
			onPressedOutside = reactModule.useCallback(function() --[[ line: 37 ]]
				-- upvalues: var3 (ref)
				var3(false)
			end, {}),
			side = popoverSide.Top,
			size = inputSize.Medium
		}) else nil
	})
end