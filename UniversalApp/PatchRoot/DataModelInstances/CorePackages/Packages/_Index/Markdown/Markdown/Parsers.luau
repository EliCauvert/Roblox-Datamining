local ParsersModule = {
	CommonMark = nil,
	RobloxMarkdown = nil,
	CommonMarkComplianceParser = require(script.CommonMarkComplianceParser),
	WikiMarkdownParser = require(script.WikiMarkdownParser)
}
require(script.Parent.lazyMembers)(ParsersModule, {
	CommonMark = function()
		return require(script.CommonMark.RendererParser)
	end,
	RobloxMarkdown = function()
		return require(script.RobloxMarkdown.RendererParser)
	end
})

return ParsersModule