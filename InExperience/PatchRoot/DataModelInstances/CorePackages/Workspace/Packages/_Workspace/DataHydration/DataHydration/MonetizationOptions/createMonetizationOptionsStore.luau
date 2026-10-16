local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local DataHydrationUtilsModule = require(DataHydration.DataHydrationUtils)
local _ = require(DataHydration.DataHydrationTypes)
local GetGamePassConfigStoreModule = require(DataHydration.GamePassConfig.getGamePassConfigStore)
local _ = require(DataHydration.GamePassConfig.GamePassConfigTypes)
local FetchMonetizationOptionsModule = require(script.Parent.fetchMonetizationOptions)
local _ = require(script.Parent.MonetizationOptionsTypes)
local Frozen = table.freeze({
	errorMessage = "The local user changed while the bulk Game Pass request was running"
})

local function updateEntryPoint(Tbl, IsEnabled) --[[ Line: 59 ]]
	local Copy = table.clone(Tbl)
	local List = {}
	local Flag = false
	local EntryPoints = Tbl.entryPoints or {}
	for _, entryPoint in EntryPoints do
		local Copy1 = table.clone(entryPoint)
		
		if Copy1.name == "InExperienceGlobalIconEnabled" then
			Copy1.isEnabled = IsEnabled
			Flag = true
		end
		table.insert(List, Copy1)
	end
	if not Flag then
		table.insert(List, {
			name = "InExperienceGlobalIconEnabled",
			isEnabled = IsEnabled
		})
	end
	Copy.entryPoints = List
	
	return Copy
end

return function(p1) --[[ Line: 81 | Named "createMonetizationOptionsStore" ]]
	-- upvalues: DataHydrationUtilsModule (copy), Frozen (copy), PromiseModule (copy), CreateSingleEntityResolverModule (copy), FetchMonetizationOptionsModule (copy), CreateDataCacheModule (copy), CreateDataResolverModule (copy), updateEntryPoint (copy), GetGamePassConfigStoreModule (copy)
	local P1 = p1 or {}
	
	local function logError(p2, p3) --[[ Line: 83 ]]
		-- upvalues: P1 (copy)
		if P1.logError ~= nil then
			P1.logError(p2, p3)
			
			return
		end
		if typeof(p3) == "table" then
			warn(`[MonetizationOptions] {p2} request failed (responseCode={tostring(p3.responseCode)}): {tostring(p3.errorMessage)}`)
			
			return
		else
			warn(`[MonetizationOptions] {p2} request failed: {tostring(p3)}`)
		end
	end
	
	local config = {
		network = P1.network,
		readNetwork = P1.readNetwork,
		mutatingNetwork = P1.mutatingNetwork,
		baseUrl = P1.baseUrl,
		groupsBaseUrl = P1.groupsBaseUrl
	}
	local GetLocalPlayerUserId = P1.getLocalPlayerUserId or DataHydrationUtilsModule.getLocalPlayerUserId
	local Flag = false
	local Generation = 0
	local Callback = (P1.observeLocalPlayerUserId or DataHydrationUtilsModule.observeLocalPlayerUserId)(function() --[[ Line: 110 ]]
		-- upvalues: Generation (ref)
		Generation += 1
	end)
	
	local function captureMutationToken() --[[ Line: 114 ]]
		-- upvalues: GetLocalPlayerUserId (copy), Generation (ref)
		local LocalPlayerUserId = GetLocalPlayerUserId()
		
		if LocalPlayerUserId == nil then
			return nil, {
				outcome = "failed",
				errorMessage = "A signed-in local user is required for bulk Game Pass mutations."
			}
		else
			return { generation = Generation, userId = LocalPlayerUserId }, nil
		end
	end
	
	local function _(p2): boolean --[[ Line: 126 | Named "isTokenCurrent" ]]
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy)
		return not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
	end
	
	local _ = function(p2): boolean --[[ Line: 129 | Named "isShopQueueCurrent" ]]
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy)
		return not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
	end
	
	local function bulkFetchOptions(p2) --[[ Line: 133 ]]
		-- upvalues: config (copy), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy)
		return {
			network = config.network,
			readNetwork = config.readNetwork,
			mutatingNetwork = config.mutatingNetwork,
			baseUrl = config.baseUrl,
			groupsBaseUrl = config.groupsBaseUrl,
			isRequestCurrent = function(): boolean --[[ Line: 140 ]]
				-- upvalues: p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval)
				return not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId())
			end
		}
	end
	
	local _ = function(p2, Promise) --[[ Line: 146 | Named "guardBulkGamePassResult" ]]
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval)
		return Promise:andThen(function(Result) --[[ Line: 150 ]]
			-- upvalues: p2 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval)
			if not Flag and (p2.generation == Generation and p2.userId == GetLocalPlayerUserId()) then
				return Result
			end
			local config = { errors = Result.errors, results = {} }
			
			for _, result in Result.results do
				local Copy = table.clone(result)
				
				if result.status ~= "failed" then
					Copy.status = "unverified"
					Copy.reason = "session_changed"
					Copy.config = nil
					Copy.error = Frozen
				end
				table.insert(config.results, Copy)
			end
			return config
		end)
	end
	
	local function runBulkGamePassMutation(p3, Callback) --[[ Line: 169 ]]
		-- upvalues: config (copy), captureMutationToken (copy), PromiseModule (upval), bulkFetchOptions (copy), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), Frozen (upval)
		if #p3 == 0 then
			return Callback(config), nil
		end
		local CaptureMutationTokenResult, CaptureMutationTokenResult2 = captureMutationToken()
		
		if CaptureMutationTokenResult == nil then
			return PromiseModule.reject(CaptureMutationTokenResult2), nil
		else
			return Callback((bulkFetchOptions(CaptureMutationTokenResult))):andThen(function(Result) --[[ Line: 150 ]]
				-- upvalues: CaptureMutationTokenResult (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), Frozen (upval)
				if not Flag and (CaptureMutationTokenResult.generation == Generation and CaptureMutationTokenResult.userId == GetLocalPlayerUserId()) then
					return Result
				end
				local config = { errors = Result.errors, results = {} }
				
				for _, result in Result.results do
					local Copy = table.clone(result)
					
					if result.status ~= "failed" then
						Copy.status = "unverified"
						Copy.reason = "session_changed"
						Copy.config = nil
						Copy.error = Frozen
					end
					table.insert(config.results, Copy)
				end
				return config
			end), CaptureMutationTokenResult
		end
	end
	
	local Tbl = {}
	local Tbl1 = {}
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p4) --[[ Line: 186 ]]
		-- upvalues: FetchMonetizationOptionsModule (upval), config (copy)
		return FetchMonetizationOptionsModule.getManagedPricing(p4, config)
	end, {
		resolver = {
			replaceItems = true,
			logError = function(p4) --[[ Line: 192 ]]
				-- upvalues: logError (copy)
				logError("managed_pricing", p4)
			end
		}
	})
	local SingleEntityResolverModule1 = CreateSingleEntityResolverModule(function(p4) --[[ Line: 198 ]]
		-- upvalues: FetchMonetizationOptionsModule (upval), config (copy)
		return FetchMonetizationOptionsModule.listShops(p4, config)
	end, {
		resolver = {
			replaceItems = true,
			logError = function(p4) --[[ Line: 203 ]]
				-- upvalues: logError (copy)
				logError("shops", p4)
			end
		}
	})
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		logError = function(p4) --[[ Line: 213 ]]
			-- upvalues: logError (copy)
			logError("permission", p4)
		end,
		fetchFn = function(p4, _) --[[ Line: 216 ]]
			-- upvalues: Tbl (copy), FetchMonetizationOptionsModule (upval), config (copy)
			local Entry = Tbl[p4]
			assert(Entry ~= nil, "Permission context must be set before fetching")
			
			return FetchMonetizationOptionsModule.getMonetizationPermission(Entry.universeId, Entry.creatorType, Entry.creatorTargetId, config)
		end
	})
	
	local _ = function(UniverseId, CreatorType, CreatorTargetId): string --[[ Line: 227 | Named "permissionKey" ]]
		-- upvalues: Tbl (copy)
		local Text: string = `{UniverseId}:{CreatorType}:{CreatorTargetId or 0}`
		Tbl[Text] = {
			universeId = UniverseId,
			creatorType = CreatorType,
			creatorTargetId = CreatorTargetId
		}
		
		return Text
	end
	
	local function readBackShops(p4, p5, p6) --[[ Line: 267 ]]
		-- upvalues: Tbl1 (copy), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), PromiseModule (upval), FetchMonetizationOptionsModule (upval), config (copy), SingleEntityResolverModule1 (copy), logError (copy)
		if p6 == nil or Tbl1[p4] == p6 and (not Flag and (p6.generation == Generation and p6.userId == GetLocalPlayerUserId())) then
			return FetchMonetizationOptionsModule.listShops(p4, config):andThen(function(Result) --[[ Line: 277 ]]
				-- upvalues: p6 (copy), Tbl1 (upval), p4 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), SingleEntityResolverModule1 (upval)
				if p6 == nil or Tbl1[p4] == p6 and (not Flag and (p6.generation == Generation and p6.userId == GetLocalPlayerUserId())) then
					SingleEntityResolverModule1.update(p4, Result)
					
					return Result
				else
					return PromiseModule.reject({ kind = "unverified", error = "Shop write was reset" })
				end
			end):catch(function(Err) --[[ Line: 284 ]]
				-- upvalues: p6 (copy), Tbl1 (upval), p4 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), logError (upval), SingleEntityResolverModule1 (upval), p5 (copy)
				if p6 ~= nil and (Tbl1[p4] ~= p6 or (Flag or (p6.generation ~= Generation or p6.userId ~= GetLocalPlayerUserId()))) then
					return PromiseModule.reject({ kind = "unverified", error = Err })
				end
				logError("shops_readback", Err)
				
				if p6 == nil or not p6.overlapped then
					return p5
				end
				if Tbl1[p4] == p6 then
					SingleEntityResolverModule1.cache.markItemsAsFailed({ (tostring(p4)) })
				end
				return PromiseModule.reject({ kind = "unverified", error = Err })
			end)
		else
			return PromiseModule.reject({
				kind = "unverified",
				error = "Shop write session changed"
			})
		end
	end
	
	local function performShopGlobalIcon(Key, IsEnabled, p4) --[[ Line: 301 ]]
		-- upvalues: Tbl1 (copy), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), PromiseModule (upval), SingleEntityResolverModule1 (copy), FetchMonetizationOptionsModule (upval), config (copy), updateEntryPoint (upval), readBackShops (copy)
		if Tbl1[Key] ~= p4 or (Flag or (p4.generation ~= Generation or p4.userId ~= GetLocalPlayerUserId())) then
			return PromiseModule.reject({ kind = "unverified", error = "Shop write was reset" })
		end
		local DataResult = SingleEntityResolverModule1.get(Key).data(false)
		local Shops = if DataResult == nil then nil else DataResult.shops
		local Shop = if Shops == nil then nil else Shops[1]
		
		if Shop == nil then
			return FetchMonetizationOptionsModule.createShop(Key, IsEnabled, config):andThen(function(Result) --[[ Line: 315 ]]
				-- upvalues: updateEntryPoint (upval), IsEnabled (copy), Tbl1 (upval), Key (copy), p4 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), SingleEntityResolverModule1 (upval), readBackShops (upval)
				local config = {
					shops = {
						(updateEntryPoint({ shopId = Result.shopId, entryPoints = {} }, IsEnabled))
					}
				}
				
				if Tbl1[Key] == p4 and (not Flag and (p4.generation == Generation and p4.userId == GetLocalPlayerUserId())) then
					SingleEntityResolverModule1.update(Key, config)
					
					return readBackShops(Key, config, p4)
				else
					return PromiseModule.reject({ kind = "unverified", error = "Shop write was reset" })
				end
			end, function(p5) --[[ Line: 326 ]]
				-- upvalues: Tbl1 (upval), Key (copy), p4 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval)
				if Tbl1[Key] == p4 and (not Flag and (p4.generation == Generation and p4.userId == GetLocalPlayerUserId())) then
					return PromiseModule.reject(p5)
				else
					return PromiseModule.reject({ kind = "unverified", error = p5 })
				end
			end)
		else
			local ShopDataMustExistBeforeAnOptimisticUpdate = assert(DataResult, "Shop data must exist before an optimistic update")
			local Copy = table.clone(ShopDataMustExistBeforeAnOptimisticUpdate.shops or {})
			Copy[1] = updateEntryPoint(Shop, IsEnabled)
			local config1 = { shops = Copy }
			SingleEntityResolverModule1.update(Key, config1)
			
			return FetchMonetizationOptionsModule.setShopGlobalIcon(Shop.shopId, IsEnabled, config):andThen(function() --[[ Line: 342 ]]
				-- upvalues: p4 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), readBackShops (upval), Key (copy), config1 (copy)
				local IsUserIdMatch: boolean = not Flag and (p4.generation == Generation and p4.userId == GetLocalPlayerUserId())
				
				return if IsUserIdMatch then readBackShops(Key, config1, p4) else PromiseModule.reject({
					kind = "unverified",
					error = "Shop write session changed"
				})
			end, function(p5) --[[ Line: 347 ]]
				-- upvalues: Tbl1 (upval), Key (copy), p4 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), PromiseModule (upval), SingleEntityResolverModule1 (upval), ShopDataMustExistBeforeAnOptimisticUpdate (copy)
				if Tbl1[Key] == p4 and (not Flag and (p4.generation == Generation and p4.userId == GetLocalPlayerUserId())) then
					SingleEntityResolverModule1.update(Key, ShopDataMustExistBeforeAnOptimisticUpdate)
					
					return PromiseModule.reject(p5)
				else
					return PromiseModule.reject({ kind = "unverified", error = p5 })
				end
			end)
		end
	end
	
	local function refreshGamePassInventory(p4, p5, Promise, p6) --[[ Line: 393 ]]
		-- upvalues: Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), P1 (copy), GetGamePassConfigStoreModule (upval)
		return if #p5 == 0 then Promise else Promise:andThen(function(Result) --[[ Line: 402 ]]
			-- upvalues: p6 (copy), Flag (upval), Generation (upval), GetLocalPlayerUserId (upval), P1 (upval), GetGamePassConfigStoreModule (upval), p4 (copy)
			if p6 == nil or (Flag or (p6.generation ~= Generation or p6.userId ~= GetLocalPlayerUserId())) then
				return Result
			end
			local Flag1 = false
			
			for _, result in Result.results do
				if result.status ~= "failed" then
					Flag1 = true
					break
				end
			end
			if Flag1 then
				local v1 = (if P1.getGamePassConfigStore == nil then GetGamePassConfigStoreModule else P1.getGamePassConfigStore)()
				v1.clear()
				v1.fetchGamePasses(p4)
				
				return Result
			else
				return Result
			end
		end)
	end
	
	return {
		getManagedPricing = SingleEntityResolverModule.get,
		fetchManagedPricing = SingleEntityResolverModule.fetch,
		getAndFetchManagedPricing = SingleEntityResolverModule.getAndFetch,
		getShops = SingleEntityResolverModule1.get,
		fetchShops = SingleEntityResolverModule1.fetch,
		getAndFetchShops = SingleEntityResolverModule1.getAndFetch,
		getAndFetchPermission = function(UniverseId, CreatorType, CreatorTargetId) --[[ Line: 237 ]]
			-- upvalues: DataResolverModule (copy), Tbl (copy)
			local Text: string = `{UniverseId}:{CreatorType}:{CreatorTargetId or 0}`
			Tbl[Text] = {
				universeId = UniverseId,
				creatorType = CreatorType,
				creatorTargetId = CreatorTargetId
			}
			
			return DataResolverModule.getAndFetchItem(Text)
		end,
		fetchPermission = function(UniverseId, CreatorType, CreatorTargetId) --[[ Line: 241 ]]
			-- upvalues: DataResolverModule (copy), Tbl (copy)
			local Text: string = `{UniverseId}:{CreatorType}:{CreatorTargetId or 0}`
			Tbl[Text] = {
				universeId = UniverseId,
				creatorType = CreatorType,
				creatorTargetId = CreatorTargetId
			}
			
			return DataResolverModule.fetchItem(Text)
		end,
		acceptManagedPricing = function(p7) --[[ Line: 245 ]]
			-- upvalues: FetchMonetizationOptionsModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchMonetizationOptionsModule.acceptManagedPricing(p7, config):andThen(function(Result) --[[ Line: 246 ]]
				-- upvalues: SingleEntityResolverModule (upval), p7 (copy)
				SingleEntityResolverModule.update(p7, { status = "Accepted" })
				
				return Result
			end)
		end,
		ensureManagedPricingAccepted = function(p7) --[[ Line: 252 ]]
			-- upvalues: FetchMonetizationOptionsModule (upval), config (copy), SingleEntityResolverModule (copy), PromiseModule (upval)
			return FetchMonetizationOptionsModule.getManagedPricing(p7, config):andThen(function(Result) --[[ Line: 253 ]]
				-- upvalues: SingleEntityResolverModule (upval), p7 (copy), PromiseModule (upval), FetchMonetizationOptionsModule (upval), config (upval)
				SingleEntityResolverModule.update(p7, Result)
				
				return Result.status == "Accepted" or (if Result.status == "Disabled" then PromiseModule.reject("Managed pricing is not available for this experience.") else FetchMonetizationOptionsModule.acceptManagedPricing(p7, config):andThen(function(Result) --[[ Line: 246 ]]
					-- upvalues: SingleEntityResolverModule (upval), p7 (copy)
					SingleEntityResolverModule.update(p7, { status = "Accepted" })
					
					return Result
				end):andThen(function(): boolean --[[ Line: 261 ]]
					return true
				end))
			end)
		end,
		updateDeveloperProductsManagedPricing = function(p7, p8, p9) --[[ Line: 457 ]]
			-- upvalues: FetchMonetizationOptionsModule (upval), config (copy)
			return FetchMonetizationOptionsModule.updateDeveloperProductsManagedPricing(p7, p8, p9, config)
		end,
		updateGamePassesManagedPricing = function(p7, p8, p9) --[[ Line: 460 ]]
			-- upvalues: refreshGamePassInventory (copy), runBulkGamePassMutation (copy), FetchMonetizationOptionsModule (upval)
			return refreshGamePassInventory(p7, p8, runBulkGamePassMutation(p8, function(p10) --[[ Line: 464 ]]
				-- upvalues: FetchMonetizationOptionsModule (upval), p7 (copy), p8 (copy), p9 (copy)
				return FetchMonetizationOptionsModule.updateGamePassesManagedPricing(p7, p8, p9, p10)
			end))
		end,
		updateGamePassesArchived = function(p7, p8, p9) --[[ Line: 469 ]]
			-- upvalues: refreshGamePassInventory (copy), runBulkGamePassMutation (copy), FetchMonetizationOptionsModule (upval)
			return refreshGamePassInventory(p7, p8, runBulkGamePassMutation(p8, function(p10) --[[ Line: 473 ]]
				-- upvalues: FetchMonetizationOptionsModule (upval), p7 (copy), p8 (copy), p9 (copy)
				return FetchMonetizationOptionsModule.updateGamePassesArchived(p7, p8, p9, p10)
			end))
		end,
		setShopGlobalIcon = function(Key, IsEnabled) --[[ Line: 356 ]]
			-- upvalues: Tbl1 (copy), Flag (ref), Generation (ref), GetLocalPlayerUserId (copy), PromiseModule (upval), performShopGlobalIcon (copy)
			local Entry = Tbl1[Key]
			
			if Entry ~= nil and (Flag or (Entry.generation ~= Generation or Entry.userId ~= GetLocalPlayerUserId())) then
				Tbl1[Key] = nil
			end
			local Entry1 = Tbl1[Key]
			
			if Entry1 == nil then
				Entry1 = {
					pending = 0,
					overlapped = false,
					tail = PromiseModule.resolve(),
					generation = Generation,
					userId = GetLocalPlayerUserId()
				}
				Tbl1[Key] = Entry1
			end
			if Entry1.pending > 0 then
				Entry1.overlapped = true
			end
			Entry1.pending += 1
			local Promise = Entry1.tail:andThen(function() --[[ Line: 376 ]]
				-- upvalues: performShopGlobalIcon (upval), Key (copy), IsEnabled (copy), Entry1 (ref)
				return performShopGlobalIcon(Key, IsEnabled, Entry1)
			end)
			Entry1.tail = Promise:andThen(function() --[[ Line: 379 ]]
				-- upvalues: Entry1 (ref), Tbl1 (upval), Key (copy)
				local Entry1 = Entry1
				Entry1.pending -= 1
				
				if Entry1.pending == 0 and Tbl1[Key] == Entry1 then
					Tbl1[Key] = nil
				end
			end, function() --[[ Line: 384 ]]
				-- upvalues: Entry1 (ref), Tbl1 (upval), Key (copy)
				local Entry1 = Entry1
				Entry1.pending -= 1
				
				if Entry1.pending == 0 and Tbl1[Key] == Entry1 then
					Tbl1[Key] = nil
				end
			end)
			
			return Promise
		end,
		clear = function() --[[ Line: 427 ]]
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy), DataResolverModule (copy), Tbl (copy), Tbl1 (copy)
			SingleEntityResolverModule.clear()
			SingleEntityResolverModule1.clear()
			DataResolverModule.clear()
			table.clear(Tbl)
			table.clear(Tbl1)
		end,
		dispose = function() --[[ Line: 435 ]]
			-- upvalues: Flag (ref), Generation (ref), Callback (copy), SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy), DataResolverModule (copy), Tbl (copy), Tbl1 (copy)
			Flag = true
			Generation += 1
			Callback()
			SingleEntityResolverModule.dispose()
			SingleEntityResolverModule1.dispose()
			DataResolverModule.dispose()
			table.clear(Tbl)
			table.clear(Tbl1)
		end
	}
end