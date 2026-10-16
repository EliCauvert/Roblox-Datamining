return function(...) --[[ Line: 3 | Named "composeRefs" ]]
	local list = { ... }
	
	return function(Current) --[[ Line: 5 ]]
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