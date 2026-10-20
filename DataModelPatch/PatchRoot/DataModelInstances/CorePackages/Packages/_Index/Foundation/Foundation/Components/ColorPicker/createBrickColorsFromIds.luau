return function(List)
	local List1 = {}
	
	for _, value in List do
		local Success, Result = pcall(BrickColor.new, value)
		
		if Success and Result then
			table.insert(List1, Result)
		else
			warn(`createBrickColorsFromIds: Failed to create BrickColor with ID {value}`)
		end
	end
	return List1
end