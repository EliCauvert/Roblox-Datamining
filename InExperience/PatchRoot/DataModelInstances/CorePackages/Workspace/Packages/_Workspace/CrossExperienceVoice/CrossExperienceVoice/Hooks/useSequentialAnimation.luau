local crossExperienceVoice = script:FindFirstAncestor("CrossExperienceVoice")
local dependenciesModule = require(crossExperienceVoice.dependencies)
local react = dependenciesModule.React
local reactOtter = dependenciesModule.ReactOtter
local _ = require(crossExperienceVoice.Common.Types)

return function(p1)
	-- upvalues: react (ref), reactOtter (ref)
	local var1 = react.useRef(nil)
	local var2, var3 = reactOtter.useAnimatedBinding(p1, function()
		-- upvalues: var1 (ref)
		if var1.current then
			var1.current()
			var1.current = nil
		end
	end)
	
	return var2, react.useCallback(function(p2, p3)
		-- upvalues: var1 (ref), var3 (ref), reactOtter (copy)
		local function _(p4, p5)
			-- upvalues: var1 (copy), var3 (copy), reactOtter (copy)
			var1.current = p5
			var3(reactOtter.ease(p4.value, {
				duration = p4.durationInMs / 1000,
				easingStyle = p4.easingStyle
			}))
		end
		
		local function animateImpl(p4, p5, p6)
			-- upvalues: animateImpl (ref), var1 (copy), var3 (copy), reactOtter (copy)
			local var4 = p4[p5]
			
			if var4 ~= nil then
				function var2.current()
					-- upvalues: p6 (ref), p5 (ref), animateImpl (copy), p4 (ref)
					if p6 then
						p6(p5)
					end
					animateImpl(p4, p5 + 1, p6)
				end
				
				var3(reactOtter.ease(var4.value, {
					duration = var4.durationInMs / 1000,
					easingStyle = var4.easingStyle
				}))
			end
		end
		
		return animateImpl(p2, 1, p3)
	end, {})
end