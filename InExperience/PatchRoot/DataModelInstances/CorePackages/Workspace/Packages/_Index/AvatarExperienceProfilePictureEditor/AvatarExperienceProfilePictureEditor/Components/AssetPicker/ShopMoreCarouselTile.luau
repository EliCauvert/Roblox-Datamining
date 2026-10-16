local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize

return function(p1) --[[ Line: 22 | Named "ShopMoreCarouselTile" ]]
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "col align-x-left gap-small auto-y",
		Size = UDim2.fromOffset(p1.tileSize, 0),
		LayoutOrder = p1.layoutOrder,
		onActivated = ReactModule.useCallback(function() --[[ Line: 23 ]]
			-- upvalues: p1 (copy)
			p1.onActivated()
		end, { p1.onActivated })
	}, {
		Thumbnail = ReactModule.createElement(View, {
			tag = "align-x-center align-y-center radius-medium bg-surface-100",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p1.tileSize, p1.tileSize)
		}, {
			Icon = ReactModule.createElement(Icon, { name = IconName.ShoppingCart, size = IconSize.XXLarge })
		}),
		Label = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 2,
			Text = p1.label
		})
	})
end