local CreateComputedFunction = require(script.Parent.Parent.Signals).createComputed

return function(Callback1, Callback) --[[ Line: 8 | Named "createReducer" ]]
	-- upvalues: CreateComputedFunction (copy)
	local Flag = false
	local v1 = nil
	
	local function _() --[[ Line: 12 | Named "ensureInitialized" ]]
		-- upvalues: Flag (ref), v1 (ref), Callback (copy)
		if not Flag then
			Flag = true
			v1 = if typeof(Callback) == "function" then Callback() else Callback
		end
	end
	
	return CreateComputedFunction(function(p1) --[[ Line: 19 ]]
		-- upvalues: Flag (ref), v1 (ref), Callback (copy), Callback1 (copy)
		if not Flag then
			Flag = true
			v1 = if typeof(Callback) == "function" then Callback() else Callback
		end
		v1 = Callback1(p1, v1)
		
		return v1
	end)
end