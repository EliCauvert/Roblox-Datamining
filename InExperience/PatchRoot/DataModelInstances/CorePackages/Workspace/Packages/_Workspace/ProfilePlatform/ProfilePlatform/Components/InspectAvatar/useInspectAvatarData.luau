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

local function useLookApiData(p0)
	-- upvalues: useSignalState (ref), purchaseDetailsStore (ref), reactModule (ref), dashModule (ref), enumsModule (ref), myRoduxNetworkingImplModule (ref)
	local var11 = useSignalState(purchaseDetailsStore.getCache)
	local var12, var13 = reactModule.useState({})
	local var14, var15 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var15 (ref), dashModule (copy), enumsModule (copy), var13 (ref), purchaseDetailsStore (copy), myRoduxNetworkingImplModule (copy)
		if #p0 == 0 then
			var15(false)
			
			return
		end
		local var16 = dashModule.collectArray(p0, function(_, p1)
			-- upvalues: enumsModule (copy)
			return if p1.itemType == enumsModule.ItemTypes.Bundle then nil else { id = tonumber(p1.assetId) or p1.assetId }
		end)
		
		if #var16 == 0 then
			var15(false)
			
			return
		end
		var15(true)
		var13({})
		purchaseDetailsStore.fetchAll(myRoduxNetworkingImplModule, var16):andThen(function(p2)
			-- upvalues: dashModule (copy), var13 (copy)
			if p2 and p2.look and p2.look.items then
				var13(dashModule.map(p2.look.items, function(p3)
					return tostring(p3.id)
				end))
			end
		end, function(p4)
			warn("[useInspectAvatarData] Failed to fetch purchase details:", tostring(p4))
		end):finally(function()
			-- upvalues: var15 (copy)
			var15(false)
		end)
	end, { p0 })
	
	return { responseIds = var12, cache = var11, isLoading = var14 }
end

local function useCatalogEnrichment(p5, p6)
	-- upvalues: useSignalState (ref), itemDetailsStore (ref), reactModule (ref), collectibleProductIdStore (ref), bundleOwnershipStore (ref), enumsModule (ref), myRoduxNetworkingImplModule (ref), promiseModule (ref)
	local var17 = useSignalState(itemDetailsStore.getCache)
	local var18, var19 = reactModule.useState(true)
	local var20 = useSignalState(collectibleProductIdStore.getCache)
	local var21 = useSignalState(bundleOwnershipStore.getCache)
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), p6 (ref), var19 (ref), enumsModule (copy), itemDetailsStore (copy), myRoduxNetworkingImplModule (copy), promiseModule (copy), bundleOwnershipStore (copy)
		if p5.isLoading then return end
		if #p6 == 0 then
			var19(false)
			
			return
		end
		local t = {}
		local t_1 = {}
		
		for i, v in p6 do
			t[tostring(v.assetId)] = v.itemType or "Asset"
			
			if v.itemType == enumsModule.ItemTypes.Bundle then
				local var29 = tonumber(v.assetId)
				
				if var29 then
					table.insert(t_1, var29)
				end
			end
		end
		local t_2 = {}
		local t_3 = {}
		
		for i_1, v_1 in p5.responseIds do
			local var28 = tonumber(v_1)
			
			if var28 and not t_3[v_1] then
				t_3[v_1] = true
				table.insert(t_2, { id = var28, itemType = t[v_1] or "Bundle" })
			end
		end
		for i_2, v_2 in p6 do
			local var26 = tostring(v_2.assetId)
			local var27 = tonumber(v_2.assetId)
			
			if var27 and not t_3[var26] then
				t_3[var26] = true
				table.insert(t_2, { id = var27, itemType = v_2.itemType or "Asset" })
			end
		end
		if #t_2 == 0 and #t_1 == 0 then
			var19(false)
			
			return
		end
		var19(true)
		promiseModule.all({
			if #t_2 > 0 then itemDetailsStore.fetchAndCache(myRoduxNetworkingImplModule, t_2) else promiseModule.resolve(),
			if #t_1 > 0 then bundleOwnershipStore.fetchAndCache(myRoduxNetworkingImplModule, t_1):catch(function(p8)
				warn("[useInspectAvatarData] Failed to fetch bundle ownership:", tostring(p8))
			end) else promiseModule.resolve()
		}):andThen(function()
			-- upvalues: var19 (copy)
			var19(false)
		end):catch(function(p7)
			-- upvalues: var19 (copy)
			warn("[useInspectAvatarData] Failed to fetch catalog details:", tostring(p7))
			var19(false)
		end)
	end, { p5.responseIds, p5.isLoading, p6 })
	reactModule.useEffect(function()
		-- upvalues: p6 (ref), var17 (ref), enumsModule (copy), p5 (ref), collectibleProductIdStore (copy), myRoduxNetworkingImplModule (copy)
		local var32
		local t = {}
		local t_1 = {}
		
		for i, v in p6 do
			var32 = var17[tostring(v.assetId)]
			
			if var32 and var32.collectibleItemId then
				local collectibleItemId = var32.collectibleItemId
				
				if not t_1[collectibleItemId] then
					if (v.itemType == enumsModule.ItemTypes.Bundle and not var32.isOffSale) or var32.hasResellers == true then
						t_1[collectibleItemId] = true
						table.insert(t, collectibleItemId)
					end
				end
			end
		end
		for i, v in p5.responseIds do
			var32 = var17[v]
			
			if var32 and var32.collectibleItemId then
				local collectibleItemId = var32.collectibleItemId
				
				if not t_1[collectibleItemId] and var32.hasResellers == true then
					t_1[collectibleItemId] = true
					table.insert(t, collectibleItemId)
				end
			end
		end
		if #t == 0 then
			return
		end
		collectibleProductIdStore.fetchAndCache(myRoduxNetworkingImplModule, t):catch(function(p9)
			warn("[useInspectAvatarData] Failed to fetch collectible product IDs:", tostring(p9))
		end)
	end, { var17, p6, p5.responseIds })
	
	return {
		catalogDetails = var17,
		isCatalogLoading = var18,
		ownershipCache = var21,
		collectibleCache = var20
	}
end

return function(p10)
	-- upvalues: useLocalUserId (ref), useLookApiData (ref), useCatalogEnrichment (ref), reactModule (ref), inspectAvatarUtilsModule (ref)
	local var33 = useLocalUserId()
	local var34 = useLookApiData(p10)
	local var35 = useCatalogEnrichment(var34, p10)
	local var36 = reactModule.useMemo(function()
		-- upvalues: p10 (ref), inspectAvatarUtilsModule (copy), var34 (ref), var35 (ref)
		if #p10 == 0 then
			return {}
		end
		local t = {}
		
		for i, v in p10 do
			t[tostring(v.assetId)] = true
		end
		local var41
		local var38 = inspectAvatarUtilsModule.collectBundleComponentIds(var34.responseIds, var34.cache)
		local t_1 = {}
		local t_2 = {}
		
		for i_1, v_1 in var34.responseIds do
			var41 = var34.cache[v_1]
			
			if var41 then
				t_2[v_1] = true
				
				if var41.assetsInBundle or not var38[v_1] then
					local var43 = var35.catalogDetails[v_1]
					
					if var43 then
						local var44 = nil
						
						if var43.collectibleItemId then
							local collectibleItemId = var35.collectibleCache[var43.collectibleItemId]
							var44 = if collectibleItemId then collectibleItemId.resaleProductId else nil
						end
						table.insert(t_1, inspectAvatarUtilsModule.buildItemData(var43, var41, t, nil, nil, var44))
					end
				end
			end
		end
		for i_1, v_2 in p10 do
			var41 = tostring(v_2.assetId)
			
			if not t_2[var41] and not var38[var41] then
				local var42 = var35.catalogDetails[var41]
				
				if var42 then
					local productId = nil
					local resaleProductId = nil
					
					if var42.collectibleItemId then
						local collectibleItemId = var35.collectibleCache[var42.collectibleItemId]
						
						if collectibleItemId then
							productId = collectibleItemId.productId
							resaleProductId = collectibleItemId.resaleProductId
						end
					end
					table.insert(t_1, inspectAvatarUtilsModule.buildItemData(var42, nil, t, productId, var35.ownershipCache[var41], resaleProductId))
				end
			end
		end
		return inspectAvatarUtilsModule.sortDisplayItems(t_1)
	end, {
		var34.responseIds, var34.cache, p10, var35.catalogDetails,
		var35.collectibleCache, var35.ownershipCache
	})
	
	return {
		displayItems = var36,
		ownedAssetIds = reactModule.useMemo(function()
			-- upvalues: var36 (ref), inspectAvatarUtilsModule (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in var36 do
				if v.isOwned then
					if #v.bundleAssetIds > 0 then
						for i_1, v_1 in v.bundleAssetIds do
							if not t_1[v_1] then
								t_1[v_1] = true
								table.insert(t, v_1)
							end
						end
					else
						local var47 = tonumber(v.id)
						local var48 = if v.itemSubType then tonumber(v.itemSubType) else nil
						
						if var47 and (not var48 or inspectAvatarUtilsModule.isWearableAssetType(var48)) and not t_1[var47] then
							t_1[var47] = true
							table.insert(t, var47)
						end
					end
				end
			end
			return t
		end, { var36 }),
		localUserId = var33,
		isLoading = var34.isLoading or var35.isCatalogLoading
	}
end