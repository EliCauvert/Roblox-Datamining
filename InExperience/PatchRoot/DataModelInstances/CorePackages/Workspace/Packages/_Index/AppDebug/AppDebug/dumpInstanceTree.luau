local function _(p0, p1) --[[ line: 7 | named "dumpProperty" ]]
	local ok, status = pcall(function() --[[ line: 8 ]]
		-- upvalues: p0 (ref), p1 (ref)
		return p0[p1]
	end)
	
	return if ok then tostring(status) else nil
end

local function dumpInstance(p2, p3) --[[ line: 14 ]]
	local name = p2.Name
	local var2 = false
	
	for i, v in p3 or {} do
		local ok, status = pcall(function() --[[ line: 8 ]]
			-- upvalues: p2 (ref), v (ref)
			return p2[v]
		end)
		local var3 = if ok then tostring(status) else nil
		
		if var3 then
			if var2 then
				name ..= ", "
			else
				var2 = true
				name ..= "   ("
			end
			name ..= v .. "=" .. var3
		end
	end
	if var2 then
		name ..= ")"
	end
	return name .. "\n"
end

local function dumpInstanceTree(p4, p5, p6) --[[ line: 38 ]]
	-- upvalues: dumpInstance (ref), dumpInstanceTree (ref)
	if p4 == nil then
		return p6 .. "[nil Instance]\n"
	elseif p4.Name == nil then
		return p6 .. "[Invalid Instance]\n"
	end
	local text = p6 .. dumpInstance(p4, p5)
	
	for i, v in p4:GetChildren() do
		text ..= dumpInstanceTree(v, p5, p6 .. "   ")
	end
	return text
end

return function(p7, p8) --[[ line: 61 ]]
	-- upvalues: dumpInstanceTree (ref)
	return dumpInstanceTree(p7, p8, "")
end