local _ = require(script:FindFirstAncestor("Utils").Parent.Types)
local NodeTypeConfigModule = require(script.Parent.NodeTypeConfig)

return function(p1)
	-- upvalues: NodeTypeConfigModule (copy)
	local NodeTypeConfigModuleEntry = NodeTypeConfigModule[p1.type]
	
	if NodeTypeConfigModuleEntry then
		return NodeTypeConfigModuleEntry
	else
		warn(`No node type config found for node: {p1.name} {p1.text} of type: {p1.type}`)
		
		return nil
	end
end