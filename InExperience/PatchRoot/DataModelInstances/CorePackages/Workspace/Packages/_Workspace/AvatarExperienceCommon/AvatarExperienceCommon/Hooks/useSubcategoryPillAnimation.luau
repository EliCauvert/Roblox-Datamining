local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local reactModule = require(avatarExperienceCommon.Parent.React)
local animationConstantsModule = require(avatarExperienceCommon.AnimationConstants)

return function(p0) --[[ line: 15 | named "useSubcategoryPillAnimation" ]]
	-- upvalues: reactModule (ref), animationConstantsModule (ref)
	local var3, var4 = reactModule.useState({})
	local var5 = reactModule.useRef(nil)
	local var6, var7 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 22 ]]
		-- upvalues: var5 (ref)
		return function() --[[ line: 23 ]]
			-- upvalues: var5 (copy)
			if var5.current then
				task.cancel(var5.current)
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 31 ]]
		-- upvalues: p0 (ref), var5 (ref), var4 (ref), var7 (ref), animationConstantsModule (copy)
		local var8 = if p0 and p0.Subcategories then p0.Subcategories else {}
		
		if var5.current then
			task.cancel(var5.current)
		end
		if next(var8) then
			var4(var8)
			var7(false)
		else
			var7(true)
		end
		var5.current = task.delay(animationConstantsModule.FIntAXSubcategoryPillFadeAnimationDurationMs / 1000, function() --[[ line: 54 ]]
			-- upvalues: var8 (ref), var4 (copy), var7 (copy), var5 (copy)
			if not next(var8) then
				var4({})
			end
			var7(false)
			var5.current = nil
		end)
	end, { p0 })
	
	return { subcategoriesState = var3, isFadingOut = var6 }
end