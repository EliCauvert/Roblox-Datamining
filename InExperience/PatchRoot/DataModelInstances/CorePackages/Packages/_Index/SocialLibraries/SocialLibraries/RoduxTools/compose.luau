return function(...)
	local list = { ... }
	local listCount = #list
	
	if listCount == 0 then
		return function(p1)
			return p1
		end
	end
	local var1 = list[1]
	
	for i = 2, listCount do
		local var2 = list[i]
		local var3 = var1
		
		var1 = function(...)
			-- upvalues: var3 (ref), var2 (ref)
			return var3(var2(...))
		end
	end
	return var1
end