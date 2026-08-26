return {
	getStringParam = function(p1, p2, p3)
		local var1 = p1[p2]
		
		return if typeof(var1) == "string" then var1 else p3
	end,
	getBooleanParam = function(p1, p2, p3)
		local var1 = p1[p2]
		
		return if typeof(var1) == "boolean" then var1 else p3
	end,
	getCallbackParam = function(p1, p2, p3)
		local var1 = p1[p2]
		
		return if typeof(var1) == "function" then function()
			-- upvalues: var1 (ref)
			var1()
		end else p3
	end
}