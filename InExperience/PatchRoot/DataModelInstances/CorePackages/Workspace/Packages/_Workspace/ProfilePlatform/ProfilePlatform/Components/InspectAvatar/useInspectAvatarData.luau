local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local promiseModule = require(parent.Promise)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local catalogNetworkingModule = require(parent.CatalogNetworking)
local useSignalState = require(parent.SignalsReact).useSignalState
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local enumsModule = require(profilePlatform.Common.Enums)
local myRoduxNetworkingImplModule = require(profilePlatform.Networking.myRoduxNetworkingImpl)
local inspectAvatarUtilsModule = require(script.Parent.InspectAvatarUtils)
local _ = require(profilePlatform.Common.Types)
local purchaseDetailsStore = catalogNetworkingModule.PurchaseDetailsStore
local collectibleProductIdStore = catalogNetworkingModule.CollectibleProductIdStore
local bundleOwnershipStore = catalogNetworkingModule.BundleOwnershipStore
local itemDetailsStore = catalogNetworkingModule.ItemDetailsStore

local function useLookApiData(p1)
	-- upvalues: useSignalState (ref), purchaseDetailsStore (ref), reactModule (ref), dashModule (ref), enumsModule (ref), myRoduxNetworkingImplModule (ref)
	local var1 = useSignalState(purchaseDetailsStore.getCache)
	local var2, var3 = reactModule.useState({})
	local var4, var5 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref), dashModule (copy), enumsModule (copy), var3 (ref), purchaseDetailsStore (copy), myRoduxNetworkingImplModule (copy)
		if #p1 == 0 then
			var5(false)
			
			return
		end
		local var6 = dashModule.collectArray(p1, function(_, p2)
			-- upvalues: enumsModule (copy)
			return if p2.itemType == enumsModule.ItemTypes.Bundle then nil else { id = tonumber(p2.assetId) or p2.assetId }
		end)
		
		if #var6 == 0 then
			var5(false)
			
			return
		end
		var5(true)
		var3({})
		purchaseDetailsStore.fetchAll(myRoduxNetworkingImplModule, var6):andThen(function(p2)
			-- upvalues: dashModule (copy), var3 (copy)
			if p2 and p2.look and p2.look.items then
				var3(dashModule.map(p2.look.items, function(p3)
					return tostring(p3.id)
				end))
			end
		end, function(p2)
			warn("[useInspectAvatarData] Failed to fetch purchase details:", tostring(p2))
		end):finally(function()
			-- upvalues: var5 (copy)
			var5(false)
		end)
	end, { p1 })
	
	return { responseIds = var2, cache = var1, isLoading = var4 }
end

local function useCatalogEnrichment(p1, p2)
	-- upvalues: useSignalState (ref), itemDetailsStore (ref), reactModule (ref), collectibleProductIdStore (ref), bundleOwnershipStore (ref), enumsModule (ref), myRoduxNetworkingImplModule (ref), promiseModule (ref)
	local var1 = useSignalState(itemDetailsStore.getCache)
	local var2, var3 = reactModule.useState(true)
	local var4 = useSignalState(collectibleProductIdStore.getCache)
	local var5 = useSignalState(bundleOwnershipStore.getCache)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), var3 (ref), enumsModule (copy), itemDetailsStore (copy), myRoduxNetworkingImplModule (copy), promiseModule (copy), bundleOwnershipStore (copy)
		if p1.isLoading then return end
		if #p2 == 0 then
			var3(false)
			
			return
		end
		local t = {}
		local t_1 = {}
		
		for i, v in p2 do
			t[tostring(v.assetId)] = v.itemType or "Asset"
			
			if v.itemType == enumsModule.ItemTypes.Bundle then
				local var6 = tonumber(v.assetId)
				
				if var6 then
					table.insert(t_1, var6)
				end
			end
		end
		local t_2 = {}
		local t_3 = {}
		
		for i_1, v_1 in p1.responseIds do
			local var7 = tonumber(v_1)
			
			if var7 and not t_3[v_1] then
				t_3[v_1] = true
				table.insert(t_2, { id = var7, itemType = t[v_1] or "Bundle" })
			end
		end
		for i_2, v_2 in p2 do
			local var8 = tostring(v_2.assetId)
			local var9 = tonumber(v_2.assetId)
			
			if var9 and not t_3[var8] then
				t_3[var8] = true
				table.insert(t_2, { id = var9, itemType = v_2.itemType or "Asset" })
			end
		end
		if #t_2 == 0 and #t_1 == 0 then
			var3(false)
			
			return
		end
		var3(true)
		promiseModule.all({
			if #t_2 > 0 then itemDetailsStore.fetchAndCache(myRoduxNetworkingImplModule, t_2) else promiseModule.resolve(),
			if #t_1 > 0 then bundleOwnershipStore.fetchAndCache(myRoduxNetworkingImplModule, t_1):catch(function(p3)
				warn("[useInspectAvatarData] Failed to fetch bundle ownership:", tostring(p3))
			end) else promiseModule.resolve()
		}):andThen(function()
			-- upvalues: var3 (copy)
			var3(false)
		end):catch(function(p3)
			-- upvalues: var3 (copy)
			warn("[useInspectAvatarData] Failed to fetch catalog details:", tostring(p3))
			var3(false)
		end)
	end, { p1.responseIds, p1.isLoading, p2 })
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var1 (ref), enumsModule (copy), p1 (ref), collectibleProductIdStore (copy), myRoduxNetworkingImplModule (copy)
		local var10
		local t = {}
		local t_1 = {}
		
		for i, v in p2 do
			var10 = var1[tostring(v.assetId)]
			
			if var10 and var10.collectibleItemId then
				local collectibleItemId = var10.collectibleItemId
				
				if not t_1[collectibleItemId] then
					if (v.itemType == enumsModule.ItemTypes.Bundle and not var10.isOffSale) or var10.hasResellers == true then
						t_1[collectibleItemId] = true
						table.insert(t, collectibleItemId)
					end
				end
			end
		end
		for i, v in p1.responseIds do
			var10 = var1[v]
			
			if var10 and var10.collectibleItemId then
				local collectibleItemId = var10.collectibleItemId
				
				if not t_1[collectibleItemId] and var10.hasResellers == true then
					t_1[collectibleItemId] = true
					table.insert(t, collectibleItemId)
				end
			end
		end
		if #t == 0 then
			return
		end
		collectibleProductIdStore.fetchAndCache(myRoduxNetworkingImplModule, t):catch(function(p3)
			warn("[useInspectAvatarData] Failed to fetch collectible product IDs:", tostring(p3))
		end)
	end, { var1, p2, p1.responseIds })
	
	return {
		catalogDetails = var1,
		isCatalogLoading = var2,
		ownershipCache = var5,
		collectibleCache = var4
	}
end

return function(p3)
	-- upvalues: useLocalUserId (ref), useLookApiData (ref), useCatalogEnrichment (ref), reactModule (ref), inspectAvatarUtilsModule (ref)
	local var11 = useLocalUserId()
	local var12 = useLookApiData(p3)
	local var13 = useCatalogEnrichment(var12, p3)
	local var14 = reactModule.useMemo(function()
		-- upvalues: p3 (ref), inspectAvatarUtilsModule (copy), var12 (ref), var13 (ref)
		if #p3 == 0 then
			return {}
		end
		local t = {}
		
		for i, v in p3 do
			t[tostring(v.assetId)] = true
		end
		local var15
		local var16 = inspectAvatarUtilsModule.collectBundleComponentIds(var12.responseIds, var12.cache)
		local t_1 = {}
		local t_2 = {}
		
		for i_1, v_1 in var12.responseIds do
			var15 = var12.cache[v_1]
			
			if var15 then
				t_2[v_1] = true
				
				if var15.assetsInBundle or not var16[v_1] then
					local var17 = var13.catalogDetails[v_1]
					
					if var17 then
						local var18 = nil
						
						if var17.collectibleItemId then
							local collectibleItemId = var13.collectibleCache[var17.collectibleItemId]
							var18 = if collectibleItemId then collectibleItemId.resaleProductId else nil
						end
						table.insert(t_1, inspectAvatarUtilsModule.buildItemData(var17, var15, t, nil, nil, var18))
					end
				end
			end
		end
		for i_1, v_2 in p3 do
			var15 = tostring(v_2.assetId)
			
			if not t_2[var15] and not var16[var15] then
				local var19 = var13.catalogDetails[var15]
				
				if var19 then
					local productId = nil
					local resaleProductId = nil
					
					if var19.collectibleItemId then
						local collectibleItemId = var13.collectibleCache[var19.collectibleItemId]
						
						if collectibleItemId then
							productId = collectibleItemId.productId
							resaleProductId = collectibleItemId.resaleProductId
						end
					end
					table.insert(t_1, inspectAvatarUtilsModule.buildItemData(var19, nil, t, productId, var13.ownershipCache[var15], resaleProductId))
				end
			end
		end
		return inspectAvatarUtilsModule.sortDisplayItems(t_1)
	end, {
		var12.responseIds, var12.cache, p3, var13.catalogDetails,
		var13.collectibleCache, var13.ownershipCache
	})
	
	return {
		displayItems = var14,
		ownedAssetIds = reactModule.useMemo(function()
			-- upvalues: var14 (ref), inspectAvatarUtilsModule (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in var14 do
				if v.isOwned then
					if #v.bundleAssetIds > 0 then
						for i_1, v_1 in v.bundleAssetIds do
							if not t_1[v_1] then
								t_1[v_1] = true
								table.insert(t, v_1)
							end
						end
					else
						local var20 = tonumber(v.id)
						local var21 = if v.itemSubType then tonumber(v.itemSubType) else nil
						
						if var20 and (not var21 or inspectAvatarUtilsModule.isWearableAssetType(var21)) and not t_1[var20] then
							t_1[var20] = true
							table.insert(t, var20)
						end
					end
				end
			end
			return t
		end, { var14 }),
		localUserId = var11,
		isLoading = var12.isLoading or var13.isCatalogLoading
	}
end