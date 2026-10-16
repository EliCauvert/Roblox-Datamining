local CrossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local DependenciesModule = require(CrossExperienceVoice.dependencies)
local React = DependenciesModule.React
local ReactOtter = DependenciesModule.ReactOtter
local _ = require(CrossExperienceVoice.Common.Types)

return function(p1) --[[ Line: 11 ]]
	-- upvalues: React (copy), ReactOtter (copy)
	local UseRefResult = React.useRef(nil)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtter.useAnimatedBinding(p1, function() --[[ Line: 13 ]]
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current()
			UseRefResult.current = nil
		end
	end)
	
	return UseAnimatedBindingResult, (React.useCallback(function(p2, p3) --[[ Line: 20 ]]
		-- upvalues: UseRefResult (copy), UseAnimatedBindingResult2 (copy), ReactOtter (upval)
		local function _(p4, Current) --[[ Line: 21 | Named "animateStep" ]]
			-- upvalues: UseRefResult (upval), UseAnimatedBindingResult2 (upval), ReactOtter (upval)
			UseRefResult.current = Current
			UseAnimatedBindingResult2(ReactOtter.ease(p4.value, {
				duration = p4.durationInMs / 1000,
				easingStyle = p4.easingStyle
			}))
		end
		
		local function animateImpl(p4, p5, Callback) --[[ Line: 29 ]]
			-- upvalues: animateImpl (copy), UseRefResult (upval), UseAnimatedBindingResult2 (upval), ReactOtter (upval)
			local v1 = p4[p5]
			
			if v1 ~= nil then
				function UseRefResult.current() --[[ Line: 32 ]]
					-- upvalues: Callback (copy), p5 (copy), animateImpl (upval), p4 (copy)
					if Callback then
						Callback(p5)
					end
					animateImpl(p4, p5 + 1, Callback)
				end
				
				UseAnimatedBindingResult2(ReactOtter.ease(v1.value, {
					duration = v1.durationInMs / 1000,
					easingStyle = v1.easingStyle
				}))
			end
		end
		
		return animateImpl(p2, 1, p3)
	end, {}))
end