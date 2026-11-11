local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UrlModule = require(Modules.LuaApp.Http.Url)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local DashModule = require(CorePackages.Packages.Dash)
local _ = require(CorePackages.Workspace.Packages.Http)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local LuaSocialLibrariesDepsModule = require(CorePackages.Packages.LuaSocialLibrariesDeps)
local ShareLinksNetworkingModule = require(CorePackages.Workspace.Packages.ShareLinksNetworking)
local FFlagAXCatalogMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local Formatted = string.format("https://develop.%s", UrlModule.DOMAIN)
local config = {
	FetchSponsoredItems = function(Callback, Text, p1)
		-- upvalues: UrlModule (copy)
		local Formatted = string.format("%sv1/catalog/sponsored-items?model.placementLocation=AvatarShop", UrlModule.CATALOG_URL)
		
		if Text then
			Formatted ..= "&model.catalogCategoryType=" .. Text
		end
		if p1 then
			Formatted ..= "&model.count=" .. tostring(p1)
		end
		return Callback(Formatted, "GET")
	end,
	FetchWidgets = function(Callback, RequestId, Context)
		-- upvalues: UrlModule (copy)
		return Callback(string.format("%smarketplace-widgets/v1/widgets?%s", UrlModule.APIS_URL, (UrlModule:makeQueryString({ requestId = RequestId, context = Context }))), "GET")
	end,
	FetchWidgetsSearch = function(Callback, RequestId, Query)
		-- upvalues: UrlModule (copy)
		return Callback(string.format("%smarketplace-widgets/v1/widgets/search?%s", UrlModule.APIS_URL, (UrlModule:makeQueryString({ query = Query, requestId = RequestId }))), "GET")
	end,
	HydrateWidgetContent = function(Callback, Content)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%smarketplace-widgets/v1/widgets/hydrate", UrlModule.APIS_URL), "POST", { postBody = HttpService:JSONEncode({ Content = Content }) })
	end,
	TrackSponsoredItemClick = function(Callback, EncryptedAdTrackingData)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%sv2/tracking/click", UrlModule.AD_CONFIGURATION_URL), "POST", {
			postBody = HttpService:JSONEncode({
				campaignTargetType = "Asset",
				placementLocation = "AvatarShop",
				encryptedAdTrackingData = EncryptedAdTrackingData
			})
		})
	end,
	FetchItemDetail = function(Callback, p1, ItemType)
		-- upvalues: UrlModule (copy)
		return Callback(string.format("%sv1/catalog/items/%s/details?%s", UrlModule.CATALOG_URL, tostring(p1), (UrlModule:makeQueryString({ itemType = ItemType }))), "GET")
	end,
	FetchItemDetails = function(Callback, Items)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%sv1/catalog/items/details", UrlModule.CATALOG_URL), "POST", { postBody = HttpService:JSONEncode({ items = Items }) })
	end,
	FetchCollectibleItemDetails = function(Callback, ItemIds)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%smarketplace-items/v1/items/details", UrlModule.APIS_URL), "POST", { postBody = HttpService:JSONEncode({ itemIds = ItemIds }) })
	end,
	PurchaseProduct = function(Callback, p1, p2, p3, UserAssetId)
		-- upvalues: ArgCheckModule (copy), UrlModule (copy), HttpService (copy), CatalogConstantsModule (copy)
		ArgCheckModule.isType(p1, "string", "CatalogWebApi.PurchaseProduct: productId")
		ArgCheckModule.isNonNegativeNumber(p2, "CatalogWebApi.PurchaseProduct: expectedPrice")
		ArgCheckModule.isType(p3, "string", "CatalogWebApi.PurchaseProduct: expectedSellerId")
		
		return Callback(string.format("%sv1/purchases/products/%s", UrlModule.ECONOMY_URL, p1), "POST", {
			postBody = HttpService:JSONEncode({
				expectedCurrency = CatalogConstantsModule.ExpectedCurrencyRobux,
				expectedPrice = tostring(p2),
				expectedSellerId = tostring(p3),
				userAssetId = UserAssetId
			})
		})
	end,
	PurchaseCollectibleItem = function(Callback, p1, CollectibleProductId, p2, p3, ExpectedSellerType, ExpectedPurchaserId, IdempotencyKey, RentalOptionDays)
		-- upvalues: UrlModule (copy), HttpService (copy), CatalogConstantsModule (copy)
		return Callback(string.format("%smarketplace-sales/v1/item/%s/purchase-item", UrlModule.APIS_URL, p1), "POST", {
			postBody = HttpService:JSONEncode({
				expectedCurrency = CatalogConstantsModule.ExpectedCurrencyRobux,
				expectedPrice = tostring(p2),
				expectedSellerId = tostring(p3),
				expectedPurchaserId = ExpectedPurchaserId,
				expectedPurchaserType = CatalogConstantsModule.CreatorType.User,
				expectedSellerType = ExpectedSellerType,
				collectibleProductId = CollectibleProductId,
				idempotencyKey = IdempotencyKey,
				rentalOptionDays = RentalOptionDays
			})
		})
	end,
	PurchaseCollectibleItemResale = function(Callback, p1, CollectibleItemInstanceId, CollectibleProductId, p2, p3, ExpectedSellerType, ExpectedPurchaserId, IdempotencyKey)
		-- upvalues: UrlModule (copy), HttpService (copy), CatalogConstantsModule (copy)
		return Callback(string.format("%smarketplace-sales/v1/item/%s/purchase-resale", UrlModule.APIS_URL, p1), "POST", {
			postBody = HttpService:JSONEncode({
				expectedCurrency = CatalogConstantsModule.ExpectedCurrencyRobux,
				expectedPrice = tostring(p2),
				expectedSellerId = tostring(p3),
				expectedPurchaserId = ExpectedPurchaserId,
				expectedPurchaserType = CatalogConstantsModule.CreatorType.User,
				expectedSellerType = ExpectedSellerType,
				collectibleProductId = CollectibleProductId,
				collectibleItemInstanceId = CollectibleItemInstanceId,
				idempotencyKey = IdempotencyKey
			})
		})
	end
}

if require(Modules.AvatarExperience.Flags.FFlagQRCodeItemRedemptionEnabled) then
	function config.RedeemQRCodeItem(Callback, p1)
		-- upvalues: ArgCheckModule (copy), UrlModule (copy)
		ArgCheckModule.isType(p1, "string", "CatalogWebApi.RedeemQRCodeItem: assetId")
		
		return Callback(string.format("%sv2/qr-code-auto-redeem/%s", UrlModule.ECONOMY_URL, p1), "POST", { postBody = "" })
	end
end
function config.FetchSellPageData(Callback, p1, p2)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%s/v1/assets/%s/users/%s/resellable-copies", UrlModule.ECONOMY_URL, p1, p2), "GET")
end

function config.FetchCollectibleResellableInstances(Callback, p1, OwnerId)
	-- upvalues: UrlModule (copy), CatalogConstantsModule (copy)
	return Callback(string.format("%smarketplace-sales/v1/item/%s/resellable-instances?%s", UrlModule.APIS_URL, p1, (UrlModule:makeQueryString({
		cursor = "",
		ownerId = OwnerId,
		ownerType = CatalogConstantsModule.CreatorType.User,
		limit = CatalogConstantsModule.MaxOwnedCopiesPerPage
	}))), "GET")
end

function config.FetchAssetResellers(Callback, p1, Cursor, _)
	-- upvalues: UrlModule (copy), CatalogConstantsModule (copy)
	return Callback(string.format("%s/v1/assets/%s/resellers?%s", UrlModule.ECONOMY_URL, p1, (UrlModule:makeQueryString({
		cursor = Cursor,
		limit = CatalogConstantsModule.MaxResellersPerPage
	}))), "GET")
end

function config.FetchAssetResaleData(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%s/v1/assets/%s/resale-data", UrlModule.ECONOMY_URL, p1), "GET")
end

function config.FetchCollectibleResaleData(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%smarketplace-sales/v1/item/%s/resale-data", UrlModule.APIS_URL, p1), "GET")
end

function config.GetCollectibleResellers(Callback, p1, Cursor, Limit)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%smarketplace-sales/v1/item/%s/resellers?%s", UrlModule.APIS_URL, p1, (UrlModule:makeQueryString({ cursor = Cursor, limit = Limit }))), "GET")
end

function config.RemoveCurrentlySellingAsset(Callback, p1, p2)
	-- upvalues: HttpService (copy), UrlModule (copy)
	return Callback(string.format("%s/v1/assets/%s/resellable-copies/%s", UrlModule.ECONOMY_URL, p1, p2), "PATCH", { postBody = HttpService:JSONEncode({ price = "" }) })
end

function config.RemoveAvailableToSell(Callback, p1, p2, Price)
	-- upvalues: HttpService (copy), UrlModule (copy)
	return Callback(string.format("%s/v1/assets/%s/resellable-copies/%s", UrlModule.ECONOMY_URL, p1, p2), "PATCH", { postBody = HttpService:JSONEncode({ price = Price }) })
end

function config.UpdateCollectibleInstanceResaleState(Callback, p1, p2, CollectibleProductId, Price, IsOnSale, SellerId)
	-- upvalues: UrlModule (copy), HttpService (copy), CatalogConstantsModule (copy)
	return Callback(string.format("%smarketplace-sales/v1/item/%s/instance/%s/resale", UrlModule.APIS_URL, p1, p2), "PATCH", {
		postBody = HttpService:JSONEncode({
			price = Price,
			isOnSale = IsOnSale,
			sellerId = SellerId,
			sellerType = CatalogConstantsModule.CreatorType.User,
			collectibleProductId = CollectibleProductId
		})
	})
end

function config.GetMarketplaceFee(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%s/v1/resale-tax-rate", UrlModule.ECONOMY_URL), "GET")
end

function config.GetCollectibleMarketplaceResaleParameters(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%smarketplace-sales/v1/item/%s/get-resale-parameters", UrlModule.APIS_URL, p1), "GET")
end

function config.ReportItem(ReportingItemTypeName, ReportingItemId, ReportCategoryId, Comment)
	-- upvalues: HttpService (copy), HttpRbxApiService (copy)
	local Json = HttpService:JSONEncode({
		reportingItemTypeName = ReportingItemTypeName,
		reportingItemId = ReportingItemId,
		reportCategoryId = ReportCategoryId,
		comment = Comment
	})
	
	if Json then
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Json (copy)
			return HttpRbxApiService:PostAsync("moderation/reportabuse", Json, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson)
		end)
		
		if Success then
			return Result
		end
	end
	return nil
end

function config.ReportItemV2(Data, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8)
	-- upvalues: HttpService (copy), UrlModule (copy), HttpRbxApiService (copy)
	local Json = HttpService:JSONEncode({
		tags = {
			ENTRY_POINT = { valueList = { { data = Data5 } } },
			SUBMITTER_USER_ID = { valueList = { { data = Data } } },
			REPORT_TARGET_USER_ID = { valueList = { { data = Data2 } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = Data7 } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = Data6 } } },
			REPORTER_COMMENT = { valueList = { { data = Data8 } } },
			REPORT_TARGET_ASSET_ID = { valueList = { { data = Data1 } } },
			REPORT_TARGET_ASSET_NAME = { valueList = { { data = Data3 } } },
			REPORT_TARGET_ASSET_DESCRIPTION = { valueList = { { data = Data4 } } }
		}
	})
	local Text = UrlModule.APIS_URL .. "abuse-reporting/v2/abuse-report"
	
	if Json then
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Text (copy), Json (copy)
			return HttpRbxApiService:PostAsyncFullUrl(Text, Json, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson)
		end)
		
		if Success then
			return Result
		end
	end
	return nil
end

function config.AbuseReport(Callback, List)
	-- upvalues: HttpService (copy), UrlModule (copy)
	local config = { tags = {} }
	
	for i, value in List do
		if typeof(value) ~= "table" then
			value = { value }
		end
		local ValueList = {}
		
		for _, Data in value do
			table.insert(ValueList, { data = Data })
		end
		config.tags[i] = { valueList = ValueList }
	end
	return Callback(UrlModule.APIS_URL .. "abuse-reporting/v2/abuse-report", "POST", { postBody = HttpService:JSONEncode(config) })
end

function config.AbuseReportBundle(Callback, p1, p2, Data, EventTime)
	-- upvalues: UrlModule (copy), HttpService (copy)
	return Callback(UrlModule.APIS_URL .. "abuse-reporting/v1/safety-event", "POST", {
		postBody = HttpService:JSONEncode({
			safetyEvent = {
				eventTime = EventTime,
				idempotencyKey = "ugc_bundle/" .. tostring(p2) .. "/" .. tostring(p1),
				tags = {
					SUBMITTER_USER_ID = { valueList = { { data = tostring(p1) } } },
					REPORTED_ABUSE_VECTOR = { valueList = { { data = "ugc_bundle" } } },
					UGC_BUNDLE_ID = { valueList = { { data = tostring(p2) } } },
					ENTRY_POINT = { valueList = { { data = Data } } },
					REPORTED_ABUSE_CATEGORY = { valueList = { { data = "ABUSE_CATEGORY_OTHER" } } },
					REPORTER_COMMENT = { valueList = { { data = "" } } }
				}
			}
		})
	})
end

function config.GetTopics(Callback, SelectTopics, InputQuery)
	-- upvalues: UrlModule (copy), HttpService (copy), CatalogConstantsModule (copy)
	return Callback(string.format("%sv1/topic/get-topics", UrlModule.CATALOG_URL), "POST", {
		postBody = HttpService:JSONEncode({
			selectTopics = SelectTopics,
			inputQuery = InputQuery,
			maxResult = CatalogConstantsModule.MaxTopics
		})
	})
end

function config.GetInitialTopics(Callback, Items)
	-- upvalues: UrlModule (copy), CatalogConstantsModule (copy), DashModule (copy), HttpService (copy)
	local Formatted = string.format("%sv1/topic/get-topics", UrlModule.CATALOG_URL)
	
	if CatalogConstantsModule.MaxItemsInTopicsRequest < #Items then
		Items = DashModule.slice(Items, 1, CatalogConstantsModule.MaxItemsInTopicsRequest)
	end
	return Callback(Formatted, "POST", {
		postBody = HttpService:JSONEncode({
			items = Items,
			maxResult = CatalogConstantsModule.MaxTopics
		})
	})
end

function config.GetCatalogMetadata(Callback)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%s/v1/catalog/metadata", UrlModule.CATALOG_URL), "GET")
end

function config.FetchAssetVersionData(Callback, p1)
	-- upvalues: Formatted (copy)
	return Callback(string.format("%sv1/assets/%s/saved-versions", Formatted, p1), "GET")
end

function config.GetLookDetails(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%slook-api/v1/looks/%s", UrlModule.APIS_URL, p1), "GET")
end

function config.HasFavoritedLook(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%slook-api/v1/looks/%s/favorite", UrlModule.APIS_URL, p1), "GET")
end

if FFlagAXCatalogMakeupSupport then
	function config.FavoriteLookV2(Callback, Id, p1)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%slook-api/v1/looks/favorite/create", UrlModule.APIS_URL), "POST", {
			postBody = HttpService:JSONEncode({ id = Id, lookType = p1 or "" })
		})
	end
else
	function config.FavoriteLook(Callback, Id)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%slook-api/v1/looks/favorite/create", UrlModule.APIS_URL), "POST", {
			postBody = HttpService:JSONEncode({ lookType = "Avatar", id = Id })
		})
	end
end
if FFlagAXCatalogMakeupSupport then
	function config.UnfavoriteLookV2(Callback, Id, p1)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%slook-api/v1/looks/favorite/delete", UrlModule.APIS_URL), "POST", {
			postBody = HttpService:JSONEncode({ id = Id, lookType = p1 or "" })
		})
	end
else
	function config.UnfavoriteLook(Callback, Id)
		-- upvalues: UrlModule (copy), HttpService (copy)
		return Callback(string.format("%slook-api/v1/looks/favorite/delete", UrlModule.APIS_URL), "POST", {
			postBody = HttpService:JSONEncode({ lookType = "Avatar", id = Id })
		})
	end
end
function config.GetLookDetailsV2(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%slook-api/v2/looks/%s", UrlModule.APIS_URL, p1), "GET")
end

function config.DeleteLook(Callback, p1)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%slook-api/v1/looks/%s", UrlModule.APIS_URL, p1), "DELETE")
end

function config.PurchaseLook(Callback, LookId, IdempotencyKey, ExpectedPrice, SalesLocationId, ExcludedItems)
	-- upvalues: UrlModule (copy), HttpService (copy)
	return Callback(string.format("%slook-api/v1/looks/%s/purchase", UrlModule.APIS_URL, LookId), "POST", {
		postBody = HttpService:JSONEncode({
			lookId = LookId,
			idempotencyKey = IdempotencyKey,
			expectedPrice = ExpectedPrice,
			salesLocationId = SalesLocationId,
			excludedItems = ExcludedItems
		})
	})
end

function config.PurchaseLookV2(Callback, LookId, IdempotencyKey, ExpectedPrice, SalesLocationId, ExcludedAssets, ExcludedBundles, TimedOptions)
	-- upvalues: UrlModule (copy), HttpService (copy)
	return Callback(string.format("%slook-api/v2/looks/%s/purchase", UrlModule.APIS_URL, LookId), "POST", {
		postBody = HttpService:JSONEncode({
			lookId = LookId,
			idempotencyKey = IdempotencyKey,
			expectedPrice = ExpectedPrice,
			salesLocationId = SalesLocationId,
			excludedAssets = ExcludedAssets,
			excludedBundles = ExcludedBundles,
			timedOptions = TimedOptions
		})
	})
end

function config.GetOrGenerateShortShareLink(ItemId, ItemType)
	-- upvalues: LuaSocialLibrariesDepsModule (copy), ShareLinksNetworkingModule (copy)
	return ShareLinksNetworkingModule.config({
		useMockedResponse = false,
		roduxNetworking = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
			keyPath = "AvatarExperience",
			networkImpl = LuaSocialLibrariesDepsModule.httpRequest.config({
				maxWaitTime = 3,
				requestFunction = LuaSocialLibrariesDepsModule.httpRequest.requestFunctions.HttpRbxApi,
				maxRetryCount = game:DefineFastInt("CatalogWebApiHttpRetryCount", 2)
			})
		})
	}).GetOrGenerateLink.API({
		linkType = "AvatarItemDetails",
		itemId = ItemId,
		itemType = ItemType
	})
end

return config