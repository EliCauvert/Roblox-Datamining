return function(p0) --[[ line: 8 | named "createBrickColorsFromIds" ]]
	local t = {}
	
	for i, v in p0 do
		local ok, status = pcall(BrickColor.new, v)
		
		if ok and status then
			table.insert(t, status)
		else
			warn(`createBrickColorsFromIds: Failed to create BrickColor with ID {v}`)
		end
	end
	return t
end