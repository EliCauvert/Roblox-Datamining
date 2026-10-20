local NetworkRequests = script.networkRequests
local CreateGetCurrentlyWearingModule = require(NetworkRequests.createGetCurrentlyWearing)
local CreateGetItemDetailsModule = require(NetworkRequests.createGetItemDetails)

return {
	config = function(p1)
		-- upvalues: CreateGetCurrentlyWearingModule (copy), CreateGetItemDetailsModule (copy)
		return {
			GetCurrentlyWearing = CreateGetCurrentlyWearingModule(p1),
			GetItemDetails = CreateGetItemDetailsModule(p1)
		}
	end
}