local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local animationConstantsModule = require(avatarExperienceCommon.AnimationConstants)

local function useCategoryPillAnimation(p1, p2, p3)
	-- upvalues: reactOtterModule (ref), reactModule (ref), animationConstantsModule (ref)
	local var1 = p3 and not p2
	local var2 = if var1 then 1 else 0
	local var3, var4 = reactOtterModule.useAnimatedBinding(p1)
	local var5, var6 = reactOtterModule.useAnimatedBinding(var2)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), reactOtterModule (copy), p1 (ref), animationConstantsModule (copy)
		var4(reactOtterModule.spring(p1, {
			frequency = animationConstantsModule.FIntAXCategoryPillPositionAnimationFrequency,
			dampingRatio = animationConstantsModule.FIntAXCategoryPillPositionAnimationDampingRatio
		}))
	end, { p1, var4 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var6 (ref), reactOtterModule (copy), animationConstantsModule (copy)
		if var2 == 1 then
			var6(reactOtterModule.instant(var2))
			
			return
		end
		var6(reactOtterModule.spring(var2, {
			frequency = animationConstantsModule.FIntAXCategoryPillTransparencyAnimationFrequency,
			dampingRatio = animationConstantsModule.FIntAXCategoryPillTransparencyAnimationDampingRatio
		}))
	end, { var2 })
	
	return var3, var5, var1
end

return function(p1)
	-- upvalues: useCategoryPillAnimation (ref), reactModule (ref), foundationModule (ref)
	local catInfo = p1.catInfo
	local pillIndex = p1.pillIndex
	local isSelected = p1.isSelected
	local shouldShowSubcategories = p1.shouldShowSubcategories
	local targetX = p1.targetX
	local renderCategoryPill = p1.renderCategoryPill
	local onRef = p1.onRef
	local var1, var2, var3 = useCategoryPillAnimation(targetX, isSelected, shouldShowSubcategories)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy anchor-center-left padding-x-xxsmall",
		BackgroundTransparency = 1,
		Position = var1:map(function(p2)
			return UDim2.new(0, p2, 0.5, 0)
		end),
		GroupTransparency = var2,
		Size = UDim2.new(0, 0, 1, 0),
		ref = onRef
	}, { Pill = renderCategoryPill(catInfo, pillIndex, not var3) })
end