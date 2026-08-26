return function(p1, p2, p3)
	local var1 = string.len(p1)
	local var2 = if p3 and p3 < 1 then 1 else p3 or var1
	
	if p3 and var1 < p3 then
		var2 = var1
	end
	if p2 == "" then
		return var2
	end
	local var3
	local _ = nil
	local var4 = nil
	local var5 = 0
	repeat
		var3 = var4
		local matchIndex, matchIndex_1 = string.find(p1, p2, var5 + 1, true)
		var4 = matchIndex
		var5 = matchIndex_1
	until var4 == nil or var2 < var4
	return if var3 == nil then -1 else var3
end