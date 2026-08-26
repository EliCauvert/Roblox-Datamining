local insert = table.insert

return function(p1)
	-- upvalues: insert (ref)
	local t = {}
	
	for i, v in p1 do
		insert(t, i)
	end
	return t
end