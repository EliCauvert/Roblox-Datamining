local _ = require(script:FindFirstAncestor("DataHydration").DataHydrationTypes)
local _ = require(script.Parent.BuildLibraryDataStoreTypes)
local buildLibraryCacheModule = require(script.Parent.BuildLibraryCache)
local createBuildLibraryListResolverModule = require(script.Parent.createBuildLibraryListResolver)

local function createState()
	-- upvalues: buildLibraryCacheModule (ref), createBuildLibraryListResolverModule (ref)
	local var1 = buildLibraryCacheModule.createBuildLibraryCache()
	local var2 = createBuildLibraryListResolverModule(var1)
	
	return {
		resolver = var2,
		cache = var1,
		dispose = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.retire()
			var2.clear()
			var2.dispose()
			var1.itemCache.dispose()
		end
	}
end

return function()
	-- upvalues: createState (ref), buildLibraryCacheModule (ref)
	local var1 = createState()
	
	local function _()
		-- upvalues: var1 (write)
		return assert(var1, "Library data store is disposed")
	end
	
	return {
		getList = function(p1)
			-- upvalues: var1 (write), buildLibraryCacheModule (copy)
			return assert(var1, "Library data store is disposed").resolver.getCachedItem(buildLibraryCacheModule.listKey(p1))
		end,
		fetchList = function(p1)
			-- upvalues: var1 (write), buildLibraryCacheModule (copy)
			return assert(var1, "Library data store is disposed").resolver.fetchItem(buildLibraryCacheModule.listKey(p1))
		end,
		getAndFetchList = function(p1)
			-- upvalues: var1 (write), buildLibraryCacheModule (copy)
			return assert(var1, "Library data store is disposed").resolver.getAndFetchItem(buildLibraryCacheModule.listKey(p1))
		end,
		getItem = function(p1)
			-- upvalues: var1 (write), buildLibraryCacheModule (copy)
			return assert(var1, "Library data store is disposed").cache.itemCache.getItem(buildLibraryCacheModule.itemKey(p1))
		end,
		clear = function()
			-- upvalues: var1 (write), createState (copy)
			assert(var1, "Library data store is disposed").dispose()
			var1 = createState()
		end,
		dispose = function()
			-- upvalues: var1 (write)
			if var1 ~= nil then
				var1.dispose()
				var1 = nil
			end
		end
	}
end