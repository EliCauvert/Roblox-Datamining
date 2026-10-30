local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)

return function(p1, p2)
	-- upvalues: SplitPaneStoreModule (copy)
	local SupportPaneTopRouteMatcher = SplitPaneStoreModule.getStore().getSupportPaneTopRouteMatcher(false)
	
	return SupportPaneTopRouteMatcher ~= nil and SupportPaneTopRouteMatcher(p1, p2)
end