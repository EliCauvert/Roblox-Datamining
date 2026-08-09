local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local enums = foundationModule.Enums

local function _(p0) --[[ line: 18 | named "formatStepCount" ]]
	return if p0 == 1 then "1 Action completed" else `{p0} Actions completed`
end

return function(p1) --[[ line: 22 | named "ActionCompletedRow" ]]
	-- upvalues: reactModule (ref), view (ref), icon (ref), enums (ref), text (ref)
	local createElement = reactModule.createElement
	local t = {
		tag = "row align-y-center gap-small auto-xy",
		LayoutOrder = p1.LayoutOrder
	}
	local t_1 = {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = enums.IconName.Nebula,
			size = enums.IconSize.Medium
		})
	}
	local createElement_1 = reactModule.createElement
	local t_2 = {
		tag = "auto-xy text-body-medium content-default",
		LayoutOrder = 2
	}
	local count = p1.count
	t_2.Text = if count == 1 then "1 Action completed" else `{count} Actions completed`
	t_1.Label = createElement_1(text, t_2)
	
	return createElement(view, t, t_1)
end