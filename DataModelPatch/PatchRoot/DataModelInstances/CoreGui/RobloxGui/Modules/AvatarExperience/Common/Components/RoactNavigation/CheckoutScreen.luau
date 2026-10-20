local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RemoveFromTryOnFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.RemoveFromTryOn
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local OpenItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local ApiFetchEconomyCurrencyModule = require(Modules.LuaApp.Thunks.ApiFetchEconomyCurrency)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local _ = require(Modules.AvatarExperience.Common.Types)
local CharacterManagerUtilsModule = require(Modules.AvatarExperience.Common.Util.CharacterManagerUtils)
local SendUnifiedEventForDeferredActionFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventForDeferredAction
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local GetUnifiedLoggingSurfaceFunction = AvatarExperienceAnalyticsModule.Utils.getUnifiedLoggingSurface
local FFlagAXFixClickItemDetailsSurfaceLogging = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXFixClickItemDetailsSurfaceLogging
local CheckoutPageContainer = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Components.Checkout.CheckoutPageContainer

local function selectRobuxFetchInfo(p1)
	return {
		localUserId = p1.LocalUserId,
		userRobux = p1.UserRobux[p1.LocalUserId]
	}
end

return require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function()
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworkingModule (copy), AnalyticsModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseSelectorFunction (copy), selectRobuxFetchInfo (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), RemoveFromTryOnFunction (copy), UnifiedEventLogEnums (copy), SendUnifiedEventForDeferredActionFunction (copy), FFlagAXFixClickItemDetailsSurfaceLogging (copy), GetUnifiedLoggingSurfaceFunction (copy), OpenItemDetailsModule (copy), ApiFetchEconomyCurrencyModule (copy), FetchAssetOrBundleInfoModule (copy), CheckoutPageContainer (copy), CharacterManagerUtilsModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AnalyticsModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseSelectorResult = UseSelectorFunction(selectRobuxFetchInfo, GetUseSelectorDeepEqualsFunction())
	
	return ReactModule.createElement(CheckoutPageContainer, {
		onRemoveItem = ReactModule.useCallback(function(p1, p2)
			-- upvalues: UseDispatchResult (copy), RemoveFromTryOnFunction (upval)
			UseDispatchResult(RemoveFromTryOnFunction(p1, p2))
		end, {
			UseDispatchResult,
			UseRoactServiceResult,
			UseRoactServiceResult1
		}),
		onOpenItemDetailsPage = ReactModule.useCallback(function(ItemId, ItemType, ItemSubType)
			-- upvalues: UnifiedEventLogEnums (upval), SendUnifiedEventForDeferredActionFunction (upval), FFlagAXFixClickItemDetailsSurfaceLogging (upval), GetUnifiedLoggingSurfaceFunction (upval), UseAvatarRouteResult (copy), UseDispatchResult (copy), OpenItemDetailsModule (upval), UseRoactServiceResult1 (copy), UseNavigationResult (copy)
			SendUnifiedEventForDeferredActionFunction({
				elementName = "CLICK_ITEM_DETAILS",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				itemId = ItemId,
				itemType = if ItemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET elseif ItemType == "Bundle" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE else nil,
				surface = if FFlagAXFixClickItemDetailsSurfaceLogging then GetUnifiedLoggingSurfaceFunction(UseAvatarRouteResult) else nil
			})
			UseDispatchResult(OpenItemDetailsModule({
				showFullWithNoPeekView = true,
				itemId = ItemId,
				itemType = ItemType,
				itemSubType = ItemSubType,
				catalogAnalytics = UseRoactServiceResult1,
				avatarRoute = UseAvatarRouteResult,
				navigation = UseNavigationResult
			}))
		end, { UseDispatchResult }),
		fetchUserRobux = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), ApiFetchEconomyCurrencyModule (upval), UseRoactServiceResult (copy), UseSelectorResult (copy)
			UseDispatchResult(ApiFetchEconomyCurrencyModule(UseRoactServiceResult, UseSelectorResult.localUserId, true))
		end, {
			UseDispatchResult,
			UseRoactServiceResult,
			UseSelectorResult
		}),
		fetchItemData = ReactModule.useCallback(function(p1, p2)
			-- upvalues: UseDispatchResult (copy), FetchAssetOrBundleInfoModule (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy)
			UseDispatchResult(FetchAssetOrBundleInfoModule(UseRoactServiceResult, UseRoactServiceResult1, p1, p2, true))
		end, {
			UseDispatchResult,
			UseRoactServiceResult,
			UseRoactServiceResult1
		}),
		getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn = CharacterManagerUtilsModule.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn,
		getBundleOutfitInfoFromProvidedTryOns = CharacterManagerUtilsModule.getBundleOutfitInfoFromProvidedTryOns
	})
end)