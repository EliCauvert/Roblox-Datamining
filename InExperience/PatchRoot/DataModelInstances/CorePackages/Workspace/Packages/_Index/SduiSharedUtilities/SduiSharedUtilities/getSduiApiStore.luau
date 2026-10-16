local CreateSduiApiStoreModule = require(script:FindFirstAncestor("SduiSharedUtilities").createSduiApiStore)
local v1 = nil

return function() --[[ Line: 9 | Named "getSduiApiStore" ]]
	-- upvalues: v1 (ref), CreateSduiApiStoreModule (copy)
	if v1 == nil then
		v1 = CreateSduiApiStoreModule()
	end
	return v1
end