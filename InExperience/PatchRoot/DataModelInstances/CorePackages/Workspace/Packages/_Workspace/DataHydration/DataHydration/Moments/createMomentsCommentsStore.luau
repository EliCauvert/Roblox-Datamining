local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.MomentsTypes)
local SignalsModule = require(Parent.Signals)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local DataHydrationTypesModule = require(DataHydration.DataHydrationTypes)
local DataHydrationUtilsModule = require(DataHydration.DataHydrationUtils)
local _ = require(script.Parent.MomentsStoreTypes)

return function(p1) --[[ Line: 23 | Named "createMomentsCommentsStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), SignalsModule (copy), DataHydrationTypesModule (copy), LocalUserIdStore (copy), DataHydrationUtilsModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule,
		fetchFn = function(_, _) --[[ Line: 30 ]]
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject("Moments comments V1 has no get-comment-by-id API")
		end
	})
	local DataCacheModule1 = CreateDataCacheModule()
	local Signal, Signal2 = SignalsModule.createSignal(0)
	
	local function _(p2): string --[[ Line: 37 | Named "normalizeOwnerId" ]]
		if p2 == nil or p2 == "" then
			return ""
		else
			local Text = tostring(p2)
			local Number: number? = tonumber(Text)
			
			return if Number == nil or Number > 0 then Text else ""
		end
	end
	
	local function getGenerationAwareResult(CachedItem, p2) --[[ Line: 46 ]]
		-- upvalues: Signal (copy), DataHydrationTypesModule (upval)
		return {
			data = function(p3) --[[ Line: 48 ]]
				-- upvalues: Signal (upval), p2 (copy), CachedItem (copy)
				return if Signal(p3) == p2 then CachedItem.data(p3) else nil
			end,
			status = function(p3) --[[ Line: 54 ]]
				-- upvalues: Signal (upval), p2 (copy), DataHydrationTypesModule (upval), CachedItem (copy)
				return if Signal(p3) == p2 then CachedItem.status(p3) else DataHydrationTypesModule.DataStatus.NotReady
			end
		}
	end
	
	local _ = function() --[[ Line: 63 | Named "clearCaches" ]]
		-- upvalues: DataResolverModule (copy), DataCacheModule1 (copy)
		DataResolverModule.clear()
		DataCacheModule1.clear()
	end
	
	local _ = function() --[[ Line: 68 | Named "invalidate" ]]
		-- upvalues: DataResolverModule (copy), DataCacheModule1 (copy), Signal2 (copy), Signal (copy)
		DataResolverModule.clear()
		DataCacheModule1.clear()
		Signal2(Signal(false) + 1)
	end
	
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
	local v1 = nil
	
	if CurrentUserId == nil or CurrentUserId == "" then
		v1 = ""
	else
		local Text = tostring(CurrentUserId)
		local Number: number? = tonumber(Text)
		v1 = if Number == nil or Number > 0 then Text else ""
	end
	local LocalPlayerUserId = DataHydrationUtilsModule.getLocalPlayerUserId()
	local v2 = nil
	
	if LocalPlayerUserId == nil or LocalPlayerUserId == "" then
		v2 = ""
	else
		local Text = tostring(LocalPlayerUserId)
		local Number: number? = tonumber(Text)
		v2 = if Number == nil or Number > 0 then Text else ""
	end
	local v3: string = if v1 == "" then v2 else v1
	local ObserveLocalPlayerUserIdResult = DataHydrationUtilsModule.observeLocalPlayerUserId(function(p2) --[[ Line: 76 | Named "handleOwnerChange" ]]
		-- upvalues: v3 (ref), DataResolverModule (copy), DataCacheModule1 (copy), Signal2 (copy), Signal (copy)
		local v4 = nil
		if p2 == nil or p2 == "" then
			v4 = ""
		else
			local Text = tostring(p2)
			local Number: number? = tonumber(Text)
			v4 = if Number == nil or Number > 0 then Text else ""
		end
		if v4 ~= v3 then
			v3 = v4
			DataResolverModule.clear()
			DataCacheModule1.clear()
			Signal2(Signal(false) + 1)
			
			return
		end
	end)
	local v4: string = v1
	local Effect = SignalsModule.createEffect(function(p2) --[[ Line: 87 ]]
		-- upvalues: LocalUserIdStore (upval), v4 (ref), v3 (ref), DataResolverModule (copy), DataCacheModule1 (copy), Signal2 (copy), Signal (copy)
		local CurrentUserId = LocalUserIdStore.getCurrentUserId(p2)
		local v5 = nil
		
		if CurrentUserId == nil or CurrentUserId == "" then
			v5 = ""
		else
			local Text = tostring(CurrentUserId)
			local Number: number? = tonumber(Text)
			v5 = if Number == nil or Number > 0 then Text else ""
		end
		if v5 == v4 then return end
		v4 = v5
		local v6 = nil
		
		if v5 == nil or v5 == "" then
			v6 = ""
		else
			local Text = tostring(v5)
			local Number: number? = tonumber(Text)
			v6 = if Number == nil or Number > 0 then Text else ""
		end
		if v6 ~= v3 then
			v3 = v6
			DataResolverModule.clear()
			DataCacheModule1.clear()
			Signal2(Signal(false) + 1)
			
			return
		end
	end)
	local Flag = false
	
	return {
		getCachedComment = function(p2) --[[ Line: 97 ]]
			-- upvalues: Signal (copy), DataResolverModule (copy), getGenerationAwareResult (copy)
			return (getGenerationAwareResult(DataResolverModule.getCachedItem(p2), (Signal(false))))
		end,
		getCachedMomentComments = function(p2) --[[ Line: 103 ]]
			-- upvalues: Signal (copy), DataCacheModule1 (copy), getGenerationAwareResult (copy)
			return (getGenerationAwareResult(DataCacheModule1.getItem(p2), (Signal(false))))
		end,
		upsertComments = function(List, p2) --[[ Line: 109 ]]
			-- upvalues: Signal (copy), DataCacheModule (copy)
			if p2 ~= nil and p2 ~= Signal(false) then return end
			local t = {}
			
			for _, value in List do
				t[value.commentId] = value
			end
			DataCacheModule.replaceItems(t)
		end,
		upsertMomentComments = function(p3, p4) --[[ Line: 120 ]]
			-- upvalues: Signal (copy), DataCacheModule1 (copy)
			if p4 == nil or p4 == Signal(false) then
				DataCacheModule1.replaceItems(p3)
				
				return
			end
		end,
		getOwnerGeneration = Signal,
		clear = function() --[[ Line: 127 ]]
			-- upvalues: DataResolverModule (copy), DataCacheModule1 (copy), Signal2 (copy), Signal (copy)
			DataResolverModule.clear()
			DataCacheModule1.clear()
			Signal2(Signal(false) + 1)
		end,
		dispose = function() --[[ Line: 131 ]]
			-- upvalues: Flag (ref), ObserveLocalPlayerUserIdResult (copy), Effect (copy), Signal2 (copy), Signal (copy), DataResolverModule (copy), DataCacheModule1 (copy)
			if not Flag then
				Flag = true
				ObserveLocalPlayerUserIdResult()
				Effect()
				Signal2(Signal(false) + 1)
				DataResolverModule.dispose()
				DataCacheModule1.dispose()
				
				return
			end
		end
	}
end