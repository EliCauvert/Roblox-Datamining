local insert = table.insert

return function(p0) --[[ line: 12 | named "keys" ]]
	-- upvalues: insert (ref)
	local t = {}
	
	for i, v in p0 do
		insert(t, i)
	end
	return t
end