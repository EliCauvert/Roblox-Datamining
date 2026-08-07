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

local function _() --[[ line: 48 | named "getFIntPresenceStoreProcessDelaySec" ]]
	return game:GetFastInt("PresenceStoreProcessDelaySec")
end

return function() --[[ line: 52 | named "createPresenceStore" ]]
	-- upvalues: createDataCacheModule (ref), presenceStorePollingTtlSec (ref), RTEPresenceStorePollingTtlSec (ref), createDataResolverModule (ref), cryoModule (ref), requestsModule (ref), normalizePresenceRawDataModule (ref), signalsModule (ref)
	local var9 = createDataCacheModule(presenceStorePollingTtlSec)
	local var10 = createDataCacheModule(if RTEPresenceStorePollingTtlSec > 0 then RTEPresenceStorePollingTtlSec else 1e999)
	local t = {}
	local t_1 = {}
	local var13 = createDataResolverModule({
		cache = var9,
		queueProcessDelaySec = game:GetFastInt("PresenceStoreProcessDelaySec"),
		fetchFn = function(p0) --[[ line: 86 ]]
			-- upvalues: cryoModule (copy), requestsModule (copy), normalizePresenceRawDataModule (copy)
			return requestsModule.MultiGetPresenceByUserIds(cryoModule.Dictionary.keys(p0)):andThen(function(p1) --[[ line: 88 ]]
				-- upvalues: normalizePresenceRawDataModule (copy)
				local userPresences
				local t = {}
				
				if p1 then
					userPresences = p1.responseBody and (p1.responseBody.userPresences or {})
				end
				for i, v in userPresences do
					local var16 = normalizePresenceRawDataModule(v)
					
					if var16 then
						t[var16.id] = var16
					end
				end
				return t
			end)
		end
	})
	
	local function _() --[[ line: 143 | named "disposeLockAwarePresenceEffects" ]]
		-- upvalues: t_1 (ref)
		for i, v in t_1 do
			v()
		end
		table.clear(t_1)
	end
	
	return {
		GetPresenceByUserId = function(p2, p3) --[[ line: 106 ]]
			-- upvalues: var13 (ref), t_1 (ref), signalsModule (copy), var10 (ref)
			if p3 and p3.skipFetch == true then
				return var13.getCachedItem(p2)
			elseif t_1[p2] == nil then
				t_1[p2] = signalsModule.createEffect(function(p4) --[[ line: 112 ]]
					-- upvalues: var10 (copy), p2 (ref), var13 (copy)
					local item, _ = var10.getItem(p2)
					
					if item.data(p4) == true and var13.getCachedItem(p2) ~= nil then
						return
					end
					var13.getAndFetchItem(p2)
				end)
			end
			return var13.getCachedItem(p2)
		end,
		UpdateUserPresence = function(p5, p6, p7) --[[ line: 127 ]]
			-- upvalues: var9 (ref), var10 (ref), t (ref)
			var9.replaceItem(p5, p6)
			local var18 = if p7 then true else false
			var10.replaceItem(p5, var18)
			t[p5] = var18
		end,
		RefreshPresenceByUserId = function(p8) --[[ line: 139 ]]
			-- upvalues: var13 (ref)
			var13.fetchItem(p8)
		end,
		clear = function() --[[ line: 150 ]]
			-- upvalues: t_1 (ref), var10 (ref), var13 (ref)
			for i, v in t_1 do
				v()
			end
			table.clear(t_1)
			var10.clear()
			var13.clear()
		end,
		dispose = function() --[[ line: 156 ]]
			-- upvalues: t_1 (ref), var10 (ref), var13 (ref)
			for i, v in t_1 do
				v()
			end
			table.clear(t_1)
			var10.dispose()
			var13.dispose()
		end
	}
end