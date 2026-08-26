local markdown = script:FindFirstAncestor("Markdown")
local nodeTypeModule = require(markdown.Enums.NodeType)
local _ = require(markdown.Types)

return function(p1)
	-- upvalues: nodeTypeModule (ref)
	return p1.name ~= "TAG" and (if p1.type ~= nodeTypeModule.Block then p1.type == nodeTypeModule.TextBlock else true)
end