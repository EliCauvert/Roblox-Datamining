local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(Parent.LuauPolyfill)
local LogResponseErrorFunction = require(Parent.DiscoveryUtils).logResponseError
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MarketplaceItemFavoriteStoreTypes)
local MarketplaceItemFavoriteUrlBuilderModule = require(script.Parent.MarketplaceItemFavoriteUrlBuilder)
local FetchMarketplaceItemFavoriteModule = require(script.Parent.fetchMarketplaceItemFavorite)
local RequestMarketplaceItemFavoriteUpdateModule = require(script.Parent.requestMarketplaceItemFavoriteUpdate)

local function _(p1)
	return if type(p1) == "table" then p1.StatusCode else nil
end

return function(p1)
	-- upvalues: MarketplaceItemFavoriteUrlBuilderModule (copy), CreateDataCacheModule (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), FetchMarketplaceItemFavoriteModule (copy), RequestMarketplaceItemFavoriteUpdateModule (copy)
	local ItemType = p1.itemType
	local EndpointName = MarketplaceItemFavoriteUrlBuilderModule.getEndpointName(ItemType)
	local Tbl = {}
	local t = {}
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		supportsMutations = true,
		cache = DataCacheModule,
		logError = function(p2)
			-- upvalues: LogResponseErrorFunction (upval), EndpointName (copy)
			LogResponseErrorFunction(EndpointName, p2)
		end,
		onClear = function()
			-- upvalues: Tbl (copy)
			table.clear(Tbl)
		end,
		fetchFn = function(p2, _)
			-- upvalues: t (copy), FetchMarketplaceItemFavoriteModule (upval), ItemType (copy), DataCacheModule (copy)
			local Entry = t[p2]
			
			return FetchMarketplaceItemFavoriteModule(ItemType, p2):andThen(function(Result)
				-- upvalues: t (upval), p2 (copy), Entry (copy), DataCacheModule (upval)
				return if t[p2] == Entry then { isFavorited = Result.responseBody ~= nil } else DataCacheModule.getItem(p2).data(false)
			end)
		end
	})
	
	local function _(p2)
		-- upvalues: DataCacheModule (copy)
		local DataResult = DataCacheModule.getItem(p2).data(false)
		
		return if DataResult then DataResult.isFavorited else nil
	end
	
	local _ = function(p2, p3, BaselineFavorited)
		-- upvalues: p1 (copy)
		local BaselineCount = p3.baselineCount
		
		if BaselineCount ~= nil and p1.setFavoriteCount ~= nil then
			p1.setFavoriteCount(p2, (math.max(0, BaselineCount + (if BaselineFavorited == p3.baselineFavorited then 0 elseif BaselineFavorited then 1 else -1))))
			
			return
		end
	end
	
	local function finishToggle(Key, p2, p3)
		-- upvalues: Tbl (copy), DataResolverModule (copy), DataCacheModule (copy), p1 (copy)
		Tbl[Key] = nil
		DataResolverModule.clearMutation(Key)
		local DataResult = DataCacheModule.getItem(Key).data(false)
		local IsFavorited = if DataResult then DataResult.isFavorited else nil
		
		if IsFavorited == nil then return end
		local BaselineCount = p2.baselineCount
		
		if BaselineCount ~= nil and p1.setFavoriteCount ~= nil then
			p1.setFavoriteCount(Key, (math.max(0, BaselineCount + (if IsFavorited == p2.baselineFavorited then 0 elseif IsFavorited then 1 else -1))))
		end
		local OnSettled: (any) -> () = p2.callbacks and p2.callbacks.onSettled
		
		if p2.hasWritten and OnSettled then
			OnSettled({ type = p3, isFavorited = IsFavorited })
		end
	end
	
	local Callback = nil
	
	local _ = function(p2, p3, p4)
		-- upvalues: DataCacheModule (copy), finishToggle (copy), Callback (ref)
		local DataResult = DataCacheModule.getItem(p2).data(false)
		
		if p3.desired == (if DataResult then DataResult.isFavorited else nil) then
			finishToggle(p2, p3, p4)
			
			return
		else
			Callback(p2, p3)
		end
	end
	
	Callback = function(Key, p2)
		-- upvalues: RequestMarketplaceItemFavoriteUpdateModule (upval), ItemType (copy), Tbl (copy), t (copy), DataCacheModule (copy), finishToggle (copy), Callback (ref), LogResponseErrorFunction (upval), EndpointName (copy)
		local Desired = p2.desired
		p2.isWriting = true
		p2.hasWritten = true
		local OnWriteStart: (any) -> () = p2.callbacks and p2.callbacks.onWriteStart
		
		if OnWriteStart then
			OnWriteStart(Desired)
		end
		RequestMarketplaceItemFavoriteUpdateModule(ItemType, Key, Desired):andThen(function()
			-- upvalues: Tbl (upval), Key (copy), p2 (copy), t (upval), DataCacheModule (upval), Desired (copy), finishToggle (upval), Callback (upval)
			if Tbl[Key] ~= p2 then return end
			p2.isWriting = false
			t[Key] = (t[Key] or 0) + 1
			DataCacheModule.updateItem(Key, { isFavorited = Desired })
			local DataResult = DataCacheModule.getItem(Key).data(false)
			
			if p2.desired == (if DataResult then DataResult.isFavorited else nil) then
				finishToggle(Key, p2, "success")
				
				return
			else
				Callback(Key, p2)
			end
		end):catch(function(Err)
			-- upvalues: Tbl (upval), Key (copy), p2 (copy), LogResponseErrorFunction (upval), EndpointName (upval), Desired (copy), finishToggle (upval), DataCacheModule (upval), Callback (upval)
			if Tbl[Key] ~= p2 then return end
			p2.isWriting = false
			LogResponseErrorFunction(EndpointName, {
				StatusCode = if type(Err) == "table" then Err.StatusCode else nil
			})
			
			if p2.desired == Desired then
				finishToggle(Key, p2, "error")
				
				return
			end
			local DataResult = DataCacheModule.getItem(Key).data(false)
			
			if p2.desired == (if DataResult then DataResult.isFavorited else nil) then
				finishToggle(Key, p2, "success")
				
				return
			else
				Callback(Key, p2)
			end
		end)
	end
	
	return {
		getFavorite = function(p2)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getOptimisticCachedItem(p2)
		end,
		getAndFetchFavorite = function(p2)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getOptimisticAndFetchItem(p2)
		end,
		toggleFavorite = function(Key, Callbacks): boolean
			-- upvalues: DataResolverModule (copy), Tbl (copy), p1 (copy), DataCacheModule (copy), finishToggle (copy), Callback (ref)
			local DataResult = DataResolverModule.getOptimisticCachedItem(Key).data(false)
			
			if DataResult == nil then
				return false
			end
			local NoIsFavorited = not DataResult.isFavorited
			local Entry = Tbl[Key]
			
			if Entry == nil then
				Entry = {
					isWriting = false,
					hasWritten = false,
					desired = NoIsFavorited,
					baselineFavorited = DataResult.isFavorited,
					baselineCount = if p1.getFavoriteCount then p1.getFavoriteCount(Key) else nil,
					callbacks = Callbacks
				}
				Tbl[Key] = Entry
			else
				Entry.desired = NoIsFavorited
				
				if Callbacks then
					Entry.callbacks = Callbacks
				end
			end
			DataResolverModule.setMutation(Key, { isFavorited = NoIsFavorited })
			local Entry1 = Entry
			local BaselineCount = Entry1.baselineCount
			
			if BaselineCount ~= nil and p1.setFavoriteCount ~= nil then
				p1.setFavoriteCount(Key, (math.max(0, BaselineCount + (if NoIsFavorited == Entry1.baselineFavorited then 0 elseif NoIsFavorited then 1 else -1))))
			end
			if not Entry.isWriting then
				local Entry2 = Entry
				local DataResult1 = DataCacheModule.getItem(Key).data(false)
				
				if Entry2.desired == (if DataResult1 then DataResult1.isFavorited else nil) then
					finishToggle(Key, Entry2, "success")
				else
					Callback(Key, Entry2)
				end
			end
			return true
		end,
		updateItems = DataCacheModule.updateItems,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end