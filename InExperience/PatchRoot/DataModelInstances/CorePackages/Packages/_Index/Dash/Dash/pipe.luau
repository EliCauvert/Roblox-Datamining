return function(p0, ...)
	local var0 = select("#", ...)
	
	if var0 == 0 then
		return p0
	end
	local list = { ... }
	
	return function(...)
		-- upvalues: p0 (ref), var0 (ref), list (ref)
		local list_1 = { p0(...) }
		
		for i = 1, var0 do
			list_1 = { list[i](unpack(list_1)) }
		end
		return unpack(list_1)
	end
end