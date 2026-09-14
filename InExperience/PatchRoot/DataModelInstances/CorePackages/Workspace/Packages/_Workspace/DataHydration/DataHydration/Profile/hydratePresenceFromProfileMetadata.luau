local dataHydration = script:FindFirstAncestor("DataHydration")
local presenceStoreModule = require(dataHydration.Presence.PresenceStore)
local normalizePresenceRawDataModule = require(dataHydration.Presence.normalizePresenceRawData)

return function(p1, p2)
	-- upvalues: normalizePresenceRawDataModule (ref), presenceStoreModule (ref)
	local presence = p2 and p2.presence
	
	if presence == nil then return end
	local var1 = normalizePresenceRawDataModule(presence, p1)
	
	if var1 == nil then
		return
	end
	presenceStoreModule.get().UpdateUserPresence(p1, var1, { isUpdatedRealtime = nil, isRealtimeUnknown = true })
end