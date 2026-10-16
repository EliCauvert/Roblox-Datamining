return function(p1) --[[ Line: 1 | Named "extractRobuxBalance" ]]
	if typeof(p1) == "table" then
		local Robux = p1.robux or p1.Robux
		
		if typeof(Robux) == "number" then
			return Robux
		end
	end
	return nil
end