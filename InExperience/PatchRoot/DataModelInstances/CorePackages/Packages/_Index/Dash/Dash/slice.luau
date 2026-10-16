local InsertFunction = table.insert

return function(p1, p2, p3) --[[ Line: 19 | Named "slice" ]]
	-- upvalues: InsertFunction (copy)
	local t = {}
	local P1 = p2 or 1
	local P2 = p3 or #p1
	
	if P1 < 0 then
		P1 = #p1 + P1
	end
	if P2 and P2 < 0 then
		P2 = #p1 + P2
	end
	for i = P1, P2 do
		InsertFunction(t, p1[i])
	end
	return t
end