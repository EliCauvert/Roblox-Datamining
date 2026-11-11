local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local EnumsModule = require(InExperienceSideSheet.Common.Enums)
local GetActionBindingsStoreModule = require(InExperienceSideSheet.Stores.GetActionBindingsStore)

return function(p1)
	-- upvalues: GetActionBindingsStoreModule (copy), EnumsModule (copy)
	local SessionActionBinding = GetActionBindingsStoreModule().sessionActionBindings[EnumsModule.ActionBinding.Respawn]
	
	if SessionActionBinding then
		SessionActionBinding.setIsEnabled(p1)
	end
end