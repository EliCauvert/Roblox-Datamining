return function(p0) --[[ line: 7 | named "littleTraceback" ]]
	local var0 = 1 + (p0 or 5)
	local trac = debug.traceback()
	local var2 = nil
	local var3 = 1
	
	for _ = 1, var0 do
		local _, var4 = trac:find("\n", var3, true)
		
		if var4 then
			var3 = var4 + 1
			
			if not var2 then
				var2 = var3
			end
		end
		return trac:sub(var2 or 1)
	end
	return trac:sub(var2 or 1, var3 - 1)
end