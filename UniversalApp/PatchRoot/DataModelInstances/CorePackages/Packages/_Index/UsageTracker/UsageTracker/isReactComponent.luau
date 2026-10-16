local ReactIsModule = require(script:FindFirstAncestor("UsageTracker").Parent.ReactIs)

return function(p1): boolean --[[ Line: 5 | Named "isReactComponent" ]]
	-- upvalues: ReactIsModule (copy)
	local Success, Result = pcall(ReactIsModule.isValidElementType, p1)
	
	if Success and Result then
		if typeof(p1) == "function" then
			local DebugInfo, DebugInfo2 = debug.info(p1, "a")
			local IsUse = string.sub(debug.info(p1, "n"), 1, 3) == "use"
			
			if DebugInfo == 1 and not DebugInfo2 and not IsUse then
				return true
			end
		elseif typeof(p1) == "table" then
			return true
		end
	end
	return false
end