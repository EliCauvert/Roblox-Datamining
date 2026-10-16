local SplitPaneSlot = require(script:FindFirstAncestor("SplitPane").Parent.AppSplitView).Enums.SplitPaneSlot

return function(p1): boolean --[[ Line: 7 | Named "isSupportPaneScreen" ]]
	-- upvalues: SplitPaneSlot (copy)
	return p1.descriptor.options.splitPaneEligibility == SplitPaneSlot.Support
end