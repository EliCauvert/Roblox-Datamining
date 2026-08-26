local networkRequests = script.networkRequests
local createGetCurrentlyWearingModule = require(networkRequests.createGetCurrentlyWearing)
local createGetItemDetailsModule = require(networkRequests.createGetItemDetails)

return {
	config = function(p1)
		-- upvalues: createGetCurrentlyWearingModule (ref), createGetItemDetailsModule (ref)
		return {
			GetCurrentlyWearing = createGetCurrentlyWearingModule(p1),
			GetItemDetails = createGetItemDetailsModule(p1)
		}
	end
}