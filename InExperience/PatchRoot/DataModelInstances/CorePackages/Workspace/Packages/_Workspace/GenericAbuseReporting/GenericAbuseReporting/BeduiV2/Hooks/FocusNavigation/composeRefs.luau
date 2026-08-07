return function(...) --[[ line: 3 | named "composeRefs" ]]
	local list = { ... }
	
	return function(p0) --[[ line: 5 ]]
		-- upvalues: list (ref)
		for i, v in list do
			if type(v) == "function" then
				v(p0)
			elseif v ~= nil then
				v.current = p0
			end
		end
	end
end