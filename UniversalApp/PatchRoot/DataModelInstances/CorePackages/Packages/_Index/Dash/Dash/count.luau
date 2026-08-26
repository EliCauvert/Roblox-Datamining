local var1 = function()
	return true
end

return function(p1, p2)
	-- upvalues: var1 (ref)
	local var2 = 0
	p2 = p2 or var1
	
	for i, v in p1 do
		if p2(v, i) then
			var2 += 1
		end
	end
	return var2
end