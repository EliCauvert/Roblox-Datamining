local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local promiseModule = require(parent.Promise)
local _ = require(parent.MomentsTypes)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref)
	local _ = p1 or {}
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var1,
		fetchFn = function(_, _)
			-- upvalues: promiseModule (copy)
			return promiseModule.reject("Moments comments V1 has no get-comment-by-id API")
		end
	})
	
	return {
		getCachedComment = function(p2)
			-- upvalues: var2 (ref)
			return var2.getCachedItem(p2)
		end,
		upsertComments = function(p2)
			-- upvalues: var1 (ref)
			for i, v in p2 do
				var1.replaceItem(v.commentId, v)
			end
		end,
		clear = function()
			-- upvalues: var2 (ref)
			var2.clear()
		end,
		dispose = function()
			-- upvalues: var2 (ref)
			var2.dispose()
		end
	}
end