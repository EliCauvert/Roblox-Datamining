local UGCValidationService = game:GetService("UGCValidationService")
local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local pcallDeferredModule = require(parent.util.pcallDeferred)

return function(p0, p1) --[[ line: 12 | named "getVerts" ]]
	-- upvalues: pcallDeferredModule (ref), UGCValidationService (ref)
	local isServer = p1.isServer
	local var2, var3 = pcallDeferredModule(function() --[[ line: 18 ]]
		-- upvalues: UGCValidationService (copy), p0 (ref)
		return UGCValidationService:GetEditableMeshVerts(p0.editableMesh)
	end, p1)
	
	if var2 then
		return true, nil, var3
	end
	local text = "Failed to read mesh: " .. p0.fullName
	
	if isServer then
		error(text)
	end
	return false, { text }
end