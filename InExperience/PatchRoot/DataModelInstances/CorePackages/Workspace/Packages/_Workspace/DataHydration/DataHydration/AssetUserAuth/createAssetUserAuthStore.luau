local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchAssetUserAuthModule = require(script.Parent.fetchAssetUserAuth)
local _ = require(script.Parent.AssetUserAuthStoreTypes)

local function ALWAYS_REFRESH() --[[ line: 22 ]]
	return true
end

return function(value) --[[ line: 28 | named "createAssetUserAuthStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fetchAssetUserAuthModule (ref), ALWAYS_REFRESH (ref)
	local value_1 = value or {}
	local t = { network = value_1.network, baseUrl = value_1.baseUrl }
	local var7 = createDataCacheModule()
	local var8 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var7,
		fetchFn = function(p0, _) --[[ line: 36 ]]
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref)
			return fetchAssetUserAuthModule.fetchOperation(p0, t)
		end
	})
	
	return {
		patchAssetIcon = function(value, p1) --[[ line: 41 ]]
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), var7 (ref)
			return fetchAssetUserAuthModule.patchAssetIcon(value, p1, t):andThen(function(p2) --[[ line: 42 ]]
				-- upvalues: var7 (copy)
				local path = p2.path
				
				if typeof(path) == "string" and #path > 0 then
					var7.updateItem(string.match(path, "operations/(.+)$") or path, p2)
				end
				return p2
			end)
		end,
		getOperation = var8.getCachedItem,
		fetchOperation = var8.fetchItem,
		getAndFetchOperation = function(p3) --[[ line: 64 ]]
			-- upvalues: var8 (ref), ALWAYS_REFRESH (copy)
			return var8.getAndFetchItem(p3, ALWAYS_REFRESH)
		end,
		refreshOperation = function(p4) --[[ line: 52 ]]
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), var7 (ref)
			return fetchAssetUserAuthModule.fetchOperation(p4, t):andThen(function(p5) --[[ line: 53 ]]
				-- upvalues: var7 (copy), p4 (ref)
				var7.updateItem(p4, p5)
				
				return p5
			end)
		end,
		updateOperation = var7.updateItem,
		clear = var8.clear,
		dispose = var8.dispose
	}
end