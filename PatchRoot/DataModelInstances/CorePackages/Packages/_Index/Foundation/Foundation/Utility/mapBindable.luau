-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local _ = require(foundation.Components.Types)

return function(p0, p1) --[[ line: 10 | named "mapBindable" ]]
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p0) then p0:map(p1) else p1(p0)
end