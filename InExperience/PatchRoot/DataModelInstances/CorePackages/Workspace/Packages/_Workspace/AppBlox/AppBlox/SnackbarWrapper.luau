local Parent = script:FindFirstAncestor("AppBlox").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets
local ShouldUseDeviceSafeInsets = require(Parent.Display).shouldUseDeviceSafeInsets
local FFlagFixOverlayTopInsetForDeviceSafeInsets = require(Parent.SharedFlags).FFlagFixOverlayTopInsetForDeviceSafeInsets
local Snackbar = FoundationModule.Snackbar
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return ReactModule.memo(function(Frame) --[[ Line: 43 | Named "SnackbarWrapper" ]]
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), FFlagFixOverlayTopInsetForDeviceSafeInsets (copy), UseDeviceInsetsFunction (copy), ShouldUseDeviceSafeInsets (copy), UseScaledValueFunction (copy), Snackbar (copy)
	ReactModule.useEffect(function() --[[ Line: 45 ]]
		-- upvalues: Frame (copy)
		local DelayedThread = if Frame.autoDismissDelaySeconds then task.delay(Frame.autoDismissDelaySeconds, Frame.closeSnackbar) else nil
		
		return function() --[[ Line: 52 ]]
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
	end, { Frame.closeSnackbar, Frame.autoDismissDelaySeconds })
	local UseResult = ReactModule.useCallback(function(_, SwipeDirection) --[[ Line: 60 ]]
		-- upvalues: Frame (copy)
		if SwipeDirection == Enum.SwipeDirection.Up then
			Frame.closeSnackbar()
		end
	end, { Frame.closeSnackbar })
	local Config = if Frame.buttonText and Frame.onButtonActivated then {
		text = Frame.buttonText,
		onActivated = Frame.onButtonActivated
	} else nil
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 72 ]]
		return p1.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1) --[[ Line: 81 ]]
		return p1.TopBar.statusBarHeight
	end)
	local Top = 0
	
	if FFlagFixOverlayTopInsetForDeviceSafeInsets then
		local UseDeviceInsetsResult = UseDeviceInsetsFunction()
		Top = if ShouldUseDeviceSafeInsets then UseDeviceInsetsResult.top else 0
	end
	local UseScaledValueResult = UseScaledValueFunction(20)
	
	return ReactModule.createElement("Frame", {
		AnchorPoint = Frame.AnchorPoint or Vector2.new(0.5, 0),
		Position = Frame.Position or UDim2.new(0.5, 0, 0, UseScaledValueResult + UseSelectorResult.top + UseSelectorResult1 + Top),
		AutomaticSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		Selectable = false,
		Active = true,
		[ReactModule.Event.TouchSwipe] = UseResult
	}, {
		ReactModule.createElement(Snackbar, {
			title = Frame.titleText,
			icon = Frame.icon,
			action = Config,
			onClose = if Frame.hideCloseAffordance then nil else Frame.closeSnackbar
		})
	})
end)