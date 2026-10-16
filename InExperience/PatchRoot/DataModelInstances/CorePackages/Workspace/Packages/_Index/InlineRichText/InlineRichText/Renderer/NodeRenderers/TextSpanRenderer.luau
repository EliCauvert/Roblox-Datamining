local InlineRichText = script:FindFirstAncestor("InlineRichText")
local Parent = InlineRichText.Parent
local CryoModule = require(Parent.Cryo)
local TextElement = require(Parent.InlineLayout).Components.InlineLayoutElements.TextElement
local _ = require(InlineRichText.Types)

return function(p1, p2) --[[ Line: 10 ]]
	-- upvalues: CryoModule (copy), TextElement (copy)
	return CryoModule.List.map(p2.processChildren(p1, p2), function(p3, LayoutOrder) --[[ Line: 12 ]]
		-- upvalues: TextElement (upval), p2 (copy)
		return TextElement.new({
			LayoutOrder = LayoutOrder,
			EngineTags = p3.engineTags,
			Text = p3.text,
			fontStyle = p2.styles.fontStyle,
			textStyle = p2.styles.textStyle
		})
	end)
end