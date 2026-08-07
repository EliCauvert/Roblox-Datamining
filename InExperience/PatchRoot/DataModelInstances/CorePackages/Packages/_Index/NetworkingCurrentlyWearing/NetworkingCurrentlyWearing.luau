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