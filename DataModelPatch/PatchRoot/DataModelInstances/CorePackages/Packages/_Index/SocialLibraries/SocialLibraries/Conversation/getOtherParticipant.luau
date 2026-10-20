return function(p1, List)
	local LocalUserId = p1.LocalUserId
	
	for _, value in ipairs(List) do
		if value ~= LocalUserId then
			return value
		end
	end
end