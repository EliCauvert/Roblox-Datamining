local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UsePreferencesFunction = require(Parent.Foundation).Hooks.usePreferences
local config = { dampingRatio = 1, frequency = 3 }

return function(p1)
	-- upvalues: UsePreferencesFunction (copy), ReactModule (copy), ReactOtterModule (copy), config (copy)
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseRefResult = ReactModule.useRef(nil)
	
	local function finishHiding()
		-- upvalues: UseRefResult (copy)
		local CurrentFunction: () -> () = UseRefResult.current
		UseRefResult.current = nil
		
		if CurrentFunction ~= nil then
			CurrentFunction()
		end
	end
	
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, (ReactModule.useCallback(function(p2: number)
		-- upvalues: UseRefResult (copy)
		if p2 <= 0 then
			local CurrentFunction: () -> () = UseRefResult.current
			UseRefResult.current = nil
			
			if CurrentFunction ~= nil then
				CurrentFunction()
			end
		end
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), ReducedMotion (copy), config (upval)
		local CurrentFunction: () -> () = UseRefResult.current
		UseRefResult.current = nil
		
		if CurrentFunction ~= nil then
			CurrentFunction()
		end
		if p1 == nil then
			UseAnimatedBindingResult2(ReactOtterModule.instant(0))
			
			return
		end
		if ReducedMotion then
			UseAnimatedBindingResult2(ReactOtterModule.instant(1))
			
			return
		else
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, config))
		end
	end, { p1, ReducedMotion })
	ReactModule.useEffect(function()
		-- upvalues: finishHiding (copy)
		return finishHiding
	end, {})
	
	return {
		shown = UseAnimatedBindingResult,
		hide = ReactModule.useCallback(function(Callback: () -> ())
			-- upvalues: ReducedMotion (copy), UseRefResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), config (upval)
			if ReducedMotion then
				Callback()
				
				return
			else
				UseRefResult.current = Callback
				UseAnimatedBindingResult2(ReactOtterModule.spring(0, config))
			end
		end, { ReducedMotion, UseAnimatedBindingResult2 })
	}
end