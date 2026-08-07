-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

local safelyAccessPropertyModule = require(script:FindFirstAncestor("SceneUnderstanding").safelyAccessProperty)

return function(value) --[[ line: 26 | named "isSourceAsset" ]]
	-- upvalues: safelyAccessPropertyModule (ref)
	return safelyAccessPropertyModule(value, "SourceAssetId", -1) > 0
end