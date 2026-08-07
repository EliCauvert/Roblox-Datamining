-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:53 2026 Pacific Standard Time.

local networkRequests = script.networkRequests
local createGetCurrentlyWearingModule = require(networkRequests.createGetCurrentlyWearing)
local createGetItemDetailsModule = require(networkRequests.createGetItemDetails)

return {
	config = function(p0) --[[ line: 9 ]]
		-- upvalues: createGetCurrentlyWearingModule (ref), createGetItemDetailsModule (ref)
		return {
			GetCurrentlyWearing = createGetCurrentlyWearingModule(p0),
			GetItemDetails = createGetItemDetailsModule(p0)
		}
	end
}