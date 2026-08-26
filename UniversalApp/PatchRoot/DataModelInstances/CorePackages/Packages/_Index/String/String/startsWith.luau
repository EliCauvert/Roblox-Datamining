return function(p1, p2, p3)
	if string.len(p2) == 0 then
		return true
	end
	local _ = nil
	local var1 = if p3 == nil or p3 < 1 then 1 else p3
	
	return if string.len(p1) < var1 then false else p1:find(p2, var1, true) == var1
end