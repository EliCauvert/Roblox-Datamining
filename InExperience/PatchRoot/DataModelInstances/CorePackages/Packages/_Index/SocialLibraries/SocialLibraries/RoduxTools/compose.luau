return function(...)
	local list = { ... }
	local listCount = #list
	
	if listCount == 0 then
		return function(p0)
			return p0
		end
	end
	local var2 = list[1]
	
	for i = 2, listCount do
		local var3 = list[i]
		local var4 = var2
		
		var2 = function(...)
			-- upvalues: var4 (ref), var3 (ref)
			return var4(var3(...))
		end
	end
	return var2
end