local InsertFunction = table.insert

return function(p1)
	-- upvalues: InsertFunction (copy)
	local t = {}
	
	for i = #p1, 1, -1 do
		InsertFunction(t, p1[i])
	end
	return t
end