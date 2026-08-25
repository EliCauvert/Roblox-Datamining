return function(...)
	local list = { ... }
	
	return function(p0)
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