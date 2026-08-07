-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local headerBarContextModule = require(foundation.Components.HeaderBar.HeaderBarContext)

return function() --[[ line: 8 | named "useHeaderBarContext" ]]
	-- upvalues: reactModule (ref), headerBarContextModule (ref)
	return reactModule.useContext(headerBarContextModule.Context)
end