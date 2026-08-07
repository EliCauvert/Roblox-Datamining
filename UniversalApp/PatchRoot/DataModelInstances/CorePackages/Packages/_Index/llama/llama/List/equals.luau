local equalObjectsModule = require(script.Parent.Parent.equalObjects)

return function(...) --[[ line: 4 | named "equals" ]]
	-- upvalues: equalObjectsModule (ref)
	if equalObjectsModule(...) then
		return true
	end
	local var1 = select("#", ...)
	
	for i_2 = 1, var1 do
		local var2 = select(i_2, ...)
		
		for i_1 = 1, var1 do
			if i_1 == i_2 then
				continue
			end
			local var3 = select(i_1, ...)
			
			for i = 1, #var2 do
				if var2[i] == var3[i] then
					continue
				end
				return false
			end
		end
	end
	return true
end