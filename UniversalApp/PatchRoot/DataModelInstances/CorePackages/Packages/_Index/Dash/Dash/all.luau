local var0 = function(p0)
	return p0
end

return function(p1, p2)
	-- upvalues: var0 (ref)
	p2 = p2 or var0
	
	for i, v in p1 do
		if not p2(v, i) then
			return false
		end
	end
	return true
end