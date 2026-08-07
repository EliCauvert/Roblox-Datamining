-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:46 2026 Pacific Standard Time.

local _ = require(script:FindFirstAncestor("Markdown").Types)

local function assignIndex(value, p0) --[[ line: 4 ]]
	-- upvalues: assignIndex (ref)
	value.index = p0
	
	if value.children then
		for i, v in value.children do
			assignIndex(v, i)
		end
	end
end

return function(p1) --[[ line: 13 | named "indexTree" ]]
	-- upvalues: assignIndex (ref)
	p1.index = 1
	
	if p1.children then
		for i, v in p1.children do
			assignIndex(v, i)
		end
	end
	return p1
end