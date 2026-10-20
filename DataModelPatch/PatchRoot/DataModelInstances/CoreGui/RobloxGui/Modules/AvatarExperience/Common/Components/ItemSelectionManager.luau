local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local ClearAnimationPreviewModule = require(Modules.AvatarExperience.Common.Actions.ClearAnimationPreview)
local StoreAndClearTryOnsModule = require(Modules.AvatarExperience.Common.Thunks.StoreAndClearTryOns)
local ClearAllResultsListFocusedWidgetsModule = require(Modules.AvatarExperience.Catalog.Actions.ClearAllResultsListFocusedWidgets)
local AppPageModule = require(Modules.LuaApp.AppPage)
local SetOutfitTryOnsModule = require(Modules.AvatarExperience.Common.Actions.SetOutfitTryOns)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local DeepLinkUtilsModule = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local WithAppRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local _ = require(Modules.AvatarExperience.Common.Types)
local NavigatedToNonTryOnPageModule = require(Modules.AvatarExperience.Common.Actions.NavigatedToNonTryOnPage)
local NavigatedToTryOnPageModule = require(Modules.AvatarExperience.Common.Actions.NavigatedToTryOnPage)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXTryOnScreenFixes = AvatarExperienceFlagsModule.FFlagAXTryOnScreenFixes
local FFlagAXFixLookTryOnReturnRemoval = AvatarExperienceFlagsModule.FFlagAXFixLookTryOnReturnRemoval
local ItemSelectionManager = require(CorePackages.Packages.Roact).PureComponent:extend("ItemSelectionManager")
ItemSelectionManager.validateProps = TModule.strictInterface({
	avatarRoute = TModule.table,
	itemSubType = TModule.optional(TModule.string),
	selectedAnimationPreview = TModule.optional(TModule.string),
	lastToggledItem = TModule.optional(TModule.table),
	lastSavedTriedOnOutfit = TModule.optional(TModule.table),
	tryOnItems = TModule.optional(TModule.table),
	lookId = if FFlagAXFixLookTryOnReturnRemoval then TModule.optional(TModule.string) else nil,
	externalNavigationRequestParams = TModule.optional(TModule.table),
	storeAndClearTryOns = TModule.callback,
	setOutfitTryOns = TModule.callback,
	clearAnimationPreview = TModule.callback,
	toggleTryOn = TModule.callback,
	clearAllResultsListFocusedWidget = TModule.callback,
	onNavigatedToNonTryOnPage = TModule.callback,
	onNavigatedToTryOnPage = TModule.callback,
	networking = TModule.callback,
	appAnalytics = TModule.table,
	catalogAnalytics = TModule.table
})
ItemSelectionManager.defaultProps = { lastToggledItem = {} }

function ItemSelectionManager:render()
	return nil
end

local config = {
	[AvatarScreen.ItemDetails] = true,
	[AvatarScreen.TryOnItem] = not FFlagAXTryOnScreenFixes or nil
}
local config1 = {
	[AvatarScreen.LayeredClothingSort] = true,
	[AvatarScreen.AccessoryAdjustment] = true,
	[AvatarScreen.TryOnItem] = if FFlagAXTryOnScreenFixes then true else nil
}

local function _(p1)
	-- upvalues: config (copy)
	local Current = p1.avatarRoute.current
	
	if config[Current.name] then
		return Current.params.itemId, Current.params.itemType
	else
		return nil, nil
	end
end

local _ = function(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return if p1.isUnequipped then true elseif p1.itemType == ConstantsModule.ItemType.Asset then ConstantsModule.AssetTypeIdToCategory[p1.itemSubType] ~= ConstantsModule.AssetCategories.Animation else p1.itemSubType ~= ConstantsModule.BundleTypeIdStrings.Animations
end

local _ = function(p1): boolean
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), AvatarScreenProperties (copy)
	if FFlagAXMISEnableMultiShopping then
		return false
	else
		local AvatarRoute = p1.avatarRoute
		
		return AvatarScreenProperties[AvatarRoute.opaque.name] and not AvatarScreenProperties[AvatarRoute.opaque.name].isMultiTryOn
	end
end

function ItemSelectionManager.willUpdate(p1, p2)
	-- upvalues: config1 (copy), config (copy), FFlagAXMISEnableMultiShopping (copy), AvatarScreenProperties (copy), DeepLinkUtilsModule (copy), FFlagAXFixLookTryOnReturnRemoval (copy)
	if config1[p2.avatarRoute.current.name] then return end
	local Current = p2.avatarRoute.current
	local ItemId = nil
	local ItemType = nil
	
	if config[Current.name] then
		ItemId = Current.params.itemId
		ItemType = Current.params.itemType
	else
		ItemId = nil
		ItemType = nil
	end
	local ItemSubType = p2.itemSubType
	local NoIsMultiTryOn = nil
	
	if FFlagAXMISEnableMultiShopping then
		NoIsMultiTryOn = false
	else
		local AvatarRoute = p2.avatarRoute
		NoIsMultiTryOn = AvatarScreenProperties[AvatarRoute.opaque.name] and not AvatarScreenProperties[AvatarRoute.opaque.name].isMultiTryOn
	end
	local Props = p1.props
	local NoIsMultiTryOn1 = nil
	
	if FFlagAXMISEnableMultiShopping then
		NoIsMultiTryOn1 = false
	else
		local AvatarRoute = Props.avatarRoute
		NoIsMultiTryOn1 = AvatarScreenProperties[AvatarRoute.opaque.name] and not AvatarScreenProperties[AvatarRoute.opaque.name].isMultiTryOn
	end
	if NoIsMultiTryOn and not NoIsMultiTryOn1 then
		local LastToggledItem = p2.lastToggledItem
		
		if LastToggledItem.itemId == ItemId and LastToggledItem.itemType == ItemType and LastToggledItem.itemSubType == ItemSubType then
			if FFlagAXFixLookTryOnReturnRemoval and ItemId == nil and p2.lookId ~= nil then
				p1.props.onNavigatedToTryOnPage()
			end
		elseif ItemId ~= nil then
			p1.props.toggleTryOn(p1.props.networking, p1.props.catalogAnalytics, ItemType, ItemSubType, ItemId, true, p2.avatarRoute, nil)
			
			return
		else
			if p1.props.externalNavigationRequestParams == p2.externalNavigationRequestParams or not DeepLinkUtilsModule.wasItemFromDeepLinkEquipped(p2.externalNavigationRequestParams, p1.props.avatarRoute) then
				p1.props.onNavigatedToTryOnPage()
				
				return
			end
			return
		end
	end
end

function ItemSelectionManager.didUpdate(p1, p2)
	-- upvalues: ConstantsModule (copy), AvatarScreenProperties (copy), FFlagAXMISEnableMultiShopping (copy), CryoModule (copy), AvatarScreen (copy), AppPageModule (copy)
	if p1.props.selectedAnimationPreview and p1.props.lastToggledItem ~= p2.lastToggledItem then
		local LastToggledItem = p1.props.lastToggledItem
		
		if if LastToggledItem.isUnequipped then true elseif LastToggledItem.itemType == ConstantsModule.ItemType.Asset then ConstantsModule.AssetTypeIdToCategory[LastToggledItem.itemSubType] ~= ConstantsModule.AssetCategories.Animation else LastToggledItem.itemSubType ~= ConstantsModule.BundleTypeIdStrings.Animations then
			p1.props.clearAnimationPreview()
		end
	end
	local Name = p1.props.avatarRoute.opaque.name
	local IsTryOnOutfitResetPage = AvatarScreenProperties[Name] and AvatarScreenProperties[Name].isTryOnOutfitResetPage
	local Name1 = p2.avatarRoute.opaque.name
	local IsMultiTryOn = AvatarScreenProperties[Name1] and AvatarScreenProperties[Name1].isMultiTryOn
	local IsRefinementPage = AvatarScreenProperties[Name1] and AvatarScreenProperties[Name1].isRefinementPage
	
	if IsTryOnOutfitResetPage and Name ~= Name1 and not IsRefinementPage then
		if FFlagAXMISEnableMultiShopping or not IsMultiTryOn then
			p1.props.onNavigatedToNonTryOnPage()
		else
			p1.props.storeAndClearTryOns()
		end
	end
	local IsMultiTryOn1 = AvatarScreenProperties[Name] and AvatarScreenProperties[Name].isMultiTryOn
	
	if not FFlagAXMISEnableMultiShopping and IsMultiTryOn1 and not IsMultiTryOn and not AvatarScreenProperties[Name].isRefinementPage and p1.props.lastSavedTriedOnOutfit and not CryoModule.isEmpty(p1.props.lastSavedTriedOnOutfit) then
		p1.props.setOutfitTryOns(p1.props.lastSavedTriedOnOutfit)
	end
	local IsRefinementPage1 = AvatarScreenProperties[Name] and AvatarScreenProperties[Name].isRefinementPage
	
	if Name ~= Name1 and Name1 == AvatarScreen.Catalog and Name ~= AppPageModule.ExperienceDetail and not IsTryOnOutfitResetPage and not IsRefinementPage1 then
		p1.props.clearAllResultsListFocusedWidget()
	end
end

return (WithAppRouteModule((RoactServices.connect({
	catalogAnalytics = AnalyticsModule,
	appAnalytics = RoactAnalyticsModule,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: config (copy), ItemDataModule (copy), CatalogUtilsModule (copy), FFlagAXFixLookTryOnReturnRemoval (copy)
	local Current = p2.avatarRoute.current
	local ItemId = nil
	local ItemType = nil
	
	if config[Current.name] then
		ItemId = Current.params.itemId
		ItemType = Current.params.itemType
	else
		ItemId = nil
		ItemType = nil
	end
	return {
		itemSubType = CatalogUtilsModule.GetItemSubType(ItemType, (ItemDataModule(p1.AvatarExperience.Common, ItemId, ItemType))),
		lastToggledItem = p1.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem,
		lastSavedTriedOnOutfit = p1.AvatarExperience.AvatarScene.LastSavedTriedOnOutfit,
		tryOnItems = p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems,
		lookId = if FFlagAXFixLookTryOnReturnRemoval then p1.AvatarExperience.AvatarScene.OutfitTryOn.LookId else nil,
		selectedAnimationPreview = p1.AvatarExperience.AvatarScene.TryOn.AnimationPreview,
		externalNavigationRequestParams = p1.AvatarExperience.ExternalNavigationRequest.params or {}
	}
end, function(Callback)
	-- upvalues: StoreAndClearTryOnsModule (copy), SetOutfitTryOnsModule (copy), ClearAnimationPreviewModule (copy), ClearAllResultsListFocusedWidgetsModule (copy), NavigatedToNonTryOnPageModule (copy), NavigatedToTryOnPageModule (copy), ToggleTryOnThunkModule (copy)
	return {
		storeAndClearTryOns = function()
			-- upvalues: Callback (copy), StoreAndClearTryOnsModule (upval)
			Callback(StoreAndClearTryOnsModule())
		end,
		setOutfitTryOns = function(p1)
			-- upvalues: Callback (copy), SetOutfitTryOnsModule (upval)
			Callback(SetOutfitTryOnsModule(p1))
		end,
		clearAnimationPreview = function()
			-- upvalues: Callback (copy), ClearAnimationPreviewModule (upval)
			Callback(ClearAnimationPreviewModule())
		end,
		clearAllResultsListFocusedWidget = function()
			-- upvalues: Callback (copy), ClearAllResultsListFocusedWidgetsModule (upval)
			return Callback(ClearAllResultsListFocusedWidgetsModule())
		end,
		onNavigatedToNonTryOnPage = function()
			-- upvalues: Callback (copy), NavigatedToNonTryOnPageModule (upval)
			return Callback(NavigatedToNonTryOnPageModule())
		end,
		onNavigatedToTryOnPage = function()
			-- upvalues: Callback (copy), NavigatedToTryOnPageModule (upval)
			return Callback(NavigatedToTryOnPageModule())
		end,
		toggleTryOn = function(p1, p2, p3, p4, p5, p6, p7, p8)
			-- upvalues: Callback (copy), ToggleTryOnThunkModule (upval)
			Callback(ToggleTryOnThunkModule(p1, p2, p3, p4, p5, p6, p7, p8))
		end
	}
end)(ItemSelectionManager))))))