local createSduiFocusActivationStoreModule = require(script:FindFirstAncestor("SduiSharedUtilities").FocusNavigation.createSduiFocusActivationStore)
local var1 = nil

return function() --[[ line: 8 | named "getSduiFocusActivationStore" ]]
	-- upvalues: var1 (write), createSduiFocusActivationStoreModule (ref)
	if var1 == nil then
		var1 = createSduiFocusActivationStoreModule()
	end
	return var1
end