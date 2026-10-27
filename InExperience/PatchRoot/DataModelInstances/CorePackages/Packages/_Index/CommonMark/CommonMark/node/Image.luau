local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

local function Image(Destination, Title)
	-- upvalues: NodeModule (copy)
	local Image = NodeModule.new("Image", false)
	Image.destination = Destination
	Image.title = Title
	
	return Image
end

function NodeModule.toStringAttributesByKind.Image(p1): string
	return "destination=" .. (if p1.destination == nil then "null" else p1.destination) .. ", title=" .. (if p1.title == nil then "null" else p1.title)
end

return Image