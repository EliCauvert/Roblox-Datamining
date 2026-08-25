local authCommon = script:FindFirstAncestor("AuthCommon")
local useAdditionalAuditContent = require(authCommon.Stores.AuditContentContext.AuditContentContext).useAdditionalAuditContent
local getFFlagEnableAuditSystemModule = require(authCommon.Flags.GetFFlagEnableAuditSystem)

return function(p0)
	-- upvalues: getFFlagEnableAuditSystemModule (ref), useAdditionalAuditContent (ref)
	if getFFlagEnableAuditSystemModule() then
		useAdditionalAuditContent(p0.contentKey, p0.value)
		
		return nil
	end
	return nil
end