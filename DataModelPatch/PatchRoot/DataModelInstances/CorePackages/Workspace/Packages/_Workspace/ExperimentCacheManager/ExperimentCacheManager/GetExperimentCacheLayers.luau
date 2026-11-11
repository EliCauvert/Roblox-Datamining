local Parent = script:FindFirstAncestor("ExperimentCacheManager").Parent
local DashModule = require(Parent.Dash)
local GetAllAppUserLayersFunction = require(Parent.ExperimentLayers).getAllAppUserLayers

return function()
	-- upvalues: GetAllAppUserLayersFunction (copy), DashModule (copy)
	return DashModule.values((GetAllAppUserLayersFunction()))
end