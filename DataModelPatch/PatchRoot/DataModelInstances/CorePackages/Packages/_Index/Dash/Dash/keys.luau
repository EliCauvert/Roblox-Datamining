local InsertFunction = table.insert

return function(List)
	-- upvalues: InsertFunction (copy)
	local t = {}
	
	for i, _ in List do
		InsertFunction(t, i)
	end
	return t
end