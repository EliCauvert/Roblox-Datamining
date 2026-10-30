local _ = require(script.Components.MarkdownViewer)
local _ = require(script.Enums.NodeType)
local _ = require(script.Types)

local function _()
	return require(script.Parsers.RobloxMarkdown)
end

local MarkdownModule = {
	parse = nil,
	safeParse = nil,
	parseOptions = nil,
	createParser = nil,
	Adapter = nil,
	Components = require(script.Components),
	Enums = require(script.Enums),
	Parsers = require(script.Parsers),
	Utils = require(script.Utils),
	toRendererAst = function(p1)
		return (require(script.Parsers.RobloxMarkdown).toRendererAst(p1))
	end,
	Flags = require(script.Flags)
}
require(script.lazyMembers)(MarkdownModule, {
	parse = function()
		return require(script.Parsers.RobloxMarkdown).parse
	end,
	safeParse = function()
		return require(script.Parsers.RobloxMarkdown).safeParse
	end,
	parseOptions = function()
		return require(script.Parsers.RobloxMarkdown).parseOptions
	end,
	createParser = function()
		return require(script.Adapter.createParser)
	end,
	Adapter = function()
		return table.freeze({ Rules = require(script.Adapter).Rules })
	end
})

return MarkdownModule