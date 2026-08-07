-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

local forEachArgs = require(script:FindFirstAncestor("Markdown").Parent.Dash).forEachArgs
local concat = table.concat

return function(...) --[[ line: 11 | named "joinTags" ]]
	-- upvalues: forEachArgs (ref), concat (ref)
	local t = {}
	forEachArgs(function(p0) --[[ line: 13 ]]
		-- upvalues: t (ref)
		if typeof(p0) == "string" then
			table.insert(t, p0)
			
			return
		elseif typeof(p0) == "table" then
			for i, v in p0 do
				if v then
					table.insert(t, i)
				end
			end
		end
	end, ...)
	
	return concat(t, " ")
end