-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:17 2026 Pacific Standard Time.

local builderIconPlatformUtilsModule = require(script.builderIconPlatformUtils)

return {
	Icon = require(script.Icon),
	IconVariant = require(script.IconVariant),
	Font = require(script.Font),
	Migration = require(script.Migration),
	getBuilderIconForKeycode = builderIconPlatformUtilsModule.getBuilderIconForKeycode,
	getBuilderIconForCurrentPlatform = builderIconPlatformUtilsModule.getBuilderIconForCurrentPlatform
}