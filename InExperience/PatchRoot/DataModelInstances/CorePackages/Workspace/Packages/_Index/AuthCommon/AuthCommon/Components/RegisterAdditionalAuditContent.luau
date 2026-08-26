local authCommon = script:FindFirstAncestor("AuthCommon")
local useAdditionalAuditContent = require(authCommon.Stores.AuditContentContext.AuditContentContext).useAdditionalAuditContent
local getFFlagEnableAuditSystemModule = require(authCommon.Flags.GetFFlagEnableAuditSystem)

return function(p1)
	-- upvalues: getFFlagEnableAuditSystemModule (ref), useAdditionalAuditContent (ref)
	if getFFlagEnableAuditSystemModule() then
		useAdditionalAuditContent(p1.contentKey, p1.value)
		
		return nil
	end
	return nil
end