local function alwaysTrue()
	return true
end

return function(p1, p2)
	-- upvalues: alwaysTrue (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	p2 = p2 or alwaysTrue
	p2 = 0
	
	for i = 1, #p1 do
		if p2(p1[i], i) then
			p2 += 1
		end
	end
	return p2
end