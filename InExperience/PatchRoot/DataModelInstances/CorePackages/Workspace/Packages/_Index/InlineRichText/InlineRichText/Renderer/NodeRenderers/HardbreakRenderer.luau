local inlineRichText = script:FindFirstAncestor("InlineRichText")
local hardBreakElement = require(inlineRichText.Parent.InlineLayout).Components.InlineLayoutElements.HardBreakElement
local _ = require(inlineRichText.Types)

return function(_, _) --[[ line: 9 ]]
	-- upvalues: hardBreakElement (ref)
	return { hardBreakElement }
end