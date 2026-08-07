local parent = script:FindFirstAncestor("AppBlox").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

return reactModule.memo(function(p0) --[[ line: 19 | named "EmptyTile" ]]
	-- upvalues: reactModule (ref), view (ref), cryoModule (ref)
	return reactModule.createElement(view, {
		tag = "size-full",
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.ZIndex
	}, cryoModule.Dictionary.union(p0.children or {}, {
		Content = reactModule.createElement(view, {
			tag = "bg-surface-100 padding-y-medium padding-x-small radius-medium",
			aspectRatio = p0.tileAspectRatio,
			Size = p0.size
		}, { ContentOverlay = p0.contentOverlayComponent })
	}))
end)