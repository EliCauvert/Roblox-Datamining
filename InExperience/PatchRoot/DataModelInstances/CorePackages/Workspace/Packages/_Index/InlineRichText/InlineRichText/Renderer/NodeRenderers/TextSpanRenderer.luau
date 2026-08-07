local inlineRichText = script:FindFirstAncestor("InlineRichText")
local parent = inlineRichText.Parent
local cryoModule = require(parent.Cryo)
local textElement = require(parent.InlineLayout).Components.InlineLayoutElements.TextElement
local _ = require(inlineRichText.Types)

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: cryoModule (ref), textElement (ref)
	return cryoModule.List.map(p1.processChildren(p0, p1), function(p2, p3) --[[ line: 12 ]]
		-- upvalues: textElement (copy), p1 (ref)
		return textElement.new({
			LayoutOrder = p3,
			EngineTags = p2.engineTags,
			Text = p2.text,
			fontStyle = p1.styles.fontStyle,
			textStyle = p1.styles.textStyle
		})
	end)
end