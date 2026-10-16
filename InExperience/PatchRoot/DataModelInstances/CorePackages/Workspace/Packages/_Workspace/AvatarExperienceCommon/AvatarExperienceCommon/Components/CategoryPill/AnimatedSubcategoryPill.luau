local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ReactOtterModule = require(Parent.ReactOtter)
local AnimationConstantsModule = require(AvatarExperienceCommon.AnimationConstants)
local FFlagAXDisableHiddenCatalogCategoryPills = require(Parent.AvatarExperienceFlags).FFlagAXDisableHiddenCatalogCategoryPills

return function(p1) --[[ Line: 22 | Named "AnimatedSubcategoryPill" ]]
	-- upvalues: ReactOtterModule (copy), ReactModule (copy), AnimationConstantsModule (copy), FFlagAXDisableHiddenCatalogCategoryPills (copy), FoundationModule (copy)
	local Subcategory = p1.subcategory
	local PillIndex = p1.pillIndex
	local RenderCategoryPillFunction = p1.renderCategoryPill
	local IsFadingOut = p1.isFadingOut
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function() --[[ Line: 32 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), AnimationConstantsModule (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(1, {
			frequency = AnimationConstantsModule.FIntAXSubcategoryPillFadeAnimationFrequency,
			dampingRatio = AnimationConstantsModule.FIntAXSubcategoryPillFadeAnimationDampingRatio
		}))
	end, {})
	ReactModule.useEffect(function() --[[ Line: 41 ]]
		-- upvalues: IsFadingOut (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if IsFadingOut then
			UseAnimatedBindingResult2((ReactOtterModule.instant(0)))
		end
	end, { IsFadingOut })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy anchor-center-left padding-x-xxsmall",
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		GroupTransparency = UseAnimatedBindingResult:map(function(p2: number): number --[[ Line: 56 ]]
			return 1 - p2
		end),
		LayoutOrder = PillIndex
	}, {
		Pill = RenderCategoryPillFunction(Subcategory, PillIndex, if FFlagAXDisableHiddenCatalogCategoryPills then not IsFadingOut else nil)
	})
end