local _ = require(script:FindFirstAncestor("Utils").Parent.Types)
local nodeTypeConfigModule = require(script.Parent.NodeTypeConfig)

return function(p1)
	-- upvalues: nodeTypeConfigModule (ref)
	local type = nodeTypeConfigModule[p1.type]
	
	if type then
		return type
	end
	warn(`No node type config found for node: {p1.name} {p1.text} of type: {p1.type}`)
	
	return nil
end