local createSduiApiStoreModule = require(script:FindFirstAncestor("SduiSharedUtilities").createSduiApiStore)
local var1 = nil

return function() --[[ line: 9 | named "getSduiApiStore" ]]
	-- upvalues: var1 (write), createSduiApiStoreModule (ref)
	if var1 == nil then
		var1 = createSduiApiStoreModule()
	end
	return var1
end