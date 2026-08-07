-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

local _ = require(script:FindFirstAncestor("Utils").Parent.Types)
local nodeTypeConfigModule = require(script.Parent.NodeTypeConfig)

return function(p0) --[[ line: 7 | named "getNodeTypeConfig" ]]
	-- upvalues: nodeTypeConfigModule (ref)
	local type = nodeTypeConfigModule[p0.type]
	
	if type then
		return type
	end
	warn(`No node type config found for node: {p0.name} {p0.text} of type: {p0.type}`)
	
	return nil
end