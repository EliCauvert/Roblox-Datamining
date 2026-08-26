return function(...)
	local list = { ... }
	
	return function(p1)
		-- upvalues: list (ref)
		for i, v in list do
			if type(v) == "function" then
				v(p1)
			elseif v ~= nil then
				v.current = p1
			end
		end
	end
end