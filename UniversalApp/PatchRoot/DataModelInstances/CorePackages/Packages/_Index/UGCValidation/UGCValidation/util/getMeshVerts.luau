local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)

return function(p1, p2)
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref)
	local isServer = p2.isServer
	local var1, var2 = pcallDeferredModule(function()
		-- upvalues: UGCValidationService (copy), p1 (ref)
		return UGCValidationService:GetEditableMeshVerts(p1.editableMesh)
	end, p2)
	
	if var1 then
		return true, nil, var2
	end
	local text = "Failed to read mesh: " .. p0.fullName
	
	if isServer then
		error(text)
	end
	return false, { text }
end