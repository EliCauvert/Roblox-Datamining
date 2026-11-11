local _ = require(script.ReactInternalTypes)
local _ = require(script.ReactRootTags)
local _ = require(script.ReactFiberHostConfig)
local _ = require(script["ReactFiberHotReloading.new"])

return function(List)
	local ReactFiberHostConfigModule = require(script.ReactFiberHostConfig)
	
	for i, value in List do
		ReactFiberHostConfigModule[i] = value
	end
	return require(script.ReactFiberReconciler)
end