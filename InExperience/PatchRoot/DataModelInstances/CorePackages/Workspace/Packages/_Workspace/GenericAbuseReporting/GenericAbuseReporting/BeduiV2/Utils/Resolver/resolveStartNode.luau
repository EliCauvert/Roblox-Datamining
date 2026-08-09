local _ = require(script:FindFirstAncestor("GenericAbuseReporting").BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local configResolversModule = require(script.Parent.configResolvers)

return {
	DEFAULT_START_NODE_ID = "root",
	resolveStartNode = function(p0) --[[ line: 26 ]]
		-- upvalues: configResolversModule (ref)
		if p0.startNode == nil or p0.startNode == "" then
			return "root"
		end
		local var1 = configResolversModule.resolveConfig(p0.startNode, {
			attribute = p0.attributes or {},
			resources = {},
			context = {},
			formData = {},
			store = {}
		})
		
		return if type(var1) == "string" then var1 else "root"
	end
}