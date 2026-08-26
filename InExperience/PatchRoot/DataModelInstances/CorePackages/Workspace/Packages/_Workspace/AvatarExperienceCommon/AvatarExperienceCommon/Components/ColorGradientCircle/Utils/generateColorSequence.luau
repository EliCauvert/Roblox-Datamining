local function deduplicateBodyColor3s(p1)
	local t = {}
	local t_1 = {}
	
	for i, v in p1 do
		local var1 = tostring(v)
		
		if not t_1[var1] then
			table.insert(t, v)
			t_1[var1] = true
		end
	end
	return t
end

return function(p2)
	-- upvalues: deduplicateBodyColor3s (ref)
	local var2 = deduplicateBodyColor3s(p2)
	local var4Count = #var2
	
	if var4Count == 1 then
		local var3 = var2[1]
		
		return ColorSequence.new(var3, var3)
	end
	local t = {}
	local var4 = 1 / (var4Count - 1 + 1.6)
	
	for i, v in var2 do
		table.insert(t, ColorSequenceKeypoint.new(if i == 1 then 0 elseif i == var4Count then 1 else (i - 1 + 0.8) * var4, v))
	end
	return ColorSequence.new(t)
end