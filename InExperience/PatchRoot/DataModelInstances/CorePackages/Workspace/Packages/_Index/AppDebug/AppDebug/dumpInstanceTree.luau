local function _(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref), p2 (ref)
		return p1[p2]
	end)
	
	return if ok then tostring(status) else nil
end

local function dumpInstance(p1, p2)
	local name = p1.Name
	local var1 = false
	
	for i, v in p2 or {} do
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), v (ref)
			return p1[v]
		end)
		local var2 = if ok then tostring(status) else nil
		
		if var2 then
			if var1 then
				name ..= ", "
			else
				var1 = true
				name ..= "   ("
			end
			name ..= v .. "=" .. var3
		end
	end
	if var1 then
		name ..= ")"
	end
	return name .. "\n"
end

local function dumpInstanceTree(p3, p4, p5)
	-- upvalues: dumpInstance (ref), dumpInstanceTree (ref)
	if p3 == nil then
		return p5 .. "[nil Instance]\n"
	elseif p3.Name == nil then
		return p5 .. "[Invalid Instance]\n"
	end
	local text = p5 .. dumpInstance(p3, p4)
	
	for i, v in p3:GetChildren() do
		text ..= dumpInstanceTree(v, p4, p5 .. "   ")
	end
	return text
end

return function(p6, p7)
	-- upvalues: dumpInstanceTree (ref)
	return dumpInstanceTree(p6, p7, "")
end