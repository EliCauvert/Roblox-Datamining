local CreateDeepLinkStoreModule = require(script.createDeepLinkStore)
local v1 = nil

return function()
	-- upvalues: v1 (ref), CreateDeepLinkStoreModule (copy)
	if v1 == nil then
		v1 = CreateDeepLinkStoreModule()
	end
	return v1
end