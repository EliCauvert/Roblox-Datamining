-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

local function dumpInstanceTree(p0, p1) --[[ line: 1 ]]
	-- upvalues: dumpInstanceTree (ref)
	p1 = p1 or ""
	assert(p1 ~= nil, "indent must be a string")
	
	if p0 == nil then
		print(p1 .. "[nil Instance]")
		
		return
	end
	assert(p0 ~= nil, "instance must be non-nil")
	print(p1 .. p0.Name)
	p1 ..= "  "
	
	for i, v in ipairs(p0:GetChildren()) do
		dumpInstanceTree(v, p1)
	end
end

return dumpInstanceTree