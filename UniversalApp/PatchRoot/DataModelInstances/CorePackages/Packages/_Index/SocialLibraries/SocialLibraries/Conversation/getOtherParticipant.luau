return function(p0, p1) --[[ line: 1 ]]
	local localUserId = p0.LocalUserId
	
	for i, v in ipairs(p1) do
		if v ~= localUserId then
			return v
		end
	end
end