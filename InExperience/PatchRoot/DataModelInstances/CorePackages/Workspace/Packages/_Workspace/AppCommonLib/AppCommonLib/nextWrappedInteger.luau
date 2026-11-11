return function(p1: number): number
	local v1 = p1 + 1
	
	return if v1 >= 9007199254740992 then 0 else v1
end