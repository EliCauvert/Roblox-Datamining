local _ = require(script:FindFirstAncestor("GenericAbuseReporting").BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local ConfigResolversModule = require(script.Parent.configResolvers)

return {
	DEFAULT_START_NODE_ID = "root",
	resolveStartNode = function(p1) --[[ Line: 26 ]]
		-- upvalues: ConfigResolversModule (copy)
		if p1.startNode == nil or p1.startNode == "" then
			return "root"
		else
			local ResolveConfigResult = ConfigResolversModule.resolveConfig(p1.startNode, {
				attribute = p1.attributes or {},
				resources = {},
				store = {}
			})
			
			return if type(ResolveConfigResult) == "string" then ResolveConfigResult else "root"
		end
	end
}