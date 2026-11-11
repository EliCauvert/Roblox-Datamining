local CreateSduiFocusActivationStoreModule = require(script:FindFirstAncestor("SduiSharedUtilities").FocusNavigation.createSduiFocusActivationStore)
local v1 = nil

return function()
	-- upvalues: v1 (ref), CreateSduiFocusActivationStoreModule (copy)
	if v1 == nil then
		v1 = CreateSduiFocusActivationStoreModule()
	end
	return v1
end