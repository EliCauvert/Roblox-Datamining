local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local FoundationModule = require(CorePackages.Packages.Foundation)
local RadioGroup = FoundationModule.RadioGroup
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FormResponsiveDropdownModule = require(Modules.AvatarExperience.Common.Components.FormResponsiveDropdown)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection

return function()
	-- upvalues: UseSelectorFunction (copy), UtilsModule (copy), ReactModule (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseNavigationFunction (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), NavigationUtilsModule (copy), SetCategoryAndSubcategoryModule (copy), UseLocalizationFunction (copy), RadioGroup (copy), FormResponsiveDropdownModule (copy), FoundationModule (copy)
	local UseSelectorResult = UseSelectorFunction(UtilsModule.getAvatarEditorCategoryInfoFromState)
	local UseSelectorResult1 = UseSelectorFunction(UtilsModule.getAvatarEditorSubcategoryFilterFromState)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if UseSelectorResult1 then UseSelectorResult1.NavigationKey else nil)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseNavigationResult = UseNavigationFunction()
	local Params = UseNavigationResult.state.params
	local NoUseSelectorResult1: boolean = not UseSelectorResult1 or UseSelectorResult1.NavigationKey ~= UseStateResult
	local SubcategoryFilters = UseSelectorResult.SubcategoryFilters or {}
	local UseRefResult = ReactModule.useRef(nil)
	UseFocusNavigableSurfaceRegistryConnectionFunction(UseRefResult.current, FocusNavigableSurfaceIdentifierEnum.CentralOverlay)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
		NavigationUtilsModule.closeFocusedScreen(UseNavigationResult)
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: SubcategoryFilters (copy), UseStateResult (copy), UseDispatchResult (copy), SetCategoryAndSubcategoryModule (upval), UseSelectorResult (copy), UseRoactServiceModuleResult (copy), UseResult (copy)
		local v1 = nil
		
		for i, subcategoryFilter in SubcategoryFilters do
			if subcategoryFilter.NavigationKey == UseStateResult then
				v1 = i
				break
			end
		end
		UseDispatchResult(SetCategoryAndSubcategoryModule(UseSelectorResult.Category, UseSelectorResult.Subcategory, UseRoactServiceModuleResult, v1))
		UseResult()
	end, {
		SubcategoryFilters, UseSelectorResult, UseDispatchResult, UseStateResult,
		UseRoactServiceModuleResult, UseResult
	})
	local UseLocalizationResult = UseLocalizationFunction((ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), SubcategoryFilters (copy)
		local config = { header = UseSelectorResult.SubcategoryFiltersHeader }
		
		for _, subcategoryFilter in SubcategoryFilters do
			config[subcategoryFilter.NavigationKey] = subcategoryFilter.Title
		end
		return config
	end, { UseSelectorResult, SubcategoryFilters })))
	
	return ReactModule.createElement(FormResponsiveDropdownModule, {
		canApply = NoUseSelectorResult1,
		onApply = UseResult1,
		onClose = UseResult,
		dropdownPosition = Params.dropdownPosition,
		headerText = UseLocalizationResult.header,
		ref = UseRefResult
	}, {
		Container = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y" }, {
			RadioGroup = ReactModule.createElement(RadioGroup.Root, { onValueChanged = UseStateResult2, value = UseStateResult }, (ReactModule.useMemo(function()
				-- upvalues: SubcategoryFilters (copy), ReactModule (upval), RadioGroup (upval), UseLocalizationResult (copy)
				local Elements = {}
				
				for _, subcategoryFilter in SubcategoryFilters do
					table.insert(Elements, (ReactModule.createElement(RadioGroup.Item, {
						value = subcategoryFilter.NavigationKey,
						label = UseLocalizationResult[subcategoryFilter.NavigationKey]
					})))
				end
				return Elements
			end, { SubcategoryFilters, UseLocalizationResult })))
		})
	})
end