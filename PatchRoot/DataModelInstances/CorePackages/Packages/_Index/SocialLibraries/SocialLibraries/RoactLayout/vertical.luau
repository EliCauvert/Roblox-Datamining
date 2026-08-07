-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

local roact = require(script:FindFirstAncestor("SocialLibraries").dependencies).Roact
local newModule = require(script.Parent.new)

return function(p0) --[[ line: 7 | named "vertical" ]]
	-- upvalues: roact (ref), newModule (ref)
	return newModule(roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }), p0)
end