local parent = script:FindFirstAncestor("AppBlox").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), cryoModule (ref)
	return reactModule.createElement(view, {
		tag = "size-full",
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.ZIndex
	}, cryoModule.Dictionary.union(p1.children or {}, {
		Content = reactModule.createElement(view, {
			tag = "bg-surface-100 padding-y-medium padding-x-small radius-medium",
			aspectRatio = p1.tileAspectRatio,
			Size = p1.size
		}, { ContentOverlay = p1.contentOverlayComponent })
	}))
end)