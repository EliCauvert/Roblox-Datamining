local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXCategoryPillColorAnimation = AvatarExperienceFlagsModule.FFlagAXCategoryPillColorAnimation
local FFlagAXCategoryPillPositionAnimation = AvatarExperienceFlagsModule.FFlagAXCategoryPillPositionAnimation
local FFlagAXDisableHiddenCatalogCategoryPills = AvatarExperienceFlagsModule.FFlagAXDisableHiddenCatalogCategoryPills
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlagsModule.FFlagAXCatalogCategoriesSDUI
local UseCategoryPillColorAnimationModule = require(AvatarExperienceCommon.Hooks.useCategoryPillColorAnimation)

return function(p1) --[[ Line: 43 | Named "CategoryPill" ]]
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), FFlagAXCatalogCategoriesSDUI (copy), ReactModule (copy), FFlagAXCategoryPillColorAnimation (copy), UseCategoryPillColorAnimationModule (copy), FoundationModule (copy), FFlagAXCategoryPillPositionAnimation (copy), FFlagAXDisableHiddenCatalogCategoryPills (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		title = if FFlagAXCatalogCategoriesSDUI and p1.localizedTitle then nil else p1.title
	})
	local PillIndex: number = p1.pillIndex
	local NavButtonRefs = p1.navButtonRefs
	local Categories = p1.categories
	local PillRef = if p1.pillRef then p1.pillRef else ReactModule.useRef(nil)
	local UseCategoryPillColorAnimationModuleResult = if FFlagAXCategoryPillColorAnimation then UseCategoryPillColorAnimationModule(p1.isChecked) else nil
	ReactModule.useEffect(function() --[[ Line: 64 ]]
		-- upvalues: PillRef (ref), p1 (copy), PillIndex (copy)
		if PillRef.current then
			p1.categoryButtonRefs[p1.id] = PillRef
			p1.navButtonRefs[PillIndex] = PillRef
		end
	end, {})
	local ActionSubEmphasis = if p1.isChecked and not p1.isSubcategory then UseTokensResult.Color.ActionSubEmphasis else UseTokensResult.Color.ActionStandard
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy radius-circle padding-small align-x-center align-y-center",
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0, 0, 0, UseTokensResult.Size.Size_800),
		backgroundStyle = if FFlagAXCategoryPillColorAnimation and not p1.isSubcategory and UseCategoryPillColorAnimationModuleResult ~= nil then UseCategoryPillColorAnimationModuleResult.animatedBackgroundStyle else ActionSubEmphasis.Background,
		onActivated = p1.onActivated,
		LayoutOrder = p1.layoutOrder or nil,
		ref = PillRef,
		NextSelectionLeft = if FFlagAXCategoryPillPositionAnimation then nil else PillIndex > 1 and NavButtonRefs[PillIndex - 1] or nil,
		NextSelectionRight = if FFlagAXCategoryPillPositionAnimation then nil else PillIndex < #Categories and NavButtonRefs[PillIndex + 1] or nil,
		isDisabled = if FFlagAXDisableHiddenCatalogCategoryPills then not p1.isSelectable else nil,
		selection = if FFlagAXCategoryPillPositionAnimation then { Selectable = p1.isSelectable } else nil,
		stroke = if p1.isSubcategory and p1.isChecked then {
			Thickness = 1,
			Color = UseTokensResult.Color.System.Contrast.Color3,
			Transparency = UseTokensResult.Color.System.Contrast.Transparency
		} else nil
	}, {
		PillText = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-align-x-center text-align-y-center text-no-wrap padding-x-xsmall text-truncate-end",
			Text = if FFlagAXCatalogCategoriesSDUI and p1.localizedTitle then p1.localizedTitle else UseLocalizationResult.title,
			textStyle = if FFlagAXCategoryPillColorAnimation and not p1.isSubcategory and UseCategoryPillColorAnimationModuleResult ~= nil then UseCategoryPillColorAnimationModuleResult.animatedTextStyle else ActionSubEmphasis.Foreground,
			fontStyle = UseTokensResult.Typography.CaptionLarge
		})
	})
end