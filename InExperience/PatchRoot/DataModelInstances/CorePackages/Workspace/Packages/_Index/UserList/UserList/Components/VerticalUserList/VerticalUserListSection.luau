local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local _ = require(userList.Common.Enums)
local view = require(parent.Foundation).View
local _ = require(userList.Common.Types)
local userListHeaderModule = require(userList.Components.UserListHeader)
local userListFooterModule = require(userList.Components.UserListFooter)
local verticalUserListModule = require(script.Parent.VerticalUserList)

return function(p0) --[[ line: 37 | named "VerticalUserListSection" ]]
	-- upvalues: reactModule (ref), view (ref), userListHeaderModule (ref), userListFooterModule (ref), verticalUserListModule (ref)
	local var5 = if p0.header then reactModule.createElement(view, {
		tag = {
			["size-full-0 auto-y"] = true,
			["padding-bottom-large"] = p0.isScrollEnabled
		},
		LayoutOrder = if not p0.isScrollEnabled then 1 else nil
	}, {
		HeaderContent = reactModule.createElement(userListHeaderModule, p0.header)
	}) else nil
	local var6 = if p0.hasMore and p0.onLoadMore then reactModule.createElement(view, {
		tag = {
			["size-full-0 auto-y"] = true,
			["padding-top-large"] = p0.isScrollEnabled
		},
		LayoutOrder = if not p0.isScrollEnabled then 3 else nil
	}, {
		FooterContent = reactModule.createElement(userListFooterModule, { hasMore = p0.hasMore, onLoadMore = p0.onLoadMore })
	}) else nil
	
	return if #p0.entities == 0 then nil elseif p0.isScrollEnabled then reactModule.createElement(verticalUserListModule, {
		isScrollEnabled = true,
		entities = p0.entities,
		initialRowCount = p0.initialRowCount,
		onRowSelected = p0.onRowSelectedOverride,
		ListHeaderComponent = var5,
		ListFooterComponent = var6,
		renderRow = p0.renderRow,
		layoutOrder = p0.layoutOrder,
		configs = p0.configs
	}) else reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-large",
		LayoutOrder = p0.layoutOrder
	}, {
		Header = var5,
		List = reactModule.createElement(verticalUserListModule, {
			layoutOrder = 2,
			isScrollEnabled = false,
			entities = p0.entities,
			initialRowCount = p0.initialRowCount,
			onRowSelected = p0.onRowSelectedOverride,
			renderRow = p0.renderRow,
			configs = p0.configs
		}),
		Footer = var6
	})
end