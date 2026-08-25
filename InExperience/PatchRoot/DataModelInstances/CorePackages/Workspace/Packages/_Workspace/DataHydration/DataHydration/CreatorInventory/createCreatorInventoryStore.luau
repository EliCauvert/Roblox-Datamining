local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local dataHydrationTypesModule = require(dataHydration.DataHydrationTypes)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local _ = require(script.Parent.CreatorInventoryStoreTypes)
local fetchCreatorInventorySearchModule = require(script.Parent.fetchCreatorInventorySearch)
local dataStatus = dataHydrationTypesModule.DataStatus
local t = {
	data = function(_)
		return nil
	end,
	status = function(_)
		-- upvalues: dataStatus (ref)
		return dataStatus.NotReady
	end
}
local t_1 = {
	data = function(_)
		return nil
	end,
	status = function(_)
		-- upvalues: dataStatus (ref)
		return dataStatus.NotReady
	end
}

local function _(p0)
	return {
		query = p0.query,
		assetType = p0.assetType,
		universeId = p0.universeId,
		maxPageSize = p0.maxPageSize,
		pageToken = p0.pageToken
	}
end

local _ = function(p1)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		query = p1.query,
		assetType = p1.assetType,
		universeId = p1.universeId,
		maxPageSize = p1.maxPageSize,
		pageToken = p1.pageToken
	})
end

local _ = function(value, p2)
	return `{value}:{p2}`
end

return function(p3)
	-- upvalues: getLocalPlayerUserId (ref), createDataCacheModule (ref), createDataResolverModule (ref), fetchCreatorInventorySearchModule (ref), httpService (ref), t (ref), t_1 (ref)
	p3 = p3 or {}
	
	local function _()
		-- upvalues: p3 (ref), getLocalPlayerUserId (copy)
		return if p3.getLocalPlayerUserId == nil then getLocalPlayerUserId() else p3.getLocalPlayerUserId()
	end
	
	local t_2 = {}
	local var10 = false
	local var11 = nil
	
	local function normalizeResponse(p4, p5, p6)
		local t = {}
		local t_1 = {}
		
		for i, v in p6.items do
			local assetItem = v.assetItem
			
			if assetItem ~= nil then
				local asset = assetItem.asset
				local assetId = asset.assetId
				table.insert(t, assetId)
				t_1[`{p5}:{assetId}`] = {
					assetId = assetId,
					displayName = asset.displayName,
					description = asset.description,
					assetType = asset.assetType,
					creationContext = asset.creationContext or {},
					state = asset.state,
					assetSubType = asset.assetSubType,
					createTime = asset.createTime,
					updateTime = asset.updateTime,
					sources = assetItem.sources or {},
					isPackage = assetItem.isPackage
				}
			end
		end
		p4.replaceItems(t_1)
		
		return { assetIds = t, nextPageToken = p6.nextPageToken }
	end
	
	local var13 = nil
	local var14 = nil
	
	local function createGeneration()
		-- upvalues: var11 (write), createDataCacheModule (copy), createDataResolverModule (copy), t_2 (write), p3 (ref), getLocalPlayerUserId (copy), fetchCreatorInventorySearchModule (copy), normalizeResponse (ref), var13 (write), var14 (write)
		local t = {}
		var11 = t
		local var19 = createDataCacheModule()
		var13 = var19
		var14 = createDataResolverModule({
			supportsMultiGet = false,
			replaceItems = true,
			cache = createDataCacheModule(),
			fetchFn = function(p7, _)
				-- upvalues: t_2 (copy), p3 (copy), getLocalPlayerUserId (copy), fetchCreatorInventorySearchModule (copy), var11 (copy), t (ref), normalizeResponse (copy), var19 (ref)
				local var20 = t_2[p7]
				assert(var20 ~= nil, `Missing Creator Inventory params for {p7}`)
				local var21 = if p3.getLocalPlayerUserId ~= nil then getLocalPlayerUserId() else p3.getLocalPlayerUserId()
				
				return fetchCreatorInventorySearchModule(var20, { network = p3.network, baseUrl = p3.baseUrl }):andThen(function(p8)
					-- upvalues: var11 (copy), t (copy), var21 (ref), p3 (copy), getLocalPlayerUserId (copy), normalizeResponse (copy), var19 (copy), var20 (ref)
					return if var11 == t and var21 == (if p3.getLocalPlayerUserId ~= nil then getLocalPlayerUserId() else p3.getLocalPlayerUserId()) then normalizeResponse(var19, var20.universeId, p8) else { nextPageToken = nil, assetIds = {} }
				end)
			end
		})
	end
	
	createGeneration()
	
	local _ = function()
		-- upvalues: var11 (write), var14 (write), var13 (write)
		var11 = nil
		var14.clear()
		var14.dispose()
		var13.dispose()
	end
	
	local _ = function(p9)
		-- upvalues: httpService (copy), t_2 (write)
		local var22 = httpService:JSONEncode({
			query = p9.query,
			assetType = p9.assetType,
			universeId = p9.universeId,
			maxPageSize = p9.maxPageSize,
			pageToken = p9.pageToken
		})
		t_2[var22] = {
			query = p9.query,
			assetType = p9.assetType,
			universeId = p9.universeId,
			maxPageSize = p9.maxPageSize,
			pageToken = p9.pageToken
		}
		
		return var22
	end
	
	return {
		getSearch = function(p10)
			-- upvalues: var10 (write), t (copy), var14 (write), httpService (copy), t_2 (write)
			if var10 then
				return t
			end
			local getCachedItem = var14.getCachedItem
			local var23 = httpService:JSONEncode({
				query = p10.query,
				assetType = p10.assetType,
				universeId = p10.universeId,
				maxPageSize = p10.maxPageSize,
				pageToken = p10.pageToken
			})
			t_2[var23] = {
				query = p10.query,
				assetType = p10.assetType,
				universeId = p10.universeId,
				maxPageSize = p10.maxPageSize,
				pageToken = p10.pageToken
			}
			
			return getCachedItem(var23)
		end,
		fetchSearch = function(p11)
			-- upvalues: var10 (write), t (copy), var14 (write), httpService (copy), t_2 (write)
			if var10 then
				return t
			end
			local fetchItem = var14.fetchItem
			local var24 = httpService:JSONEncode({
				query = p11.query,
				assetType = p11.assetType,
				universeId = p11.universeId,
				maxPageSize = p11.maxPageSize,
				pageToken = p11.pageToken
			})
			t_2[var24] = {
				query = p11.query,
				assetType = p11.assetType,
				universeId = p11.universeId,
				maxPageSize = p11.maxPageSize,
				pageToken = p11.pageToken
			}
			
			return fetchItem(var24)
		end,
		getAndFetchSearch = function(p12)
			-- upvalues: var10 (write), t (copy), var14 (write), httpService (copy), t_2 (write)
			if var10 then
				return t
			end
			local getAndFetchItem = var14.getAndFetchItem
			local var25 = httpService:JSONEncode({
				query = p12.query,
				assetType = p12.assetType,
				universeId = p12.universeId,
				maxPageSize = p12.maxPageSize,
				pageToken = p12.pageToken
			})
			t_2[var25] = {
				query = p12.query,
				assetType = p12.assetType,
				universeId = p12.universeId,
				maxPageSize = p12.maxPageSize,
				pageToken = p12.pageToken
			}
			
			return getAndFetchItem(var25)
		end,
		getAsset = function(value, p13)
			-- upvalues: var10 (write), t_1 (copy), var13 (write)
			return if var10 then t_1 else var13.getItem(`{value}:{p13}`)
		end,
		getAssets = function(value, p14)
			-- upvalues: var10 (write), t_1 (copy), var13 (write)
			if var10 then
				local t = {}
				
				for i, v in p14 do
					t[tostring(v)] = t_1
				end
				return t
			else
				local list = table.create(#p14)
				
				for i, v in p14 do
					list[i] = `{value}:{v}`
				end
				local items = var13.getItems(list)
				local t = {}
				
				for i_1, v_1 in p14 do
					t[tostring(v_1)] = items[`{value}:{v_1}`]
				end
				return t
			end
		end,
		invalidateAll = function()
			-- upvalues: var10 (write), var11 (write), var14 (write), var13 (write), t_2 (write), createGeneration (ref)
			if var10 then
				return
			end
			var11 = nil
			var14.clear()
			var14.dispose()
			var13.dispose()
			t_2 = {}
			createGeneration()
		end,
		dispose = function()
			-- upvalues: var10 (write), var11 (write), var14 (write), var13 (write), t_2 (write)
			if var10 then
				return
			end
			var10 = true
			var11 = nil
			var14.clear()
			var14.dispose()
			var13.dispose()
			t_2 = {}
		end
	}
end