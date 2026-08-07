local equalObjectsModule = require(script.Parent.Parent.equalObjects)

return function(...) --[[ line: 4 | named "equals" ]]
	-- upvalues: equalObjectsModule (ref)
	if equalObjectsModule(...) then
		return true
	end
	local var1 = select("#", ...)
	
	for i_1 = 1, var1 do
		local var2 = select(i_1, ...)
		
		for i = 1, var1 do
			if i == i_1 then
				continue
			end
			local var3 = select(i, ...)
			
			for i, v in pairs(var2) do
				if v ~= var3[i] then
					return false
				end
			end
		end
	end
	return true
end