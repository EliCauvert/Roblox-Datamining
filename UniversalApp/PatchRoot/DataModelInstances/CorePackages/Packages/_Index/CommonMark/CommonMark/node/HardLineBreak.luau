local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return function()
	-- upvalues: NodeModule (copy)
	return NodeModule.new("HardLineBreak", false)
end