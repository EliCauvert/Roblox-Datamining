local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local OtterModule = require(Parent.Otter)
local ReactModule = require(Parent.React)
local UseAnimatedBindingFunction = require(Parent.ReactOtter).useAnimatedBinding
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: UseTokensModule (copy), UsePreferencesModule (copy), ReactModule (copy), UseAnimatedBindingFunction (copy), OtterModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local ReducedMotion = UsePreferencesModule().reducedMotion
	local IsOpen = p1.isOpen
	local OnExitedFunction = p1.onExited
	local UseStateResult, UseStateResult2 = ReactModule.useState(IsOpen)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(IsOpen)
	local v1: number = if IsOpen then 1 else 0
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction(0, function(p2)
		-- upvalues: UseStateResult2_1 (copy), IsOpen (copy), UseStateResult (copy), UseStateResult2 (copy), OnExitedFunction (copy)
		UseStateResult2_1(false)
		
		if p2 == 0 and not IsOpen and UseStateResult then
			UseStateResult2(false)
			
			if OnExitedFunction then
				OnExitedFunction()
			end
		end
	end)
	ReactModule.useEffect(function()
		-- upvalues: IsOpen (copy), UseStateResult2 (copy), ReducedMotion (copy), UseAnimatedBindingResult2 (copy), OtterModule (upval), v1 (copy), UseStateResult2_1 (copy), UseAnimatedBindingResult (copy), UseTokensModuleResult (copy)
		if IsOpen then
			UseStateResult2(true)
		end
		if ReducedMotion then
			UseAnimatedBindingResult2((OtterModule.instant(v1)))
			
			return
		else
			UseStateResult2_1(UseAnimatedBindingResult:getValue() ~= v1)
			UseAnimatedBindingResult2(OtterModule.ease(v1, {
				easingStyle = if IsOpen then UseTokensModuleResult.Ease.StandardOut else UseTokensModuleResult.Ease.StandardIn,
				duration = if IsOpen then UseTokensModuleResult.Time.Time_300 else UseTokensModuleResult.Time.Time_200
			}))
		end
	end, {
		IsOpen, v1, ReducedMotion, UseTokensModuleResult, UseAnimatedBindingResult,
		UseAnimatedBindingResult2
	})
	
	return {
		isMounted = IsOpen or UseStateResult,
		isAnimating = UseStateResult1,
		progress = UseAnimatedBindingResult
	}
end