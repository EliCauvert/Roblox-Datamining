-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 4 ]]
	local state = p0.state
	
	return p0.router.getScreenOptions(p0.getChildNavigation(state.routes[state.index].key), p1)
end