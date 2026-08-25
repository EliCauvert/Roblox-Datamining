return {
	getStringParam = function(p0, p1, p2)
		local var0 = p0[p1]
		
		return if typeof(var0) == "string" then var0 else p2
	end,
	getBooleanParam = function(p3, p4, p5)
		local var1 = p3[p4]
		
		return if typeof(var1) == "boolean" then var1 else p5
	end,
	getCallbackParam = function(p6, p7, p8)
		local var2 = p6[p7]
		
		return if typeof(var2) == "function" then function()
			-- upvalues: var2 (ref)
			var2()
		end else p8
	end
}