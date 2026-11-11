local function toStringLimitedHelper(List, p1, p2, Callback, p3: number): string
	-- upvalues: toStringLimitedHelper (copy)
	local P1 = p1 or ""
	assert(P1, "")
	local P2 = p2 or 5
	assert(P2, "")
	local v1 = 20
	
	if type(Callback) == "function" then
		local CallbackResult = Callback(p3)
		
		if type(CallbackResult) == "number" then
			v1 = CallbackResult
		end
	end
	if type(List) ~= "table" then
		return if type(List) == "string" then "\"" .. List .. "\"" else tostring(List)
	end
	if P2 > 0 and P2 < p3 then
		return "*truncated"
	end
	local Text = "" .. "{\n"
	local Count = 0
	
	for i, value in pairs(List) do
		Count += 1
		
		if v1 > 0 and v1 < Count then
			Text ..= "  " .. P1 .. "*truncated" .. "\n"
			break
		end
		if type(i) == "string" then
			Text ..= "  " .. P1 .. i .. " = " .. toStringLimitedHelper(value, "  " .. P1, P2, Callback, p3 + 1) .. ";\n"
		end
		if type(i) == "number" then
			Text ..= "  " .. P1 .. toStringLimitedHelper(value, "  " .. P1, P2, Callback, p3 + 1) .. ",\n"
		end
	end
	return Text .. P1 .. "}"
end

return function(p4, p5, p6, p7)
	-- upvalues: toStringLimitedHelper (copy)
	return (toStringLimitedHelper(p4, p5, p6, p7, 1))
end