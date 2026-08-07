-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:33 2026 Pacific Standard Time.

local getEngineUGCValidateAssetTextureLimitsModule = require(script.Parent.Parent.flags.getEngineUGCValidateAssetTextureLimits)
game:DefineFastFlag("UGCValidateAccessoryAssetTextureLimit", false)

return function() --[[ line: 7 ]]
	-- upvalues: getEngineUGCValidateAssetTextureLimitsModule (ref)
	return getEngineUGCValidateAssetTextureLimitsModule() and game:GetFastFlag("UGCValidateAccessoryAssetTextureLimit")
end