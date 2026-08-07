-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:32 2026 Pacific Standard Time.

local safeFlagsModule = require(script:FindFirstAncestor("FoundationImages").Parent.SafeFlags)

return {
	FixBlurryImages = safeFlagsModule.createGetFFlag("FixBlurryImages")(),
	FoundationImagesWhitelistedIconAssets = safeFlagsModule.createGetFString("FoundationImagesWhitelistedIconAssets", "")()
}