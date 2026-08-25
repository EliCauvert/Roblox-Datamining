local _ = require(script:FindFirstAncestor("Utils").Parent.Types)
local nodeTypeConfigModule = require(script.Parent.NodeTypeConfig)

return function(p0)
	-- upvalues: nodeTypeConfigModule (ref)
	local type = nodeTypeConfigModule[p0.type]
	
	if type then
		return type
	end
	warn(`No node type config found for node: {p0.name} {p0.text} of type: {p0.type}`)
	
	return nil
end