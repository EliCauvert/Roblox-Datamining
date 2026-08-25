local var0 = function()
	return true
end

return function(p0, p1)
	-- upvalues: var0 (ref)
	local var1 = 0
	p1 = p1 or var0
	
	for i, v in p0 do
		if p1(v, i) then
			var1 += 1
		end
	end
	return var1
end