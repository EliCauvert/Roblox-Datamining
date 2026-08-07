-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:35 2026 Pacific Standard Time.

game:DefineFastFlag("UGCValidationAnimationPackSupport", false)
local ok = pcall(function() --[[ line: 3 ]]
	local _ = Enum.BundleType.Animations
	local _ = Enum.AssetType.ClimbAnimation
end)

return function() --[[ line: 8 ]]
	-- upvalues: ok (ref)
	return ok and game:GetFastFlag("UGCValidationAnimationPackSupport")
end