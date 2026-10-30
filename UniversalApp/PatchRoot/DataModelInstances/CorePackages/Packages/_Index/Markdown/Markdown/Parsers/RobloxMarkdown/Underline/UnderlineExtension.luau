local Markdown = script:FindFirstAncestor("Markdown")
local _ = require(Markdown.Adapter.AdapterTypes)
local _ = require(Markdown.Parent.CommonMark)
local UnderlineDelimiterProcessorModule = require(script.Parent.UnderlineDelimiterProcessor)

return {
	create = function()
		-- upvalues: UnderlineDelimiterProcessorModule (copy)
		return {
			extendParser = function(p1)
				-- upvalues: UnderlineDelimiterProcessorModule (upval)
				p1:customDelimiterProcessor(UnderlineDelimiterProcessorModule.new())
			end,
			extendHtmlRenderer = function(p1)
				local UnderlineHtmlNodeRendererModule = require(script.Parent.UnderlineHtmlNodeRenderer)
				p1:nodeRendererFactory({
					create = function(_, p2)
						-- upvalues: UnderlineHtmlNodeRendererModule (copy)
						return (UnderlineHtmlNodeRendererModule.new(p2))
					end
				})
			end,
			extendAdapter = function(p1)
				p1:inline("Underline", { style = "UNDERLINE" })
			end
		}
	end
}