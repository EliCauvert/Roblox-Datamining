local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local _ = require(groups.Common.Types)
local groupListItemModule = require(script.Parent.GroupListItem)

return reactModule.memo(function(p0) --[[ line: 24 | named "GroupsListSection" ]]
	-- upvalues: reactModule (ref), text (ref), view (ref), groupListItemModule (ref)
	if #p0.groups == 0 then
		return nil
	end
	local t = {}
	local var5 = false
	
	if p0.heading and p0.heading ~= "" then
		t.Heading = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "content-default text-align-x-left size-full-0 auto-y text-title-large",
			Text = p0.heading
		})
	end
	for i, v in ipairs(p0.groups) do
		local var6 = not p0.visibleIds or p0.visibleIds[v.id] == true
		var5 = var5 or var6
		t[`Group_{v.id}`] = reactModule.createElement(view, {
			Visible = var6,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = i + 1
		}, {
			Item = reactModule.createElement(groupListItemModule, {
				group = v,
				layoutOrder = i + 1,
				showRank = p0.showRank,
				showMemberCount = p0.showMemberCount
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-small",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder,
		Visible = var5
	}, t)
end)