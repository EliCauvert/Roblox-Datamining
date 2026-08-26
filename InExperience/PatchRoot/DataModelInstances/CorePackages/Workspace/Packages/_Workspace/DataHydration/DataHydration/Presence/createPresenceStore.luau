local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local requestsModule = require(dataHydration.Presence.Requests)
local _ = require(script.Parent.Requests.MultiGetPresenceByUserIds)
local normalizePresenceRawDataModule = require(script.Parent.normalizePresenceRawData)
local presenceStorePollingTtlSec = game:DefineFastInt("PresenceStorePollingTtlSec", 60)
local RTEPresenceStorePollingTtlSec = game:DefineFastInt("RTEPresenceStorePollingTtlSec", 0)
game:DefineFastInt("PresenceStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("PresenceStoreProcessDelaySec")
end

return function()
	-- upvalues: createDataCacheModule (ref), presenceStorePollingTtlSec (ref), RTEPresenceStorePollingTtlSec (ref), createDataResolverModule (ref), cryoModule (ref), requestsModule (ref), normalizePresenceRawDataModule (ref), signalsModule (ref)
	local var1 = createDataCacheModule(presenceStorePollingTtlSec)
	local var2 = createDataCacheModule(if RTEPresenceStorePollingTtlSec > 0 then RTEPresenceStorePollingTtlSec else 1e999)
	local t = {}
	local t_1 = {}
	local var3 = createDataResolverModule({
		cache = var1,
		queueProcessDelaySec = game:GetFastInt("PresenceStoreProcessDelaySec"),
		fetchFn = function(p1)
			-- upvalues: cryoModule (copy), requestsModule (copy), normalizePresenceRawDataModule (copy)
			return requestsModule.MultiGetPresenceByUserIds(cryoModule.Dictionary.keys(p1)):andThen(function(p2)
				-- upvalues: normalizePresenceRawDataModule (copy)
				local userPresences
				local t = {}
				
				if p2 then
					userPresences = p2.responseBody and (p2.responseBody.userPresences or {})
				end
				for i, v in userPresences do
					local var4 = normalizePresenceRawDataModule(v)
					
					if var4 then
						t[var4.id] = var4
					end
				end
				return t
			end)
		end
	})
	
	local function _()
		-- upvalues: t_1 (ref)
		for i, v in t_1 do
			v()
		end
		table.clear(t_1)
	end
	
	return {
		GetPresenceByUserId = function(p2, p3)
			-- upvalues: var3 (ref), t_1 (ref), signalsModule (copy), var2 (ref)
			if p3 and p3.skipFetch == true then
				return var3.getCachedItem(p2)
			elseif t_1[p2] == nil then
				t_1[p2] = signalsModule.createEffect(function(p4)
					-- upvalues: var2 (copy), p2 (ref), var3 (copy)
					local item, _ = var2.getItem(p2)
					
					if item.data(p4) == true and var3.getCachedItem(p2) ~= nil then
						return
					end
					var3.getAndFetchItem(p2)
				end)
			end
			return var3.getCachedItem(p2)
		end,
		UpdateUserPresence = function(p2, p3, p4)
			-- upvalues: var1 (ref), var2 (ref), t (ref)
			var1.replaceItem(p2, p3)
			local var4 = if p4 then true else false
			var2.replaceItem(p2, var4)
			t[p2] = var4
		end,
		RefreshPresenceByUserId = function(p2)
			-- upvalues: var3 (ref)
			var3.fetchItem(p2)
		end,
		clear = function()
			-- upvalues: t_1 (ref), var2 (ref), var3 (ref)
			for i, v in t_1 do
				v()
			end
			table.clear(t_1)
			var2.clear()
			var3.clear()
		end,
		dispose = function()
			-- upvalues: t_1 (ref), var2 (ref), var3 (ref)
			for i, v in t_1 do
				v()
			end
			table.clear(t_1)
			var2.dispose()
			var3.dispose()
		end
	}
end