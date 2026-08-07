local parent = script:FindFirstAncestor("ExperimentCacheManager").Parent
local dashModule = require(parent.Dash)
local getAllAppUserLayers = require(parent.ExperimentLayers).getAllAppUserLayers

return function() --[[ line: 5 ]]
	-- upvalues: getAllAppUserLayers (ref), dashModule (ref)
	return dashModule.values(getAllAppUserLayers())
end