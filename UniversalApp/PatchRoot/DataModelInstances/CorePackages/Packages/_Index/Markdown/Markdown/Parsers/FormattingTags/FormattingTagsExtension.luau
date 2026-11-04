local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Adapter.AdapterTypes)
local _ = require(Markdown.Parent.CommonMark)
local _ = require(script.Parent.FormattingTag)
local FormattingTagInlineParserModule = require(script.Parent.FormattingTagInlineParser)
local FormattingTagPostProcessorModule = require(script.Parent.FormattingTagPostProcessor)
local Frozen = table.freeze({
	b = "BOLD_2",
	i = "ITALIC",
	u = "UNDERLINE",
	s = "STRIKE"
})

local function adaptFormattingTag(p1, p2)
	-- upvalues: Frozen (copy)
	if p1:getFirstChild() ~= nil then
		p2:adaptInlinesOf(p1, (p2:append(p2.parent, "STYLED_TEXT", { style = Frozen[p1.tagName] })))
		
		return
	end
end

local function literalOf(p1)
	return p1.literal
end

return {
	create = function(p1)
		-- upvalues: FormattingTagInlineParserModule (copy), FormattingTagPostProcessorModule (copy), adaptFormattingTag (copy), literalOf (copy)
		local IsParseTags: boolean = p1 ~= nil and p1.parseTags == true
		local MaxNesting = if p1 == nil then nil else p1.maxNesting
		
		return {
			extendParser = function(p2)
				-- upvalues: IsParseTags (copy), FormattingTagInlineParserModule (upval), FormattingTagPostProcessorModule (upval), MaxNesting (copy)
				if IsParseTags then
					p2:customInlineContentParserFactory(FormattingTagInlineParserModule.Factory.new())
				end
				p2:postProcessor((FormattingTagPostProcessorModule.new(MaxNesting)))
			end,
			extendHtmlRenderer = function(p2)
				local FormattingTagHtmlNodeRendererModule = require(script.Parent.FormattingTagHtmlNodeRenderer)
				p2:nodeRendererFactory({
					create = function(_, p3)
						-- upvalues: FormattingTagHtmlNodeRendererModule (copy)
						return (FormattingTagHtmlNodeRendererModule.new(p3))
					end
				})
			end,
			extendAdapter = function(p2)
				-- upvalues: adaptFormattingTag (upval), literalOf (upval)
				p2:inline("FormattingTag", adaptFormattingTag)
				p2:inline("FormattingTagText", { text = literalOf })
			end
		}
	end
}