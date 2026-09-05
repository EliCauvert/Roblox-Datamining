local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchMonetizationOptionsModule = require(script.Parent.fetchMonetizationOptions)
local _ = require(script.Parent.MonetizationOptionsTypes)

local function updateEntryPoint(p1, p2)
	local cloned = table.clone(p1)
	local t = {}
	local var1 = false
	
	for i, v in p1.entryPoints or {} do
		local cloned_1 = table.clone(v)
		
		if cloned_1.name == "InExperienceGlobalIconEnabled" then
			cloned_1.isEnabled = p2
			var1 = true
		end
		table.insert(t, cloned_1)
	end
	if not var1 then
		table.insert(t, { name = "InExperienceGlobalIconEnabled", isEnabled = p2 })
	end
	cloned.entryPoints = t
	
	return cloned
end

return function(p3)
	-- upvalues: createSingleEntityResolverModule (ref), fetchMonetizationOptionsModule (ref), createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), updateEntryPoint (ref)
	p3 = p3 or {}
	
	local function logError(p4, p5)
		-- upvalues: p3 (ref)
		if p3.logError ~= nil then
			p3.logError(p4, p5)
			
			return
		elseif typeof(p5) == "table" then
			warn(`[MonetizationOptions] {p4} request failed (responseCode={tostring(p5.responseCode)}): {tostring(p5.errorMessage)}`)
			
			return
		end
		warn(`[MonetizationOptions] {p4} request failed: {tostring(p5)}`)
	end
	
	local t = {
		network = p3.network,
		readNetwork = p3.readNetwork,
		mutatingNetwork = p3.mutatingNetwork,
		baseUrl = p3.baseUrl,
		groupsBaseUrl = p3.groupsBaseUrl
	}
	local t_1 = {}
	local var2 = createSingleEntityResolverModule(function(p4)
		-- upvalues: fetchMonetizationOptionsModule (copy), t (ref)
		return fetchMonetizationOptionsModule.getManagedPricing(p4, t)
	end, {
		resolver = {
			replaceItems = true,
			logError = function(p4)
				-- upvalues: logError (ref)
				logError("managed_pricing", p4)
			end
		}
	})
	local var3 = createSingleEntityResolverModule(function(p4)
		-- upvalues: fetchMonetizationOptionsModule (copy), t (ref)
		return fetchMonetizationOptionsModule.listShops(p4, t)
	end, {
		resolver = {
			replaceItems = true,
			logError = function(p4)
				-- upvalues: logError (ref)
				logError("shops", p4)
			end
		}
	})
	local var4 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		logError = function(p4)
			-- upvalues: logError (ref)
			logError("permission", p4)
		end,
		fetchFn = function(p4, _)
			-- upvalues: t_1 (ref), fetchMonetizationOptionsModule (copy), t (ref)
			local var5 = t_1[p4]
			assert(var5 ~= nil, "Permission context must be set before fetching")
			
			return fetchMonetizationOptionsModule.getMonetizationPermission(var5.universeId, var5.creatorType, var5.creatorTargetId, t)
		end
	})
	
	local function _(p4, p5, p6)
		-- upvalues: t_1 (ref)
		local var5 = `{p4}:{p5}:{p6 or 0}`
		t_1[var5] = {
			universeId = p4,
			creatorType = p5,
			creatorTargetId = p6
		}
		
		return var5
	end
	
	local function readBackShops(p4, p5)
		-- upvalues: fetchMonetizationOptionsModule (copy), t (ref), var3 (ref), logError (ref)
		return fetchMonetizationOptionsModule.listShops(p4, t):andThen(function(p6)
			-- upvalues: var3 (copy), p4 (ref)
			var3.update(p4, p6)
			
			return p6
		end):catch(function(p6)
			-- upvalues: logError (copy), p5 (ref)
			logError("shops_readback", p6)
			
			return p5
		end)
	end
	
	return {
		getManagedPricing = var2.get,
		fetchManagedPricing = var2.fetch,
		getAndFetchManagedPricing = var2.getAndFetch,
		getShops = var3.get,
		fetchShops = var3.fetch,
		getAndFetchShops = var3.getAndFetch,
		getAndFetchPermission = function(p4, p5, p6)
			-- upvalues: var4 (ref), t_1 (ref)
			local getAndFetchItem = var4.getAndFetchItem
			local var5 = `{p4}:{p5}:{p6 or 0}`
			t_1[var5] = {
				universeId = p4,
				creatorType = p5,
				creatorTargetId = p6
			}
			
			return getAndFetchItem(var5)
		end,
		fetchPermission = function(p4, p5, p6)
			-- upvalues: var4 (ref), t_1 (ref)
			local fetchItem = var4.fetchItem
			local var5 = `{p4}:{p5}:{p6 or 0}`
			t_1[var5] = {
				universeId = p4,
				creatorType = p5,
				creatorTargetId = p6
			}
			
			return fetchItem(var5)
		end,
		acceptManagedPricing = function(p4)
			-- upvalues: fetchMonetizationOptionsModule (copy), t (ref), var2 (ref)
			return fetchMonetizationOptionsModule.acceptManagedPricing(p4, t):andThen(function(p5)
				-- upvalues: var2 (copy), p4 (ref)
				var2.update(p4, { status = "Accepted" })
				
				return p5
			end)
		end,
		ensureManagedPricingAccepted = function(p4)
			-- upvalues: fetchMonetizationOptionsModule (copy), t (ref), var2 (ref), promiseModule (copy)
			return fetchMonetizationOptionsModule.getManagedPricing(p4, t):andThen(function(p5)
				-- upvalues: var2 (copy), p4 (ref), promiseModule (copy), fetchMonetizationOptionsModule (copy), t (copy)
				var2.update(p4, p5)
				
				return p5.status == "Accepted" or (if p5.status == "Disabled" then promiseModule.reject("Managed pricing is not available for this experience.") else fetchMonetizationOptionsModule.acceptManagedPricing(p4, t):andThen(function(p6)
					-- upvalues: var2 (copy), p4 (ref)
					var2.update(p4, { status = "Accepted" })
					
					return p6
				end):andThen(function()
					return true
				end))
			end)
		end,
		updateDeveloperProductsManagedPricing = function(p4, p5, p6)
			-- upvalues: fetchMonetizationOptionsModule (copy), t (ref)
			return fetchMonetizationOptionsModule.updateDeveloperProductsManagedPricing(p4, p5, p6, t)
		end,
		setShopGlobalIcon = function(value, p4)
			-- upvalues: var3 (ref), fetchMonetizationOptionsModule (copy), t (ref), updateEntryPoint (copy), readBackShops (ref), promiseModule (copy)
			local var5 = var3.get(value).data(false)
			local var6 = if var5 ~= nil then nil else var5.shops
			local var7 = if var6 ~= nil then nil else var6[1]
			
			if var7 == nil then
				return fetchMonetizationOptionsModule.createShop(value, p4, t):andThen(function(p5)
					-- upvalues: updateEntryPoint (copy), p4 (ref), var3 (copy), value (ref), readBackShops (copy)
					local t = {
						shops = {
							updateEntryPoint({ shopId = p5.shopId, entryPoints = {} }, p4)
						}
					}
					var3.update(value, t)
					
					return readBackShops(value, t)
				end)
			end
			local var8 = assert(var5, "Shop data must exist before an optimistic update")
			local cloned = table.clone(var8.shops or {})
			cloned[1] = updateEntryPoint(var7, p4)
			local t_1 = { shops = cloned }
			var3.update(value, t_1)
			
			return fetchMonetizationOptionsModule.setShopGlobalIcon(var7.shopId, p4, t):andThen(function()
				-- upvalues: readBackShops (copy), value (ref), t_1 (ref)
				return readBackShops(value, t_1)
			end):catch(function(p5)
				-- upvalues: var3 (copy), value (ref), var8 (ref), promiseModule (copy)
				var3.update(value, var8)
				
				return promiseModule.reject(p5)
			end)
		end,
		clear = function()
			-- upvalues: var2 (ref), var3 (ref), var4 (ref), t_1 (ref)
			var2.clear()
			var3.clear()
			var4.clear()
			table.clear(t_1)
		end,
		dispose = function()
			-- upvalues: var2 (ref), var3 (ref), var4 (ref), t_1 (ref)
			var2.dispose()
			var3.dispose()
			var4.dispose()
			table.clear(t_1)
		end
	}
end