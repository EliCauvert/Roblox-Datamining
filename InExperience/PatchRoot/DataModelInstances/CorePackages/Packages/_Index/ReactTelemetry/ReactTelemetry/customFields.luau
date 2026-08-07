local plugin = script:FindFirstAncestorWhichIsA("Plugin")

return {
	context = if plugin then "plugin" else "unknown",
	plugin_name = if plugin then plugin.Name else nil
}