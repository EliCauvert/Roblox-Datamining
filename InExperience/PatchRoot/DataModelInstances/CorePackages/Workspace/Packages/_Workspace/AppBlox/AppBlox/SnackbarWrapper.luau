local parent = script:FindFirstAncestor("AppBlox").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local snackbar = foundationModule.Snackbar
local useScaledValue = foundationModule.Hooks.useScaledValue
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useSelector (ref), useScaledValue (ref), snackbar (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		local var1 = if p1.autoDismissDelaySeconds then task.delay(p1.autoDismissDelaySeconds, p1.closeSnackbar) else nil
		
		return function()
			-- upvalues: var1 (write)
			if var1 then
				task.cancel(var1)
				var1 = nil
			end
		end
	end, { p1.closeSnackbar, p1.autoDismissDelaySeconds })
	
	return reactModule.createElement("Frame", {
		AnchorPoint = p1.AnchorPoint or Vector2.new(0.5, 0),
		Position = p1.Position or UDim2.new(0.5, 0, 0, useScaledValue(20) + useSelector(function(p2)
			return p2.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
		end).top + useSelector(function(p2)
			return p2.TopBar.statusBarHeight
		end)),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		Selectable = false,
		Active = true,
		[reactModule.Event.TouchSwipe] = reactModule.useCallback(function(_, p2)
			-- upvalues: p1 (ref)
			if p2 == Enum.SwipeDirection.Up then
				p1.closeSnackbar()
			end
		end, { p1.closeSnackbar })
	}, {
		reactModule.createElement(snackbar, {
			title = p1.titleText,
			icon = p1.icon,
			action = if p1.buttonText and p1.onButtonActivated then { text = p1.buttonText, onActivated = p1.onButtonActivated } else nil,
			onClose = if p1.hideCloseAffordance then nil else p1.closeSnackbar
		})
	})
end)