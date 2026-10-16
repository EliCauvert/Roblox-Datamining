return {
	getStringParam = function(p1, p2, p3) --[[ Line: 7 ]]
		local v1 = p1[p2]
		
		return if typeof(v1) == "string" then v1 else p3
	end,
	getBooleanParam = function(p1, p2, p3) --[[ Line: 12 ]]
		local v1 = p1[p2]
		
		return if typeof(v1) == "boolean" then v1 else p3
	end,
	getCallbackParam = function(p1, p2, p3) --[[ Line: 17 ]]
		local Callback = p1[p2]
		
		return if typeof(Callback) == "function" then function() --[[ Line: 23 ]]
			-- upvalues: Callback (copy)
			Callback()
		end else p3
	end
}