-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

local function prettyPrint(p0, p1) --[[ line: 3 ]]
	-- upvalues: prettyPrint (ref)
	p1 = p1 or 0
	local t = {}
	
	if typeof(p0) == "table" then
		table.insert(t, "{\n")
		
		for i, v in pairs(p0) do
			table.insert(t, ("    "):rep(p1 + 1))
			table.insert(t, tostring(i))
			table.insert(t, " = ")
			table.insert(t, prettyPrint(v, p1 + 1))
			table.insert(t, "\n")
		end
		table.insert(t, ("    "):rep(p1))
		table.insert(t, "}")
	elseif typeof(p0) == "string" then
		table.insert(t, string.format("%q", p0))
		table.insert(t, " (string)")
	else
		table.insert(t, tostring(p0))
		table.insert(t, " (")
		table.insert(t, typeof(p0))
		table.insert(t, ")")
	end
	return table.concat(t, "")
end

return prettyPrint