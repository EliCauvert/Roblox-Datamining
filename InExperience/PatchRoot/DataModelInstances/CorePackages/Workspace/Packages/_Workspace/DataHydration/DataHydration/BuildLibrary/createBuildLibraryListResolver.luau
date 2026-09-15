local httpService = game:GetService("HttpService")
local dataHydration = script:FindFirstAncestor("DataHydration")
local promiseModule = require(dataHydration.Parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.BuildLibraryDataStoreTypes)
local _ = require(script.Parent.BuildLibraryCache)
local buildLibraryInventoryModule = require(script.Parent.BuildLibraryInventory)
local buildLibraryQueryModule = require(script.Parent.BuildLibraryQuery)

return function(p1)
	-- upvalues: createDataResolverModule (ref), createDataCacheModule (ref), httpService (ref), promiseModule (ref), buildLibraryInventoryModule (ref), buildLibraryQueryModule (ref)
	return createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		requestTimeoutSec = 90,
		cache = createDataCacheModule(),
		fetchFn = function(p2)
			-- upvalues: httpService (copy), p1 (ref), promiseModule (copy), buildLibraryInventoryModule (copy), buildLibraryQueryModule (copy)
			local var1 = httpService:JSONDecode(p2)
			local var2 = p1.nextSequence()
			
			return (if var1.source.kind == "LocalDataModel" then promiseModule.resolve(buildLibraryInventoryModule.query(var1)) else p1.executeQuery({
				selectors = buildLibraryQueryModule.selectorsForKind(var1.itemKind),
				ids = var1.ids,
				offset = var1.offset,
				limit = var1.limit,
				search = var1.query,
				includeInstances = var1.itemKind == "Model"
			})):andThen(function(p3)
				-- upvalues: p1 (copy), var1 (ref), var2 (ref)
				p1.assertActive()
				assert(if var1.generation ~= nil then var1.generation == p3.generation else true, "Stale Library list generation")
				local var3, var4 = p1.decodeItems(p3, var1.itemKind)
				
				for i, v in var3 do
					if v.kind == "Model" and v.model == nil then
						var4 = var4 or "Instance preview is unavailable"
					end
				end
				return {
					itemKind = var1.itemKind,
					generation = p3.generation,
					count = p3.total,
					itemIds = p1.cacheItems(var1.source, var3, var2),
					hasMore = p3.hasMore,
					nextOffset = p3.nextOffset,
					previewError = var4
				}
			end)
		end
	})
end