local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local animationConstantsModule = require(avatarExperienceCommon.AnimationConstants)
local fFlagAXDisableHiddenCatalogCategoryPills = require(parent.AvatarExperienceFlags).FFlagAXDisableHiddenCatalogCategoryPills

return function(p1)
	-- upvalues: reactOtterModule (ref), reactModule (ref), animationConstantsModule (ref), fFlagAXDisableHiddenCatalogCategoryPills (ref), foundationModule (ref)
	local subcategory = p1.subcategory
	local pillIndex = p1.pillIndex
	local renderCategoryPill = p1.renderCategoryPill
	local isFadingOut = p1.isFadingOut
	local var1, var2 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), reactOtterModule (copy), animationConstantsModule (copy)
		var2(reactOtterModule.spring(1, {
			frequency = animationConstantsModule.FIntAXSubcategoryPillFadeAnimationFrequency,
			dampingRatio = animationConstantsModule.FIntAXSubcategoryPillFadeAnimationDampingRatio
		}))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: isFadingOut (ref), var2 (ref), reactOtterModule (copy)
		if isFadingOut then
			var2(reactOtterModule.instant(0))
		end
	end, { isFadingOut })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy anchor-center-left padding-x-xxsmall",
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		GroupTransparency = var1:map(function(p2)
			return 1 - p2
		end),
		LayoutOrder = pillIndex
	}, {
		Pill = renderCategoryPill(subcategory, pillIndex, if fFlagAXDisableHiddenCatalogCategoryPills then not isFadingOut else nil)
	})
end