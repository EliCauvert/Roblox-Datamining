local SafeFlagsModule = require(script:FindFirstAncestor("MarkdownCore").Parent.SafeFlags)

return {
	FFlagMarkdownAssistantParity = SafeFlagsModule.createGetFFlag("MarkdownAssistantParity")(),
	FFlagMarkdownTables = SafeFlagsModule.createGetFFlag("MarkdownTables")(),
	FFlagMarkdownTagFallbacks = SafeFlagsModule.createGetFFlag("MarkdownTagFallbacks")()
}