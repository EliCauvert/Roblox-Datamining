local EqualObjectsModule = require(script.Parent.Parent.equalObjects)

return function(...): boolean --[[ Line: 4 | Named "equals" ]]
	-- upvalues: EqualObjectsModule (copy)
	if EqualObjectsModule(...) then
		return true
	end
	local Selected = select("#", ...)
	
	for i = 1, Selected do
		local Selected1 = select(i, ...)
		
		for i1 = 1, Selected do
			if i1 ~= i then
				local Selected2 = select(i1, ...)
				
				for i2, value in pairs(Selected1) do
					if value ~= Selected2[i2] then
						return false
					end
				end
			end
		end
	end
	return true
end