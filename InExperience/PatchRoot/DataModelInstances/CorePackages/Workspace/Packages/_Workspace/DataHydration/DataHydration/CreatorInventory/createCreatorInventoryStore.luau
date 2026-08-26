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

local function _(p1)
	return {
		query = p1.query,
		assetType = p1.assetType,
		universeId = p1.universeId,
		maxPageSize = p1.maxPageSize,
		pageToken = p1.pageToken
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

local _ = function(value, p1)
	return `{value}:{p1}`
end

return function(p1)
	-- upvalues: getLocalPlayerUserId (ref), createDataCacheModule (ref), createDataResolverModule (ref), fetchCreatorInventorySearchModule (ref), httpService (ref), t (ref), t_1 (ref)
	p1 = p1 or {}
	
	local function _()
		-- upvalues: p1 (ref), getLocalPlayerUserId (copy)
		return if p1.getLocalPlayerUserId == nil then getLocalPlayerUserId() else p1.getLocalPlayerUserId()
	end
	
	local t_2 = {}
	local var1 = false
	local var2 = nil
	
	local function normalizeResponse(p2, p3, p4)
		local t = {}
		local t_1 = {}
		
		for i, v in p4.items do
			local assetItem = v.assetItem
			
			if assetItem ~= nil then
				local asset = assetItem.asset
				local assetId = asset.assetId
				table.insert(t, assetId)
				t_1[`{p3}:{assetId}`] = {
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
		p2.replaceItems(t_1)
		
		return { assetIds = t, nextPageToken = p4.nextPageToken }
	end
	
	local var3 = nil
	local var4 = nil
	
	local function createGeneration()
		-- upvalues: var2 (write), createDataCacheModule (copy), createDataResolverModule (copy), t_2 (write), p1 (ref), getLocalPlayerUserId (copy), fetchCreatorInventorySearchModule (copy), normalizeResponse (ref), var3 (write), var4 (write)
		local t = {}
		var2 = t
		local var5 = createDataCacheModule()
		var3 = var5
		var4 = createDataResolverModule({
			supportsMultiGet = false,
			replaceItems = true,
			cache = createDataCacheModule(),
			fetchFn = function(p5, _)
				-- upvalues: t_2 (copy), p1 (copy), getLocalPlayerUserId (copy), fetchCreatorInventorySearchModule (copy), var2 (copy), t (ref), normalizeResponse (copy), var5 (ref)
				local var6 = t_2[p5]
				assert(var6 ~= nil, `Missing Creator Inventory params for {p5}`)
				local var7 = if p1.getLocalPlayerUserId ~= nil then getLocalPlayerUserId() else p1.getLocalPlayerUserId()
				
				return fetchCreatorInventorySearchModule(var6, { network = p1.network, baseUrl = p1.baseUrl }):andThen(function(p6)
					-- upvalues: var2 (copy), t (copy), var7 (ref), p1 (copy), getLocalPlayerUserId (copy), normalizeResponse (copy), var5 (copy), var6 (ref)
					return if var2 == t and var7 == (if p1.getLocalPlayerUserId ~= nil then getLocalPlayerUserId() else p1.getLocalPlayerUserId()) then normalizeResponse(var5, var6.universeId, p6) else { nextPageToken = nil, assetIds = {} }
				end)
			end
		})
	end
	
	createGeneration()
	
	local _ = function()
		-- upvalues: var2 (write), var4 (write), var3 (write)
		var2 = nil
		var4.clear()
		var4.dispose()
		var3.dispose()
	end
	
	local _ = function(p5)
		-- upvalues: httpService (copy), t_2 (write)
		local var6 = httpService:JSONEncode({
			query = p5.query,
			assetType = p5.assetType,
			universeId = p5.universeId,
			maxPageSize = p5.maxPageSize,
			pageToken = p5.pageToken
		})
		t_2[var6] = {
			query = p5.query,
			assetType = p5.assetType,
			universeId = p5.universeId,
			maxPageSize = p5.maxPageSize,
			pageToken = p5.pageToken
		}
		
		return var6
	end
	
	return {
		getSearch = function(p5)
			-- upvalues: var1 (write), t (copy), var4 (write), httpService (copy), t_2 (write)
			if var1 then
				return t
			end
			local getCachedItem = var4.getCachedItem
			local var6 = httpService:JSONEncode({
				query = p5.query,
				assetType = p5.assetType,
				universeId = p5.universeId,
				maxPageSize = p5.maxPageSize,
				pageToken = p5.pageToken
			})
			t_2[var6] = {
				query = p5.query,
				assetType = p5.assetType,
				universeId = p5.universeId,
				maxPageSize = p5.maxPageSize,
				pageToken = p5.pageToken
			}
			
			return getCachedItem(var6)
		end,
		fetchSearch = function(p5)
			-- upvalues: var1 (write), t (copy), var4 (write), httpService (copy), t_2 (write)
			if var1 then
				return t
			end
			local fetchItem = var4.fetchItem
			local var6 = httpService:JSONEncode({
				query = p5.query,
				assetType = p5.assetType,
				universeId = p5.universeId,
				maxPageSize = p5.maxPageSize,
				pageToken = p5.pageToken
			})
			t_2[var6] = {
				query = p5.query,
				assetType = p5.assetType,
				universeId = p5.universeId,
				maxPageSize = p5.maxPageSize,
				pageToken = p5.pageToken
			}
			
			return fetchItem(var6)
		end,
		getAndFetchSearch = function(p5)
			-- upvalues: var1 (write), t (copy), var4 (write), httpService (copy), t_2 (write)
			if var1 then
				return t
			end
			local getAndFetchItem = var4.getAndFetchItem
			local var6 = httpService:JSONEncode({
				query = p5.query,
				assetType = p5.assetType,
				universeId = p5.universeId,
				maxPageSize = p5.maxPageSize,
				pageToken = p5.pageToken
			})
			t_2[var6] = {
				query = p5.query,
				assetType = p5.assetType,
				universeId = p5.universeId,
				maxPageSize = p5.maxPageSize,
				pageToken = p5.pageToken
			}
			
			return getAndFetchItem(var6)
		end,
		getAsset = function(value, p5)
			-- upvalues: var1 (write), t_1 (copy), var3 (write)
			return if var1 then t_1 else var3.getItem(`{value}:{p5}`)
		end,
		getAssets = function(value, p5)
			-- upvalues: var1 (write), t_1 (copy), var3 (write)
			if var1 then
				local t = {}
				
				for i, v in p5 do
					t[tostring(v)] = t_1
				end
				return t
			else
				local list = table.create(#p5)
				
				for i, v in p5 do
					list[i] = `{value}:{v}`
				end
				local items = var3.getItems(list)
				local t = {}
				
				for i_1, v_1 in p5 do
					t[tostring(v_1)] = items[`{value}:{v_1}`]
				end
				return t
			end
		end,
		invalidateAll = function()
			-- upvalues: var1 (write), var2 (write), var4 (write), var3 (write), t_2 (write), createGeneration (ref)
			if var1 then
				return
			end
			var2 = nil
			var4.clear()
			var4.dispose()
			var3.dispose()
			t_2 = {}
			createGeneration()
		end,
		dispose = function()
			-- upvalues: var1 (write), var2 (write), var4 (write), var3 (write), t_2 (write)
			if var1 then
				return
			end
			var1 = true
			var2 = nil
			var4.clear()
			var4.dispose()
			var3.dispose()
			t_2 = {}
		end
	}
end