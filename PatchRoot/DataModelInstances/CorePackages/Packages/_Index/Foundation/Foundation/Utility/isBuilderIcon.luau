-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

return require(script:FindFirstAncestor("Foundation").Parent.Dash).memoize(function(p0) --[[ line: 6 | named "isBuilderIcon" ]]
	return p0 ~= nil and (p0 ~= "" and p0:find("[^%l%d%-]") == nil)
end)