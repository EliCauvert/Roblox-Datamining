local CreateDeepLinkStoreModule = require(script.createDeepLinkStore)
local v1 = nil

return function() --[[ Line: 6 | Named "getDeepLinkStore" ]]
	-- upvalues: v1 (ref), CreateDeepLinkStoreModule (copy)
	if v1 == nil then
		v1 = CreateDeepLinkStoreModule()
	end
	return v1
end