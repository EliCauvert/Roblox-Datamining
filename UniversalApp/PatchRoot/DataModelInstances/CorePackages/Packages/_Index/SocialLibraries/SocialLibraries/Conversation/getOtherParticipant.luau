return function(p1, p2)
	local localUserId = p1.LocalUserId
	
	for i, v in ipairs(p2) do
		if v ~= localUserId then
			return v
		end
	end
end