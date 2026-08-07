-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local migration = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons).Migration

return function(p0) --[[ line: 7 | named "migrateIconName" ]]
	-- upvalues: migration (ref)
	return migration.uiblox[p0]
end