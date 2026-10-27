local SafeFlagsModule = require(script:FindFirstAncestor("Markdown").Parent.SafeFlags)

return {
	FFlagMarkdownUseRobloxProfileParser = SafeFlagsModule.createGetFFlag("MarkdownUseRobloxProfileParser")(),
	FFlagMarkdownDefaultRobloxProfile = SafeFlagsModule.createGetFFlag("MarkdownDefaultRobloxProfile")()
}