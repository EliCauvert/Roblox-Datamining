local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

local function Link(Destination, Title)
	-- upvalues: NodeModule (copy)
	local Link = NodeModule.new("Link", false)
	Link.destination = Destination
	Link.title = Title
	
	return Link
end

function NodeModule.toStringAttributesByKind.Link(p1): string
	return "destination=" .. (if p1.destination == nil then "null" else p1.destination) .. ", title=" .. (if p1.title == nil then "null" else p1.title)
end

return Link