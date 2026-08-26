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

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), fFlagAXCatalogCategoriesSDUI (ref), reactModule (ref), fFlagAXCategoryPillColorAnimation (ref), useCategoryPillColorAnimationModule (ref), foundationModule (ref), fFlagAXCategoryPillPositionAnimation (ref), fFlagAXDisableHiddenCatalogCategoryPills (ref)
	local var1 = useTokens()
	local var2 = useLocalization({
		title = if fFlagAXCatalogCategoriesSDUI and p1.localizedTitle then nil else p1.title
	})
	local pillIndex = p1.pillIndex
	local navButtonRefs = p1.navButtonRefs
	local categories = p1.categories
	local var3 = if p1.pillRef then p1.pillRef else reactModule.useRef(nil)
	local var4 = if fFlagAXCategoryPillColorAnimation then useCategoryPillColorAnimationModule(p1.isChecked) else nil
	reactModule.useEffect(function()
		-- upvalues: var3 (write), p1 (ref), pillIndex (ref)
		if var3.current then
			p1.categoryButtonRefs[p1.id] = var3
			p1.navButtonRefs[pillIndex] = var3
		end
	end, {})
	local var5 = if p1.isChecked and not p1.isSubcategory then var1.Color.ActionSubEmphasis else var1.Color.ActionStandard
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy radius-circle padding-small align-x-center align-y-center",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 0, var1.Size.Size_800),
		backgroundStyle = if fFlagAXCategoryPillColorAnimation and not p1.isSubcategory and var4 ~= nil then var4.animatedBackgroundStyle else var5.Background,
		onActivated = p1.onActivated,
		LayoutOrder = p1.layoutOrder or nil,
		ref = var3,
		NextSelectionLeft = if fFlagAXCategoryPillPositionAnimation then nil elseif pillIndex > 1 then navButtonRefs[pillIndex - 1] else nil,
		NextSelectionRight = if fFlagAXCategoryPillPositionAnimation then nil elseif pillIndex < #categories then navButtonRefs[pillIndex + 1] else nil,
		isDisabled = if fFlagAXDisableHiddenCatalogCategoryPills then not p1.isSelectable else nil,
		selection = if fFlagAXCategoryPillPositionAnimation then { Selectable = p1.isSelectable } else nil,
		stroke = if p1.isSubcategory and p1.isChecked then {
			Thickness = 1,
			Color = var1.Color.System.Contrast.Color3,
			Transparency = var1.Color.System.Contrast.Transparency
		} else nil
	}, {
		PillText = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-align-x-center text-align-y-center text-no-wrap padding-x-xsmall text-truncate-end",
			Text = if fFlagAXCatalogCategoriesSDUI and p1.localizedTitle then p1.localizedTitle else var2.title,
			textStyle = if fFlagAXCategoryPillColorAnimation and not p1.isSubcategory and var4 ~= nil then var4.animatedTextStyle else var5.Foreground,
			fontStyle = var1.Typography.CaptionLarge
		})
	})
end