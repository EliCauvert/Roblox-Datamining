return function(...)
	local list = { ... }
	
	return function(p1)
		-- upvalues: list (copy)
		local Promise = nil
		
		for _, value in ipairs(list) do
			if Promise == nil then
				Promise = value(p1)
			else
				Promise = Promise:andThen(function(Result)
					-- upvalues: value (copy), p1 (copy)
					return if Result == nil then value(p1) else Result
				end)
			end
		end
		return Promise
	end
end