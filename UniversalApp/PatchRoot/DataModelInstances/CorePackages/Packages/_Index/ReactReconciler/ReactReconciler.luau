local _ = require(script.ReactInternalTypes)
local _ = require(script.ReactRootTags)
local _ = require(script.ReactFiberHostConfig)
local _ = require(script["ReactFiberHotReloading.new"])

return function(p1)
	local reactFiberHostConfigModule = require(script.ReactFiberHostConfig)
	
	for i, v in p1 do
		reactFiberHostConfigModule[i] = v
	end
	return require(script.ReactFiberReconciler)
end