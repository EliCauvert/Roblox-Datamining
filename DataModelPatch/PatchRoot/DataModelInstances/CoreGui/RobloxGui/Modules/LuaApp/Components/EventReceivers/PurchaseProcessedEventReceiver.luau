local CorePackages = game:GetService("CorePackages")
local MarketplaceService = game:GetService("MarketplaceService")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local RobloxAppEnumsModule = require(CorePackages.Workspace.Packages.RobloxAppEnums)
local SetCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Actions.SetCentralOverlay
local CloseCentralOverlayFunction = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AvatarEditorNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarEditorNavigation
local Characters = AvatarEditorNavigation.Categories.Characters
local Accessories = AvatarEditorNavigation.Categories.Accessories
local Purchased = AvatarEditorNavigation.Subcategories[Characters].Purchased
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = require(CorePackages.Workspace.Packages.UserLib).Utils.Constants
local PaymentsProtocolModule = require(CorePackages.Workspace.Packages.PaymentsProtocol)
local ProductType = PaymentsProtocolModule.Enum.ProductType
local UiMode = RobloxAppEnumsModule.UiMode
local config = {
	mid = PaymentsProtocolModule.PaymentsProtocolConstants.MESSAGE_ON_PURCHASE_PROCESSED_EVENT,
	validateParams = require(CorePackages.Packages.t).table
}
local config1 = {
	[8] = AvatarEditorNavigation.Categories.Accessories,
	[46] = AvatarEditorNavigation.Categories.Accessories
}
local config2 = {
	[8] = AvatarEditorNavigation.Subcategories[Accessories].Hats,
	[46] = AvatarEditorNavigation.Subcategories[Accessories].Back
}
local config3 = {
	[8] = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventoryWithPath",
	[46] = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventoryWithPath"
}
local config4 = {
	[8] = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.HeadAccessoriesInventoryPath",
	[46] = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.BackAccessoriesInventoryPath"
}
local FFlagShowConfirmationScreenForOOAP = require(CorePackages.Workspace.Packages.SharedFlags).FFlagShowConfirmationScreenForOOAP
local NewResult = require(CorePackages.Workspace.Packages.MessageBus).MessageBus.Subscriber.new()

local function _(TenFoot): string
	-- upvalues: FFlagShowConfirmationScreenForOOAP (copy), UiMode (copy)
	return if FFlagShowConfirmationScreenForOOAP then if TenFoot == UiMode.TenFoot then "<font color=\"rgb(255, 255, 255)\">" else "<font color=\"rgb(0, 0, 0)\">" else "<font color=\"rgb(255, 255, 255)\">"
end

local _ = function(p1)
	-- upvalues: config1 (copy), Characters (copy), config2 (copy), Purchased (copy), config3 (copy), config4 (copy)
	return {
		avatarEditorCategory = config1[p1] or Characters,
		avatarEditorSubCategory = config2[p1] or Purchased,
		bodyTextKey = config3[p1] or "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory",
		inventoryPathKey = config4[p1]
	}
end

return function()
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagShowConfirmationScreenForOOAP (copy), CloseCentralOverlayFunction (copy), AvatarScreen (copy), Characters (copy), Purchased (copy), MarketplaceService (copy), config1 (copy), config2 (copy), config3 (copy), config4 (copy), UseUiModeInfoFunction (copy), UseLocalizationFunction (copy), UiMode (copy), NewResult (copy), config (copy), ProductType (copy), Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({
		id = nil,
		name = nil,
		thumbnailType = nil,
		assetTypeId = nil
	})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({
		bodyTextKey = "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory",
		inventoryPathKey = nil
	})
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = nil
	local UseResult1 = nil
	local UseNavigationResult = UseNavigationFunction()
	
	if not FFlagShowConfirmationScreenForOOAP then
		UseResult = ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval), UseNavigationResult (copy), AvatarScreen (upval), Characters (upval), Purchased (upval), UseStateResult2 (copy)
			UseDispatchResult(CloseCentralOverlayFunction())
			UseNavigationResult.navigate(AvatarScreen.AvatarEditor, {
				avatarEditorCategory = Characters,
				avatarEditorSubcategory = Purchased
			})
			UseStateResult2({ id = nil, name = nil, thumbnailType = nil })
		end, { UseDispatchResult, UseNavigationResult })
	end
	UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval), UseStateResult2 (copy)
		UseDispatchResult(CloseCentralOverlayFunction())
		UseStateResult2({ id = nil, name = nil, thumbnailType = nil })
	end, { UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function(AssetId, InfoType, ThumbnailType)
		-- upvalues: MarketplaceService (upval), FFlagShowConfirmationScreenForOOAP (upval), config1 (upval), Characters (upval), config2 (upval), Purchased (upval), config3 (upval), config4 (upval), UseStateResult2_1 (copy), UseStateResult2 (copy)
		local config = {
			name = nil,
			assetTypeId = nil,
			id = AssetId,
			thumbnailType = ThumbnailType
		}
		
		if AssetId then
			local Success, Result = pcall(function()
				-- upvalues: MarketplaceService (upval), AssetId (copy), InfoType (copy)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then MarketplaceService:GetProductInfoAsync(AssetId, InfoType) else MarketplaceService:GetProductInfo(AssetId, InfoType)
			end)
			
			if Success then
				config.name = Result.Name
				
				if FFlagShowConfirmationScreenForOOAP then
					config.assetTypeId = Result.AssetTypeId
					local AssetTypeId = config.assetTypeId
					local config1 = {
						avatarEditorCategory = config1[AssetTypeId] or Characters,
						avatarEditorSubCategory = config2[AssetTypeId] or Purchased,
						bodyTextKey = config3[AssetTypeId] or "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory",
						inventoryPathKey = config4[AssetTypeId]
					}
					UseStateResult2_1({
						bodyTextKey = config1.bodyTextKey,
						inventoryPathKey = config1.inventoryPathKey
					})
				end
			end
		end
		UseStateResult2(config)
	end, {})
	local UiMode1 = UseUiModeInfoFunction().uiMode
	local UseLocalizationResult = nil
	UseLocalizationResult = if FFlagShowConfirmationScreenForOOAP then UseLocalizationFunction({
		titleText = "Feature.AvatarBundleReceivedInteractiveAlert.Title.ItemsAcquired",
		takeALookText = "Feature.AvatarBundleReceivedInteractiveAlert.Action.TakeALook",
		okButtonText = "Feature.AvatarBundleReceivedInteractiveAlert.Action.Ok",
		bodyText = {
			UseStateResult1.bodyTextKey,
			avatarName = if UseStateResult.name then UseStateResult.name else "",
			fontColorSpanStart = if FFlagShowConfirmationScreenForOOAP then if UiMode1 == UiMode.TenFoot then "<font color=\"rgb(255, 255, 255)\">" else "<font color=\"rgb(0, 0, 0)\">" else "<font color=\"rgb(255, 255, 255)\">",
			fontColorSpanEnd = "</font>",
			inventoryPath = UseLocalizationFunction({ inventoryPath = UseStateResult1.inventoryPathKey }).inventoryPath
		},
		errorBodyText = {
			"Feature.AvatarBundleReceivedInteractiveAlert.BodyText.UnknownAddedToInventory",
			fontColorSpanStart = if FFlagShowConfirmationScreenForOOAP then if UiMode1 == UiMode.TenFoot then "<font color=\"rgb(255, 255, 255)\">" else "<font color=\"rgb(0, 0, 0)\">" else "<font color=\"rgb(255, 255, 255)\">",
			fontColorSpanEnd = "</font>"
		}
	}) else UseLocalizationFunction({
		titleText = "Feature.AvatarBundleReceivedInteractiveAlert.Title.ItemsAcquired",
		takeALookText = "Feature.AvatarBundleReceivedInteractiveAlert.Action.TakeALook",
		okButtonText = "Feature.AvatarBundleReceivedInteractiveAlert.Action.Ok",
		bodyText = {
			"Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory",
			avatarName = if UseStateResult.name then UseStateResult.name else "",
			fontColorSpanStart = if FFlagShowConfirmationScreenForOOAP then if UiMode1 == UiMode.TenFoot then "<font color=\"rgb(255, 255, 255)\">" else "<font color=\"rgb(0, 0, 0)\">" else "<font color=\"rgb(255, 255, 255)\">",
			fontColorSpanEnd = "</font>"
		},
		errorBodyText = {
			"Feature.AvatarBundleReceivedInteractiveAlert.BodyText.UnknownAddedToInventory",
			fontColorSpanStart = if FFlagShowConfirmationScreenForOOAP then if UiMode1 == UiMode.TenFoot then "<font color=\"rgb(255, 255, 255)\">" else "<font color=\"rgb(0, 0, 0)\">" else "<font color=\"rgb(255, 255, 255)\">",
			fontColorSpanEnd = "</font>"
		}
	})
	ReactModule.useEffect(function()
		-- upvalues: NewResult (upval), config (upval), ProductType (upval), UseResult2 (copy), Constants (upval)
		NewResult:subscribe(config, function(p1)
			-- upvalues: ProductType (upval), UseResult2 (upval), Constants (upval)
			if not p1.nativeProduct then
				warn("PaymentProcessedEventReceiver: Response does not have nativeProduct key")
				
				return
			end
			if p1.nativeProduct.productType == ProductType.PlayStationPlusItem then
				if not p1.payload then
					warn("Response does not have payload key")
					
					return
				end
				local GrantedAssetIds = p1.payload.granted_asset_ids
				local GrantedAssetId = if GrantedAssetIds and #GrantedAssetIds > 0 then GrantedAssetIds[1] else nil
				local GrantedBundleIds = p1.payload.granted_bundle_ids
				local GrantedBundleId = if GrantedBundleIds and #GrantedBundleIds > 0 then GrantedBundleIds[1] else nil
				
				if GrantedAssetId then
					UseResult2(GrantedAssetId, Enum.InfoType.Asset, Constants.RbxthumbTypes.Asset)
				end
				if GrantedBundleId then
					UseResult2(GrantedBundleId, Enum.InfoType.Bundle, Constants.RbxthumbTypes.BundleThumbnail)
				end
			end
		end)
		
		return function()
			-- upvalues: NewResult (upval), config (upval)
			NewResult:unsubscribe(config)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), FFlagShowConfirmationScreenForOOAP (upval), config1 (upval), Characters (upval), config2 (upval), Purchased (upval), config3 (upval), config4 (upval), UseDispatchResult (copy), CloseCentralOverlayFunction (upval), UseNavigationResult (copy), AvatarScreen (upval), UseStateResult2 (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseLocalizationResult (ref), UseResult (ref), UseResult1 (ref)
		if not UseStateResult.id then return end
		local v1: (() -> ())? = nil
		
		if FFlagShowConfirmationScreenForOOAP then
			local AssetTypeId = UseStateResult.assetTypeId
			local config = {
				avatarEditorCategory = config1[AssetTypeId] or Characters,
				avatarEditorSubCategory = config2[AssetTypeId] or Purchased,
				bodyTextKey = config3[AssetTypeId] or "Feature.AvatarBundleReceivedInteractiveAlert.BodyText.AddedToInventory",
				inventoryPathKey = config4[AssetTypeId]
			}
			
			v1 = function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval), UseNavigationResult (upval), AvatarScreen (upval), config (copy), UseStateResult2 (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
				UseNavigationResult.navigate(AvatarScreen.AvatarEditor, {
					avatarEditorCategory = config.avatarEditorCategory,
					avatarEditorSubcategory = config.avatarEditorSubCategory
				})
				UseStateResult2({
					id = nil,
					name = nil,
					thumbnailType = nil,
					assetTypeId = nil
				})
			end
		end
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.ItemsReceivedAlert, {
			titleText = UseLocalizationResult.titleText,
			avatarThumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(UseStateResult.id, UseStateResult.thumbnailType, 420),
			avatarThumbnailDisplayHeight = if UseStateResult.name then 276 else 0,
			bodyText = if UseStateResult.name then UseLocalizationResult.bodyText else UseLocalizationResult.errorBodyText,
			primaryButtonText = UseLocalizationResult.takeALookText,
			onPrimaryButtonActivated = if FFlagShowConfirmationScreenForOOAP then v1 else UseResult,
			secondaryButtonText = UseLocalizationResult.okButtonText,
			onSecondaryButtonActivated = UseResult1
		}))
	end, {
		UseStateResult, UseLocalizationResult, UseDispatchResult,
		if FFlagShowConfirmationScreenForOOAP then nil else UseResult, UseResult1,
		if FFlagShowConfirmationScreenForOOAP then UseNavigationResult else nil
	})
end