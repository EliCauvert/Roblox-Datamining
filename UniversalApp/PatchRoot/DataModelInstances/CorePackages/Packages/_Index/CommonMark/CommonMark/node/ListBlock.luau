local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return {
	new = function(p1)
		-- upvalues: NodeModule (copy)
		local NewNode = NodeModule.new(p1, true)
		NewNode.tight = false
		
		return NewNode
	end
}