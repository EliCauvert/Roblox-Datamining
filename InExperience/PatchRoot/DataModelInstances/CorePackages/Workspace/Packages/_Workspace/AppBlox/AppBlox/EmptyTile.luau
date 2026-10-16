local Parent = script:FindFirstAncestor("AppBlox").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return ReactModule.memo(function(p1) --[[ Line: 19 | Named "EmptyTile" ]]
	-- upvalues: ReactModule (copy), View (copy), CryoModule (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.ZIndex
	}, CryoModule.Dictionary.union(p1.children or {}, {
		Content = ReactModule.createElement(View, {
			tag = "bg-surface-100 padding-y-medium padding-x-small radius-medium",
			aspectRatio = p1.tileAspectRatio,
			Size = p1.size
		}, { ContentOverlay = p1.contentOverlayComponent })
	}))
end)