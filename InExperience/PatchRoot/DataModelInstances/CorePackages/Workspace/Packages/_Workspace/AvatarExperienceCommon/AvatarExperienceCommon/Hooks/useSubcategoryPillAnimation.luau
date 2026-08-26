local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local reactModule = require(avatarExperienceCommon.Parent.React)
local animationConstantsModule = require(avatarExperienceCommon.AnimationConstants)

return function(p1)
	-- upvalues: reactModule (ref), animationConstantsModule (ref)
	local var1, var2 = reactModule.useState({})
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref)
		return function()
			-- upvalues: var3 (copy)
			if var3.current then
				task.cancel(var3.current)
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var2 (ref), var5 (ref), animationConstantsModule (copy)
		local var6 = if p1 and p1.Subcategories then p1.Subcategories else {}
		
		if var3.current then
			task.cancel(var3.current)
		end
		if next(var6) then
			var2(var6)
			var5(false)
		else
			var5(true)
		end
		var3.current = task.delay(animationConstantsModule.FIntAXSubcategoryPillFadeAnimationDurationMs / 1000, function()
			-- upvalues: var6 (ref), var2 (copy), var5 (copy), var3 (copy)
			if not next(var6) then
				var2({})
			end
			var5(false)
			var3.current = nil
		end)
	end, { p1 })
	
	return { subcategoriesState = var1, isFadingOut = var4 }
end