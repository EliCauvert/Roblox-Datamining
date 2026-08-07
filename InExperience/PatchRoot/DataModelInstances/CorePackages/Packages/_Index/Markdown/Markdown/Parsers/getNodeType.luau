local markdown = script:FindFirstAncestor("Markdown")
local _ = require(markdown.Types)
local nodeTypeModule = require(markdown.Enums.NodeType)

return function(p0, p1) --[[ line: 8 | named "getNodeType" ]]
	-- upvalues: nodeTypeModule (ref)
	local var2 = p1.nodeConfiguration[p0]
	
	if var2 then
		return var2.type
	end
	warn(`No node configuration found for {p0}`)
	
	return nodeTypeModule.Block
end