local InlineRichText = script:FindFirstAncestor("InlineRichText")
local HardBreakElement = require(InlineRichText.Parent.InlineLayout).Components.InlineLayoutElements.HardBreakElement
local _ = require(InlineRichText.Types)

return function(_, _)
	-- upvalues: HardBreakElement (copy)
	return { HardBreakElement }
end