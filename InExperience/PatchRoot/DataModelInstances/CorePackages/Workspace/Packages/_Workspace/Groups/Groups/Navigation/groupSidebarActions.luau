local t = {}
local t1 = {}

local function _(p1, Key, Value)
	local List = p1[Key]
	
	if not List then
		List = {}
		p1[Key] = List
	end
	table.insert(List, Value)
	
	return function()
		-- upvalues: List (ref), Value (copy), p1 (copy), Key (copy)
		local FoundIndex: number? = table.find(List, Value)
		
		if FoundIndex then
			table.remove(List, FoundIndex)
		end
		if #List == 0 and p1[Key] == List then
			p1[Key] = nil
		end
	end
end

local _ = function(p1, p2)
	local v1 = if p2 then p1[p2] else nil
	
	return if v1 then v1[#v1] else nil
end

local _ = function(p1)
	-- upvalues: t1 (copy), t (copy)
	local Entry = if p1 then t1[p1] else nil
	
	if not Entry then
		return nil
	end
	local Entry2 = nil
	for i = #Entry, 1, -1 do
		local Entry1 = Entry[i]
		local Entry3 = if Entry1 then t[Entry1] else nil
		Entry2 = if Entry3 then Entry3[#Entry3] else nil
		
		if Entry2 then
			return Entry2
		end
	end
	return nil
end

return {
	register = function(Key, Value)
		-- upvalues: t (copy)
		local Entry = t[Key]
		
		if not Entry then
			Entry = {}
			t[Key] = Entry
		end
		table.insert(Entry, Value)
		
		return function()
			-- upvalues: Entry (ref), Value (copy), t (copy), Key (copy)
			local FoundIndex: number? = table.find(Entry, Value)
			
			if FoundIndex then
				table.remove(Entry, FoundIndex)
			end
			if #Entry == 0 and t[Key] == Entry then
				t[Key] = nil
			end
		end
	end,
	link = function(Key, Value)
		-- upvalues: t1 (copy)
		local Entry = t1[Key]
		
		if not Entry then
			Entry = {}
			t1[Key] = Entry
		end
		table.insert(Entry, Value)
		
		return function()
			-- upvalues: Entry (ref), Value (copy), t1 (copy), Key (copy)
			local FoundIndex: number? = table.find(Entry, Value)
			
			if FoundIndex then
				table.remove(Entry, FoundIndex)
			end
			if #Entry == 0 and t1[Key] == Entry then
				t1[Key] = nil
			end
		end
	end,
	openGroup = function(p2, p3, p4, p5, p6)
		-- upvalues: t (copy), t1 (copy)
		local Entry = if p2 then t[p2] else nil
		local Callback: (any, any, any, any) -> () = if Entry then Entry[#Entry] else nil
		
		if not Callback then
			local Entry1 = if p2 then t1[p2] else nil
			
			if Entry1 then
				Callback = nil
				local Entry2 = nil
				
				for i = #Entry1, 1, -1 do
					local Entry11 = Entry1[i]
					local Entry3 = if Entry11 then t[Entry11] else nil
					Entry2 = if Entry3 then Entry3[#Entry3] else nil
					
					if not Entry2 then
						continue
					end
					Callback = Entry2
					break
				end
			else
				Callback = nil
			end
		end
		if Callback then
			Callback(p3, p4, p5, p6)
		end
	end
}