return function(p1, ...)
	local var1 = select("#", ...)
	
	if var1 == 0 then
		return p1
	end
	local list = { ... }
	
	return function(...)
		-- upvalues: p1 (ref), var1 (ref), list (ref)
		local list_1 = { p1(...) }
		
		for i = 1, var1 do
			list_1 = { list[i](unpack(list_1)) }
		end
		return unpack(list_1)
	end
end