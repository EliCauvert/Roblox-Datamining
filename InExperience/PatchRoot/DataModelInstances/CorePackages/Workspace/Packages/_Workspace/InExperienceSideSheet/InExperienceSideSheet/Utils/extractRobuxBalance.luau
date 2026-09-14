return function(p1)
	if typeof(p1) == "table" then
		local robux = p1.robux or p1.Robux
		
		return if typeof(robux) == "number" then robux else nil
	end
end