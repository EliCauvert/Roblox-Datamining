local function alwaysTrue()
	return true
end

return function(p1, p2)
	-- upvalues: alwaysTrue (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = 0
	p2 = p2 or alwaysTrue
	
	for i, v in pairs(p1) do
		if p2(v, i) then
			var2 += 1
		end
	end
	return var2
end