local splitPaneSlot = require(script:FindFirstAncestor("SplitPane").Parent.AppSplitView).Enums.SplitPaneSlot

return function(p0) --[[ line: 7 | named "isSupportPaneScreen" ]]
	-- upvalues: splitPaneSlot (ref)
	return p0.descriptor.options.splitPaneEligibility == splitPaneSlot.Support
end