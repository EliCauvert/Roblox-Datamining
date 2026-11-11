return function(...)
	local list = { ... }
	local CountList = #list
	
	if CountList == 0 then
		return function(p1)
			return p1
		end
	end
	local Callback = list[1]
	
	for i = 2, CountList do
		local Callback1 = list[i]
		
		Callback = function(...)
			-- upvalues: Callback (copy), Callback1 (copy)
			return Callback(Callback1(...))
		end
		
	end
	return Callback
end