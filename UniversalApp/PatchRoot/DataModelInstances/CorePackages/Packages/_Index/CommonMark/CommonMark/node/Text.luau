local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

local function Text(Literal)
	-- upvalues: NodeModule (copy)
	local Text = NodeModule.new("Text", false)
	Text.literal = Literal
	
	return Text
end

function NodeModule.toStringAttributesByKind.Text(p1): string
	return "literal=" .. (if p1.literal == nil then "null" else p1.literal)
end

return Text