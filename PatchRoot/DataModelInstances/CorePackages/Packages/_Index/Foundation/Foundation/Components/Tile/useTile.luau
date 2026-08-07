-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:10 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local reactModule = require(foundation.Parent.React)
local tileContextModule = require(script.Parent.TileContext)

return function() --[[ line: 17 ]]
	-- upvalues: reactModule (ref), tileContextModule (ref)
	return reactModule.useContext(tileContextModule)
end