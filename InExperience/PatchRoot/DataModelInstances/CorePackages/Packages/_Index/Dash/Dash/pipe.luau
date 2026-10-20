return function(Callback, ...)
	local Selected = select("#", ...)
	
	if Selected == 0 then
		return Callback
	else
		local list = { ... }
		
		return function(...)
			-- upvalues: Callback (copy), Selected (copy), list (copy)
			local list1 = { Callback(...) }
			
			for i = 1, Selected do
				list1 = { list[i](unpack(list1)) }
			end
			return unpack(list1)
		end
	end
end