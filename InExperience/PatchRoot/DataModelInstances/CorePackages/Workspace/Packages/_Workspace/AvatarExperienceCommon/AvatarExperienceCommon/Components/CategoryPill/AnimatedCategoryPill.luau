local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ReactOtterModule = require(Parent.ReactOtter)
local AnimationConstantsModule = require(AvatarExperienceCommon.AnimationConstants)

local function useCategoryPillAnimation(TargetX, IsSelected, ShouldShowSubcategories) --[[ Line: 21 ]]
	-- upvalues: ReactOtterModule (copy), ReactModule (copy), AnimationConstantsModule (copy)
	local NoIsSelected: boolean = ShouldShowSubcategories and not IsSelected
	local v1: number = if NoIsSelected then 1 else 0
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(TargetX)
	local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(v1)
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), TargetX (copy), AnimationConstantsModule (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(TargetX, {
			frequency = AnimationConstantsModule.FIntAXCategoryPillPositionAnimationFrequency,
			dampingRatio = AnimationConstantsModule.FIntAXCategoryPillPositionAnimationDampingRatio
		}))
	end, { TargetX, UseAnimatedBindingResult2 })
	ReactModule.useEffect(function() --[[ Line: 38 ]]
		-- upvalues: v1 (copy), UseAnimatedBindingResult2_1 (copy), ReactOtterModule (upval), AnimationConstantsModule (upval)
		if v1 == 1 then
			UseAnimatedBindingResult2_1(ReactOtterModule.instant(v1))
			
			return
		else
			UseAnimatedBindingResult2_1((ReactOtterModule.spring(v1, {
				frequency = AnimationConstantsModule.FIntAXCategoryPillTransparencyAnimationFrequency,
				dampingRatio = AnimationConstantsModule.FIntAXCategoryPillTransparencyAnimationDampingRatio
			})))
		end
	end, { v1 })
	
	return UseAnimatedBindingResult, UseAnimatedBindingResult1, NoIsSelected
end

return function(p1) --[[ Line: 52 | Named "AnimatedCategoryPill" ]]
	-- upvalues: useCategoryPillAnimation (copy), ReactModule (copy), FoundationModule (copy)
	local CatInfo = p1.catInfo
	local PillIndex = p1.pillIndex
	local RenderCategoryPillFunction = p1.renderCategoryPill
	local OnRef = p1.onRef
	local UseCategoryPillAnimationResult, UseCategoryPillAnimationResult2, UseCategoryPillAnimationResult3 = useCategoryPillAnimation(p1.targetX, p1.isSelected, p1.shouldShowSubcategories)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy anchor-center-left padding-x-xxsmall",
		BackgroundTransparency = 1,
		Position = UseCategoryPillAnimationResult:map(function(XOffset): UDim2 --[[ Line: 68 ]]
			return UDim2.new(0, XOffset, 0.5, 0)
		end),
		GroupTransparency = UseCategoryPillAnimationResult2,
		Size = UDim2.new(0, 0, 1, 0),
		ref = OnRef
	}, {
		Pill = RenderCategoryPillFunction(CatInfo, PillIndex, not UseCategoryPillAnimationResult3)
	})
end