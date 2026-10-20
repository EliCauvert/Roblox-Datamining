return function(p1): string
	local Traceback: string = debug.traceback()
	local v1: number? = nil
	local v2 = 1
	
	for _ = 1, 1 + (p1 or 5) do
		local _, EndIndex = Traceback:find("\n", v2, true)
		
		if not EndIndex then
			return Traceback:sub(v1 or 1)
		end
		v2 = EndIndex + 1
		
		if not v1 then
			v1 = v2
		end
	end
	return Traceback:sub(v1 or 1, v2 - 1)
end