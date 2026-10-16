local Groups = script:FindFirstAncestor("Groups")
local Parent = Groups.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local _ = require(Groups.Common.Types)
local GroupListItemModule = require(script.Parent.GroupListItem)

return ReactModule.memo(function(p1) --[[ Line: 24 | Named "GroupsListSection" ]]
	-- upvalues: ReactModule (copy), Text (copy), View (copy), GroupListItemModule (copy)
	if #p1.groups == 0 then
		return nil
	end
	local Elements = {}
	local Visible = false
	
	if p1.heading and p1.heading ~= "" then
		Elements.Heading = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "content-default text-align-x-left size-full-0 auto-y text-title-large",
			Text = p1.heading
		})
	end
	for i, group in ipairs(p1.groups) do
		local NoVisibleIds: boolean = not p1.visibleIds or p1.visibleIds[group.id] == true
		Visible = Visible or NoVisibleIds
		Elements[`Group_{group.id}`] = ReactModule.createElement(View, {
			Visible = NoVisibleIds,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = i + 1
		}, {
			Item = ReactModule.createElement(GroupListItemModule, {
				group = group,
				layoutOrder = i + 1,
				showRank = p1.showRank,
				showMemberCount = p1.showMemberCount
			})
		})
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small",
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Visible = Visible
	}, Elements)
end)