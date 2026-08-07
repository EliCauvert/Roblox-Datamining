-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:34 2026 Pacific Standard Time.

local getEngineFeatureUGCValidateHSRMeshIdsModule = require(script.Parent.Parent.flags.getEngineFeatureUGCValidateHSRMeshIds)
game:DefineFastFlag("UGCValidateHSRMeshIdsLuaFlag", false)

return function() --[[ line: 7 ]]
	-- upvalues: getEngineFeatureUGCValidateHSRMeshIdsModule (ref)
	return game:GetFastFlag("UGCValidateHSRMeshIdsLuaFlag") and getEngineFeatureUGCValidateHSRMeshIdsModule()
end