local Parent = script:FindFirstAncestor("TenFootUiGlobalNav").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local FocusNavigationContext = require(Parent.ReactFocusNavigation).FocusNavigationContext
local UseDescendantHasFocusFunction = require(Parent.FocusNavigationUtils).useDescendantHasFocus
local config = { stiffness = 711.1, damping = 40, mass = 1 }

return function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationContext (copy), UseDescendantHasFocusFunction (copy), ReactOtterModule (copy), config (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1)
	local UseContextResult = ReactModule.useContext(FocusNavigationContext)
	local UseRefResult = ReactModule.useRef(nil)
	local UseDescendantHasFocusResult = UseDescendantHasFocusFunction(UseRefResult.current)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if UseStateResult then 0 else 1, function(p2)
		-- upvalues: UseStateResult2 (copy)
		if p2 == 1 then
			UseStateResult2(false)
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
		if p1 then
			UseStateResult2(true)
			UseAnimatedBindingResult2(ReactOtterModule.spring(0, config))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, config))
		end
	end, { p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), p1 (copy), UseDescendantHasFocusResult (copy)
		if UseContextResult and not p1 and UseDescendantHasFocusResult then
			UseContextResult:focusGuiObject(nil, true)
		end
	end, { p1, UseDescendantHasFocusResult })
	
	return {
		isVisible = UseStateResult,
		transparency = UseAnimatedBindingResult,
		ref = UseRefResult
	}
end