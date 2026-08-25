local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXCategoryPillColorAnimation = avatarExperienceFlagsModule.FFlagAXCategoryPillColorAnimation
local fFlagAXCategoryPillPositionAnimation = avatarExperienceFlagsModule.FFlagAXCategoryPillPositionAnimation
local fFlagAXDisableHiddenCatalogCategoryPills = avatarExperienceFlagsModule.FFlagAXDisableHiddenCatalogCategoryPills
local fFlagAXCatalogCategoriesSDUI = avatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local useCategoryPillColorAnimationModule = require(avatarExperienceCommon.Hooks.useCategoryPillColorAnimation)

return function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), fFlagAXCatalogCategoriesSDUI (ref), reactModule (ref), fFlagAXCategoryPillColorAnimation (ref), useCategoryPillColorAnimationModule (ref), foundationModule (ref), fFlagAXCategoryPillPositionAnimation (ref), fFlagAXDisableHiddenCatalogCategoryPills (ref)
	local var5 = useTokens()
	local var6 = useLocalization({
		title = if fFlagAXCatalogCategoriesSDUI and p0.localizedTitle then nil else p0.title
	})
	local pillIndex = p0.pillIndex
	local navButtonRefs = p0.navButtonRefs
	local categories = p0.categories
	local var7 = if p0.pillRef then p0.pillRef else reactModule.useRef(nil)
	local var8 = if fFlagAXCategoryPillColorAnimation then useCategoryPillColorAnimationModule(p0.isChecked) else nil
	reactModule.useEffect(function()
		-- upvalues: var7 (write), p0 (ref), pillIndex (ref)
		if var7.current then
			p0.categoryButtonRefs[p0.id] = var7
			p0.navButtonRefs[pillIndex] = var7
		end
	end, {})
	local var9 = if p0.isChecked and not p0.isSubcategory then var5.Color.ActionSubEmphasis else var5.Color.ActionStandard
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle padding-small align-x-center align-y-center",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 0, var5.Size.Size_800),
		backgroundStyle = if fFlagAXCategoryPillColorAnimation and not p0.isSubcategory and var8 ~= nil then var8.animatedBackgroundStyle else var9.Background,
		onActivated = p0.onActivated,
		LayoutOrder = p0.layoutOrder or nil,
		ref = var7,
		NextSelectionLeft = if fFlagAXCategoryPillPositionAnimation then nil elseif pillIndex > 1 then navButtonRefs[pillIndex - 1] else nil,
		NextSelectionRight = if fFlagAXCategoryPillPositionAnimation then nil elseif pillIndex < #categories then navButtonRefs[pillIndex + 1] else nil,
		isDisabled = if fFlagAXDisableHiddenCatalogCategoryPills then not p0.isSelectable else nil,
		selection = if fFlagAXCategoryPillPositionAnimation then { Selectable = p0.isSelectable } else nil,
		stroke = if p0.isSubcategory and p0.isChecked then {
			Thickness = 1,
			Color = var5.Color.System.Contrast.Color3,
			Transparency = var5.Color.System.Contrast.Transparency
		} else nil
	}, {
		PillText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-align-x-center text-align-y-center text-no-wrap padding-x-xsmall text-truncate-end",
			Text = if fFlagAXCatalogCategoriesSDUI and p0.localizedTitle then p0.localizedTitle else var6.title,
			textStyle = if fFlagAXCategoryPillColorAnimation and not p0.isSubcategory and var8 ~= nil then var8.animatedTextStyle else var9.Foreground,
			fontStyle = var5.Typography.CaptionLarge
		})
	})
end