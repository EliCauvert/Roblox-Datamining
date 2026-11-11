local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local InventoryItemType = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Enums.InventoryItemType
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local _ = require(Modules.AvatarExperience.Common.Types)
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local SetAnimationPreviewModule = require(Modules.AvatarExperience.Common.Actions.SetAnimationPreview)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ClearTryOnsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local ClearAnimationPreviewModule = require(Modules.AvatarExperience.Common.Actions.ClearAnimationPreview)
local _ = require(script.Parent.TryOnItemCard)

return function(p1)
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), UseAvatarRouteFunction (copy), UseNavigationFunction (copy), FoundationModule (copy), InventoryItemType (copy), ItemDataModule (copy), UseSelectorFunction (copy), UtilsModule (copy), ClearTryOnsFunction (copy), ClearAnimationPreviewModule (copy), ToggleTryOnThunkModule (copy), SetAnimationPreviewModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactNetworkingModule)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AnalyticsModule)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local InventoryItemType1 = p1.inventoryItemType
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: InventoryItemType1 (copy), InventoryItemType (upval), ItemDataModule (upval), p1 (copy)
		return if InventoryItemType1 == InventoryItemType.Asset then ItemDataModule(p2.AvatarExperience.Common, p1.itemId, InventoryItemType1) else nil
	end, { InventoryItemType1, p1.itemId })))
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: InventoryItemType1 (copy), InventoryItemType (upval), p1 (copy)
		return if InventoryItemType1 == InventoryItemType.Outfit then p2.AvatarExperience.AvatarEditor.OutfitInfos[p1.itemId] else nil
	end, { InventoryItemType1, p1.itemId })))
	local AssetType = if UseSelectorResult then UseSelectorResult.assetType else nil
	local UseSelectorResult2 = UseSelectorFunction(function(p2): boolean
		-- upvalues: p1 (copy)
		local LastAnimOrEmoteToggledItem = p2.AvatarExperience.AvatarScene.OutfitTryOn.LastAnimOrEmoteToggledItem
		
		if LastAnimOrEmoteToggledItem and LastAnimOrEmoteToggledItem.itemId == p1.itemId then
			return true
		else
			local AnimationPreview = p2.AvatarExperience.AvatarScene.TryOn.AnimationPreview
			
			return AnimationPreview and AnimationPreview == p1.itemId or false
		end
	end)
	
	return {
		showDynamicHeadIcon = false,
		itemId = p1.itemId,
		inventoryItemType = InventoryItemType1,
		itemName = if UseSelectorResult then UseSelectorResult.name elseif UseSelectorResult1 then UseSelectorResult1.name else "",
		isSelected = UseSelectorResult2,
		thumbnailRef = UseRefResult,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), UseSelectorResult (copy), UseSelectorResult2 (copy), AssetType (copy), UtilsModule (upval), UseDispatchResult (copy), ClearTryOnsFunction (upval), ClearAnimationPreviewModule (upval), ToggleTryOnThunkModule (upval), UseRoactServiceModuleResult (copy), UseRoactServiceModuleResult1 (copy), UseAvatarRouteResult (copy), UseNavigationResult (copy), SetAnimationPreviewModule (upval)
			if not p1.itemId or not UseSelectorResult then return end
			local NoUseSelectorResult2 = not UseSelectorResult2
			local IsAnimationAssetType = AssetType and UtilsModule.isAnimationAssetType(AssetType)
			UseDispatchResult(ClearTryOnsFunction())
			UseDispatchResult(ClearAnimationPreviewModule())
			
			if NoUseSelectorResult2 then
				UseDispatchResult(ToggleTryOnThunkModule(UseRoactServiceModuleResult, UseRoactServiceModuleResult1, "Asset", UseSelectorResult.assetType, p1.itemId, NoUseSelectorResult2, UseAvatarRouteResult, UseNavigationResult, nil))
				
				if IsAnimationAssetType and NoUseSelectorResult2 then
					UseDispatchResult(SetAnimationPreviewModule(p1.itemId, UseSelectorResult.assetType))
				end
			end
			if p1.onTileClicked then
				p1.onTileClicked()
			end
		end, {
			UseDispatchResult, UseRoactServiceModuleResult, UseRoactServiceModuleResult1,
			UseNavigationResult, UseAvatarRouteResult, p1.itemId, UseSelectorResult2,
			UseSelectorResult, AssetType, p1.onTileClicked
		}),
		impressionsTag = p1.impressionsTag,
		assetType = AssetType,
		tokens = UseTokensResult,
		ref = p1.ref
	}
end