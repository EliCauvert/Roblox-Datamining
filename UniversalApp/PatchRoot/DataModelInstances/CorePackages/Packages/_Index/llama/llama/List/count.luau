local function alwaysTrue() --[[ line: 2 ]]
	return true
end

return function(p0, p1) --[[ line: 6 | named "count" ]]
	-- upvalues: alwaysTrue (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	p1 = p1 or alwaysTrue
	p1 = 0
	
	for i = 1, #p0 do
		if p1(p0[i], i) then
			p1 += 1
		end
	end
	return p1
end