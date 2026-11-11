local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local FFlagAXBodyPartsPillLabel = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXBodyPartsPillLabel

local function selectSubcategoryFilterIndex(p1)
	return p1.AvatarExperience.AvatarEditor.Categories.subcategoryFilter
end

return function(Frame)
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), UseTokensFunction (copy), UseSelectorFunction (copy), selectSubcategoryFilterIndex (copy), UseLocalizationFunction (copy), AvatarScreen (copy), FoundationModule (copy), FFlagAXBodyPartsPillLabel (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(selectSubcategoryFilterIndex)
	local SubcategoryFilter = if Frame.categoryInfo.SubcategoryFilters then Frame.categoryInfo.SubcategoryFilters[UseSelectorResult] else nil
	
	return ReactModule.createElement(FoundationModule.Pill, {
		isChecked = false,
		icon = {
			name = "icons/actions/truncationExpand_small",
			position = FoundationModule.Enums.IconPosition.Right
		},
		text = UseLocalizationFunction({
			pillText = if SubcategoryFilter then SubcategoryFilter.Title else nil
		}).pillText,
		ref = UseRefResult,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy), UseTokensResult (copy), UseNavigationResult (copy), AvatarScreen (upval)
			local Current = UseRefResult.current
			UseNavigationResult.navigate(AvatarScreen.SubcategoryFiltersDropdown, {
				dropdownPosition = if Current then Vector2.new(Current.AbsolutePosition.X, Current.AbsolutePosition.Y + Current.AbsoluteSize.Y + UseTokensResult.Gap.Small) else nil
			})
		end, { UseNavigationResult, UseTokensResult }),
		LayoutOrder = if FFlagAXBodyPartsPillLabel then Frame.LayoutOrder else nil
	})
end