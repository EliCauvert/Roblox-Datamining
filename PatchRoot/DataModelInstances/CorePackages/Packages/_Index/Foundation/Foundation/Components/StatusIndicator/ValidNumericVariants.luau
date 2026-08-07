-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:09 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local statusIndicatorVariantModule = require(foundation.Enums.StatusIndicatorVariant)
local flagsModule = require(foundation.Utility.Flags)

return {
	[statusIndicatorVariantModule.Emphasis] = true,
	[statusIndicatorVariantModule.Standard] = true,
	[statusIndicatorVariantModule.Contrast_Experiment] = if flagsModule.FoundationStatusIndicatorVariantExperiment then true else false,
	[statusIndicatorVariantModule.Alert] = if flagsModule.FoundationStatusIndicatorVariantExperiment then true else false
}