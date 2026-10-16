local _ = require(script.Parent.Types)

return function(p1) --[[ Line: 11 | Named "iterable" ]]
	local Count = 1
	local Flag = true
	local NextEntry = nil
	
	return function() --[[ Line: 16 ]]
		-- upvalues: Flag (ref), p1 (copy), Count (ref), NextEntry (ref)
		if Flag then
			local v1 = p1[Count]
			
			if v1 ~= nil then
				local Count1: number = Count
				Count += 1
				
				return Count1, v1
			end
			Flag = false
		end
		while true do
			NextEntry = next(p1, NextEntry)
			if typeof(NextEntry) == "number" and NextEntry > 0 and NextEntry < Count and NextEntry % 1 == 0 then
				continue
		end
		if NextEntry == nil then
			return nil
		else
			return NextEntry, p1[NextEntry]
		end
	end
end