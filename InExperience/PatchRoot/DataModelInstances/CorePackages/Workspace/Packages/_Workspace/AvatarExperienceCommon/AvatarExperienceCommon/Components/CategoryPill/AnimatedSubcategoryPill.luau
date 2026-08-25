local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactOtterModule = require(parent.ReactOtter)
local animationConstantsModule = require(avatarExperienceCommon.AnimationConstants)
local fFlagAXDisableHiddenCatalogCategoryPills = require(parent.AvatarExperienceFlags).FFlagAXDisableHiddenCatalogCategoryPills

return function(p0)
	-- upvalues: reactOtterModule (ref), reactModule (ref), animationConstantsModule (ref), fFlagAXDisableHiddenCatalogCategoryPills (ref), foundationModule (ref)
	local subcategory = p0.subcategory
	local pillIndex = p0.pillIndex
	local renderCategoryPill = p0.renderCategoryPill
	local isFadingOut = p0.isFadingOut
	local var5, var6 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), reactOtterModule (copy), animationConstantsModule (copy)
		var6(reactOtterModule.spring(1, {
			frequency = animationConstantsModule.FIntAXSubcategoryPillFadeAnimationFrequency,
			dampingRatio = animationConstantsModule.FIntAXSubcategoryPillFadeAnimationDampingRatio
		}))
	end, {})
	reactModule.useEffect(function()
		-- upvalues: isFadingOut (ref), var6 (ref), reactOtterModule (copy)
		if isFadingOut then
			var6(reactOtterModule.instant(0))
		end
	end, { isFadingOut })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy anchor-center-left padding-x-xxsmall",
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		GroupTransparency = var5:map(function(p1)
			return 1 - p1
		end),
		LayoutOrder = pillIndex
	}, {
		Pill = renderCategoryPill(subcategory, pillIndex, if fFlagAXDisableHiddenCatalogCategoryPills then not isFadingOut else nil)
	})
end