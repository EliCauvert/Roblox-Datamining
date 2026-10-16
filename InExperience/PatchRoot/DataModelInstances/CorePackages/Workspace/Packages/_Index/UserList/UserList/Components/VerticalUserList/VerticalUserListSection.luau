local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local _ = require(UserList.Common.Enums)
local View = require(Parent.Foundation).View
local _ = require(UserList.Common.Types)
local UserListHeaderModule = require(UserList.Components.UserListHeader)
local UserListFooterModule = require(UserList.Components.UserListFooter)
local VerticalUserListModule = require(script.Parent.VerticalUserList)
local UserListTightHeaderSpacing = game:DefineFastFlag("UserListTightHeaderSpacing", false)
local FFlagUserListCtaIntegrationEnabled = require(Parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions

return function(p1) --[[ Line: 45 | Named "VerticalUserListSection" ]]
	-- upvalues: ReactModule (copy), View (copy), UserListTightHeaderSpacing (copy), UserListHeaderModule (copy), UserListFooterModule (copy), VerticalUserListModule (copy), FFlagUserListCtaIntegrationEnabled (copy), FFlagUserListSurfaceExtensions (copy)
	local Element = if p1.header then ReactModule.createElement(View, {
		tag = {
			["size-full-0 auto-y"] = true,
			["padding-bottom-small"] = UserListTightHeaderSpacing,
			["padding-bottom-large"] = not UserListTightHeaderSpacing and p1.isScrollEnabled
		},
		LayoutOrder = if p1.isScrollEnabled then nil else 1
	}, {
		HeaderContent = ReactModule.createElement(UserListHeaderModule, p1.header)
	}) else nil
	local Element1 = if p1.hasMore and p1.onLoadMore then ReactModule.createElement(View, {
		tag = {
			["size-full-0 auto-y"] = true,
			["padding-top-large"] = UserListTightHeaderSpacing or p1.isScrollEnabled
		},
		LayoutOrder = if p1.isScrollEnabled then nil else 3
	}, {
		FooterContent = ReactModule.createElement(UserListFooterModule, { hasMore = p1.hasMore, onLoadMore = p1.onLoadMore })
	}) else nil
	
	return if #p1.entities == 0 then nil elseif p1.isScrollEnabled then ReactModule.createElement(VerticalUserListModule, {
		isScrollEnabled = true,
		entities = p1.entities,
		initialRowCount = p1.initialRowCount,
		onRowSelected = p1.onRowSelectedOverride,
		ListHeaderComponent = Element,
		ListFooterComponent = Element1,
		renderRow = p1.renderRow,
		ctaConfig = if FFlagUserListCtaIntegrationEnabled then p1.ctaConfig else nil,
		layoutOrder = p1.layoutOrder,
		configs = p1.configs,
		onEndReached = if FFlagUserListSurfaceExtensions then p1.onEndReached else nil,
		firstRowRef = if FFlagUserListSurfaceExtensions then p1.firstRowRef else nil
	}) else ReactModule.createElement(View, {
		tag = {
			["col size-full-0 auto-y"] = UserListTightHeaderSpacing,
			["col gap-large size-full-0 auto-y"] = not UserListTightHeaderSpacing
		},
		LayoutOrder = p1.layoutOrder
	}, {
		Header = Element,
		List = ReactModule.createElement(VerticalUserListModule, {
			layoutOrder = 2,
			isScrollEnabled = false,
			entities = p1.entities,
			initialRowCount = p1.initialRowCount,
			onRowSelected = p1.onRowSelectedOverride,
			renderRow = p1.renderRow,
			ctaConfig = if FFlagUserListCtaIntegrationEnabled then p1.ctaConfig else nil,
			configs = p1.configs,
			firstRowRef = if FFlagUserListSurfaceExtensions then p1.firstRowRef else nil
		}),
		Footer = Element1
	})
end