local FFlagExpChatStickyTabs = require(script:FindFirstAncestor("ExpChat").Parent.SharedFlags).FFlagExpChatStickyTabs

return function(p1): boolean
	-- upvalues: FFlagExpChatStickyTabs (copy)
	return not (FFlagExpChatStickyTabs and p1)
end