-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:07 2026 Pacific Standard Time.

local reactIsModule = require(script:FindFirstAncestor("UsageTracker").Parent.ReactIs)

return function(p0) --[[ line: 5 | named "isReactComponent" ]]
	-- upvalues: reactIsModule (ref)
	local ok, status = pcall(reactIsModule.isValidElementType, p0)
	
	if ok and status then
		if typeof(p0) == "function" then
			local debugInfo, debugInfo_1 = debug.info(p0, "a")
			
			if debugInfo == 1 and not debugInfo_1 and not (string.sub(debug.info(p0, "n"), 1, 3) == "use") then
				return true
			end
		else
			return typeof(p0) == "table"
		end
	end
end