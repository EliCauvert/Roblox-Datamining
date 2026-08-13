local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local playerBadgeModule = require(parent.Components.Presentation.PlayerBadge)
local playerBadgeGroupModule = require(parent.Components.Presentation.PlayerBadgeGroup)
local fFlagPlayerListPeopleCellGapFixModule = require(parent.Flags.FFlagPlayerListPeopleCellGapFix)
local fFlagPlayerListReskinVerifiedIconModule = require(parent.Flags.FFlagPlayerListReskinVerifiedIcon)
local t = {
	["text-body-small text-align-x-left content-default text-truncate-end"] = true,
	["shrink auto-xy"] = fFlagPlayerListPeopleCellGapFixModule,
	["fill size-0-full"] = not fFlagPlayerListPeopleCellGapFixModule
}
local t_1 = {
	["row align-x-left align-y-center fill size-0-full clip"] = true,
	["gap-medium"] = fFlagPlayerListPeopleCellGapFixModule,
	["gap-xsmall"] = not fFlagPlayerListPeopleCellGapFixModule
}

return reactModule.memo(function(p0) --[[ line: 34 | named "PeopleCell" ]]
	-- upvalues: t (ref), reactModule (ref), text (ref), fFlagPlayerListReskinVerifiedIconModule (ref), playerBadgeGroupModule (ref), playerBadgeModule (ref), view (ref), t_1 (ref)
	local t_2 = {
		NameText = reactModule.createElement(text, {
			LayoutOrder = 1,
			Text = p0.displayName,
			tag = p0.textTag or (if p0.truncate then t else "auto-xy text-body-small text-align-x-left content-default")
		})
	}
	
	if p0.player then
		if fFlagPlayerListReskinVerifiedIconModule then
			t_2.Badge = reactModule.createElement(playerBadgeGroupModule, { layoutOrder = 2, player = p0.player })
		else
			t_2.Badge = reactModule.createElement(playerBadgeModule, { layoutOrder = 2, player = p0.player })
		end
	end
	return reactModule.createElement(view, { LayoutOrder = p0.layoutOrder, tag = t_1 }, t_2)
end)