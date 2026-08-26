local reactIsModule = require(script:FindFirstAncestor("UsageTracker").Parent.ReactIs)

return function(p1)
	-- upvalues: reactIsModule (ref)
	local ok, status = pcall(reactIsModule.isValidElementType, p1)
	
	if ok and status then
		if typeof(p1) == "function" then
			local debugInfo, debugInfo_1 = debug.info(p1, "a")
			
			if debugInfo == 1 and not debugInfo_1 and not (string.sub(debug.info(p1, "n"), 1, 3) == "use") then
				return true
			end
		else
			return typeof(p1) == "table"
		end
	end
end