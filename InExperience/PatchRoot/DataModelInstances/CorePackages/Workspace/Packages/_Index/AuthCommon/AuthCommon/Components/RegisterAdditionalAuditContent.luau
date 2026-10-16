local AuthCommon = script:FindFirstAncestor("AuthCommon")
local UseAdditionalAuditContentFunction = require(AuthCommon.Stores.AuditContentContext.AuditContentContext).useAdditionalAuditContent
local GetFFlagEnableAuditSystemModule = require(AuthCommon.Flags.GetFFlagEnableAuditSystem)

return function(p1) --[[ Line: 21 | Named "RegisterAdditionalAuditContent" ]]
	-- upvalues: GetFFlagEnableAuditSystemModule (copy), UseAdditionalAuditContentFunction (copy)
	if GetFFlagEnableAuditSystemModule() then
		UseAdditionalAuditContentFunction(p1.contentKey, p1.value)
		
		return nil
	else
		return nil
	end
end