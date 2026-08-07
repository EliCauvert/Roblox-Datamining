local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local dependenciesModule = require(crossExperienceVoice.dependencies)
local react = dependenciesModule.React
local reactOtter = dependenciesModule.ReactOtter
local _ = require(crossExperienceVoice.Common.Types)

return function(p0) --[[ line: 11 ]]
	-- upvalues: react (ref), reactOtter (ref)
	local var2 = react.useRef(nil)
	local var3, var4 = reactOtter.useAnimatedBinding(p0, function() --[[ line: 13 ]]
		-- upvalues: var2 (ref)
		if var2.current then
			var2.current()
			var2.current = nil
		end
	end)
	
	return var3, react.useCallback(function(p1, p2) --[[ line: 20 ]]
		-- upvalues: var2 (ref), var4 (ref), reactOtter (copy)
		local function _(p3, p4) --[[ line: 21 | named "animateStep" ]]
			-- upvalues: var2 (copy), var4 (copy), reactOtter (copy)
			var2.current = p4
			var4(reactOtter.ease(p3.value, {
				duration = p3.durationInMs / 1000,
				easingStyle = p3.easingStyle
			}))
		end
		
		local function animateImpl(p5, p6, p7) --[[ line: 29 ]]
			-- upvalues: animateImpl (ref), var2 (copy), var4 (copy), reactOtter (copy)
			local var6 = p5[p6]
			
			if var6 ~= nil then
				function var2.current() --[[ line: 32 ]]
					-- upvalues: p7 (ref), p6 (ref), animateImpl (copy), p5 (ref)
					if p7 then
						p7(p6)
					end
					animateImpl(p5, p6 + 1, p7)
				end
				
				var4(reactOtter.ease(var6.value, {
					duration = var6.durationInMs / 1000,
					easingStyle = var6.easingStyle
				}))
			end
		end
		
		return animateImpl(p1, 1, p2)
	end, {})
end