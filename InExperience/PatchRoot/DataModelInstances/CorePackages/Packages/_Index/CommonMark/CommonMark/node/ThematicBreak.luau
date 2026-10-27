local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return function()
	-- upvalues: NodeModule (copy)
	local ThematicBreak = NodeModule.new("ThematicBreak", true)
	ThematicBreak.literal = nil
	
	return ThematicBreak
end