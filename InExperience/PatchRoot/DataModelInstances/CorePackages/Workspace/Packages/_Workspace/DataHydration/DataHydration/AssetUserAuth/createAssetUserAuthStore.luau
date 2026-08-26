local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local promiseModule = require(parent.Promise)
local fetchAssetUserAuthModule = require(script.Parent.fetchAssetUserAuth)
local _ = require(script.Parent.AssetUserAuthStoreTypes)

local function ALWAYS_REFRESH()
	return true
end

return function(value)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fetchAssetUserAuthModule (ref), promiseModule (ref), ALWAYS_REFRESH (ref)
	local value_1 = value or {}
	local t = { network = value_1.network, baseUrl = value_1.baseUrl }
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var1,
		fetchFn = function(p1, _)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref)
			return fetchAssetUserAuthModule.fetchOperation(p1, t)
		end
	})
	
	local function seedAndReturn(p1)
		-- upvalues: var1 (ref)
		local path = p1.path
		
		if typeof(path) == "string" and #path > 0 then
			var1.updateItem(string.match(path, "operations/(.+)$") or path, p1)
		end
		return p1
	end
	
	return {
		patchAssetIcon = function(value, p1)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), var1 (ref)
			return fetchAssetUserAuthModule.patchAssetIcon(value, p1, t):andThen(function(p2)
				-- upvalues: var1 (copy)
				local path = p2.path
				
				if typeof(path) == "string" and #path > 0 then
					var1.updateItem(string.match(path, "operations/(.+)$") or path, p2)
				end
				return p2
			end)
		end,
		updateIcon = function(p1, p2)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), seedAndReturn (ref)
			return fetchAssetUserAuthModule.updateIcon(p1, p2, t):andThen(seedAndReturn)
		end,
		getPreviews = function(p1)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref)
			return fetchAssetUserAuthModule.getPreviews(p1, t)
		end,
		updatePreviews = function(p1, p2)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), seedAndReturn (ref)
			return fetchAssetUserAuthModule.updatePreviews(p1, p2, t):andThen(seedAndReturn)
		end,
		createImageAsset = function(value, p1, p2)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), seedAndReturn (ref)
			return fetchAssetUserAuthModule.createImageAsset(value, p1, p2, t):andThen(seedAndReturn)
		end,
		pollUntilDone = function(p1)
			-- upvalues: promiseModule (copy), fetchAssetUserAuthModule (copy), t (ref), var1 (ref)
			local var3
			local _ = nil
			
			if typeof(p1) == "string" then
				var3 = p1
			else
				local path = p1.path or ""
				var3 = string.match(path, "operations/(.+)$") or (p1.operationId or path)
			end
			return promiseModule.new(function(p2, p3)
				-- upvalues: var3 (write), fetchAssetUserAuthModule (copy), t (copy), var1 (copy)
				local var4 = 0
				local var5 = 0
				
				local function poll()
					-- upvalues: var4 (write), var3 (copy), fetchAssetUserAuthModule (copy), t (copy), var1 (copy), var5 (write), p3 (ref), p2 (ref), poll (ref)
					var4 += 1
					fetchAssetUserAuthModule.fetchOperation(var3, t):andThen(function(p4)
						-- upvalues: var1 (copy), var3 (ref)
						var1.updateItem(var3, p4)
						
						return p4
					end):andThen(function(p4)
						-- upvalues: var5 (copy), p3 (copy), p2 (copy), var4 (copy), var3 (copy), poll (copy)
						var5 = 0
						
						if p4.done then
							if p4.error then
								p3(p4.error.message or "Operation failed")
								
								return
							end
							p2({ status = "done", operation = p4 })
							
							return
						elseif var4 >= 30 then
							p2({ status = "timed_out", operationId = var3 })
							
							return
						end
						task.delay(2, poll)
					end):catch(function(p4)
						-- upvalues: var5 (copy), poll (copy), p3 (copy)
						var5 += 1
						
						if var5 <= 3 then
							task.delay(math.pow(2, var5 - 1) * 2, poll)
							
							return
						end
						p3(p4)
					end)
				end
				
				poll()
			end)
		end,
		getOperation = var2.getCachedItem,
		fetchOperation = var2.fetchItem,
		getAndFetchOperation = function(p1)
			-- upvalues: var2 (ref), ALWAYS_REFRESH (copy)
			return var2.getAndFetchItem(p1, ALWAYS_REFRESH)
		end,
		refreshOperation = function(p1)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), var1 (ref)
			return fetchAssetUserAuthModule.fetchOperation(p1, t):andThen(function(p2)
				-- upvalues: var1 (copy), p1 (ref)
				var1.updateItem(p1, p2)
				
				return p2
			end)
		end,
		updateOperation = var1.updateItem,
		clear = var2.clear,
		dispose = var2.dispose
	}
end