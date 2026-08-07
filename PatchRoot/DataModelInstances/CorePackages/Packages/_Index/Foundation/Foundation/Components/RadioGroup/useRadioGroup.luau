-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:07 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local radioGroupContextModule = require(script.Parent.RadioGroupContext)

return function() --[[ line: 15 ]]
	-- upvalues: reactModule (ref), radioGroupContextModule (ref)
	return reactModule.useContext(radioGroupContextModule)
end