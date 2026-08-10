return function(...) --[[ line: 4 | named "composeRefs" ]]
	local list = { ... }
	
	return function(p0) --[[ line: 6 ]]
		-- upvalues: list (ref)
		for i, v in list do
			if type(v) == "function" then
				v(p0)
			elseif type(v) == "table" then
				v.current = p0
			end
		end
	end
end