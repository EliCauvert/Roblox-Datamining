return function(...)
	local list = { ... }
	
	return function(Current)
		-- upvalues: list (copy)
		for _, value in list do
			if type(value) == "function" then
				value(Current)
			elseif value ~= nil then
				value.current = Current
			end
		end
	end
end