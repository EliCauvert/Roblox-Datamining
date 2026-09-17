local usePortalSelectionLinksModule = require(script.Parent.usePortalSelectionLinks)

return function(p1)
	-- upvalues: usePortalSelectionLinksModule (ref)
	local list = {
		{
			direction = "Right",
			from = p1.triggerRef,
			to = p1.firstItemRef
		},
		{
			direction = "Left",
			from = p1.firstItemRef,
			to = p1.triggerRef
		}
	}
	
	if p1.firstTabRef then
		table.insert(list, {
			direction = "Left",
			from = p1.firstTabRef,
			to = p1.triggerRef
		})
	end
	usePortalSelectionLinksModule({
		enabled = p1.enabled,
		active = p1.isOpen,
		edges = list,
		rearmKey = p1.currentItemKey,
		restoreHome = p1.triggerRef,
		guiService = p1.guiService
	})
end