local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local _ = require(groups.Common.Types)
local groupListItemModule = require(script.Parent.GroupListItem)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), text (ref), view (ref), groupListItemModule (ref)
	if #p1.groups == 0 then
		return nil
	end
	local t = {}
	local var1 = false
	
	if p1.heading and p1.heading ~= "" then
		t.Heading = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "content-default text-align-x-left size-full-0 auto-y text-title-large",
			Text = p1.heading
		})
	end
	for i, v in ipairs(p1.groups) do
		local var2 = not p1.visibleIds or p1.visibleIds[v.id] == true
		var1 = var1 or var2
		t[`Group_{v.id}`] = reactModule.createElement(view, {
			Visible = var2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = i + 1
		}, {
			Item = reactModule.createElement(groupListItemModule, {
				group = v,
				layoutOrder = i + 1,
				showRank = p1.showRank,
				showMemberCount = p1.showMemberCount
			})
		})
	end
	return reactModule.createElement(view, {
		tag = "col gap-small",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Visible = var1
	}, t)
end)