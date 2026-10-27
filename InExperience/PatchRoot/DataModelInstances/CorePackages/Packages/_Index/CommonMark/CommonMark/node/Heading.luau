local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return function()
	-- upvalues: NodeModule (copy)
	local Heading = NodeModule.new("Heading", true)
	Heading.level = 0
	
	return Heading
end