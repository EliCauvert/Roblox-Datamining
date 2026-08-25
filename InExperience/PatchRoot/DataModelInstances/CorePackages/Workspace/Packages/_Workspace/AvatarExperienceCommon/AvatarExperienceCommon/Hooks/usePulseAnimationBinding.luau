local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local otterModule = require(parent.Otter)
local useAnimatedBinding = require(parent.ReactOtter).useAnimatedBinding
local _ = { easeIn = 1, easeOut = 10 }
local _ = { easeOut = 1, easeIn = 0 }
local t = { frequency = 10, dampingRatio = 1 }

return function(p0)
	-- upvalues: reactModule (ref), otterModule (ref), t (ref), useAnimatedBinding (ref)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = useAnimatedBinding({ thickness = 0, transparency = 0 }, reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref), p0 (ref), otterModule (copy), t (copy)
		if var3.current and p0 then
			if p1.thickness == 10 then
				var3.current({
					thickness = otterModule.instant(1),
					transparency = otterModule.instant(0)
				})
				
				return
			elseif p1.thickness == 1 then
				var3.current({
					thickness = otterModule.ease(10, t),
					transparency = otterModule.ease(1, t)
				})
			end
		end
	end, { p0 }))
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var3 (ref), var5 (ref), otterModule (copy), t (copy)
		if p0 then
			if not var3.current then
				var3.current = var5
			end
			var5({
				thickness = otterModule.ease(10, t),
				transparency = otterModule.ease(1, t)
			})
		end
		return function()
			-- upvalues: var5 (copy), otterModule (copy)
			var5({
				thickness = otterModule.instant(0),
				transparency = otterModule.instant(0)
			})
		end
	end, { p0 })
	
	return var4
end