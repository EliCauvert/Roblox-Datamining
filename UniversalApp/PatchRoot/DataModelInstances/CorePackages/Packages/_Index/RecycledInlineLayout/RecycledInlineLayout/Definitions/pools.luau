local _ = require(script:FindFirstAncestor("RecycledInlineLayout").Types)
local t = {}

return {
	register = function(p1)
		-- upvalues: t (copy)
		local Pool = p1.pool
		local Entry = t[Pool]
		
		if Entry == nil then
			Entry = { atomic = false, view = p1.view, specs = {}, names = {} }
			t[Pool] = Entry
		end
		assert(Entry.view == p1.view, `{p1.name}: Leaves in one pool must share a view`)
		
		for i, prop in p1.props do
			local Spec = Entry.specs[i]
			assert(Spec == nil or Spec.delivery == prop.delivery, `{p1.name}.{i}: Leaves in one pool must deliver a prop the same way`)
			Entry.specs[i] = Spec or prop
		end
		table.insert(Entry.names, p1.name)
		table.sort(Entry.names)
		Entry.atomic = Entry.atomic or p1.split == nil
	end,
	get = function(p2)
		-- upvalues: t (copy)
		return t[p2]
	end
}