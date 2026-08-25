local function deduplicateBodyColor3s(p0)
	local t = {}
	local t_1 = {}
	
	for i, v in p0 do
		local var3 = tostring(v)
		
		if not t_1[var3] then
			table.insert(t, v)
			t_1[var3] = true
		end
	end
	return t
end

return function(p1)
	-- upvalues: deduplicateBodyColor3s (ref)
	local var4 = deduplicateBodyColor3s(p1)
	local var4Count = #var4
	
	if var4Count == 1 then
		local var6 = var4[1]
		
		return ColorSequence.new(var6, var6)
	end
	local t = {}
	local var8 = 1 / (var4Count - 1 + 1.6)
	
	for i, v in var4 do
		table.insert(t, ColorSequenceKeypoint.new(if i == 1 then 0 elseif i == var4Count then 1 else (i - 1 + 0.8) * var8, v))
	end
	return ColorSequence.new(t)
end