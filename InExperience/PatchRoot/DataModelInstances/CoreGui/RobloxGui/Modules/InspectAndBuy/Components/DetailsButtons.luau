local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local constantsModule = require(parent.Constants)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local favoritesButtonModule = require(parent.Components.FavoritesButton)
local tryOnButtonModule = require(parent.Components.TryOnButton)
local buyButtonModule = require(parent.Components.BuyButton)
local inspectAndBuyControllerBarModule = require(parent.Components.InspectAndBuyControllerBar)
local getIsFavoriteModule = require(parent.Selectors.GetIsFavorite)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local tutilsModule = require(corePackagesService.Packages.tutils)
local getFFlagIBGateUGC4ACollectibleAssetsBundlesModule = require(parent.Flags.GetFFlagIBGateUGC4ACollectibleAssetsBundles)
local getFFlagIBEnableCollectiblesSystemSupportModule = require(parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)
local detailsButtons = roactModule.PureComponent:extend("DetailsButtons")

local function _(value)
	-- upvalues: constantsModule (ref)
	return constantsModule.AnimationAssetTypes[value] ~= nil
end

local function getBuyText(p1, p2, p3, p4)
	-- upvalues: getFFlagIBEnableCollectiblesSystemSupportModule (ref), robloxTranslatorModule (ref), constantsModule (ref), playersService (ref)
	local price = nil
	local isLimited = p1.isLimited or getFFlagIBEnableCollectiblesSystemSupportModule() and p1.isLimitedUnique
	
	if p4 then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.FromResale", p2, { PRICE = tostring(p4) })
		
		return price
	elseif p3 and p1.isForSale then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.LimitReached", p2)
		
		return price
	elseif p1.price ~= nil and p1.productType == constantsModule.ProductType.CollectibleItem and p1.isForSale then
		price = p1.price
		
		return price
	elseif p1.owned then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Owned", p2)
		
		return price
	elseif isLimited then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Limited", p2)
		
		return price
	elseif not p1.isForSale and not isLimited then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Offsale", p2)
		
		return price
	elseif p1.isForSale then
		if p1.premiumPricing == nil then
			price = p1.price
		else
			return if playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium then p1.premiumPricing.premiumPriceInRobux elseif p1.price == nil then robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.PremiumOnly", p2) else p1.price
		end
	end
	return price
end

function detailsButtons.init(p1)
	-- upvalues: roactModule (ref)
	p1.tryOnButtonRef = roactModule.createRef()
	p1.buyButtonRef = roactModule.createRef()
	p1.favoriteButtonRef = roactModule.createRef()
end

function detailsButtons.didUpdate(p1, p2)
	-- upvalues: guiService (ref)
	local detailsInformation = p1.props.detailsInformation
	local gamepadEnabled = p1.props.gamepadEnabled
	
	if detailsInformation.viewingDetails then
		if gamepadEnabled and p1.props.visible then
			guiService.SelectedCoreObject = p1.favoriteButtonRef.current
		end
	elseif p1.props.assetInfo.bundlesAssetIsIn == nil and detailsInformation.viewingDetails and gamepadEnabled then
		guiService.SelectedCoreObject = nil
	end
	local overlay = p1.props.overlay
	local overlay_1 = p2.overlay
	
	if gamepadEnabled and overlay and (overlay.overlay == nil and overlay_1) and overlay_1.overlay ~= nil then
		guiService.SelectedCoreObject = p1.tryOnButtonRef.current
	end
end

function detailsButtons.calculateBuyStatusForLimitedItem(p1, p2, p3, _)
	-- upvalues: utilityFunctionsModule (ref), tutilsModule (ref), playersService (ref), getBuyText (ref), constantsModule (ref)
	local var1
	local var2 = utilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(p2)
	local var3 = utilityFunctionsModule.isLimited1Point0(p2) or utilityFunctionsModule.isLimited1Point0_LimitedUnique(p2)
	local var4 = nil
	local collectibleLowestResalePrice = nil
	local collectibleLowestAvailableResaleItemInstanceId = nil
	local collectibleLowestAvailableResaleProductId = nil
	local collectibleItemId = nil
	
	if var2 then
		var1 = p2.isForSale
		local resellableInstances = p1.props.resellableInstances
		local collectibleItemId_1 = resellableInstances and (resellableInstances[p2.collectibleItemId] and tutilsModule.fieldCount(resellableInstances[p2.collectibleItemId]))
		var4 = collectibleItemId_1 and (p2.collectibleQuantityLimitPerUser ~= nil and (p2.collectibleQuantityLimitPerUser > 0 and p2.collectibleQuantityLimitPerUser <= collectibleItemId_1))
		local var5 = p2.collectibleLowestAvailableResaleProductId and p2.collectibleLowestAvailableResaleProductId ~= ""
		local _ = false
		local var6 = if p2.remaining > 0 then var5 and p2.collectibleLowestResalePrice < (p2.price or 0) else var5 and p2.collectibleLowestResalePrice
		
		if var5 then
			if not var1 or var4 or var6 then
				collectibleLowestResalePrice = p2.collectibleLowestResalePrice
				collectibleLowestAvailableResaleItemInstanceId = p2.collectibleLowestAvailableResaleItemInstanceId
				collectibleLowestAvailableResaleProductId = p2.collectibleLowestAvailableResaleProductId
				collectibleItemId = p2.collectibleItemId
				var1 = true
			end
		elseif var4 then
			var1 = false
		end
	else
		var1 = p2.isForSale and (not p2.owned and not var3)
	end
	if var1 and p2.price == nil and p2.premiumPricing ~= nil then
		var1 = playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium
	end
	local var7
	local var8 = getBuyText(p2, p3, var4, collectibleLowestResalePrice)
	
	if p2.price ~= nil and not p2.owned then
		var7 = var1
		
		if not var7 then
			var7 = if collectibleLowestResalePrice == nil then p2.price ~= nil and (p2.productType == constantsModule.ProductType.CollectibleItem and var1) else true
		end
		return {
			buyText = var8,
			showRobuxIcon = var7,
			forSale = var1,
			collectibleQuantityLimitReached = var4,
			collectibleLowestResalePrice = collectibleLowestResalePrice,
			collectibleLowestAvailableResaleItemInstanceId = collectibleLowestAvailableResaleItemInstanceId,
			collectibleLowestAvailableResaleProductId = collectibleLowestAvailableResaleProductId,
			collectibleItemId = collectibleItemId
		}
	end
end

function detailsButtons.render(p1)
	-- upvalues: utilityFunctionsModule (ref), constantsModule (ref), getFFlagIBGateUGC4ACollectibleAssetsBundlesModule (ref), roactModule (ref), inspectAndBuyControllerBarModule (ref), favoritesButtonModule (ref), tryOnButtonModule (ref), buyButtonModule (ref)
	local locale = p1.props.locale
	local assetInfo = p1.props.assetInfo
	local showRobuxIcon = false
	local var1 = false
	local buyText = nil
	local forSale = nil
	local var2 = nil
	local bundleId = nil
	local asset = nil
	local assetId = nil
	local var3 = nil
	local collectibleItemId = nil
	local collectibleLowestResalePrice = nil
	local collectibleLowestAvailableResaleProductId = nil
	local collectibleLowestAvailableResaleItemInstanceId = nil
	
	if assetInfo then
		var2 = assetInfo.parentBundleId ~= nil
		var3 = var2 and not assetInfo.isForSale
		
		if var2 then
			bundleId = utilityFunctionsModule.getBundleId(assetInfo)
			asset = constantsModule.ItemType.Bundle
			assetId = bundleId
		else
			asset = constantsModule.ItemType.Asset
			assetId = assetInfo.assetId
		end
		local var4 = p1:calculateBuyStatusForLimitedItem(assetInfo, locale, forSale)
		buyText = var4.buyText
		showRobuxIcon = var4.showRobuxIcon
		forSale = var4.forSale
		local _ = var4.collectibleQuantityLimitReached
		collectibleLowestResalePrice = var4.collectibleLowestResalePrice
		collectibleLowestAvailableResaleProductId = var4.collectibleLowestAvailableResaleProductId
		collectibleLowestAvailableResaleItemInstanceId = var4.collectibleLowestAvailableResaleItemInstanceId
		collectibleItemId = var4.collectibleItemId
		var1 = if constantsModule.AssetTypeIdStringToHumanoidDescriptionProp[assetInfo.assetTypeId] == nil and constantsModule.AssetTypeIdToAccessoryTypeEnum[assetInfo.assetTypeId] == nil then false else not (constantsModule.AnimationAssetTypes[assetInfo.assetTypeId] ~= nil)
	end
	local var5 = nil
	
	if getFFlagIBGateUGC4ACollectibleAssetsBundlesModule() then
		var5 = utilityFunctionsModule.isUnlimitedCollectibleAsset(asset, assetInfo) or (utilityFunctionsModule.isLimitedBundle(asset, assetInfo) or utilityFunctionsModule.isUnlimitedCollectibleBundle(asset, assetInfo))
	end
	if assetInfo then
		collectibleItemId = assetInfo.collectibleItemId
		var5 = var2 and #p1.props.assetBundles[assetInfo.assetId] > 1
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 51),
		Position = UDim2.new(0, 0, 1, -51)
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 10),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		ControllerBar = p1.props.detailsInformation.viewingDetails and p1.props.gamepadEnabled and roactModule.createElement(inspectAndBuyControllerBarModule, {
			showFavorite = true,
			showTryOn = var1,
			tryingOn = p1.props.tryingOn,
			isFavorited = p1.props.isFavorited
		}),
		FavoriteButton = roactModule.createElement(favoritesButtonModule, { favoriteButtonRef = p1.favoriteButtonRef }),
		TryOnButton = roactModule.createElement(tryOnButtonModule, {
			showTryOn = var1,
			assetInfo = assetInfo,
			partOfBundleAndOffsale = var3,
			bundleId = bundleId,
			tryOnButtonRef = p1.tryOnButtonRef,
			localPlayerModel = p1.props.localPlayerModel
		}),
		TryOnFiller = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Image = "",
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(0.5, -32, 0, 44),
			Visible = not var1,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(5, 5, 120, 20)
		}),
		BuyButton = if getFFlagIBGateUGC4ACollectibleAssetsBundlesModule() and var5 then nil else roactModule.createElement(buyButtonModule, {
			itemType = asset,
			itemId = assetId,
			showRobuxIcon = showRobuxIcon,
			forSale = forSale,
			buyText = buyText,
			buyButtonRef = p1.buyButtonRef,
			collectibleItemId = collectibleItemId,
			collectibleLowestAvailableResaleProductId = collectibleLowestAvailableResaleProductId,
			collectibleLowestAvailableResaleItemInstanceId = collectibleLowestAvailableResaleItemInstanceId,
			collectibleLowestResalePrice = collectibleLowestResalePrice
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	-- upvalues: getIsFavoriteModule (ref)
	return {
		visible = p1.visible,
		assetInfo = p1.assets[p1.detailsInformation.assetId] or {},
		assetBundles = p1.assetBundles,
		detailsInformation = p1.detailsInformation,
		bundleInfo = p1.bundles,
		locale = p1.locale,
		gamepadEnabled = p1.gamepadEnabled,
		isFavorited = getIsFavoriteModule(p1),
		tryingOn = p1.tryingOnInfo.tryingOn,
		resellableInstances = p1.collectibleResellableInstances,
		overlay = p1.overlay
	}
end)(detailsButtons)