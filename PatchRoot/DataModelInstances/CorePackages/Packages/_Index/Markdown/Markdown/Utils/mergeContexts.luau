-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

local markdown = script:FindFirstAncestor("Markdown")
local dashModule = require(markdown.Parent.Dash)
local _ = require(markdown.Types)

return function(p0, p1) --[[ line: 7 | named "mergeContexts" ]]
	-- upvalues: dashModule (ref)
	return dashModule.joinDeep(p0, p1)
end