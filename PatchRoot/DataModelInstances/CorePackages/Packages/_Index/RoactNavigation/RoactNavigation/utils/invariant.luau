-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

local var0 = if _G.__DEV__ then function(p0) --[[ line: 15 ]]
	if p0 == nil then
		error("invariant requires an error message argument")
	end
end else function(_) --[[ line: 12 ]] end

return function(p1, p2, ...) --[[ line: 22 | named "invariant" ]]
	-- upvalues: var0 (write)
	var0(p2)
	
	if not p1 then
		if p2 == nil then
			error("Minified exception occurred; use the non-minified dev environment for the full error message and additional helpful warnings.", 2)
			
			return
		end
		error(string.format(p2, ...), 2)
	end
end