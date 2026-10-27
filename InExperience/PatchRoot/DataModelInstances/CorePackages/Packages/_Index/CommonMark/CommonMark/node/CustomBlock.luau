local NodeModule = require(script:FindFirstAncestor("CommonMark").node.Node)

return {
	new = function(p1)
		-- upvalues: NodeModule (copy)
		return NodeModule.new(p1, true)
	end
}