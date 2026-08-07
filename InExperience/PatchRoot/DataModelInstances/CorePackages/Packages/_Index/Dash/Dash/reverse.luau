local insert = table.insert

return function(p0) --[[ line: 9 | named "reverse" ]]
	-- upvalues: insert (ref)
	local t = {}
	
	for i = #p0, 1, -1 do
		insert(t, p0[i])
	end
	return t
end