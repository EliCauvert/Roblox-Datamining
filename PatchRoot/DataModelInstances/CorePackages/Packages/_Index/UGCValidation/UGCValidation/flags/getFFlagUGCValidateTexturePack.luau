-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:35 2026 Pacific Standard Time.

local getEngineUGCValidateTexturePackCPlusPlusModule = require(script.Parent.Parent.flags.getEngineUGCValidateTexturePackCPlusPlus)
game:DefineFastFlag("UGCValidateTexturePack", false)

return function() --[[ line: 7 ]]
	-- upvalues: getEngineUGCValidateTexturePackCPlusPlusModule (ref)
	return game:GetFastFlag("UGCValidateTexturePack") and getEngineUGCValidateTexturePackCPlusPlusModule()
end