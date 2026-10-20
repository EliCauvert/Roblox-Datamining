local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local RequestsModule = require(DataHydration.Presence.Requests)
local _ = require(script.Parent.Requests.MultiGetPresenceByUserIds)
local NormalizePresenceRawDataModule = require(script.Parent.normalizePresenceRawData)
local FFlagProfileCTAHydratePresenceFromMetadataModule = require(DataHydration.Flags.FFlagProfileCTAHydratePresenceFromMetadata)
local PresenceStorePollingTtlSec = game:DefineFastInt("PresenceStorePollingTtlSec", 60)
local RTEPresenceStorePollingTtlSec = game:DefineFastInt("RTEPresenceStorePollingTtlSec", 0)
game:DefineFastInt("PresenceStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("PresenceStoreProcessDelaySec")
end

return function()
	-- upvalues: CreateDataCacheModule (copy), PresenceStorePollingTtlSec (copy), RTEPresenceStorePollingTtlSec (copy), CreateDataResolverModule (copy), CryoModule (copy), RequestsModule (copy), NormalizePresenceRawDataModule (copy), SignalsModule (copy), FFlagProfileCTAHydratePresenceFromMetadataModule (copy)
	local DataCacheModule = CreateDataCacheModule(PresenceStorePollingTtlSec)
	local DataCacheModule1 = CreateDataCacheModule(if RTEPresenceStorePollingTtlSec > 0 then RTEPresenceStorePollingTtlSec else 1e999)
	local t = {}
	local Tbl = {}
	local DataResolverModule = CreateDataResolverModule({
		cache = DataCacheModule,
		queueProcessDelaySec = game:GetFastInt("PresenceStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: CryoModule (upval), RequestsModule (upval), NormalizePresenceRawDataModule (upval)
			return RequestsModule.MultiGetPresenceByUserIds((CryoModule.Dictionary.keys(p1))):andThen(function(Result)
				-- upvalues: NormalizePresenceRawDataModule (upval)
				local t = {}
				local UserPresences = Result and Result.responseBody and Result.responseBody.userPresences or {}
				for _, userPresence in UserPresences do
					local NormalizePresenceRawDataModuleResult = NormalizePresenceRawDataModule(userPresence)
					
					if NormalizePresenceRawDataModuleResult then
						t[NormalizePresenceRawDataModuleResult.id] = NormalizePresenceRawDataModuleResult
					end
				end
				return t
			end)
		end
	})
	
	local function _()
		-- upvalues: Tbl (copy)
		for _, value in Tbl do
			value()
		end
		table.clear(Tbl)
	end
	
	return {
		GetPresenceByUserId = function(Key, p2)
			-- upvalues: DataResolverModule (copy), Tbl (copy), SignalsModule (upval), DataCacheModule1 (copy)
			if p2 and p2.skipFetch == true then
				return DataResolverModule.getCachedItem(Key)
			end
			if Tbl[Key] == nil then
				Tbl[Key] = SignalsModule.createEffect(function(p3)
					-- upvalues: DataCacheModule1 (upval), Key (copy), DataResolverModule (upval)
					local Item, _ = DataCacheModule1.getItem(Key)
					local CachedItem = DataResolverModule.getCachedItem(Key)
					
					if Item.data(p3) ~= true or CachedItem == nil then
						DataResolverModule.getAndFetchItem(Key)
						
						return
					end
				end)
			end
			return DataResolverModule.getCachedItem(Key)
		end,
		UpdateUserPresence = function(Key, p2, p3)
			-- upvalues: FFlagProfileCTAHydratePresenceFromMetadataModule (upval), DataCacheModule (copy), DataCacheModule1 (copy), t (copy)
			if FFlagProfileCTAHydratePresenceFromMetadataModule and p3 and p3.isRealtimeUnknown then
				DataCacheModule.replaceItem(Key, p2)
				
				return
			else
				DataCacheModule.replaceItem(Key, p2)
				local IsIsUpdatedRealtime: boolean = if p3 then p3.isUpdatedRealtime == true else false
				DataCacheModule1.replaceItem(Key, IsIsUpdatedRealtime)
				t[Key] = IsIsUpdatedRealtime
			end
		end,
		RefreshPresenceByUserId = function(p2)
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.fetchItem(p2)
		end,
		clear = function()
			-- upvalues: Tbl (copy), DataCacheModule1 (copy), DataResolverModule (copy)
			for _, value in Tbl do
				value()
			end
			table.clear(Tbl)
			DataCacheModule1.clear()
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: Tbl (copy), DataCacheModule1 (copy), DataResolverModule (copy)
			for _, value in Tbl do
				value()
			end
			table.clear(Tbl)
			DataCacheModule1.dispose()
			DataResolverModule.dispose()
		end
	}
end