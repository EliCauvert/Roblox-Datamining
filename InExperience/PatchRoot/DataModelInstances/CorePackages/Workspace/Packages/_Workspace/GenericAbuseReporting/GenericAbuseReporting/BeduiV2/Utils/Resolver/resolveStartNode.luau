local _ = require(script:FindFirstAncestor("GenericAbuseReporting").BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local configResolversModule = require(script.Parent.configResolvers)

return {
	DEFAULT_START_NODE_ID = "root",
	resolveStartNode = function(p1)
		-- upvalues: configResolversModule (ref)
		if p1.startNode == nil or p1.startNode == "" then
			return "root"
		end
		local var1 = configResolversModule.resolveConfig(p1.startNode, {
			attribute = p1.attributes or {},
			resources = {},
			store = {}
		})
		
		return if type(var1) == "string" then var1 else "root"
	end
}