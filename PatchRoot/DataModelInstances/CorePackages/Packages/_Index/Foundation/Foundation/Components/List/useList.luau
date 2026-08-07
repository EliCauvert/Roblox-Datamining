-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:05 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local listContextModule = require(script.Parent.ListContext)

return function() --[[ line: 8 ]]
	-- upvalues: reactModule (ref), listContextModule (ref)
	return reactModule.useContext(listContextModule)
end