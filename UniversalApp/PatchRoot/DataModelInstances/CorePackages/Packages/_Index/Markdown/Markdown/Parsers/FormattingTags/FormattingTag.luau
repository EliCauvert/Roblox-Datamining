local CommonMarkModule = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)

return {
	new = function(TagName)
		-- upvalues: CommonMarkModule (copy)
		local FormattingTag = CommonMarkModule.Node.CustomNode.new("FormattingTag")
		FormattingTag.tagName = TagName
		
		return FormattingTag
	end,
	text = function(Literal)
		-- upvalues: CommonMarkModule (copy)
		local FormattingTagText = CommonMarkModule.Node.CustomNode.new("FormattingTagText")
		FormattingTagText.literal = Literal
		
		return FormattingTagText
	end,
	TAGS = table.freeze({
		["<b>"] = table.freeze({ name = "b", closing = false }),
		["</b>"] = table.freeze({ name = "b", closing = true }),
		["<i>"] = table.freeze({ name = "i", closing = false }),
		["</i>"] = table.freeze({ name = "i", closing = true }),
		["<u>"] = table.freeze({ name = "u", closing = false }),
		["</u>"] = table.freeze({ name = "u", closing = true }),
		["<s>"] = table.freeze({ name = "s", closing = false }),
		["</s>"] = table.freeze({ name = "s", closing = true })
	})
}