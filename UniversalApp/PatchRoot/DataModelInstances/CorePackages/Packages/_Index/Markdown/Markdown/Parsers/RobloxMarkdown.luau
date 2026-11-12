local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Adapter)
local CommonMarkModule = require(Markdown.Parent.CommonMark)
local FlagsModule = require(Markdown.Flags)
local FormattingTagsExtensionModule = require(Markdown.Parsers.FormattingTags.FormattingTagsExtension)
local _ = require(Markdown.Types)
local CreateParserModule = require(Markdown.Adapter.createParser)
local Frozen = table.freeze({
	"Heading",
	"FencedCodeBlock",
	"IndentedCodeBlock",
	"ThematicBreak",
	"ListBlock"
})
local Frozen1 = table.freeze({
	"Code", "BackslashEscape", "Emphasis", "Link", "Image", "HardLineBreak"
})
local Frozen2 = table.freeze(FormattingTagsExtensionModule.create({ parseTags = true, maxNesting = 32 }))
local List = {
	table.freeze(require(script.NoNestedQuote).extension()),
	table.freeze(CommonMarkModule.Ext.Gfm.Strikethrough.StrikethroughExtension.builder():requireTwoTildes(false):build()),
	table.freeze(require(script.Underline.UnderlineExtension).create()),
	table.freeze(require(script.Mention.MentionExtension).create())
}

if FlagsModule.FFlagMarkdownFormattingTags then
	table.insert(List, Frozen2)
end
local Frozen3 = table.freeze(List)
local ParserModule = CreateParserModule({
	extensions = Frozen3,
	parserOptions = {
		linkReferenceDefinitions = false,
		maxOpenBlockParsers = 32,
		maxInlineNesting = 32,
		enabledBlockTypes = Frozen,
		enabledInlineTypes = Frozen1
	}
})
local Frozen4 = table.freeze({ extensions = Frozen3 })
local RobloxMarkdownModule = {
	parseOptions = ParserModule.parseOptions,
	renderOptions = Frozen4,
	formattingTagsExtension = Frozen2,
	parse = function(p1)
		-- upvalues: ParserModule (copy)
		return ParserModule.parseDocument(p1)
	end,
	toRendererAst = function(p1, p2)
		-- upvalues: ParserModule (copy)
		return ParserModule.toRendererAst(p1, p2)
	end
}

function RobloxMarkdownModule.safeParse(p1)
	-- upvalues: RobloxMarkdownModule (copy)
	return pcall(RobloxMarkdownModule.parse, p1)
end

function RobloxMarkdownModule.renderHtml(p1)
	-- upvalues: CommonMarkModule (copy), Frozen4 (copy)
	return CommonMarkModule.renderHtml(p1, Frozen4)
end

return RobloxMarkdownModule