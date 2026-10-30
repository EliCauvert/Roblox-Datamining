local _ = require(script.Parent.Registry)
local RendererNodesModule = require(script.Parent.RendererNodes)
local _ = require(script:FindFirstAncestor("Markdown").Types)
local Frozen = table.freeze({ QUOTE = true })

return {
	isDroppable = function(p1): boolean
		-- upvalues: Frozen (copy)
		return Frozen[p1] == true
	end,
	finish = function(List, List1, p1)
		-- upvalues: RendererNodesModule (copy)
		for i, value in List do
			i.text = table.concat(value)
		end
		if not p1.dropEmpty then return end
		local t = {}
		local t1 = {}
		
		for i1, value1 in List1 do
			if #i1.children == 0 then
				t[i1] = true
				t1[value1] = true
			end
		end
		for i3 in t1 do
			local Children = i3.children
			local Index = 0
			
			for i2 = 1, #Children do
				local Child = Children[i2]
				
				if not t[Child] then
					Index += 1
					Children[Index] = Child
					Child.index = Index
					Child.offset = RendererNodesModule.offsetAt(i3, Child, Index)
				end
			end
			for i4 = #Children, Index + 1, -1 do
				Children[i4] = nil
			end
		end
	end
}