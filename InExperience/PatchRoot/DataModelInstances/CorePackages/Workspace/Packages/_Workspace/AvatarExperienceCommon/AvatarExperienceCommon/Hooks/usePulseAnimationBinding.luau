local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)
local useAnimatedBinding = require(parent.ReactOtter).useAnimatedBinding
local _ = { easeIn = 1, easeOut = 10 }
local _ = { easeOut = 1, easeIn = 0 }
local t = { frequency = 10, dampingRatio = 1 }

return function(p1)
	-- upvalues: reactModule (ref), otterModule (ref), t (ref), useAnimatedBinding (ref)
	local var1 = reactModule.useRef(nil)
	local var2, var3 = useAnimatedBinding({ thickness = 0, transparency = 0 }, reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), p1 (ref), otterModule (copy), t (copy)
		if var1.current and p1 then
			if p2.thickness == 10 then
				var1.current({
					thickness = otterModule.instant(1),
					transparency = otterModule.instant(0)
				})
				
				return
			elseif p2.thickness == 1 then
				var1.current({
					thickness = otterModule.ease(10, t),
					transparency = otterModule.ease(1, t)
				})
			end
		end
	end, { p1 }))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), var3 (ref), otterModule (copy), t (copy)
		if p1 then
			if not var1.current then
				var1.current = var3
			end
			var3({
				thickness = otterModule.ease(10, t),
				transparency = otterModule.ease(1, t)
			})
		end
		return function()
			-- upvalues: var3 (copy), otterModule (copy)
			var3({
				thickness = otterModule.instant(0),
				transparency = otterModule.instant(0)
			})
		end
	end, { p1 })
	
	return var2
end