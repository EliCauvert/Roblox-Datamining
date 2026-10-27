local _ = require(script.Parent.AdapterTypes)
local _ = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)
local RulesModule = require(script.Parent.Rules)

local function literalOf(p1)
	return p1.literal or ""
end

local function softLineBreak(_): string
	return "\n"
end

return {
	register = function(p1)
		-- upvalues: RulesModule (copy), literalOf (copy), softLineBreak (copy)
		p1:block("Paragraph", { as = "PARAGRAPH" })
		p1:block("Heading", {
			as = "HEADING",
			attributes = function(p2)
				return { depth = p2.level }
			end
		})
		p1:block("ThematicBreak", RulesModule.divider())
		p1:block("FencedCodeBlock", RulesModule.codeBlock())
		p1:block("IndentedCodeBlock", RulesModule.codeBlock())
		p1:block("HtmlBlock", RulesModule.htmlBlock())
		local ListResult = RulesModule.list()
		p1:block("BulletList", ListResult)
		p1:block("OrderedList", ListResult)
		p1:block("BlockQuote", RulesModule.quote())
		p1:block("LinkReferenceDefinition", "drop")
		p1:inline("Text", { text = literalOf })
		p1:inline("HtmlInline", { text = literalOf })
		p1:inline("SoftLineBreak", { text = softLineBreak })
		p1:inline("HardLineBreak", RulesModule.hardLineBreak())
		p1:inline("Code", RulesModule.code())
		p1:inline("Link", RulesModule.link())
		p1:inline("Image", RulesModule.image())
		p1:inline("Emphasis", { style = "ITALIC" })
		p1:inline("StrongEmphasis", { style = "BOLD_2" })
		p1:inline("Strikethrough", { style = "STRIKE" })
	end
}