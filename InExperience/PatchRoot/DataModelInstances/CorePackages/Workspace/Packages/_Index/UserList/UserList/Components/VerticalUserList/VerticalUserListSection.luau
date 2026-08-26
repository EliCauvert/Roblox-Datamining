local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local _ = require(userList.Common.Enums)
local view = require(parent.Foundation).View
local _ = require(userList.Common.Types)
local userListHeaderModule = require(userList.Components.UserListHeader)
local userListFooterModule = require(userList.Components.UserListFooter)
local verticalUserListModule = require(script.Parent.VerticalUserList)
local userListTightHeaderSpacing = game:DefineFastFlag("UserListTightHeaderSpacing", false)
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled

return function(p1)
	-- upvalues: reactModule (ref), view (ref), userListTightHeaderSpacing (ref), userListHeaderModule (ref), userListFooterModule (ref), verticalUserListModule (ref), fFlagUserListCtaIntegrationEnabled (ref)
	local var1 = if p1.header then reactModule.createElement(view, {
		tag = {
			["size-full-0 auto-y"] = true,
			["padding-bottom-small"] = userListTightHeaderSpacing,
			["padding-bottom-large"] = not userListTightHeaderSpacing and p1.isScrollEnabled
		},
		LayoutOrder = if not p1.isScrollEnabled then 1 else nil
	}, {
		HeaderContent = reactModule.createElement(userListHeaderModule, p1.header)
	}) else nil
	local var2 = if p1.hasMore and p1.onLoadMore then reactModule.createElement(view, {
		tag = {
			["size-full-0 auto-y"] = true,
			["padding-top-large"] = userListTightHeaderSpacing or p1.isScrollEnabled
		},
		LayoutOrder = if not p1.isScrollEnabled then 3 else nil
	}, {
		FooterContent = reactModule.createElement(userListFooterModule, { hasMore = p1.hasMore, onLoadMore = p1.onLoadMore })
	}) else nil
	
	return if #p1.entities == 0 then nil elseif p1.isScrollEnabled then reactModule.createElement(verticalUserListModule, {
		isScrollEnabled = true,
		entities = p1.entities,
		initialRowCount = p1.initialRowCount,
		onRowSelected = p1.onRowSelectedOverride,
		ListHeaderComponent = var1,
		ListFooterComponent = var2,
		renderRow = p1.renderRow,
		ctaConfig = if fFlagUserListCtaIntegrationEnabled then p1.ctaConfig else nil,
		layoutOrder = p1.layoutOrder,
		configs = p1.configs
	}) else reactModule.createElement(view, {
		tag = {
			["col size-full-0 auto-y"] = userListTightHeaderSpacing,
			["col gap-large size-full-0 auto-y"] = not userListTightHeaderSpacing
		},
		LayoutOrder = p1.layoutOrder
	}, {
		Header = var1,
		List = reactModule.createElement(verticalUserListModule, {
			layoutOrder = 2,
			isScrollEnabled = false,
			entities = p1.entities,
			initialRowCount = p1.initialRowCount,
			onRowSelected = p1.onRowSelectedOverride,
			renderRow = p1.renderRow,
			ctaConfig = if fFlagUserListCtaIntegrationEnabled then p1.ctaConfig else nil,
			configs = p1.configs
		}),
		Footer = var2
	})
end