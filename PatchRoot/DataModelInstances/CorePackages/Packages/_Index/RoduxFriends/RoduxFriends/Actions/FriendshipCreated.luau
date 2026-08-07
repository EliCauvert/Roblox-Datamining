-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:06 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.roduxFriendsTypes)

return require(parent.Parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 7 ]]
	return { payload = { userId1 = p0, userId2 = p1 } }
end)