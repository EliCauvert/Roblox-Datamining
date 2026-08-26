local var1 = function(p1)
	return p1
end

return function(p1, p2)
	-- upvalues: var1 (ref)
	p2 = p2 or var1
	
	for i, v in p1 do
		if not p2(v, i) then
			return false
		end
	end
	return true
end