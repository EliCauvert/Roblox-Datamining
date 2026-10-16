local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local ReactModule = require(AvatarExperienceCommon.Parent.React)
local AnimationConstantsModule = require(AvatarExperienceCommon.AnimationConstants)

return function(p1) --[[ Line: 15 | Named "useSubcategoryPillAnimation" ]]
	-- upvalues: ReactModule (copy), AnimationConstantsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 22 ]]
		-- upvalues: UseRefResult (copy)
		return function() --[[ Line: 23 ]]
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
			end
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), AnimationConstantsModule (upval)
		local Subcategories = if p1 and p1.Subcategories then p1.Subcategories else {}
		
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		if next(Subcategories) then
			UseStateResult2(Subcategories)
			UseStateResult2_1(false)
		else
			UseStateResult2_1(true)
		end
		UseRefResult.current = task.delay(AnimationConstantsModule.FIntAXSubcategoryPillFadeAnimationDurationMs / 1000, function() --[[ Line: 54 ]]
			-- upvalues: Subcategories (copy), UseStateResult2 (upval), UseStateResult2_1 (upval), UseRefResult (upval)
			if not next(Subcategories) then
				UseStateResult2({})
			end
			UseStateResult2_1(false)
			UseRefResult.current = nil
		end)
	end, { p1 })
	
	return {
		subcategoriesState = UseStateResult,
		isFadingOut = UseStateResult1
	}
end