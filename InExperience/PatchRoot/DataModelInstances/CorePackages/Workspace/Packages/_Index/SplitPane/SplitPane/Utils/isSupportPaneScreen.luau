local splitPaneSlot = require(script:FindFirstAncestor("SplitPane").Parent.AppSplitView).Enums.SplitPaneSlot

return function(p0)
	-- upvalues: splitPaneSlot (ref)
	return p0.descriptor.options.splitPaneEligibility == splitPaneSlot.Support
end