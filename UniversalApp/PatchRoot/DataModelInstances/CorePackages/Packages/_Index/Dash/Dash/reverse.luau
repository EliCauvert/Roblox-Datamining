local insert = table.insert

return function(p1)
	-- upvalues: insert (ref)
	local t = {}
	
	for i = #p1, 1, -1 do
		insert(t, p1[i])
	end
	return t
end