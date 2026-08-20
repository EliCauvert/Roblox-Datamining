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

local function maybeApplyPurchasedBackground(value, p0) --[[ line: 32 ]]
	-- upvalues: avatarBackground (ref), applyProfileConfiguration (ref)
	local var6 = nil
	
	for i, v in p0 do
		if v.assetTypeId == avatarBackground then
			var6 = tonumber(v.assetId)
		end
	end
	if var6 then
		value:dispatch(applyProfileConfiguration({ BackgroundAssetId = var6 }))
	end
end

local fFlagSignalsNavP3gAvatarExperience = require(parent.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local getLegacyNavigationStore = require(parent.NavigationRodux).GetLegacyNavigationStore

return if fFlagAXMISEnableMultiShoppingUnifiedEvents then function(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22) --[[ line: 48 ]]
	-- upvalues: fFlagSignalsNavP3gAvatarExperience (ref), getLegacyNavigationStore (ref), avatarScreenProperties (ref), sendUnifiedEventsForMultiItemShopping (ref), getUnifiedEventsForMIS (ref), unifiedEventLogEnums (ref), mutedError (ref), cartIdService (ref), unifiedSelectionListStore (ref), fFlagAXMISSaveWearFix (ref), purchaseItemsSuccessModule (ref), fFlagAXBackgroundsCustomizeHydration (ref), maybeApplyPurchasedBackground (ref)
	return function(p23, _) --[[ line: 62 ]]
		-- upvalues: fFlagSignalsNavP3gAvatarExperience (copy), getLegacyNavigationStore (copy), avatarScreenProperties (copy), p20 (ref), p21 (ref), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), p11 (ref), p17 (ref), unifiedEventLogEnums (copy), mutedError (copy), cartIdService (copy), unifiedSelectionListStore (copy), fFlagAXMISSaveWearFix (copy), p22 (ref), p15 (write), p18 (ref), purchaseItemsSuccessModule (copy), p12 (ref), p13 (ref), p19 (ref), p14 (ref), p16 (ref), fFlagAXBackgroundsCustomizeHydration (copy), maybeApplyPurchasedBackground (copy)
		local var11
		local state = p23:getState()
		local _ = nil
		
		if fFlagSignalsNavP3gAvatarExperience then
			local currentRoute = getLegacyNavigationStore(false).getCurrentRoute(false)
			var11 = currentRoute and currentRoute.routeName
		else
			var11 = state.Navigation and (state.Navigation.currentRoute and state.Navigation.currentRoute.routeName)
		end
		local var12 = avatarScreenProperties[var11]
		local var13 = if var12 and var12.analyticsData then var12.analyticsData.unifiedLoggingSurface else nil
		
		if not pcall(function() --[[ line: 79 ]]
			-- upvalues: p20 (copy), state (ref), p21 (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), p11 (copy), p17 (copy), unifiedEventLogEnums (copy), var13 (ref)
			if p20 then
				p20.isOrganicLook = state.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo == nil
			end
			if p21 then
				p21.isOrganicLook = state.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo == nil
			end
			sendUnifiedEventsForMultiItemShopping(getUnifiedEventsForMIS(p11, p17, p20, p21, unifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS), var13)
		end) then
			mutedError("Failed to send unified events for multi-item shopping purchase success")
		end
		cartIdService.refreshCartId()
		unifiedSelectionListStore.clearSelectionList()
		local var14 = if fFlagAXMISSaveWearFix and p22 then p22(state, p17) else nil
		local t = {}
		
		if fFlagAXMISSaveWearFix and var14 then
			for i, v in var14:GetChildren() do
				if v:IsA("MakeupDescription") then
					t[tostring(v.assetId)] = v.order
				end
			end
		end
		if p15 == nil then
			local var16 = p18(state, p17)
			p15 = if var16 then var16.scales else nil
		end
		p23:dispatch(purchaseItemsSuccessModule({
			items = p11,
			equippableAssets = p12,
			replaceAllEquippedAssets = p13,
			shouldClearEquippedMakeup = if fFlagAXMISSaveWearFix then p19 else nil,
			bodyColor3s = p14,
			bodyScales = p15,
			bodyPartColorRangeIds = p16,
			makeupAssetsOnHumanoid = if fFlagAXMISSaveWearFix then t else nil
		}))
		
		if fFlagAXBackgroundsCustomizeHydration then
			maybeApplyPurchasedBackground(p23, p12)
		end
	end
end else function(p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ line: 154 ]]
	-- upvalues: purchaseItemsSuccessModule (ref), fFlagAXBackgroundsCustomizeHydration (ref), maybeApplyPurchasedBackground (ref)
	return function(p10, _) --[[ line: 165 ]]
		-- upvalues: p5 (write), p8 (ref), p7 (ref), purchaseItemsSuccessModule (copy), p1 (ref), p2 (ref), p3 (ref), p9 (ref), p4 (ref), p6 (ref), fFlagAXBackgroundsCustomizeHydration (copy), maybeApplyPurchasedBackground (copy)
		local state = p10:getState()
		
		if p5 == nil then
			local var8 = p8(state, p7)
			p5 = if var8 then var8.scales else nil
		end
		p10:dispatch(purchaseItemsSuccessModule({
			items = p1,
			equippableAssets = p2,
			replaceAllEquippedAssets = p3,
			shouldClearEquippedMakeup = p9,
			bodyColor3s = p4,
			bodyScales = p5,
			bodyPartColorRangeIds = p6
		}))
		
		if fFlagAXBackgroundsCustomizeHydration then
			maybeApplyPurchasedBackground(p10, p2)
		end
	end
end