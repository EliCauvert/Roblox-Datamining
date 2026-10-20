return function(p1)
	if typeof(p1) == "table" then
		local Robux = p1.robux or p1.Robux
		
		if typeof(Robux) == "number" then
			return Robux
		end
	end
	return nil
end