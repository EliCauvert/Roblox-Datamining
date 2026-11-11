local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)

return function(p1, p2)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy)
	local IsServer = p2.isServer
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy)
		return UGCValidationService:GetEditableMeshVerts(p1.editableMesh)
	end, p2)
	
	if PcallDeferredModuleResult then
		return true, nil, PcallDeferredModuleResult2
	end
	local Text = "Failed to read mesh: " .. p1.fullName
	
	if IsServer then
		error(Text)
	end
	return false, { Text }
end