local DataHydration = script:FindFirstAncestor("DataHydration")
local PresenceStoreModule = require(DataHydration.Presence.PresenceStore)
local NormalizePresenceRawDataModule = require(DataHydration.Presence.normalizePresenceRawData)

return function(p1, p2) --[[ Line: 19 | Named "hydratePresenceFromProfileMetadata" ]]
	-- upvalues: NormalizePresenceRawDataModule (copy), PresenceStoreModule (copy)
	local Presence = p2 and p2.presence
	
	if Presence == nil then return end
	local NormalizePresenceRawDataModuleResult = NormalizePresenceRawDataModule(Presence, p1)
	
	if NormalizePresenceRawDataModuleResult ~= nil then
		PresenceStoreModule.get().UpdateUserPresence(p1, NormalizePresenceRawDataModuleResult, { isUpdatedRealtime = nil, isRealtimeUnknown = true })
		
		return
	end
end