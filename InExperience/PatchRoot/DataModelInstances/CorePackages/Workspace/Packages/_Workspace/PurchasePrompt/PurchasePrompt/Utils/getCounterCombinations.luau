return function(Text, Text1, Text2, Text3, p1)
	local List = {}
	
	if Text3 == nil then
		table.insert(List, Text .. Text1 .. Text2)
	else
		table.insert(List, Text .. Text3 .. Text1 .. Text2)
	end
	if p1 ~= nil then
		local Text4 = tostring(p1)
		
		if Text3 ~= nil then
			table.insert(List, Text .. Text3 .. Text1 .. Text4 .. Text2)
			
			return List
		end
		table.insert(List, Text .. Text1 .. Text4 .. Text2)
	end
	return List
end