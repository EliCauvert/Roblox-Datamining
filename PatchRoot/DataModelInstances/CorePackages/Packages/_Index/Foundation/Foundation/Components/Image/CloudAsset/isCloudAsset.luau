-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:04 2026 Pacific Standard Time.

local assets = require(script:FindFirstAncestor("Foundation").Parent.FoundationCloudAssets).Assets

return function(p0) --[[ line: 6 ]]
	-- upvalues: assets (ref)
	return assets[p0] ~= nil
end