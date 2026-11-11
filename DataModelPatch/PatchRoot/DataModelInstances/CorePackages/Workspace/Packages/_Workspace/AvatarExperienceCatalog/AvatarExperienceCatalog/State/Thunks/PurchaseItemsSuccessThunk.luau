local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local PurchaseItemsSuccessModule = require(AvatarExperienceCatalog.State.Actions.PurchaseItemsSuccess)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local UnifiedSelectionListStore = AvatarExperienceAnalyticsModule.Store.UnifiedSelectionListStore
local SendUnifiedEventsForMultiItemShoppingFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventsForMultiItemShopping
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local GetUnifiedEventsForMISFunction = AvatarExperienceAnalyticsModule.Utils.getUnifiedEventsForMIS
local CartIdService = AvatarExperienceAnalyticsModule.Lib.CartIdService
local AvatarScreenProperties = require(Parent.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMISSaveWearFix = AvatarExperienceFlagsModule.FFlagAXMISSaveWearFix
local FFlagAXBackgroundsCustomizeHydration = AvatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration
local ApplyProfileConfigurationFunction = require(Parent.AvatarExperienceRodux).Actions.ApplyProfileConfiguration
local AvatarBackground = require(Parent.AvatarExperienceCommon).Constants.ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground

local function maybeApplyPurchasedBackground(p1, EquippableAssets)
	-- upvalues: AvatarBackground (copy), ApplyProfileConfigurationFunction (copy)
	local Number: number? = nil
	
	for _, equippableAsset in EquippableAssets do
		if equippableAsset.assetTypeId == AvatarBackground then
			Number = tonumber(equippableAsset.assetId)
		end
	end
	if Number then
		p1:dispatch(ApplyProfileConfigurationFunction({ BackgroundAssetId = Number }))
	end
end

local FFlagSignalsNavP3gAvatarExperience = require(Parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStoreFunction = require(Parent.NavigationRodux).GetLegacyNavigationStore

return if AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents then function(Items, EquippableAssets, ReplaceAllEquippedAssets, BodyColor3s, BodyScales, BodyPartColorRangeIds, p2, Callback1, p3, p4, p5, Callback)
	-- upvalues: FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), AvatarScreenProperties (copy), SendUnifiedEventsForMultiItemShoppingFunction (copy), GetUnifiedEventsForMISFunction (copy), UnifiedEventLogEnums (copy), MutedErrorFunction (copy), CartIdService (copy), UnifiedSelectionListStore (copy), FFlagAXMISSaveWearFix (copy), PurchaseItemsSuccessModule (copy), FFlagAXBackgroundsCustomizeHydration (copy), maybeApplyPurchasedBackground (copy)
	return function(p6, _)
		-- upvalues: FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), AvatarScreenProperties (upval), p4 (copy), p5 (copy), SendUnifiedEventsForMultiItemShoppingFunction (upval), GetUnifiedEventsForMISFunction (upval), Items (copy), p2 (copy), UnifiedEventLogEnums (upval), MutedErrorFunction (upval), CartIdService (upval), UnifiedSelectionListStore (upval), FFlagAXMISSaveWearFix (upval), Callback (copy), BodyScales (ref), Callback1 (copy), PurchaseItemsSuccessModule (upval), EquippableAssets (copy), ReplaceAllEquippedAssets (copy), p3 (copy), BodyColor3s (copy), BodyPartColorRangeIds (copy), FFlagAXBackgroundsCustomizeHydration (upval), maybeApplyPurchasedBackground (upval)
		local State = p6:getState()
		local RouteName = nil
		
		if FFlagSignalsNavP3gAvatarExperience then
			local CurrentRoute = GetLegacyNavigationStoreFunction(false).getCurrentRoute(false)
			RouteName = CurrentRoute and CurrentRoute.routeName
		else
			RouteName = State.Navigation and (State.Navigation.currentRoute and State.Navigation.currentRoute.routeName)
		end
		local AvatarScreenProperty = AvatarScreenProperties[RouteName]
		local UnifiedLoggingSurface = if AvatarScreenProperty and AvatarScreenProperty.analyticsData then AvatarScreenProperty.analyticsData.unifiedLoggingSurface else nil
		
		if not pcall(function()
			-- upvalues: p4 (upval), State (copy), p5 (upval), SendUnifiedEventsForMultiItemShoppingFunction (upval), GetUnifiedEventsForMISFunction (upval), Items (upval), p2 (upval), UnifiedEventLogEnums (upval), UnifiedLoggingSurface (copy)
			if p4 then
				p4.isOrganicLook = State.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo == nil
			end
			if p5 then
				p5.isOrganicLook = State.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo == nil
			end
			SendUnifiedEventsForMultiItemShoppingFunction(GetUnifiedEventsForMISFunction(Items, p2, p4, p5, UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS), UnifiedLoggingSurface)
		end) then
			MutedErrorFunction("Failed to send unified events for multi-item shopping purchase success")
		end
		CartIdService.refreshCartId()
		UnifiedSelectionListStore.clearSelectionList()
		local CallbackResult = if FFlagAXMISSaveWearFix and Callback then Callback(State, p2) else nil
		local Orders = {}
		
		if FFlagAXMISSaveWearFix and CallbackResult then
			for _, MakeupDescription in CallbackResult:GetChildren() do
				if MakeupDescription:IsA("MakeupDescription") then
					Orders[tostring(MakeupDescription.assetId)] = MakeupDescription.order
				end
			end
		end
		if BodyScales == nil then
			local CallbackResult1 = Callback1(State, p2)
			BodyScales = if CallbackResult1 then CallbackResult1.scales else nil
		end
		p6:dispatch(PurchaseItemsSuccessModule({
			items = Items,
			equippableAssets = EquippableAssets,
			replaceAllEquippedAssets = ReplaceAllEquippedAssets,
			shouldClearEquippedMakeup = if FFlagAXMISSaveWearFix then p3 else nil,
			bodyColor3s = BodyColor3s,
			bodyScales = BodyScales,
			bodyPartColorRangeIds = BodyPartColorRangeIds,
			makeupAssetsOnHumanoid = if FFlagAXMISSaveWearFix then Orders else nil
		}))
		
		if FFlagAXBackgroundsCustomizeHydration then
			maybeApplyPurchasedBackground(p6, EquippableAssets)
		end
	end
end else function(Items, EquippableAssets, ReplaceAllEquippedAssets, BodyColor3s, BodyScales, BodyPartColorRangeIds, p6, Callback, ShouldClearEquippedMakeup)
	-- upvalues: PurchaseItemsSuccessModule (copy), FFlagAXBackgroundsCustomizeHydration (copy), maybeApplyPurchasedBackground (copy)
	return function(p7, _)
		-- upvalues: BodyScales (ref), Callback (copy), p6 (copy), PurchaseItemsSuccessModule (upval), Items (copy), EquippableAssets (copy), ReplaceAllEquippedAssets (copy), ShouldClearEquippedMakeup (copy), BodyColor3s (copy), BodyPartColorRangeIds (copy), FFlagAXBackgroundsCustomizeHydration (upval), maybeApplyPurchasedBackground (upval)
		local State = p7:getState()
		
		if BodyScales == nil then
			local CallbackResult = Callback(State, p6)
			BodyScales = if CallbackResult then CallbackResult.scales else nil
		end
		p7:dispatch(PurchaseItemsSuccessModule({
			items = Items,
			equippableAssets = EquippableAssets,
			replaceAllEquippedAssets = ReplaceAllEquippedAssets,
			shouldClearEquippedMakeup = ShouldClearEquippedMakeup,
			bodyColor3s = BodyColor3s,
			bodyScales = BodyScales,
			bodyPartColorRangeIds = BodyPartColorRangeIds
		}))
		
		if FFlagAXBackgroundsCustomizeHydration then
			maybeApplyPurchasedBackground(p7, EquippableAssets)
		end
	end
end