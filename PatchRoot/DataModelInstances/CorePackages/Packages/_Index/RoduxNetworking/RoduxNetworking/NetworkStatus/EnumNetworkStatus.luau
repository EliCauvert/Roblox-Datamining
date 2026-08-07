-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

local t = {}
local t_1 = {
	NotStarted = "NotStarted",
	Fetching = "Fetching",
	Done = "Done",
	Failed = "Failed"
}
setmetatable(t, {
	__newindex = function(_, _, _) --[[ line: 12 ]] end,
	__index = function(_, p0) --[[ line: 14 ]]
		-- upvalues: t_1 (ref)
		assert(t_1[p0] ~= nil, "EnumNetworkStatus has no value: " .. tostring(p0))
		
		return t_1[p0]
	end
})

return t