local _ = require(script.Parent.types)
local t = {}

return {
	add = function(Key, p1)
		-- upvalues: t (ref)
		local Entry = t[Key]
		
		if Entry == nil then
			Entry = {}
			t[Key] = Entry
		end
		table.insert(Entry, p1)
	end,
	remove = function(Key, p1)
		-- upvalues: t (ref)
		local Entry = t[Key]
		
		if Entry == nil then return end
		for i, value in Entry do
			if value == p1 then
				table.remove(Entry, i)
				break
			end
		end
		if #Entry == 0 then
			t[Key] = nil
		end
	end,
	clear = function()
		-- upvalues: t (ref)
		t = {}
	end,
	snapshot = function()
		-- upvalues: t (ref)
		if next(t) == nil then
			return nil
		end
		local t1 = {}
		
		for i1, value in t do
			local List = {}
			
			for i = #value, 1, -1 do
				table.insert(List, value[i])
			end
			t1[i1] = List
		end
		return t1
	end
}