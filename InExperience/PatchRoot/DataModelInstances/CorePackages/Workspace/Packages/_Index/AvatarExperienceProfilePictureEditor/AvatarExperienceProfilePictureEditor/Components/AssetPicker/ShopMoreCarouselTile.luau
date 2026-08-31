local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

return function(p1)
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col align-x-left gap-small auto-y",
		Size = UDim2.fromOffset(p1.tileSize, 0),
		LayoutOrder = p1.layoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.onActivated()
		end, { p1.onActivated })
	}, {
		Thumbnail = reactModule.createElement(view, {
			tag = "align-x-center align-y-center radius-medium bg-surface-100",
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p1.tileSize, p1.tileSize)
		}, {
			Icon = reactModule.createElement(icon, { name = iconName.ShoppingCart, size = iconSize.XXLarge })
		}),
		Label = reactModule.createElement(text, {
			tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 2,
			Text = p1.label
		})
	})
end