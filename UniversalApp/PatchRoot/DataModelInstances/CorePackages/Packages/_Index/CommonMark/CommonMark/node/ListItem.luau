local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return function()
	-- upvalues: NodeModule (copy)
	local ListItem = NodeModule.new("ListItem", true)
	ListItem.markerIndent = nil
	ListItem.contentIndent = nil
	
	return ListItem
end