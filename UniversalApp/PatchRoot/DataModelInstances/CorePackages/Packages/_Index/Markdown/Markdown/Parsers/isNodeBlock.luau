local markdown = script:FindFirstAncestor("Markdown")
local nodeTypeModule = require(markdown.Enums.NodeType)
local _ = require(markdown.Types)

return function(p0)
	-- upvalues: nodeTypeModule (ref)
	return p0.name ~= "TAG" and (if p0.type ~= nodeTypeModule.Block then p0.type == nodeTypeModule.TextBlock else true)
end