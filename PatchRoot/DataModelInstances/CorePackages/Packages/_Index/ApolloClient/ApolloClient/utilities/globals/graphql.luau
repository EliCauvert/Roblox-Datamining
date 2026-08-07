-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:17 2026 Pacific Standard Time.

local t = {}
local isType = require(script.Parent.Parent.Parent.Parent.GraphQL).isType

function t.removeTemporaryGlobals() --[[ line: 26 ]]
	-- upvalues: isType (ref)
	isType(nil)
	
	return (function() --[[ line: 33 | named "remove" ]] end)()
end

return t