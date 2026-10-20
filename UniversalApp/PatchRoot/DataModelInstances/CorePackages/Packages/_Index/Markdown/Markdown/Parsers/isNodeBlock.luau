local Markdown = script:FindFirstAncestor("Markdown")
local NodeTypeModule = require(Markdown.Enums.NodeType)
local _ = require(Markdown.Types)

return function(p1): boolean
	-- upvalues: NodeTypeModule (copy)
	return p1.name ~= "TAG" and (p1.type == NodeTypeModule.Block or p1.type == NodeTypeModule.TextBlock)
end