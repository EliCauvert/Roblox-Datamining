local splitPaneSlot = require(script:FindFirstAncestor("SplitPane").Parent.AppSplitView).Enums.SplitPaneSlot

return function(p1)
	-- upvalues: splitPaneSlot (ref)
	return p1.descriptor.options.splitPaneEligibility == splitPaneSlot.Support
end