-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local loggerModule = require(foundation.Utility.Logger)

return require(foundation.Parent.React).createContext(function() --[[ line: 10 ]]
	-- upvalues: loggerModule (ref)
	loggerModule:warning("No Style Provider found")
	
	return ""
end)