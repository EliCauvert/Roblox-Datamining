local parent = script:FindFirstAncestor("InterventionShared").Parent
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local luauPolyfillModule = require(parent.LuauPolyfill)
local setTimeout = luauPolyfillModule.setTimeout
local clearTimeout = luauPolyfillModule.clearTimeout
local snackbar = require(parent.Foundation).Snackbar
local genericInterventionSnackbarAutoDismissDelaySeconds = game:DefineFastInt("GenericInterventionSnackbarAutoDismissDelaySeconds", 4)

return reactModule.memo(function(p1)
	-- upvalues: useEffect (ref), genericInterventionSnackbarAutoDismissDelaySeconds (ref), setTimeout (ref), clearTimeout (ref), reactModule (ref), snackbar (ref)
	useEffect(function()
		-- upvalues: p1 (ref), genericInterventionSnackbarAutoDismissDelaySeconds (copy), setTimeout (copy), clearTimeout (copy)
		local _ = nil
		local var1 = setTimeout(function()
			-- upvalues: p1 (copy)
			p1.onDismiss()
		end, (p1.autoDismissDelaySeconds or genericInterventionSnackbarAutoDismissDelaySeconds) * 1000)
		
		return function()
			-- upvalues: var1 (write), clearTimeout (copy)
			if var1 then
				clearTimeout(var1)
			end
		end
	end, { p1.onDismiss, p1.autoDismissDelaySeconds })
	
	return reactModule.createElement(snackbar, {
		title = p1.titleText,
		icon = p1.iconName,
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0)
	})
end)