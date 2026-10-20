local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ConstantsModule = require(Parent.Constants)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local FavoritesButtonModule = require(Parent.Components.FavoritesButton)
local TryOnButtonModule = require(Parent.Components.TryOnButton)
local BuyButtonModule = require(Parent.Components.BuyButton)
local InspectAndBuyControllerBarModule = require(Parent.Components.InspectAndBuyControllerBar)
local GetIsFavoriteModule = require(Parent.Selectors.GetIsFavorite)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local TutilsModule = require(CorePackages.Packages.tutils)
local GetFFlagIBGateUGC4ACollectibleAssetsBundlesModule = require(Parent.Flags.GetFFlagIBGateUGC4ACollectibleAssetsBundles)
local GetFFlagIBEnableCollectiblesSystemSupportModule = require(Parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local DetailsButtons = RoactModule.PureComponent:extend("DetailsButtons")

local function _(p1): boolean
	-- upvalues: ConstantsModule (copy)
	return ConstantsModule.AnimationAssetTypes[p1] ~= nil
end

local function getBuyText(p1, p2, IsCollectibleQuantityLimitPerUserBelow, CollectibleLowestResalePrice)
	-- upvalues: GetFFlagIBEnableCollectiblesSystemSupportModule (copy), RobloxTranslatorModule (copy), ConstantsModule (copy), Players (copy)
	local Price = nil
	local IsLimited = p1.isLimited or GetFFlagIBEnableCollectiblesSystemSupportModule() and p1.isLimitedUnique
	
	if CollectibleLowestResalePrice then
		Price = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.FromResale", p2, { PRICE = tostring(CollectibleLowestResalePrice) })
		
		return Price
	end
	if IsCollectibleQuantityLimitPerUserBelow and p1.isForSale then
		Price = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.LimitReached", p2)
		
		return Price
	end
	if p1.price ~= nil and p1.productType == ConstantsModule.ProductType.CollectibleItem and p1.isForSale then
		Price = p1.price
		
		return Price
	end
	if p1.owned then
		Price = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Owned", p2)
		
		return Price
	end
	if IsLimited then
		Price = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Limited", p2)
		
		return Price
	end
	if not p1.isForSale and not IsLimited then
		Price = RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Offsale", p2)
		
		return Price
	end
	if p1.isForSale then
		if p1.premiumPricing ~= nil then
			return if Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then p1.premiumPricing.premiumPriceInRobux elseif p1.price == nil then RobloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.PremiumOnly", p2) else p1.price
		end
		Price = p1.price
	end
	return Price
end

function DetailsButtons.init(p1)
	-- upvalues: RoactModule (copy)
	p1.tryOnButtonRef = RoactModule.createRef()
	p1.buyButtonRef = RoactModule.createRef()
	p1.favoriteButtonRef = RoactModule.createRef()
end

function DetailsButtons.didUpdate(p1, p2)
	-- upvalues: GuiService (copy)
	local DetailsInformation = p1.props.detailsInformation
	local GamepadEnabled = p1.props.gamepadEnabled
	
	if DetailsInformation.viewingDetails then
		local Visible = p1.props.visible
		
		if GamepadEnabled and Visible then
			GuiService.SelectedCoreObject = p1.favoriteButtonRef.current
		end
	elseif p1.props.assetInfo.bundlesAssetIsIn == nil and DetailsInformation.viewingDetails and GamepadEnabled then
		GuiService.SelectedCoreObject = nil
	end
	local Overlay = p1.props.overlay
	local Overlay1 = p2.overlay
	
	if GamepadEnabled and Overlay and Overlay.overlay == nil and Overlay1 and Overlay1.overlay ~= nil then
		GuiService.SelectedCoreObject = p1.tryOnButtonRef.current
	end
end

function DetailsButtons.calculateBuyStatusForLimitedItem(p1, AssetInfo, Locale, _)
	-- upvalues: UtilityFunctionsModule (copy), TutilsModule (copy), Players (copy), getBuyText (copy), ConstantsModule (copy)
	local IsLimited1Point0 = UtilityFunctionsModule.isLimited1Point0(AssetInfo) or UtilityFunctionsModule.isLimited1Point0_LimitedUnique(AssetInfo)
	local IsCollectibleQuantityLimitPerUserBelow: boolean? = nil
	local CollectibleLowestResalePrice = nil
	local CollectibleLowestAvailableResaleItemInstanceId = nil
	local CollectibleLowestAvailableResaleProductId = nil
	local CollectibleItemId = nil
	local IsForSale = nil
	
	if UtilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(AssetInfo) then
		IsForSale = AssetInfo.isForSale
		local ResellableInstances = p1.props.resellableInstances
		local FieldCountResult = ResellableInstances and (ResellableInstances[AssetInfo.collectibleItemId] and TutilsModule.fieldCount(ResellableInstances[AssetInfo.collectibleItemId]))
		IsCollectibleQuantityLimitPerUserBelow = FieldCountResult and (AssetInfo.collectibleQuantityLimitPerUser ~= nil and (AssetInfo.collectibleQuantityLimitPerUser > 0 and AssetInfo.collectibleQuantityLimitPerUser <= FieldCountResult))
		local IsNotCollectibleLowestAvailableResaleProductIdMatch: boolean = AssetInfo.collectibleLowestAvailableResaleProductId and AssetInfo.collectibleLowestAvailableResaleProductId ~= ""
		local IsCollectibleLowestResalePriceBelow = if AssetInfo.remaining > 0 then IsNotCollectibleLowestAvailableResaleProductIdMatch and AssetInfo.collectibleLowestResalePrice < (AssetInfo.price or 0) else IsNotCollectibleLowestAvailableResaleProductIdMatch and AssetInfo.collectibleLowestResalePrice
		
		if IsNotCollectibleLowestAvailableResaleProductIdMatch then
			if not IsForSale or IsCollectibleQuantityLimitPerUserBelow or IsCollectibleLowestResalePriceBelow then
				CollectibleLowestResalePrice = AssetInfo.collectibleLowestResalePrice
				CollectibleLowestAvailableResaleItemInstanceId = AssetInfo.collectibleLowestAvailableResaleItemInstanceId
				CollectibleLowestAvailableResaleProductId = AssetInfo.collectibleLowestAvailableResaleProductId
				CollectibleItemId = AssetInfo.collectibleItemId
				IsForSale = true
			end
		elseif IsCollectibleQuantityLimitPerUserBelow then
			IsForSale = false
		end
	else
		IsForSale = AssetInfo.isForSale and (not AssetInfo.owned and not IsLimited1Point0)
	end
	if IsForSale and AssetInfo.price == nil and AssetInfo.premiumPricing ~= nil then
		IsForSale = Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium
	end
	return {
		buyText = getBuyText(AssetInfo, Locale, IsCollectibleQuantityLimitPerUserBelow, CollectibleLowestResalePrice),
		showRobuxIcon = (if AssetInfo.price == nil or AssetInfo.owned then CollectibleLowestResalePrice ~= nil else IsForSale or CollectibleLowestResalePrice ~= nil) or AssetInfo.price ~= nil and (AssetInfo.productType == ConstantsModule.ProductType.CollectibleItem and IsForSale),
		forSale = IsForSale,
		collectibleQuantityLimitReached = IsCollectibleQuantityLimitPerUserBelow,
		collectibleLowestResalePrice = CollectibleLowestResalePrice,
		collectibleLowestAvailableResaleItemInstanceId = CollectibleLowestAvailableResaleItemInstanceId,
		collectibleLowestAvailableResaleProductId = CollectibleLowestAvailableResaleProductId,
		collectibleItemId = CollectibleItemId
	}
end

function DetailsButtons.render(p1)
	-- upvalues: UtilityFunctionsModule (copy), ConstantsModule (copy), GetFFlagIBGateUGC4ACollectibleAssetsBundlesModule (copy), RoactModule (copy), InspectAndBuyControllerBarModule (copy), FavoritesButtonModule (copy), TryOnButtonModule (copy), BuyButtonModule (copy)
	local Locale = p1.props.locale
	local AssetInfo = p1.props.assetInfo
	local ShowRobuxIcon = false
	local ShowTryOn = false
	local BuyText = nil
	local ForSale = nil
	local HasParentBundleId: boolean? = nil
	local BundleId = nil
	local Asset = nil
	local AssetId = nil
	local NoIsForSale: boolean? = nil
	local CollectibleItemId = nil
	local CollectibleLowestResalePrice = nil
	local CollectibleLowestAvailableResaleProductId = nil
	local CollectibleLowestAvailableResaleItemInstanceId = nil
	
	if AssetInfo then
		HasParentBundleId = AssetInfo.parentBundleId ~= nil
		NoIsForSale = HasParentBundleId and not AssetInfo.isForSale
		
		if HasParentBundleId then
			BundleId = UtilityFunctionsModule.getBundleId(AssetInfo)
			Asset = ConstantsModule.ItemType.Bundle
			AssetId = BundleId
		else
			Asset = ConstantsModule.ItemType.Asset
			AssetId = AssetInfo.assetId
		end
		local BuyStatusForLimitedItem = p1:calculateBuyStatusForLimitedItem(AssetInfo, Locale, ForSale)
		BuyText = BuyStatusForLimitedItem.buyText
		ShowRobuxIcon = BuyStatusForLimitedItem.showRobuxIcon
		ForSale = BuyStatusForLimitedItem.forSale
		local _ = BuyStatusForLimitedItem.collectibleQuantityLimitReached
		CollectibleLowestResalePrice = BuyStatusForLimitedItem.collectibleLowestResalePrice
		CollectibleLowestAvailableResaleProductId = BuyStatusForLimitedItem.collectibleLowestAvailableResaleProductId
		CollectibleLowestAvailableResaleItemInstanceId = BuyStatusForLimitedItem.collectibleLowestAvailableResaleItemInstanceId
		CollectibleItemId = BuyStatusForLimitedItem.collectibleItemId
		ShowTryOn = (ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp[AssetInfo.assetTypeId] ~= nil or ConstantsModule.AssetTypeIdToAccessoryTypeEnum[AssetInfo.assetTypeId] ~= nil) and not (ConstantsModule.AnimationAssetTypes[AssetInfo.assetTypeId] ~= nil)
	end
	local IsUnlimitedCollectibleAsset = if GetFFlagIBGateUGC4ACollectibleAssetsBundlesModule() then UtilityFunctionsModule.isUnlimitedCollectibleAsset(Asset, AssetInfo) or (UtilityFunctionsModule.isLimitedBundle(Asset, AssetInfo) or UtilityFunctionsModule.isUnlimitedCollectibleBundle(Asset, AssetInfo)) else nil
	
	if AssetInfo then
		CollectibleItemId = AssetInfo.collectibleItemId
		local AssetBundle = p1.props.assetBundles[AssetInfo.assetId]
		IsUnlimitedCollectibleAsset = HasParentBundleId and #AssetBundle > 1
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 51),
		Position = UDim2.new(0, 0, 1, -51)
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 10),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		ControllerBar = p1.props.detailsInformation.viewingDetails and p1.props.gamepadEnabled and RoactModule.createElement(InspectAndBuyControllerBarModule, {
			showFavorite = true,
			showTryOn = ShowTryOn,
			tryingOn = p1.props.tryingOn,
			isFavorited = p1.props.isFavorited
		}),
		FavoriteButton = RoactModule.createElement(FavoritesButtonModule, { favoriteButtonRef = p1.favoriteButtonRef }),
		TryOnButton = RoactModule.createElement(TryOnButtonModule, {
			showTryOn = ShowTryOn,
			assetInfo = AssetInfo,
			partOfBundleAndOffsale = NoIsForSale,
			bundleId = BundleId,
			tryOnButtonRef = p1.tryOnButtonRef,
			localPlayerModel = p1.props.localPlayerModel
		}),
		TryOnFiller = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Image = "",
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(0.5, -32, 0, 44),
			Visible = not ShowTryOn,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(5, 5, 120, 20)
		}),
		BuyButton = if GetFFlagIBGateUGC4ACollectibleAssetsBundlesModule() and IsUnlimitedCollectibleAsset then nil else RoactModule.createElement(BuyButtonModule, {
			itemType = Asset,
			itemId = AssetId,
			showRobuxIcon = ShowRobuxIcon,
			forSale = ForSale,
			buyText = BuyText,
			buyButtonRef = p1.buyButtonRef,
			collectibleItemId = CollectibleItemId,
			collectibleLowestAvailableResaleProductId = CollectibleLowestAvailableResaleProductId,
			collectibleLowestAvailableResaleItemInstanceId = CollectibleLowestAvailableResaleItemInstanceId,
			collectibleLowestResalePrice = CollectibleLowestResalePrice
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	-- upvalues: GetIsFavoriteModule (copy)
	return {
		visible = p1.visible,
		assetInfo = p1.assets[p1.detailsInformation.assetId] or {},
		assetBundles = p1.assetBundles,
		detailsInformation = p1.detailsInformation,
		bundleInfo = p1.bundles,
		locale = p1.locale,
		gamepadEnabled = p1.gamepadEnabled,
		isFavorited = GetIsFavoriteModule(p1),
		tryingOn = p1.tryingOnInfo.tryingOn,
		resellableInstances = p1.collectibleResellableInstances,
		overlay = p1.overlay
	}
end)(DetailsButtons)