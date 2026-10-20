local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(Parent.AvatarExperienceCommon)
local WearTimeListItemModule = require(script.Parent.WearTimeListItem)

return function(Frame)
	-- upvalues: ReactModule (copy), WearTimeListItemModule (copy), View (copy)
	local Elements = {}
	
	for LayoutOrder, option in Frame.options do
		Elements["WearTimeListItem_" .. tostring(LayoutOrder)] = ReactModule.createElement(WearTimeListItemModule, {
			days = option.days,
			price = option.price,
			isActive = option.selected ~= nil and option.selected,
			onActivated = if Frame.onOptionActivated then function()
				-- upvalues: Frame (copy), LayoutOrder (copy)
				Frame.onOptionActivated(LayoutOrder)
			end else nil,
			LayoutOrder = LayoutOrder
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y padding-small radius-medium stroke-default stroke-thick",
		LayoutOrder = Frame.LayoutOrder
	}, Elements)
end