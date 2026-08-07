return function(p0, p1, p2) --[[ line: 16 | named "startsWith" ]]
	if string.len(p1) == 0 then
		return true
	end
	local _ = nil
	local var0 = if p2 == nil or p2 < 1 then 1 else p2
	
	return if string.len(p0) < var0 then false else p0:find(p1, var0, true) == var0
end