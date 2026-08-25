local inlineRichText = script:FindFirstAncestor("InlineRichText")
local hardBreakElement = require(inlineRichText.Parent.InlineLayout).Components.InlineLayoutElements.HardBreakElement
local _ = require(inlineRichText.Types)

return function(_, _)
	-- upvalues: hardBreakElement (ref)
	return { hardBreakElement }
end