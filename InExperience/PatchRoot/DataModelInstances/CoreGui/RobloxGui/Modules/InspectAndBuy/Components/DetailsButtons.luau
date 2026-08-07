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

local function _(value) --[[ line: 35 | named "isAnimationAsset" ]]
	-- upvalues: constantsModule (ref)
	return constantsModule.AnimationAssetTypes[value] ~= nil
end

local function getBuyText(p0, p1, p2, p3) --[[ line: 39 ]]
	-- upvalues: getFFlagIBEnableCollectiblesSystemSupportModule (ref), robloxTranslatorModule (ref), constantsModule (ref), playersService (ref)
	local price = nil
	local isLimited = p0.isLimited or getFFlagIBEnableCollectiblesSystemSupportModule() and p0.isLimitedUnique
	
	if p3 then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.FromResale", p1, { PRICE = tostring(p3) })
		
		return price
	elseif p2 and p0.isForSale then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Action.LimitReached", p1)
		
		return price
	elseif p0.price ~= nil and p0.productType == constantsModule.ProductType.CollectibleItem and p0.isForSale then
		price = p0.price
		
		return price
	elseif p0.owned then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Owned", p1)
		
		return price
	elseif isLimited then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Limited", p1)
		
		return price
	elseif not p0.isForSale and not isLimited then
		price = robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.Offsale", p1)
		
		return price
	elseif p0.isForSale then
		if p0.premiumPricing == nil then
			price = p0.price
		else
			return if playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium then p0.premiumPricing.premiumPriceInRobux elseif p0.price == nil then robloxTranslatorModule:FormatByKeyForLocale("InGame.InspectMenu.Label.PremiumOnly", p1) else p0.price
		end
	end
	return price
end

function detailsButtons.init(p4) --[[ line: 83 ]]
	-- upvalues: roactModule (ref)
	p4.tryOnButtonRef = roactModule.createRef()
	p4.buyButtonRef = roactModule.createRef()
	p4.favoriteButtonRef = roactModule.createRef()
end

function detailsButtons.didUpdate(p5, p6) --[[ line: 89 ]]
	-- upvalues: guiService (ref)
	local detailsInformation = p5.props.detailsInformation
	local gamepadEnabled = p5.props.gamepadEnabled
	
	if detailsInformation.viewingDetails then
		if gamepadEnabled and p5.props.visible then
			guiService.SelectedCoreObject = p5.favoriteButtonRef.current
		end
	elseif p5.props.assetInfo.bundlesAssetIsIn == nil and detailsInformation.viewingDetails and gamepadEnabled then
		guiService.SelectedCoreObject = nil
	end
	local overlay = p5.props.overlay
	local overlay_1 = p6.overlay
	
	if gamepadEnabled and overlay and (overlay.overlay == nil and overlay_1) and overlay_1.overlay ~= nil then
		guiService.SelectedCoreObject = p5.tryOnButtonRef.current
	end
end

function detailsButtons.calculateBuyStatusForLimitedItem(p7, p8, p9, _) --[[ line: 113 ]]
	-- upvalues: utilityFunctionsModule (ref), tutilsModule (ref), playersService (ref), getBuyText (ref), constantsModule (ref)
	local var22
	local var19 = utilityFunctionsModule.isLimited2Point0_Or_LimitedCollectible(p8)
	local var20 = utilityFunctionsModule.isLimited1Point0(p8) or utilityFunctionsModule.isLimited1Point0_LimitedUnique(p8)
	local var21 = nil
	local collectibleLowestResalePrice = nil
	local collectibleLowestAvailableResaleItemInstanceId = nil
	local collectibleLowestAvailableResaleProductId = nil
	local collectibleItemId = nil
	
	if var19 then
		var22 = p8.isForSale
		local resellableInstances = p7.props.resellableInstances
		local collectibleItemId_1 = resellableInstances and (resellableInstances[p8.collectibleItemId] and tutilsModule.fieldCount(resellableInstances[p8.collectibleItemId]))
		var21 = collectibleItemId_1 and (p8.collectibleQuantityLimitPerUser ~= nil and (p8.collectibleQuantityLimitPerUser > 0 and p8.collectibleQuantityLimitPerUser <= collectibleItemId_1))
		local var24 = p8.collectibleLowestAvailableResaleProductId and p8.collectibleLowestAvailableResaleProductId ~= ""
		local _ = false
		local var25 = if p8.remaining > 0 then var24 and p8.collectibleLowestResalePrice < (p8.price or 0) else var24 and p8.collectibleLowestResalePrice
		
		if var24 then
			if not var22 or var21 or var25 then
				collectibleLowestResalePrice = p8.collectibleLowestResalePrice
				collectibleLowestAvailableResaleItemInstanceId = p8.collectibleLowestAvailableResaleItemInstanceId
				collectibleLowestAvailableResaleProductId = p8.collectibleLowestAvailableResaleProductId
				collectibleItemId = p8.collectibleItemId
				var22 = true
			end
		elseif var21 then
			var22 = false
		end
	else
		var22 = p8.isForSale and (not p8.owned and not var20)
	end
	if var22 and p8.price == nil and p8.premiumPricing ~= nil then
		var22 = playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium
	end
	local var27
	local var26 = getBuyText(p8, p9, var21, collectibleLowestResalePrice)
	
	if p8.price ~= nil and not p8.owned then
		var27 = var22
		
		if not var27 then
			var27 = if collectibleLowestResalePrice == nil then p8.price ~= nil and (p8.productType == constantsModule.ProductType.CollectibleItem and var22) else true
		end
		return {
			buyText = var26,
			showRobuxIcon = var27,
			forSale = var22,
			collectibleQuantityLimitReached = var21,
			collectibleLowestResalePrice = collectibleLowestResalePrice,
			collectibleLowestAvailableResaleItemInstanceId = collectibleLowestAvailableResaleItemInstanceId,
			collectibleLowestAvailableResaleProductId = collectibleLowestAvailableResaleProductId,
			collectibleItemId = collectibleItemId
		}
	end
end

function detailsButtons.render(p10) --[[ line: 188 ]]
	-- upvalues: utilityFunctionsModule (ref), constantsModule (ref), getFFlagIBGateUGC4ACollectibleAssetsBundlesModule (ref), roactModule (ref), inspectAndBuyControllerBarModule (ref), favoritesButtonModule (ref), tryOnButtonModule (ref), buyButtonModule (ref)
	local locale = p10.props.locale
	local assetInfo = p10.props.assetInfo
	local showRobuxIcon = false
	local var28 = false
	local buyText = nil
	local forSale = nil
	local var29 = nil
	local bundleId = nil
	local asset = nil
	local assetId = nil
	local var31 = nil
	local collectibleItemId = nil
	local collectibleLowestResalePrice = nil
	local collectibleLowestAvailableResaleProductId = nil
	local collectibleLowestAvailableResaleItemInstanceId = nil
	
	if assetInfo then
		var29 = assetInfo.parentBundleId ~= nil
		var31 = var29 and not assetInfo.isForSale
		
		if var29 then
			bundleId = utilityFunctionsModule.getBundleId(assetInfo)
			asset = constantsModule.ItemType.Bundle
			assetId = bundleId
		else
			asset = constantsModule.ItemType.Asset
			assetId = assetInfo.assetId
		end
		local var32 = p10:calculateBuyStatusForLimitedItem(assetInfo, locale, forSale)
		buyText = var32.buyText
		showRobuxIcon = var32.showRobuxIcon
		forSale = var32.forSale
		local _ = var32.collectibleQuantityLimitReached
		collectibleLowestResalePrice = var32.collectibleLowestResalePrice
		collectibleLowestAvailableResaleProductId = var32.collectibleLowestAvailableResaleProductId
		collectibleLowestAvailableResaleItemInstanceId = var32.collectibleLowestAvailableResaleItemInstanceId
		collectibleItemId = var32.collectibleItemId
		var28 = if constantsModule.AssetTypeIdStringToHumanoidDescriptionProp[assetInfo.assetTypeId] == nil and constantsModule.AssetTypeIdToAccessoryTypeEnum[assetInfo.assetTypeId] == nil then false else not (constantsModule.AnimationAssetTypes[assetInfo.assetTypeId] ~= nil)
	end
	local var33 = nil
	
	if getFFlagIBGateUGC4ACollectibleAssetsBundlesModule() then
		var33 = utilityFunctionsModule.isUnlimitedCollectibleAsset(asset, assetInfo) or (utilityFunctionsModule.isLimitedBundle(asset, assetInfo) or utilityFunctionsModule.isUnlimitedCollectibleBundle(asset, assetInfo))
	end
	if assetInfo then
		collectibleItemId = assetInfo.collectibleItemId
		var33 = var29 and #p10.props.assetBundles[assetInfo.assetId] > 1
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
		ControllerBar = p10.props.detailsInformation.viewingDetails and p10.props.gamepadEnabled and roactModule.createElement(inspectAndBuyControllerBarModule, {
			showFavorite = true,
			showTryOn = var28,
			tryingOn = p10.props.tryingOn,
			isFavorited = p10.props.isFavorited
		}),
		FavoriteButton = roactModule.createElement(favoritesButtonModule, { favoriteButtonRef = p10.favoriteButtonRef }),
		TryOnButton = roactModule.createElement(tryOnButtonModule, {
			showTryOn = var28,
			assetInfo = assetInfo,
			partOfBundleAndOffsale = var31,
			bundleId = bundleId,
			tryOnButtonRef = p10.tryOnButtonRef,
			localPlayerModel = p10.props.localPlayerModel
		}),
		TryOnFiller = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Image = "",
			AnchorPoint = Vector2.new(0.5, 0),
			Size = UDim2.new(0.5, -32, 0, 44),
			Visible = not var28,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(5, 5, 120, 20)
		}),
		BuyButton = if getFFlagIBGateUGC4ACollectibleAssetsBundlesModule() and var33 then nil else roactModule.createElement(buyButtonModule, {
			itemType = asset,
			itemId = assetId,
			showRobuxIcon = showRobuxIcon,
			forSale = forSale,
			buyText = buyText,
			buyButtonRef = p10.buyButtonRef,
			collectibleItemId = collectibleItemId,
			collectibleLowestAvailableResaleProductId = collectibleLowestAvailableResaleProductId,
			collectibleLowestAvailableResaleItemInstanceId = collectibleLowestAvailableResaleItemInstanceId,
			collectibleLowestResalePrice = collectibleLowestResalePrice
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p11, _) --[[ line: 315 ]]
	-- upvalues: getIsFavoriteModule (ref)
	return {
		visible = p11.visible,
		assetInfo = p11.assets[p11.detailsInformation.assetId] or {},
		assetBundles = p11.assetBundles,
		detailsInformation = p11.detailsInformation,
		bundleInfo = p11.bundles,
		locale = p11.locale,
		gamepadEnabled = p11.gamepadEnabled,
		isFavorited = getIsFavoriteModule(p11),
		tryingOn = p11.tryingOnInfo.tryingOn,
		resellableInstances = p11.collectibleResellableInstances,
		overlay = p11.overlay
	}
end)(detailsButtons)