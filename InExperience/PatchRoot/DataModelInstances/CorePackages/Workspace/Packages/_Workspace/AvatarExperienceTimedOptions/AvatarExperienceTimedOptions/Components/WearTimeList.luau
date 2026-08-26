local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local _ = require(parent.AvatarExperienceCommon)
local wearTimeListItemModule = require(script.Parent.WearTimeListItem)

return function(p1)
	-- upvalues: reactModule (ref), wearTimeListItemModule (ref), view (ref)
	local t = {}
	
	for i, v in p1.options do
		t["WearTimeListItem_" .. tostring(i)] = reactModule.createElement(wearTimeListItemModule, {
			days = v.days,
			price = v.price,
			isActive = if v.selected ~= nil then false else v.selected,
			onActivated = if p1.onOptionActivated then function()
				-- upvalues: p1 (ref), i (ref)
				p1.onOptionActivated(i)
			end else nil,
			LayoutOrder = i
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y padding-small radius-medium stroke-default stroke-thick",
		LayoutOrder = p1.LayoutOrder
	}, t)
end