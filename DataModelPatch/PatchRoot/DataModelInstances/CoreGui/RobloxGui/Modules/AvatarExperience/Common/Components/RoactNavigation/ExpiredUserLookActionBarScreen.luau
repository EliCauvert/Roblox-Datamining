local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local Constants = AvatarExperienceCommonModule.Constants
local ItemTypeEnum = AvatarExperienceCommonModule.Enums.ItemTypeEnum
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local ToggleTryOnFunction = AvatarExperienceRoduxModule.Actions.ToggleTryOn
local RemoveFromTryOnFunction = AvatarExperienceRoduxModule.Actions.RemoveFromTryOn
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local ActionBarWithExpiredTimedOptionsModule = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionBarWithExpiredTimedOptions)

local function selectDeviceOrientation(p1)
	return p1.DeviceOrientation
end

local function selectTryOnItems(p1)
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end

return require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function()
	-- upvalues: UseNavigationFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), RoactNetworkingModule (copy), UseSelectorFunction (copy), selectDeviceOrientation (copy), selectTryOnItems (copy), DeviceOrientationMode (copy), ReactModule (copy), RemoveFromTryOnFunction (copy), ItemTypeEnum (copy), GetTryOnItemReducerKeyFunction (copy), ToggleTryOnFunction (copy), FetchAssetOrBundleInfoModule (copy), AvatarScreen (copy), FoundationModule (copy), Constants (copy), ActionBarWithExpiredTimedOptionsModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(RoactNetworkingModule)
	local UseSelectorResult = UseSelectorFunction(selectDeviceOrientation)
	local UseSelectorResult1 = UseSelectorFunction(selectTryOnItems)
	local IsUseSelectorResultMatch = UseSelectorResult == DeviceOrientationMode.Portrait
	local Params = UseNavigationResult.state.params or {}
	local ExpiredItemCount = Params.expiredItemCount or 0
	local ExpiredItems = Params.expiredItems
	local UseRefResult = ReactModule.useRef(ExpiredItems)
	UseRefResult.current = ExpiredItems
	local UseRefResult1 = ReactModule.useRef(UseDispatchResult)
	UseRefResult1.current = UseDispatchResult
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), RemoveFromTryOnFunction (upval), ItemTypeEnum (upval)
		return function()
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval), RemoveFromTryOnFunction (upval), ItemTypeEnum (upval)
			local Current = UseRefResult.current
			
			if not Current then return end
			for _, value in Current do
				UseRefResult1.current(RemoveFromTryOnFunction(value.itemId, ItemTypeEnum.Asset))
			end
		end
	end, {})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ExpiredItems (copy), GetTryOnItemReducerKeyFunction (upval), ItemTypeEnum (upval), UseSelectorResult1 (copy), UseDispatchResult (copy), ToggleTryOnFunction (upval), FetchAssetOrBundleInfoModule (upval), UseRoactServiceModuleResult1 (copy), UseRoactServiceModuleResult (copy), UseNavigationResult (copy), AvatarScreen (upval)
		if ExpiredItems then
			for _, expiredItem in ExpiredItems do
				local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(expiredItem.itemId, ItemTypeEnum.Asset)
				
				if not UseSelectorResult1 or not UseSelectorResult1[TryOnItemReducerKey] then
					UseDispatchResult(ToggleTryOnFunction(ItemTypeEnum.Asset, expiredItem.itemSubType, expiredItem.itemId, true, expiredItem.order))
					UseDispatchResult(FetchAssetOrBundleInfoModule(UseRoactServiceModuleResult1, UseRoactServiceModuleResult, expiredItem.itemId, ItemTypeEnum.Asset))
				end
			end
		end
		UseNavigationResult.navigate(AvatarScreen.ExpiredUserLookCheckout)
	end, {
		UseNavigationResult, UseDispatchResult, ExpiredItems, UseSelectorResult1,
		UseRoactServiceModuleResult, UseRoactServiceModuleResult1
	})
	
	return if ExpiredItemCount > 0 then ReactModule.createElement(FoundationModule.View, { tag = "size-full gui-object-defaults", ZIndex = 4 }, {
		ActionBarInner = ReactModule.createElement(FoundationModule.View, {
			tag = "gui-object-defaults",
			Size = if IsUseSelectorResultMatch then UDim2.fromScale(1, 1) else UDim2.fromScale(Constants.LANDSCAPE_SCENE_WIDTH_PERCENTAGE, 1),
			Position = if IsUseSelectorResultMatch then UDim2.fromScale(0, 0) else UDim2.fromScale(Constants.LANDSCAPE_UI_WIDTH_PERCENTAGE, 0)
		}, {
			ActionBar = ReactModule.createElement(ActionBarWithExpiredTimedOptionsModule, {
				expiredItemCount = ExpiredItemCount,
				onViewPressed = UseResult
			})
		})
	}) else nil
end)