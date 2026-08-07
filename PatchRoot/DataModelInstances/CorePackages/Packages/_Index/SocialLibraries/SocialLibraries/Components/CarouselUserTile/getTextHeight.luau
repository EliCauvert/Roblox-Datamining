-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:23 2026 Pacific Standard Time.

local text = require(script:FindFirstAncestor("SocialLibraries").dependencies).Text
local _ = require(script.Parent.StyleTypes)

return function(p0, p1, p2) --[[ line: 6 ]]
	-- upvalues: text (ref)
	return text.GetTextHeight(p0, p1, p2)
end