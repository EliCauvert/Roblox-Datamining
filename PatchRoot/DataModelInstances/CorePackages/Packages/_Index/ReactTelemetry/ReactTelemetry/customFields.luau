-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:38 2026 Pacific Standard Time.

local plugin = script:FindFirstAncestorWhichIsA("Plugin")

return {
	context = if plugin then "plugin" else "unknown",
	plugin_name = if plugin then plugin.Name else nil
}