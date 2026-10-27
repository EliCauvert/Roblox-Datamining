local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return function(Label, Destination, Title)
	-- upvalues: NodeModule (copy)
	local LinkReferenceDefinition = NodeModule.new("LinkReferenceDefinition", true)
	LinkReferenceDefinition.label = Label
	LinkReferenceDefinition.destination = Destination
	LinkReferenceDefinition.title = Title
	
	return LinkReferenceDefinition
end