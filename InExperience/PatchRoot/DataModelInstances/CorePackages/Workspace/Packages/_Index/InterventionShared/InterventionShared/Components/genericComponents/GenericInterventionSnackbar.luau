local parent = script:FindFirstAncestor("InterventionShared").Parent
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local luauPolyfillModule = require(parent.LuauPolyfill)
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local snackbar = require(parent.Foundation).Snackbar
local genericInterventionSnackbarAutoDismissDelaySeconds = game:DefineFastInt("GenericInterventionSnackbarAutoDismissDelaySeconds", 4)

return reactModule.memo(function(p0) --[[ line: 27 | named "GenericInterventionSnackbar" ]]
	-- upvalues: useEffect (ref), genericInterventionSnackbarAutoDismissDelaySeconds (ref), setTimeout (ref), clearTimeout (ref), reactModule (ref), snackbar (ref)
	useEffect(function() --[[ line: 28 ]]
		-- upvalues: p0 (ref), genericInterventionSnackbarAutoDismissDelaySeconds (copy), setTimeout (copy), clearTimeout (copy)
		local _ = nil
		local var3 = setTimeout(function() --[[ line: 32 ]]
			-- upvalues: p0 (copy)
			p0.onDismiss()
		end, (p0.autoDismissDelaySeconds or genericInterventionSnackbarAutoDismissDelaySeconds) * 1000)
		
		return function() --[[ line: 36 ]]
			-- upvalues: var3 (write), clearTimeout (copy)
			if var3 then
				clearTimeout(var3)
			end
		end
	end, { p0.onDismiss, p0.autoDismissDelaySeconds })
	
	return reactModule.createElement(snackbar, {
		title = p0.titleText,
		icon = p0.iconName,
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0)
	})
end)