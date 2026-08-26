local function captureSize(...)
	return { ... }, select("#", ...)
end

return function(p1)
	-- upvalues: captureSize (ref)
	assert(type(p1) == "function", "memoize requires a function to memoize")
	local var1 = nil
	local var2 = nil
	local var3 = nil
	local var4 = nil
	
	return function(...)
		-- upvalues: var2 (write), var1 (write), var3 (write), var4 (write), captureSize (copy), p1 (ref)
		local var5 = select("#", ...)
		while var5 > 0 and select(var5, ...) == nil do
			var5 -= 1
		end
		if var5 ~= var2 then
			var1 = { ... }
			var2 = var5
			local var6, var7 = captureSize(p1(...))
			var3 = var6
			var4 = var7
			
			return unpack(var3, 1, var4)
		end
		for i = 1, var2 do
			if select(i, ...) == var1[i] then
				continue
			end
			var1 = { ... }
			local var8, var9 = captureSize(p1(...))
			var3 = var8
			var4 = var9
			break
		end
		return unpack(var3, 1, var4)
	end
end