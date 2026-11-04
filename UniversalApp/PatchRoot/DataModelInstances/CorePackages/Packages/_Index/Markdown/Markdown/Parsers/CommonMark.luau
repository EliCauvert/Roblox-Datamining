local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Adapter)
local CommonMarkModule1 = require(Markdown.Parent.CommonMark)
local _ = require(Markdown.Types)
local Frozen = table.freeze(require(Markdown.Parsers.FormattingTags.FormattingTagsExtension).create({ maxNesting = 100 }))
local Frozen1 = table.freeze(if require(Markdown.Flags).FFlagMarkdownFormattingTags then { Frozen } else {})
local v1 = require(Markdown.Adapter.createParser)({ extensions = Frozen1 })
local Frozen2 = table.freeze({ extensions = Frozen1 })
local CommonMarkModule = {
	parseOptions = v1.parseOptions,
	renderOptions = Frozen2,
	formattingTagsExtension = Frozen,
	parse = function(p1)
		-- upvalues: v1 (copy)
		return v1.parseDocument(p1)
	end,
	toRendererAst = function(p1, p2)
		-- upvalues: v1 (copy)
		return v1.toRendererAst(p1, p2)
	end
}

function CommonMarkModule.safeParse(p1)
	-- upvalues: CommonMarkModule (copy)
	return pcall(CommonMarkModule.parse, p1)
end

function CommonMarkModule.renderHtml(p1)
	-- upvalues: CommonMarkModule1 (copy), Frozen2 (copy)
	return CommonMarkModule1.renderHtml(p1, Frozen2)
end

return CommonMarkModule