local Plugin = script:FindFirstAncestorWhichIsA("Plugin")

return {
	context = if Plugin then "plugin" else "unknown",
	plugin_name = if Plugin then Plugin.Name else nil
}