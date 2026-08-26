local markdown = script:FindFirstAncestor("Markdown")
local _ = require(markdown.Types)
local nodeTypeModule = require(markdown.Enums.NodeType)

return function(p1, p2)
	-- upvalues: nodeTypeModule (ref)
	local var1 = p2.nodeConfiguration[p1]
	
	if var1 then
		return var1.type
	end
	warn(`No node configuration found for {p1}`)
	
	return nodeTypeModule.Block
end