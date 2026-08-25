local createDeepLinkStoreModule = require(script.createDeepLinkStore)
local var1 = nil

return function()
	-- upvalues: var1 (write), createDeepLinkStoreModule (ref)
	if var1 == nil then
		var1 = createDeepLinkStoreModule()
	end
	return var1
end