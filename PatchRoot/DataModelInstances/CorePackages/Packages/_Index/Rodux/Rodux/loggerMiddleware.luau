-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

local prettyPrintModule = require(script.Parent.prettyPrint)
local t = { outputFunction = print }

function t.middleware(p0, p1) --[[ line: 10 ]]
	-- upvalues: t (ref), prettyPrintModule (ref)
	return function(p2) --[[ line: 11 ]]
		-- upvalues: p0 (ref), t (copy), prettyPrintModule (copy), p1 (ref)
		local var2 = p0(p2)
		t.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(prettyPrintModule(p2), prettyPrintModule(p1:getState())))
		
		return var2
	end
end

return t