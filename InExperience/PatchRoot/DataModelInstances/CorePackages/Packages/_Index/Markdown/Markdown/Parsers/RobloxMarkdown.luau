local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Adapter)
local CommonMarkModule = require(Markdown.Parent.CommonMark)
local _ = require(Markdown.Types)
local Frozen = table.freeze({
	table.freeze(require(script.NoNestedQuote).extension()),
	table.freeze(CommonMarkModule.Ext.Gfm.Strikethrough.StrikethroughExtension.builder():requireTwoTildes(false):build()),
	table.freeze(require(script.Underline.UnderlineExtension).create()),
	table.freeze(require(script.Mention.MentionExtension).create())
})
local v1 = require(Markdown.Adapter.createParser)({
	extensions = Frozen,
	parserOptions = {
		linkReferenceDefinitions = false,
		maxOpenBlockParsers = 32,
		maxInlineNesting = 32,
		enabledBlockTypes = table.freeze({
			"Heading",
			"FencedCodeBlock",
			"IndentedCodeBlock",
			"ThematicBreak",
			"ListBlock"
		}),
		enabledInlineTypes = table.freeze({
			"Code", "BackslashEscape", "Emphasis", "Link", "Image", "HardLineBreak"
		})
	}
})
local Frozen1 = table.freeze({ extensions = Frozen })
local RobloxMarkdownModule = {
	parseOptions = v1.parseOptions,
	renderOptions = Frozen1,
	parse = function(p1)
		-- upvalues: v1 (copy)
		return v1.parseDocument(p1)
	end,
	toRendererAst = function(p1, p2)
		-- upvalues: v1 (copy)
		return v1.toRendererAst(p1, p2)
	end
}

function RobloxMarkdownModule.safeParse(p1)
	-- upvalues: RobloxMarkdownModule (copy)
	return pcall(RobloxMarkdownModule.parse, p1)
end

function RobloxMarkdownModule.renderHtml(p1)
	-- upvalues: CommonMarkModule (copy), Frozen1 (copy)
	return CommonMarkModule.renderHtml(p1, Frozen1)
end

return RobloxMarkdownModule