local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local _ = require(Modules.AvatarExperience.Common.Types)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local WidgetConstants = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local SetLookDetailsPeekViewSelectedTabFunction = AvatarExperienceRoduxModule.Actions.SetLookDetailsPeekViewSelectedTab
local SetTryOnManagerPeekViewStateFunction = AvatarExperienceRoduxModule.Actions.SetTryOnManagerPeekViewState
local TryOnLooksOutfitFunction = AvatarExperienceRoduxModule.Actions.TryOnLooksOutfit
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

local function processAssetItem(p1)
	-- upvalues: WidgetConstants (copy)
	assert(p1.id ~= nil and p1.assetType ~= nil, "Asset is missing required fields")
	
	return {
		isNotSelectable = true,
		itemId = p1.id,
		itemType = WidgetConstants.ContentType.Asset,
		itemSubType = tostring(p1.assetType),
		tryOnItemOrder = p1.tryOnItemOrder
	}
end

local function processAssetItemInBundle(p1)
	-- upvalues: WidgetConstants (copy)
	assert(p1.id ~= nil and p1.assetType ~= nil, "Asset is missing required fields")
	
	return {
		itemId = tostring(p1.id),
		itemType = WidgetConstants.ContentType.Asset,
		itemSubType = tostring(p1.assetType),
		tryOnItemOrder = p1.tryOnItemOrder
	}
end

local function processBundleItem(p1)
	-- upvalues: processAssetItemInBundle (copy), WidgetConstants (copy)
	assert(p1.id ~= nil and p1.bundleType ~= nil, "Bundle is missing required fields")
	local Count = 0
	local Items = {}
	
	for TryOnItemOrder, value in p1.assetsInBundle do
		if value.isIncluded then
			value.tryOnItemOrder = TryOnItemOrder
			Count += 1
			table.insert(Items, (processAssetItemInBundle(value)))
		end
	end
	return {
		isNotSelectable = true,
		itemId = p1.id,
		itemType = WidgetConstants.ContentType.Bundle,
		itemSubType = tostring(p1.bundleType),
		items = Items,
		numberOfAssetsIncluded = if Count > 0 then Count else nil,
		tryOnItemOrder = p1.tryOnItemOrder
	}
end

return function(p2)
	-- upvalues: ConstantsModule (copy), processAssetItem (copy), processBundleItem (copy), SetTryOnManagerPeekViewStateFunction (copy), PeekViewState (copy), TryOnLooksOutfitFunction (copy), UtilsModule (copy), NavigateWithLockFunction (copy), NavigationUtilsModule (copy), AvatarScreen (copy), SetLookDetailsPeekViewSelectedTabFunction (copy)
	return function(p3)
		-- upvalues: ConstantsModule (upval), processAssetItem (upval), processBundleItem (upval), SetTryOnManagerPeekViewStateFunction (upval), PeekViewState (upval), TryOnLooksOutfitFunction (upval), UtilsModule (upval), p2 (copy), NavigateWithLockFunction (upval), NavigationUtilsModule (upval), AvatarScreen (upval), SetLookDetailsPeekViewSelectedTabFunction (upval)
		local DraftLookId = ConstantsModule.DraftLookId
		local Look = p3:getState().AvatarExperience.AvatarScene.Looks[DraftLookId]
		
		if not Look then return end
		local LookBundleInfos = Look.lookBundleInfos
		local AssetItemIdTypeAndSubtype = {}
		
		for _, lookAssetInfo in Look.lookAssetInfos do
			table.insert(AssetItemIdTypeAndSubtype, (processAssetItem(lookAssetInfo)))
		end
		local BundleItemIdTypeAndSubtype = {}
		
		for _, lookBundleInfo in LookBundleInfos do
			table.insert(BundleItemIdTypeAndSubtype, (processBundleItem(lookBundleInfo)))
		end
		p3:dispatch(SetTryOnManagerPeekViewStateFunction(PeekViewState.Full))
		p3:dispatch(TryOnLooksOutfitFunction({
			assetItemIdTypeAndSubtype = AssetItemIdTypeAndSubtype,
			bundleItemIdTypeAndSubtype = BundleItemIdTypeAndSubtype,
			lookId = DraftLookId,
			lookType = Look.lookType,
			bodyColor3s = if Look.avatarProperties then UtilsModule.convertBodyColor3HexesToColor3s(Look.avatarProperties.bodyColor3s) else nil,
			scale = if Look.avatarProperties then Look.avatarProperties.scale else nil
		}))
		
		if p2 ~= nil then
			p3:dispatch(NavigateWithLockFunction(function()
				-- upvalues: NavigationUtilsModule (upval), p2 (upval), AvatarScreen (upval), p3 (copy), SetLookDetailsPeekViewSelectedTabFunction (upval)
				NavigationUtilsModule.closeFiltersAndItemDetails(p2)
				p2.navigate(AvatarScreen.LookDetails)
				p3:dispatch(SetLookDetailsPeekViewSelectedTabFunction(1))
			end))
		end
	end
end