local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Types)
local NodeTypeModule = require(Markdown.Enums.NodeType)

return function(p1, p2)
	-- upvalues: NodeTypeModule (copy)
	local NodeConfigurationEntry = p2.nodeConfiguration[p1]
	
	if NodeConfigurationEntry then
		return NodeConfigurationEntry.type
	else
		warn(`No node configuration found for {p1}`)
		
		return NodeTypeModule.Block
	end
end