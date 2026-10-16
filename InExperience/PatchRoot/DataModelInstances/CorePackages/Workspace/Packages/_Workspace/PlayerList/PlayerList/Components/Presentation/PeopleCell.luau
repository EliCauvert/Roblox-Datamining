local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local PlayerBadgeGroupModule = require(Parent.Components.Presentation.PlayerBadgeGroup)

return ReactModule.memo(function(p1) --[[ Line: 23 | Named "PeopleCell" ]]
	-- upvalues: ReactModule (copy), Text (copy), PlayerBadgeGroupModule (copy), View (copy)
	local config = {
		NameText = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			Text = p1.displayName,
			tag = p1.textTag or (if p1.truncate then "text-body-small text-align-x-left content-default text-truncate-end shrink auto-xy" else "auto-xy text-body-small text-align-x-left content-default")
		})
	}
	
	if p1.player then
		config.Badge = ReactModule.createElement(PlayerBadgeGroupModule, { layoutOrder = 2, player = p1.player })
	end
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center fill size-0-full clip gap-medium",
		LayoutOrder = p1.layoutOrder
	}, config)
end)