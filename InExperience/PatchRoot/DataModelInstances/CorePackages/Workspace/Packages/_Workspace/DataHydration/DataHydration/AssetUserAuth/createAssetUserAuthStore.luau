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
	local var8 = createDataCacheModule()
	local var9 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var8,
		fetchFn = function(p0, _)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref)
			return fetchAssetUserAuthModule.fetchOperation(p0, t)
		end
	})
	
	local function seedAndReturn(p1)
		-- upvalues: var8 (ref)
		local path = p1.path
		
		if typeof(path) == "string" and #path > 0 then
			var8.updateItem(string.match(path, "operations/(.+)$") or path, p1)
		end
		return p1
	end
	
	return {
		patchAssetIcon = function(value, p2)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), var8 (ref)
			return fetchAssetUserAuthModule.patchAssetIcon(value, p2, t):andThen(function(p3)
				-- upvalues: var8 (copy)
				local path = p3.path
				
				if typeof(path) == "string" and #path > 0 then
					var8.updateItem(string.match(path, "operations/(.+)$") or path, p3)
				end
				return p3
			end)
		end,
		updateIcon = function(p4, p5)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), seedAndReturn (ref)
			return fetchAssetUserAuthModule.updateIcon(p4, p5, t):andThen(seedAndReturn)
		end,
		getPreviews = function(p6)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref)
			return fetchAssetUserAuthModule.getPreviews(p6, t)
		end,
		updatePreviews = function(p7, p8)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), seedAndReturn (ref)
			return fetchAssetUserAuthModule.updatePreviews(p7, p8, t):andThen(seedAndReturn)
		end,
		createImageAsset = function(value, p9, p10)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), seedAndReturn (ref)
			return fetchAssetUserAuthModule.createImageAsset(value, p9, p10, t):andThen(seedAndReturn)
		end,
		pollUntilDone = function(p11)
			-- upvalues: promiseModule (copy), fetchAssetUserAuthModule (copy), t (ref), var8 (ref)
			local var11
			local _ = nil
			
			if typeof(p11) == "string" then
				var11 = p11
			else
				local path = p11.path or ""
				var11 = string.match(path, "operations/(.+)$") or (p11.operationId or path)
			end
			return promiseModule.new(function(p12, p13)
				-- upvalues: var11 (write), fetchAssetUserAuthModule (copy), t (copy), var8 (copy)
				local var13 = 0
				local var14 = 0
				
				local function poll()
					-- upvalues: var13 (write), var11 (copy), fetchAssetUserAuthModule (copy), t (copy), var8 (copy), var14 (write), p13 (ref), p12 (ref), poll (ref)
					var13 += 1
					fetchAssetUserAuthModule.fetchOperation(var11, t):andThen(function(p16)
						-- upvalues: var8 (copy), var11 (ref)
						var8.updateItem(var11, p16)
						
						return p16
					end):andThen(function(p15)
						-- upvalues: var14 (copy), p13 (copy), p12 (copy), var13 (copy), var11 (copy), poll (copy)
						var14 = 0
						
						if p15.done then
							if p15.error then
								p13(p15.error.message or "Operation failed")
								
								return
							end
							p12({ status = "done", operation = p15 })
							
							return
						elseif var13 >= 30 then
							p12({ status = "timed_out", operationId = var11 })
							
							return
						end
						task.delay(2, poll)
					end):catch(function(p14)
						-- upvalues: var14 (copy), poll (copy), p13 (copy)
						var14 += 1
						
						if var14 <= 3 then
							task.delay(math.pow(2, var14 - 1) * 2, poll)
							
							return
						end
						p13(p14)
					end)
				end
				
				poll()
			end)
		end,
		getOperation = var9.getCachedItem,
		fetchOperation = var9.fetchItem,
		getAndFetchOperation = function(p17)
			-- upvalues: var9 (ref), ALWAYS_REFRESH (copy)
			return var9.getAndFetchItem(p17, ALWAYS_REFRESH)
		end,
		refreshOperation = function(p18)
			-- upvalues: fetchAssetUserAuthModule (copy), t (ref), var8 (ref)
			return fetchAssetUserAuthModule.fetchOperation(p18, t):andThen(function(p19)
				-- upvalues: var8 (copy), p18 (ref)
				var8.updateItem(p18, p19)
				
				return p19
			end)
		end,
		updateOperation = var8.updateItem,
		clear = var9.clear,
		dispose = var9.dispose
	}
end