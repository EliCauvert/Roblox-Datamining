local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local enumsModule = require(inExperienceSideSheet.Common.Enums)
local getActionBindingsStoreModule = require(inExperienceSideSheet.Stores.GetActionBindingsStore)

return function(value) --[[ line: 7 | named "setIsRespawnEnabled" ]]
	-- upvalues: getActionBindingsStoreModule (ref), enumsModule (ref)
	local respawn = getActionBindingsStoreModule().sessionActionBindings[enumsModule.ActionBinding.Respawn]
	
	if respawn then
		respawn.setIsEnabled(value)
	end
end