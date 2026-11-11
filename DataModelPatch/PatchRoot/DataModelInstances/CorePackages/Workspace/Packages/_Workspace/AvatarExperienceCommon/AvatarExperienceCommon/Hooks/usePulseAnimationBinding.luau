local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local OtterModule = require(Parent.Otter)
local UseAnimatedBindingFunction = require(Parent.ReactOtter).useAnimatedBinding
local config = { frequency = 10, dampingRatio = 1 }

return function(p1)
	-- upvalues: ReactModule (copy), OtterModule (copy), config (copy), UseAnimatedBindingFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = UseAnimatedBindingFunction({ thickness = 0, transparency = 0 }, (ReactModule.useCallback(function(p2)
		-- upvalues: UseRefResult (copy), p1 (copy), OtterModule (upval), config (upval)
		if UseRefResult.current and p1 then
			if p2.thickness == 10 then
				UseRefResult.current({
					thickness = OtterModule.instant(1),
					transparency = OtterModule.instant(0)
				})
				
				return
			end
			if p2.thickness == 1 then
				UseRefResult.current({
					thickness = OtterModule.ease(10, config),
					transparency = OtterModule.ease(1, config)
				})
			end
		end
	end, { p1 })))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseAnimatedBindingResult2 (copy), OtterModule (upval), config (upval)
		if p1 then
			if not UseRefResult.current then
				UseRefResult.current = UseAnimatedBindingResult2
			end
			UseAnimatedBindingResult2({
				thickness = OtterModule.ease(10, config),
				transparency = OtterModule.ease(1, config)
			})
		end
		return function()
			-- upvalues: UseAnimatedBindingResult2 (upval), OtterModule (upval)
			UseAnimatedBindingResult2({
				thickness = OtterModule.instant(0),
				transparency = OtterModule.instant(0)
			})
		end
	end, { p1 })
	
	return UseAnimatedBindingResult
end