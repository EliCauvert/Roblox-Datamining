local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local dataHydrationUtilsModule = require(dataHydration.DataHydrationUtils)
local _ = require(dataHydration.DataHydrationTypes)
local getGamePassConfigStoreModule = require(dataHydration.GamePassConfig.getGamePassConfigStore)
local _ = require(dataHydration.GamePassConfig.GamePassConfigTypes)
local fetchMonetizationOptionsModule = require(script.Parent.fetchMonetizationOptions)
local _ = require(script.Parent.MonetizationOptionsTypes)
local frozen = table.freeze({
	errorMessage = "The local user changed while the bulk Game Pass request was running"
})

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
	-- upvalues: dataHydrationUtilsModule (ref), frozen (ref), promiseModule (ref), createSingleEntityResolverModule (ref), fetchMonetizationOptionsModule (ref), createDataCacheModule (ref), createDataResolverModule (ref), updateEntryPoint (ref), getGamePassConfigStoreModule (ref)
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
	local getLocalPlayerUserId = p3.getLocalPlayerUserId or dataHydrationUtilsModule.getLocalPlayerUserId
	local observeLocalPlayerUserId = p3.observeLocalPlayerUserId or dataHydrationUtilsModule.observeLocalPlayerUserId
	local var2 = false
	local var3 = 0
	local var4 = observeLocalPlayerUserId(function()
		-- upvalues: var3 (write)
		var3 += 1
	end)
	
	local function captureMutationToken()
		-- upvalues: getLocalPlayerUserId (ref), var3 (write)
		local var5 = getLocalPlayerUserId()
		
		if var5 == nil then
			return nil, {
				outcome = "failed",
				errorMessage = "A signed-in local user is required for bulk Game Pass mutations."
			}
		end
		return { generation = var3, userId = var5 }, nil
	end
	
	local function _(p4)
		-- upvalues: var2 (write), var3 (write), getLocalPlayerUserId (ref)
		return not var2 and (p4.generation == var3 and p4.userId == getLocalPlayerUserId())
	end
	
	local _ = function(p4)
		-- upvalues: var2 (write), var3 (write), getLocalPlayerUserId (ref)
		return not var2 and (p4.generation == var3 and p4.userId == getLocalPlayerUserId())
	end
	
	local function bulkFetchOptions(p4)
		-- upvalues: t (ref), var2 (write), var3 (write), getLocalPlayerUserId (ref)
		return {
			network = t.network,
			readNetwork = t.readNetwork,
			mutatingNetwork = t.mutatingNetwork,
			baseUrl = t.baseUrl,
			groupsBaseUrl = t.groupsBaseUrl,
			isRequestCurrent = function()
				-- upvalues: p4 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy)
				return not var2 and (p4.generation == var3 and p4.userId == getLocalPlayerUserId())
			end
		}
	end
	
	local _ = function(p4, p5)
		-- upvalues: var2 (write), var3 (write), getLocalPlayerUserId (ref), frozen (copy)
		return p5:andThen(function(p6)
			-- upvalues: p4 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy), frozen (copy)
			if not var2 and (p4.generation == var3 and p4.userId == getLocalPlayerUserId()) then
				return p6
			end
			local t = { errors = p6.errors, results = {} }
			
			for i, v in p6.results do
				local cloned = table.clone(v)
				
				if v.status ~= "failed" then
					cloned.status = "unverified"
					cloned.reason = "session_changed"
					cloned.config = nil
					cloned.error = frozen
				end
				table.insert(t.results, cloned)
			end
			return t
		end)
	end
	
	local function runBulkGamePassMutation(p6, p7)
		-- upvalues: t (ref), captureMutationToken (ref), promiseModule (copy), bulkFetchOptions (ref), var2 (write), var3 (write), getLocalPlayerUserId (ref), frozen (copy)
		if #p6 == 0 then
			return p7(t), nil
		end
		local var5, var6 = captureMutationToken()
		
		if var5 == nil then
			return promiseModule.reject(var6), nil
		end
		return p7(bulkFetchOptions(var5)):andThen(function(p8)
			-- upvalues: var5 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy), frozen (copy)
			if not var2 and (var5.generation == var3 and var5.userId == getLocalPlayerUserId()) then
				return p8
			end
			local t = { errors = p8.errors, results = {} }
			
			for i, v in p8.results do
				local cloned = table.clone(v)
				
				if v.status ~= "failed" then
					cloned.status = "unverified"
					cloned.reason = "session_changed"
					cloned.config = nil
					cloned.error = frozen
				end
				table.insert(t.results, cloned)
			end
			return t
		end), var5
	end
	
	local t_1 = {}
	local t_2 = {}
	local var7 = createSingleEntityResolverModule(function(p8)
		-- upvalues: fetchMonetizationOptionsModule (copy), t (ref)
		return fetchMonetizationOptionsModule.getManagedPricing(p8, t)
	end, {
		resolver = {
			replaceItems = true,
			logError = function(p8)
				-- upvalues: logError (ref)
				logError("managed_pricing", p8)
			end
		}
	})
	local var8 = createSingleEntityResolverModule(function(p8)
		-- upvalues: fetchMonetizationOptionsModule (copy), t (ref)
		return fetchMonetizationOptionsModule.listShops(p8, t)
	end, {
		resolver = {
			replaceItems = true,
			logError = function(p8)
				-- upvalues: logError (ref)
				logError("shops", p8)
			end
		}
	})
	local var9 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		logError = function(p8)
			-- upvalues: logError (ref)
			logError("permission", p8)
		end,
		fetchFn = function(p8, _)
			-- upvalues: t_1 (ref), fetchMonetizationOptionsModule (copy), t (ref)
			local var10 = t_1[p8]
			assert(var10 ~= nil, "Permission context must be set before fetching")
			
			return fetchMonetizationOptionsModule.getMonetizationPermission(var10.universeId, var10.creatorType, var10.creatorTargetId, t)
		end
	})
	
	local _ = function(p8, p9, p10)
		-- upvalues: t_1 (ref)
		local var10 = `{p8}:{p9}:{p10 or 0}`
		t_1[var10] = {
			universeId = p8,
			creatorType = p9,
			creatorTargetId = p10
		}
		
		return var10
	end
	
	local function getAndFetchPermission(p8, p9, p10)
		-- upvalues: var9 (ref), t_1 (ref)
		local getAndFetchItem = var9.getAndFetchItem
		local var10 = `{p8}:{p9}:{p10 or 0}`
		t_1[var10] = {
			universeId = p8,
			creatorType = p9,
			creatorTargetId = p10
		}
		
		return getAndFetchItem(var10)
	end
	
	local function fetchPermission(p8, p9, p10)
		-- upvalues: var9 (ref), t_1 (ref)
		local fetchItem = var9.fetchItem
		local var10 = `{p8}:{p9}:{p10 or 0}`
		t_1[var10] = {
			universeId = p8,
			creatorType = p9,
			creatorTargetId = p10
		}
		
		return fetchItem(var10)
	end
	
	local function acceptManagedPricing(p8)
		-- upvalues: fetchMonetizationOptionsModule (copy), t (ref), var7 (ref)
		return fetchMonetizationOptionsModule.acceptManagedPricing(p8, t):andThen(function(p9)
			-- upvalues: var7 (copy), p8 (ref)
			var7.update(p8, { status = "Accepted" })
			
			return p9
		end)
	end
	
	local function ensureManagedPricingAccepted(p8)
		-- upvalues: fetchMonetizationOptionsModule (copy), t (ref), var7 (ref), promiseModule (copy)
		return fetchMonetizationOptionsModule.getManagedPricing(p8, t):andThen(function(p9)
			-- upvalues: var7 (copy), p8 (ref), promiseModule (copy), fetchMonetizationOptionsModule (copy), t (copy)
			var7.update(p8, p9)
			
			return p9.status == "Accepted" or (if p9.status == "Disabled" then promiseModule.reject("Managed pricing is not available for this experience.") else fetchMonetizationOptionsModule.acceptManagedPricing(p8, t):andThen(function(p10)
				-- upvalues: var7 (copy), p8 (ref)
				var7.update(p8, { status = "Accepted" })
				
				return p10
			end):andThen(function()
				return true
			end))
		end)
	end
	
	local function readBackShops(p8, p9, p10)
		-- upvalues: t_2 (ref), var2 (write), var3 (write), getLocalPlayerUserId (ref), promiseModule (copy), fetchMonetizationOptionsModule (copy), t (ref), var8 (ref), logError (ref)
		return if p10 == nil or t_2[p8] == p10 and (not var2 and (p10.generation == var3 and p10.userId == getLocalPlayerUserId())) then fetchMonetizationOptionsModule.listShops(p8, t):andThen(function(p11)
			-- upvalues: p10 (ref), t_2 (copy), p8 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy), promiseModule (copy), var8 (copy)
			if p10 ~= nil then
				if t_2[p8] == p10 then
					local var10 = p10
					
					if not var2 and (var10.generation == var3 and var10.userId == getLocalPlayerUserId()) then
						var8.update(p8, p11)
						
						return p11
					else
						return promiseModule.reject({ kind = "unverified", error = "Shop write was reset" })
					end
				end
			end
		end):catch(function(p11)
			-- upvalues: p10 (ref), t_2 (copy), p8 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy), promiseModule (copy), logError (copy), var8 (copy), p9 (ref)
			if p10 ~= nil then
				if t_2[p8] == p10 then
					local var10 = p10
					
					if var2 or not (var10.generation == var3 and var10.userId == getLocalPlayerUserId()) then
						return promiseModule.reject({ kind = "unverified", error = p11 })
					end
				end
			end
			logError("shops_readback", p11)
			
			if p10 == nil or not p10.overlapped then
				return p9
			elseif t_2[p8] == p10 then
				var8.cache.markItemsAsFailed({ tostring(p8) })
			end
			return promiseModule.reject({ kind = "unverified", error = p11 })
		end) else promiseModule.reject({
			kind = "unverified",
			error = "Shop write session changed"
		})
	end
	
	local function performShopGlobalIcon(p8, p9, p10)
		-- upvalues: t_2 (ref), var2 (write), var3 (write), getLocalPlayerUserId (ref), promiseModule (copy), var8 (ref), fetchMonetizationOptionsModule (copy), t (ref), updateEntryPoint (copy), readBackShops (ref)
		if t_2[p8] ~= p10 or (var2 or not (p10.generation == var3 and p10.userId == getLocalPlayerUserId())) then
			return promiseModule.reject({ kind = "unverified", error = "Shop write was reset" })
		end
		local var10 = var8.get(p8).data(false)
		local var11 = if var10 ~= nil then nil else var10.shops
		local var12 = if var11 ~= nil then nil else var11[1]
		
		if var12 == nil then
			return fetchMonetizationOptionsModule.createShop(p8, p9, t):andThen(function(p11)
				-- upvalues: updateEntryPoint (copy), p9 (ref), t_2 (copy), p8 (ref), p10 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy), promiseModule (copy), var8 (copy), readBackShops (copy)
				local t = {
					shops = {
						updateEntryPoint({ shopId = p11.shopId, entryPoints = {} }, p9)
					}
				}
				
				if t_2[p8] == p10 then
					local var13 = p10
					
					if not var2 and (var13.generation == var3 and var13.userId == getLocalPlayerUserId()) then
						var8.update(p8, t)
						
						return readBackShops(p8, t, p10)
					end
				end
				return promiseModule.reject({ kind = "unverified", error = "Shop write was reset" })
			end, function(p11)
				-- upvalues: t_2 (copy), p8 (ref), p10 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy), promiseModule (copy)
				if t_2[p8] == p10 then
					local var13 = p10
					
					return if not var2 and (var13.generation == var3 and var13.userId == getLocalPlayerUserId()) then promiseModule.reject(p11) else promiseModule.reject({ kind = "unverified", error = p11 })
				end
			end)
		end
		local var13 = assert(var10, "Shop data must exist before an optimistic update")
		local cloned = table.clone(var13.shops or {})
		cloned[1] = updateEntryPoint(var12, p9)
		local t_1 = { shops = cloned }
		var8.update(p8, t_1)
		
		return fetchMonetizationOptionsModule.setShopGlobalIcon(var12.shopId, p9, t):andThen(function()
			-- upvalues: p10 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy), promiseModule (copy), readBackShops (copy), p8 (ref), t_1 (ref)
			local var14 = p10
			
			return if not var2 and (var14.generation == var3 and var14.userId == getLocalPlayerUserId()) then readBackShops(p8, t_1, p10) else promiseModule.reject({
				kind = "unverified",
				error = "Shop write session changed"
			})
		end, function(p11)
			-- upvalues: t_2 (copy), p8 (ref), p10 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy), promiseModule (copy), var8 (copy), var13 (ref)
			if t_2[p8] == p10 then
				local var14 = p10
				
				if not var2 and (var14.generation == var3 and var14.userId == getLocalPlayerUserId()) then
					var8.update(p8, var13)
					
					return promiseModule.reject(p11)
				end
			end
			return promiseModule.reject({ kind = "unverified", error = p11 })
		end)
	end
	
	local function refreshGamePassInventory(p8, p9, p10, p11)
		-- upvalues: var2 (write), var3 (write), getLocalPlayerUserId (ref), p3 (ref), getGamePassConfigStoreModule (copy)
		return if #p9 == 0 then p10 else p10:andThen(function(p12)
			-- upvalues: p11 (ref), var2 (copy), var3 (copy), getLocalPlayerUserId (copy), p3 (copy), getGamePassConfigStoreModule (copy), p8 (ref)
			if p11 ~= nil then
				local var10 = p11
				
				if var2 or not (var10.generation == var3 and var10.userId == getLocalPlayerUserId()) then
					return p12
				end
				local var11 = false
				
				for i, v in p12.results do
					if v.status ~= "failed" then
						var11 = true
						break
					end
				end
				if var11 then
					local var12 = (if p3.getGamePassConfigStore ~= nil then getGamePassConfigStoreModule else p3.getGamePassConfigStore)()
					var12.clear()
					var12.fetchGamePasses(p8)
					
					return p12
				end
				return p12
			end
		end)
	end
	
	return {
		getManagedPricing = var7.get,
		fetchManagedPricing = var7.fetch,
		getAndFetchManagedPricing = var7.getAndFetch,
		getShops = var8.get,
		fetchShops = var8.fetch,
		getAndFetchShops = var8.getAndFetch,
		getAndFetchPermission = getAndFetchPermission,
		fetchPermission = fetchPermission,
		acceptManagedPricing = acceptManagedPricing,
		ensureManagedPricingAccepted = ensureManagedPricingAccepted,
		updateDeveloperProductsManagedPricing = function(p12, p13, p14)
			-- upvalues: fetchMonetizationOptionsModule (copy), t (ref)
			return fetchMonetizationOptionsModule.updateDeveloperProductsManagedPricing(p12, p13, p14, t)
		end,
		updateGamePassesManagedPricing = function(p12, p13, p14)
			-- upvalues: refreshGamePassInventory (ref), runBulkGamePassMutation (ref), fetchMonetizationOptionsModule (copy)
			return refreshGamePassInventory(p12, p13, runBulkGamePassMutation(p13, function(p15)
				-- upvalues: fetchMonetizationOptionsModule (copy), p12 (ref), p13 (ref), p14 (ref)
				return fetchMonetizationOptionsModule.updateGamePassesManagedPricing(p12, p13, p14, p15)
			end))
		end,
		updateGamePassesArchived = function(p12, p13, p14)
			-- upvalues: refreshGamePassInventory (ref), runBulkGamePassMutation (ref), fetchMonetizationOptionsModule (copy)
			return refreshGamePassInventory(p12, p13, runBulkGamePassMutation(p13, function(p15)
				-- upvalues: fetchMonetizationOptionsModule (copy), p12 (ref), p13 (ref), p14 (ref)
				return fetchMonetizationOptionsModule.updateGamePassesArchived(p12, p13, p14, p15)
			end))
		end,
		setShopGlobalIcon = function(value, p12)
			-- upvalues: t_2 (ref), var2 (write), var3 (write), getLocalPlayerUserId (ref), promiseModule (copy), performShopGlobalIcon (ref)
			local var10 = t_2[value]
			
			if var10 ~= nil and (var2 or not (var10.generation == var3 and var10.userId == getLocalPlayerUserId())) then
				t_2[value] = nil
			end
			local var11 = t_2[value]
			
			if var11 == nil then
				var11 = {
					pending = 0,
					overlapped = false,
					tail = promiseModule.resolve(),
					generation = var3,
					userId = getLocalPlayerUserId()
				}
				t_2[value] = var11
			end
			if var11.pending > 0 then
				var11.overlapped = true
			end
			var11.pending += 1
			local var12 = var11.tail:andThen(function()
				-- upvalues: performShopGlobalIcon (copy), value (ref), p12 (ref), var11 (write)
				return performShopGlobalIcon(value, p12, var11)
			end)
			var11.tail = var12:andThen(function()
				-- upvalues: var11 (write), t_2 (copy), value (ref)
				var11.pending -= 1
				
				if var11.pending == 0 and t_2[value] == var11 then
					t_2[value] = nil
				end
			end, function()
				-- upvalues: var11 (write), t_2 (copy), value (ref)
				var11.pending -= 1
				
				if var11.pending == 0 and t_2[value] == var11 then
					t_2[value] = nil
				end
			end)
			
			return var12
		end,
		clear = function()
			-- upvalues: var7 (ref), var8 (ref), var9 (ref), t_1 (ref), t_2 (ref)
			var7.clear()
			var8.clear()
			var9.clear()
			table.clear(t_1)
			table.clear(t_2)
		end,
		dispose = function()
			-- upvalues: var2 (write), var3 (write), var4 (ref), var7 (ref), var8 (ref), var9 (ref), t_1 (ref), t_2 (ref)
			var2 = true
			var3 += 1
			var4()
			var7.dispose()
			var8.dispose()
			var9.dispose()
			table.clear(t_1)
			table.clear(t_2)
		end
	}
end