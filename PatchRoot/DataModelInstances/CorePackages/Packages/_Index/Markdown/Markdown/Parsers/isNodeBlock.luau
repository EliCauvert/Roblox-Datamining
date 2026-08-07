-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:46 2026 Pacific Standard Time.

local markdown = script:FindFirstAncestor("Markdown")
local nodeTypeModule = require(markdown.Enums.NodeType)
local _ = require(markdown.Types)

return function(p0) --[[ line: 5 | named "isNodeBlock" ]]
	-- upvalues: nodeTypeModule (ref)
	return p0.name ~= "TAG" and (if p0.type ~= nodeTypeModule.Block then p0.type == nodeTypeModule.TextBlock else true)
end