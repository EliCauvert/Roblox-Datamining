local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local mutedError = require(parent.Loggers).mutedError
local purchaseItemsSuccessModule = require(avatarExperienceCatalog.State.Actions.PurchaseItemsSuccess)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local avatarExperienceNavigationModule = require(parent.AvatarExperienceNavigation)
local unifiedSelectionListStore = avatarExperienceAnalyticsModule.Store.UnifiedSelectionListStore
local sendUnifiedEventsForMultiItemShopping = avatarExperienceAnalyticsModule.sendUnifiedEventsForMultiItemShopping
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local getUnifiedEventsForMIS = avatarExperienceAnalyticsModule.Utils.getUnifiedEventsForMIS
local cartIdService = avatarExperienceAnalyticsModule.Lib.CartIdService
local avatarScreenProperties = avatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMISEnableMultiShoppingUnifiedEvents = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local fFlagAXMISSaveWearFix = avatarExperienceFlagsModule.FFlagAXMISSaveWearFix
local fFlagAXBackgroundsCustomizeHydration = avatarExperienceFlagsModule.FFlagAXBackgroundsCustomizeHydration
local applyProfileConfiguration = require(parent.AvatarExperienceRodux).Actions.ApplyProfileConfiguration
local avatarBackground = require(parent.AvatarExperienceCommon).Constants.ASSET_TYPE_NAME_TO_ID_STRING.AvatarBackground

local function maybeApplyPurchasedBackground(value, p1)
	-- upvalues: avatarBackground (ref), applyProfileConfiguration (ref)
	local var1 = nil
	
	for i, v in p1 do
		if v.assetTypeId == avatarBackground then
			var1 = tonumber(v.assetId)
		end
	end
	if var1 then
		value:dispatch(applyProfileConfiguration({ BackgroundAssetId = var1 }))
	end
end

local fFlagSignalsNavP3gAvatarExperience = require(parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local getLegacyNavigationStore = require(parent.NavigationRodux).GetLegacyNavigationStore

return if fFlagAXMISEnableMultiShoppingUnifiedEvents then function(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: fFlagSignalsNavP3gAvatarExperience (ref), getLegacyNavigationStore (ref), avatarScreenProperties (ref), sendUnifiedEventsForMultiItemShopping (ref), getUnifiedEventsForMIS (ref), unifiedEventLogEnums (ref), mutedError (ref), cartIdService (ref), unifiedSelectionListStore (ref), fFlagAXMISSaveWearFix (ref), purchaseItemsSuccessModule (ref), fFlagAXBackgroundsCustomizeHydration (ref), maybeApplyPurchasedBackground (ref)
	return function(p14, _)
		-- upvalues: fFlagSignalsNavP3gAvatarExperience (copy), getLegacyNavigationStore (copy), avatarScreenProperties (copy), p11 (ref), p12 (ref), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), p2 (ref), p8 (ref), unifiedEventLogEnums (copy), mutedError (copy), cartIdService (copy), unifiedSelectionListStore (copy), fFlagAXMISSaveWearFix (copy), p13 (ref), p6 (write), p9 (ref), purchaseItemsSuccessModule (copy), p3 (ref), p4 (ref), p10 (ref), p5 (ref), p7 (ref), fFlagAXBackgroundsCustomizeHydration (copy), maybeApplyPurchasedBackground (copy)
		local var2
		local state = p14:getState()
		local _ = nil
		
		if fFlagSignalsNavP3gAvatarExperience then
			local currentRoute = getLegacyNavigationStore(false).getCurrentRoute(false)
			var2 = currentRoute and currentRoute.routeName
		else
			var2 = state.Navigation and (state.Navigation.currentRoute and state.Navigation.currentRoute.routeName)
		end
		local var3 = avatarScreenProperties[var2]
		local var4 = if var3 and var3.analyticsData then var3.analyticsData.unifiedLoggingSurface else nil
		
		if not pcall(function()
			-- upvalues: p11 (copy), state (ref), p12 (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), p2 (copy), p8 (copy), unifiedEventLogEnums (copy), var4 (ref)
			if p11 then
				p11.isOrganicLook = state.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo == nil
			end
			if p12 then
				p12.isOrganicLook = state.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo == nil
			end
			sendUnifiedEventsForMultiItemShopping(getUnifiedEventsForMIS(p2, p8, p11, p12, unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS), var4)
		end) then
			mutedError("Failed to send unified events for multi-item shopping purchase success")
		end
		cartIdService.refreshCartId()
		unifiedSelectionListStore.clearSelectionList()
		local var5 = if fFlagAXMISSaveWearFix and p13 then p13(state, p8) else nil
		local t = {}
		
		if fFlagAXMISSaveWearFix and var5 then
			for i, v in var5:GetChildren() do
				if v:IsA("MakeupDescription") then
					t[tostring(v.assetId)] = v.order
				end
			end
		end
		if p6 == nil then
			local var6 = p9(state, p8)
			p6 = if var6 then var6.scales else nil
		end
		p14:dispatch(purchaseItemsSuccessModule({
			items = p2,
			equippableAssets = p3,
			replaceAllEquippedAssets = p4,
			shouldClearEquippedMakeup = if fFlagAXMISSaveWearFix then p10 else nil,
			bodyColor3s = p5,
			bodyScales = p6,
			bodyPartColorRangeIds = p7,
			makeupAssetsOnHumanoid = if fFlagAXMISSaveWearFix then t else nil
		}))
		
		if fFlagAXBackgroundsCustomizeHydration then
			maybeApplyPurchasedBackground(p14, p3)
		end
	end
end else function(p14, p15, p16, p17, p18, p19, p20, p21, p22)
	-- upvalues: purchaseItemsSuccessModule (ref), fFlagAXBackgroundsCustomizeHydration (ref), maybeApplyPurchasedBackground (ref)
	return function(p23, _)
		-- upvalues: p18 (write), p21 (ref), p20 (ref), purchaseItemsSuccessModule (copy), p14 (ref), p15 (ref), p16 (ref), p22 (ref), p17 (ref), p19 (ref), fFlagAXBackgroundsCustomizeHydration (copy), maybeApplyPurchasedBackground (copy)
		local state = p23:getState()
		
		if p18 == nil then
			local var2 = p21(state, p20)
			p18 = if var2 then var2.scales else nil
		end
		p23:dispatch(purchaseItemsSuccessModule({
			items = p14,
			equippableAssets = p15,
			replaceAllEquippedAssets = p16,
			shouldClearEquippedMakeup = p22,
			bodyColor3s = p17,
			bodyScales = p18,
			bodyPartColorRangeIds = p19
		}))
		
		if fFlagAXBackgroundsCustomizeHydration then
			maybeApplyPurchasedBackground(p23, p15)
		end
	end
end