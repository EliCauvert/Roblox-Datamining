local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local SelectTryOnBodyIds = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectTryOnBodyIds else require(Modules.AvatarExperience.Common.Selectors.selectTryOnBodyIds)
local SelectDefaultTryOnBodyColorsToggledModule = require(Modules.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled)
local DefaultTryOnBodyColorsToggledModule = require(Modules.AvatarExperience.Common.Actions.DefaultTryOnBodyColorsToggled)
local _ = require(script.Parent.ColorAdjustmentPage)

local function selectColorPickerAvailable(p1): boolean
	-- upvalues: SelectTryOnBodyIds (copy)
	local SelectTryOnBodyIdsResult = SelectTryOnBodyIds(p1)
	
	if #SelectTryOnBodyIdsResult == 0 then
		return true
	end
	for _, value in SelectTryOnBodyIdsResult do
		local BundleInfo = p1.AvatarExperience.Common.BundleInfos[value]
		
		if BundleInfo and BundleInfo.isRecolorable then
			return true
		end
	end
	return false
end

local function selectDefaultColorCheckboxAvailable(p2): boolean
	-- upvalues: SelectTryOnBodyIds (copy)
	for _, value in SelectTryOnBodyIds(p2) do
		local BundleInfo = p2.AvatarExperience.Common.BundleInfos[value]
		
		if BundleInfo and BundleInfo.isRecolorable then
			return true
		end
	end
	return false
end

return function()
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), UseSelectorFunction (copy), selectColorPickerAvailable (copy), SelectDefaultTryOnBodyColorsToggledModule (copy), selectDefaultColorCheckboxAvailable (copy), UseDispatchFunction (copy), DefaultTryOnBodyColorsToggledModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	local UseSelectorResult = UseSelectorFunction(selectColorPickerAvailable)
	local UseSelectorResult1 = UseSelectorFunction(SelectDefaultTryOnBodyColorsToggledModule)
	local UseSelectorResult2 = UseSelectorFunction(selectDefaultColorCheckboxAvailable)
	local UseDispatchResult = UseDispatchFunction()
	
	return {
		onBackButtonPressed = UseResult,
		colorPickerAvailable = UseSelectorResult,
		defaultColorCheckboxAvailable = UseSelectorResult2,
		defaultColorChecked = UseSelectorResult1,
		onDefaultColorCheckboxActivated = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), DefaultTryOnBodyColorsToggledModule (upval), UseSelectorResult1 (copy)
			UseDispatchResult(DefaultTryOnBodyColorsToggledModule(not UseSelectorResult1))
		end, { UseDispatchResult, UseSelectorResult1 })
	}
end