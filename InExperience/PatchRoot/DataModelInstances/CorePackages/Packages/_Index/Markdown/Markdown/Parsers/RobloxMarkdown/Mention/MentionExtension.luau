local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Adapter.AdapterTypes)
local _ = require(Markdown.Parent.CommonMark)
local _ = require(script.Parent.Mention)
local MentionInlineParserModule = require(script.Parent.MentionInlineParser)

local function mentionText(p1): string
	return `@{p1.name or p1.id}`
end

return {
	create = function()
		-- upvalues: MentionInlineParserModule (copy), mentionText (copy)
		return {
			extendParser = function(p1)
				-- upvalues: MentionInlineParserModule (upval)
				p1:customInlineContentParserFactory(MentionInlineParserModule.Factory.new())
			end,
			extendHtmlRenderer = function(p1)
				local MentionHtmlNodeRendererModule = require(script.Parent.MentionHtmlNodeRenderer)
				p1:nodeRendererFactory({
					create = function(_, p2)
						-- upvalues: MentionHtmlNodeRendererModule (copy)
						return (MentionHtmlNodeRendererModule.new(p2))
					end
				})
			end,
			extendAdapter = function(p1)
				-- upvalues: mentionText (upval)
				p1:inline("Mention", { text = mentionText })
			end
		}
	end
}