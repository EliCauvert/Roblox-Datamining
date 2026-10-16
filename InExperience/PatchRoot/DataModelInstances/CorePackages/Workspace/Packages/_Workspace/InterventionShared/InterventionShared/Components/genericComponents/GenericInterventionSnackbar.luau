local Parent = script:FindFirstAncestor("InterventionShared").Parent
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local Snackbar = require(Parent.Foundation).Snackbar
local GenericInterventionSnackbarAutoDismissDelaySeconds = game:DefineFastInt("GenericInterventionSnackbarAutoDismissDelaySeconds", 4)

return ReactModule.memo(function(p1) --[[ Line: 27 | Named "GenericInterventionSnackbar" ]]
	-- upvalues: UseEffectFunction (copy), GenericInterventionSnackbarAutoDismissDelaySeconds (copy), SetTimeoutFunction (copy), ClearTimeoutFunction (copy), ReactModule (copy), Snackbar (copy)
	UseEffectFunction(function() --[[ Line: 28 ]]
		-- upvalues: p1 (copy), GenericInterventionSnackbarAutoDismissDelaySeconds (upval), SetTimeoutFunction (upval), ClearTimeoutFunction (upval)
		local SetTimeoutResult = nil
		SetTimeoutResult = SetTimeoutFunction(function() --[[ Line: 32 ]]
			-- upvalues: p1 (upval)
			p1.onDismiss()
		end, (p1.autoDismissDelaySeconds or GenericInterventionSnackbarAutoDismissDelaySeconds) * 1000)
		
		return function() --[[ Line: 36 ]]
			-- upvalues: SetTimeoutResult (ref), ClearTimeoutFunction (upval)
			if SetTimeoutResult then
				ClearTimeoutFunction(SetTimeoutResult)
			end
		end
	end, { p1.onDismiss, p1.autoDismissDelaySeconds })
	
	return (ReactModule.createElement(Snackbar, {
		title = p1.titleText,
		icon = p1.iconName,
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0)
	}))
end)