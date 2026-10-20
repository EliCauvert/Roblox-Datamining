local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local PromiseModule = require(Parent.Promise)
local CatalogNetworkingModule = require(Parent.CatalogNetworking)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local EnumsModule = require(ProfilePlatform.Common.Enums)
local MyRoduxNetworkingImplModule = require(ProfilePlatform.Networking.myRoduxNetworkingImpl)
local InspectAvatarUtilsModule = require(script.Parent.InspectAvatarUtils)
local _ = require(ProfilePlatform.Common.Types)
local PurchaseDetailsStore = CatalogNetworkingModule.PurchaseDetailsStore
local CollectibleProductIdStore = CatalogNetworkingModule.CollectibleProductIdStore
local BundleOwnershipStore = CatalogNetworkingModule.BundleOwnershipStore
local ItemDetailsStore = CatalogNetworkingModule.ItemDetailsStore

local function useLookApiData(p1)
	-- upvalues: UseSignalStateFunction (copy), PurchaseDetailsStore (copy), ReactModule (copy), DashModule (copy), EnumsModule (copy), MyRoduxNetworkingImplModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(PurchaseDetailsStore.getCache)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(true)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2_1 (copy), DashModule (upval), EnumsModule (upval), UseStateResult2 (copy), PurchaseDetailsStore (upval), MyRoduxNetworkingImplModule (upval)
		if #p1 == 0 then
			UseStateResult2_1(false)
			
			return
		end
		local CollectArrayResult = DashModule.collectArray(p1, function(_, p2)
			-- upvalues: EnumsModule (upval)
			return if p2.itemType == EnumsModule.ItemTypes.Bundle then nil else { id = tonumber(p2.assetId) or p2.assetId }
		end)
		
		if #CollectArrayResult == 0 then
			UseStateResult2_1(false)
			
			return
		else
			UseStateResult2_1(true)
			UseStateResult2({})
			PurchaseDetailsStore.fetchAll(MyRoduxNetworkingImplModule, CollectArrayResult):andThen(function(Result)
				-- upvalues: DashModule (upval), UseStateResult2 (upval)
				if Result and Result.look and Result.look.items then
					UseStateResult2((DashModule.map(Result.look.items, function(p2): string
						return (tostring(p2.id))
					end)))
				end
			end, function(p2)
				warn("[useInspectAvatarData] Failed to fetch purchase details:", (tostring(p2)))
			end):finally(function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end)
		end
	end, { p1 })
	
	return {
		responseIds = UseStateResult,
		cache = UseSignalStateResult,
		isLoading = UseStateResult1
	}
end

local function useCatalogEnrichment(p1, p2)
	-- upvalues: UseSignalStateFunction (copy), ItemDetailsStore (copy), ReactModule (copy), CollectibleProductIdStore (copy), BundleOwnershipStore (copy), EnumsModule (copy), MyRoduxNetworkingImplModule (copy), PromiseModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(ItemDetailsStore.getCache)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseSignalStateResult1 = UseSignalStateFunction(CollectibleProductIdStore.getCache)
	local UseSignalStateResult2 = UseSignalStateFunction(BundleOwnershipStore.getCache)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy), UseStateResult2 (copy), EnumsModule (upval), ItemDetailsStore (upval), MyRoduxNetworkingImplModule (upval), PromiseModule (upval), BundleOwnershipStore (upval)
		if p1.isLoading then return end
		if #p2 == 0 then
			UseStateResult2(false)
			
			return
		end
		local ItemTypes = {}
		local List = {}
		
		for _, value in p2 do
			ItemTypes[tostring(value.assetId)] = value.itemType or "Asset"
			
			if value.itemType == EnumsModule.ItemTypes.Bundle then
				local Number: number? = tonumber(value.assetId)
				
				if Number then
					table.insert(List, Number)
				end
			end
		end
		local List1 = {}
		local t = {}
		
		for _, responseId in p1.responseIds do
			local Number: number? = tonumber(responseId)
			
			if Number and not t[responseId] then
				t[responseId] = true
				table.insert(List1, {
					id = Number,
					itemType = ItemTypes[responseId] or "Bundle"
				})
			end
		end
		for _, value1 in p2 do
			local Text = tostring(value1.assetId)
			local Number: number? = tonumber(value1.assetId)
			
			if Number and not t[Text] then
				t[Text] = true
				table.insert(List1, { id = Number, itemType = value1.itemType or "Asset" })
			end
		end
		if #List1 == 0 and #List == 0 then
			UseStateResult2(false)
			
			return
		else
			UseStateResult2(true)
			PromiseModule.all({
				if #List1 > 0 then ItemDetailsStore.fetchAndCache(MyRoduxNetworkingImplModule, List1) else PromiseModule.resolve(),
				if #List > 0 then BundleOwnershipStore.fetchAndCache(MyRoduxNetworkingImplModule, List):catch(function(Err)
					warn("[useInspectAvatarData] Failed to fetch bundle ownership:", (tostring(Err)))
				end) else PromiseModule.resolve()
			}):andThen(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end):catch(function(Err)
				-- upvalues: UseStateResult2 (upval)
				warn("[useInspectAvatarData] Failed to fetch catalog details:", (tostring(Err)))
				UseStateResult2(false)
			end)
		end
	end, { p1.responseIds, p1.isLoading, p2 })
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseSignalStateResult (copy), EnumsModule (upval), p1 (copy), CollectibleProductIdStore (upval), MyRoduxNetworkingImplModule (upval)
		local CollectibleItemIds = {}
		local t = {}
		
		for _, value in p2 do
			local UseSignalStateResultEntry = UseSignalStateResult[tostring(value.assetId)]
			
			if UseSignalStateResultEntry and UseSignalStateResultEntry.collectibleItemId then
				local CollectibleItemId = UseSignalStateResultEntry.collectibleItemId
				
				if not t[CollectibleItemId] then
					local IsHasResellers = UseSignalStateResultEntry.hasResellers == true
					
					if value.itemType == EnumsModule.ItemTypes.Bundle and not UseSignalStateResultEntry.isOffSale or IsHasResellers then
						t[CollectibleItemId] = true
						table.insert(CollectibleItemIds, CollectibleItemId)
					end
				end
			end
		end
		for _, responseId in p1.responseIds do
			local UseSignalStateResultEntry = UseSignalStateResult[responseId]
			
			if UseSignalStateResultEntry and UseSignalStateResultEntry.collectibleItemId then
				local CollectibleItemId = UseSignalStateResultEntry.collectibleItemId
				
				if not t[CollectibleItemId] and UseSignalStateResultEntry.hasResellers == true then
					t[CollectibleItemId] = true
					table.insert(CollectibleItemIds, CollectibleItemId)
				end
			end
		end
		if #CollectibleItemIds ~= 0 then
			CollectibleProductIdStore.fetchAndCache(MyRoduxNetworkingImplModule, CollectibleItemIds):catch(function(Err)
				warn("[useInspectAvatarData] Failed to fetch collectible product IDs:", (tostring(Err)))
			end)
			
			return
		end
	end, { UseSignalStateResult, p2, p1.responseIds })
	
	return {
		catalogDetails = UseSignalStateResult,
		isCatalogLoading = UseStateResult,
		ownershipCache = UseSignalStateResult2,
		collectibleCache = UseSignalStateResult1
	}
end

return function(p3)
	-- upvalues: UseLocalUserIdFunction (copy), useLookApiData (copy), useCatalogEnrichment (copy), ReactModule (copy), InspectAvatarUtilsModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseLookApiDataResult = useLookApiData(p3)
	local UseCatalogEnrichmentResult = useCatalogEnrichment(UseLookApiDataResult, p3)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p3 (copy), InspectAvatarUtilsModule (upval), UseLookApiDataResult (copy), UseCatalogEnrichmentResult (copy)
		if #p3 == 0 then
			return {}
		end
		local t = {}
		
		for _, value in p3 do
			t[tostring(value.assetId)] = true
		end
		local CollectBundleComponentIdsResult = InspectAvatarUtilsModule.collectBundleComponentIds(UseLookApiDataResult.responseIds, UseLookApiDataResult.cache)
		local ItemDatas = {}
		local t1 = {}
		
		for _, responseId in UseLookApiDataResult.responseIds do
			local CacheEntry = UseLookApiDataResult.cache[responseId]
			
			if CacheEntry then
				t1[responseId] = true
				
				if CacheEntry.assetsInBundle or not CollectBundleComponentIdsResult[responseId] then
					local CatalogDetail = UseCatalogEnrichmentResult.catalogDetails[responseId]
					
					if CatalogDetail then
						local ResaleProductId = nil
						
						if CatalogDetail.collectibleItemId then
							local Collectible = UseCatalogEnrichmentResult.collectibleCache[CatalogDetail.collectibleItemId]
							ResaleProductId = if Collectible then Collectible.resaleProductId else nil
						end
						table.insert(ItemDatas, InspectAvatarUtilsModule.buildItemData(CatalogDetail, CacheEntry, t, nil, nil, ResaleProductId))
					end
				end
			end
		end
		for _, value1 in p3 do
			local Text = tostring(value1.assetId)
			
			if not t1[Text] and not CollectBundleComponentIdsResult[Text] then
				local CatalogDetail = UseCatalogEnrichmentResult.catalogDetails[Text]
				
				if CatalogDetail then
					local ProductId = nil
					local ResaleProductId = nil
					
					if CatalogDetail.collectibleItemId then
						local Collectible = UseCatalogEnrichmentResult.collectibleCache[CatalogDetail.collectibleItemId]
						
						if Collectible then
							ProductId = Collectible.productId
							ResaleProductId = Collectible.resaleProductId
						end
					end
					table.insert(ItemDatas, InspectAvatarUtilsModule.buildItemData(CatalogDetail, nil, t, ProductId, UseCatalogEnrichmentResult.ownershipCache[Text], ResaleProductId))
				end
			end
		end
		return InspectAvatarUtilsModule.sortDisplayItems(ItemDatas)
	end, {
		UseLookApiDataResult.responseIds, UseLookApiDataResult.cache, p3,
		UseCatalogEnrichmentResult.catalogDetails,
		UseCatalogEnrichmentResult.collectibleCache,
		UseCatalogEnrichmentResult.ownershipCache
	})
	
	return {
		displayItems = UseMemoResult,
		ownedAssetIds = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy), InspectAvatarUtilsModule (upval)
			local List = {}
			local t = {}
			
			for _, value in UseMemoResult do
				if value.isOwned then
					if #value.bundleAssetIds <= 0 then
						local Number: number? = tonumber(value.id)
						local Number1 = if value.itemSubType then tonumber(value.itemSubType) else nil
						
						if Number and (not Number1 or InspectAvatarUtilsModule.isWearableAssetType(Number1)) and not t[Number] then
							t[Number] = true
							table.insert(List, Number)
							continue
						end
						continue
					end
					for _, bundleAssetId in value.bundleAssetIds do
						if not t[bundleAssetId] then
							t[bundleAssetId] = true
							table.insert(List, bundleAssetId)
						end
					end
				end
			end
			return List
		end, { UseMemoResult }),
		localUserId = UseLocalUserIdResult,
		isLoading = UseLookApiDataResult.isLoading or UseCatalogEnrichmentResult.isCatalogLoading
	}
end