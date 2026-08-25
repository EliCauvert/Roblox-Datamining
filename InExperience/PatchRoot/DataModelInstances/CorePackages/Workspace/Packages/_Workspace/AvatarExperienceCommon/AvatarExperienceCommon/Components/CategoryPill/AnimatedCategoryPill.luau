local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local animationConstantsModule = require(avatarExperienceCommon.AnimationConstants)

local function useCategoryPillAnimation(p0, p1, p2)
	-- upvalues: reactOtterModule (ref), reactModule (ref), animationConstantsModule (ref)
	local var6 = p2 and not p1
	local var7 = if var6 then 1 else 0
	local var8, var9 = reactOtterModule.useAnimatedBinding(p0)
	local var10, var11 = reactOtterModule.useAnimatedBinding(var7)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), reactOtterModule (copy), p0 (ref), animationConstantsModule (copy)
		var9(reactOtterModule.spring(p0, {
			frequency = animationConstantsModule.FIntAXCategoryPillPositionAnimationFrequency,
			dampingRatio = animationConstantsModule.FIntAXCategoryPillPositionAnimationDampingRatio
		}))
	end, { p0, var9 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var11 (ref), reactOtterModule (copy), animationConstantsModule (copy)
		if var7 == 1 then
			var11(reactOtterModule.instant(var7))
			
			return
		end
		var11(reactOtterModule.spring(var7, {
			frequency = animationConstantsModule.FIntAXCategoryPillTransparencyAnimationFrequency,
			dampingRatio = animationConstantsModule.FIntAXCategoryPillTransparencyAnimationDampingRatio
		}))
	end, { var7 })
	
	return var8, var10, var6
end

return function(p3)
	-- upvalues: useCategoryPillAnimation (ref), reactModule (ref), foundationModule (ref)
	local catInfo = p3.catInfo
	local pillIndex = p3.pillIndex
	local isSelected = p3.isSelected
	local shouldShowSubcategories = p3.shouldShowSubcategories
	local targetX = p3.targetX
	local renderCategoryPill = p3.renderCategoryPill
	local onRef = p3.onRef
	local var12, var13, var14 = useCategoryPillAnimation(targetX, isSelected, shouldShowSubcategories)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy anchor-center-left padding-x-xxsmall",
		BackgroundTransparency = 1,
		Position = var12:map(function(p4)
			return UDim2.new(0, p4, 0.5, 0)
		end),
		GroupTransparency = var13,
		Size = UDim2.new(0, 0, 1, 0),
		ref = onRef
	}, { Pill = renderCategoryPill(catInfo, pillIndex, not var14) })
end