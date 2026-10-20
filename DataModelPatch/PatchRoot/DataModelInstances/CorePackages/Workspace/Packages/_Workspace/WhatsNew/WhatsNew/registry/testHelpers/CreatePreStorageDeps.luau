local _ = require(script:FindFirstAncestor("WhatsNew").Types)
local UnixTimestamp = DateTime.fromIsoDate("2026-06-01T00:00:00Z").UnixTimestamp

return {
	DEFAULT_USER_ID = 1,
	createPreStorageDeps = function(p1)
		-- upvalues: UnixTimestamp (copy)
		local P0 = p1 or {}
		
		return {
			userId = P0.userId or 1,
			storage = P0.storage or {},
			meta = P0.meta or {},
			currentTime = P0.currentTime or UnixTimestamp
		}
	end,
	DEFAULT_CURRENT_TIME = UnixTimestamp
}