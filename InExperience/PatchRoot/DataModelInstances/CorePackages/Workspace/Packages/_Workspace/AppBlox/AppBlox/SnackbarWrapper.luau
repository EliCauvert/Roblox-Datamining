local parent = script:FindFirstAncestor("AppBlox").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local snackbar = foundationModule.Snackbar
local useScaledValue = foundationModule.Hooks.useScaledValue
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector

return reactModule.memo(function(p0) --[[ line: 39 | named "SnackbarWrapper" ]]
	-- upvalues: reactModule (ref), useSelector (ref), useScaledValue (ref), snackbar (ref)
	reactModule.useEffect(function() --[[ line: 41 ]]
		-- upvalues: p0 (ref)
		local var3 = if p0.autoDismissDelaySeconds then task.delay(p0.autoDismissDelaySeconds, p0.closeSnackbar) else nil
		
		return function() --[[ line: 48 ]]
			-- upvalues: var3 (write)
			if var3 then
				task.cancel(var3)
				var3 = nil
			end
		end
	end, { p0.closeSnackbar, p0.autoDismissDelaySeconds })
	
	return reactModule.createElement("Frame", {
		AnchorPoint = p0.AnchorPoint or Vector2.new(0.5, 0),
		Position = p0.Position or UDim2.new(0.5, 0, 0, useScaledValue(20) + useSelector(function(p1) --[[ line: 68 ]]
			return p1.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
		end).top + useSelector(function(p2) --[[ line: 77 ]]
			return p2.TopBar.statusBarHeight
		end)),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		Selectable = false,
		Active = true,
		[reactModule.Event.TouchSwipe] = reactModule.useCallback(function(_, p3) --[[ line: 56 ]]
			-- upvalues: p0 (ref)
			if p3 == Enum.SwipeDirection.Up then
				p0.closeSnackbar()
			end
		end, { p0.closeSnackbar })
	}, {
		reactModule.createElement(snackbar, {
			title = p0.titleText,
			icon = p0.icon,
			action = if p0.buttonText and p0.onButtonActivated then { text = p0.buttonText, onActivated = p0.onButtonActivated } else nil,
			onClose = if p0.hideCloseAffordance then nil else p0.closeSnackbar
		})
	})
end)