local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local cryoModule = require(parent.Cryo)
local textElement = require(parent.InlineLayout).Components.InlineLayoutElements.TextElement
local _ = require(inlineRichText.Types)

return function(p1, p2)
	-- upvalues: cryoModule (ref), textElement (ref)
	return cryoModule.List.map(p2.processChildren(p1, p2), function(p3, p4)
		-- upvalues: textElement (copy), p2 (ref)
		return textElement.new({
			LayoutOrder = p4,
			EngineTags = p3.engineTags,
			Text = p3.text,
			fontStyle = p2.styles.fontStyle,
			textStyle = p2.styles.textStyle
		})
	end)
end