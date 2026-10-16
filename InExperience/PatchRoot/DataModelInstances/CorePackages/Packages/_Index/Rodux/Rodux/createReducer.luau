return function(p1, p2) --[[ Line: 1 ]]
	return function(p3, p4) --[[ Line: 2 ]]
		-- upvalues: p1 (copy), p2 (copy)
		if p3 == nil then
			p3 = p1
		end
		local Callback = p2[p4.type]
		
		return if Callback then Callback(p3, p4) else p3
	end
end