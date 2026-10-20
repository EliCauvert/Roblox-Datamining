local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(UserList.Common.Types)
local EntityRow = require(UserList.Components.UserRow).EntityRow
local FFlagUserListCtaIntegrationEnabled = require(Parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local FFlagAddStatusIndicatorToBaseRow = require(Parent.SharedFlags).FFlagAddStatusIndicatorToBaseRow
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions

return function(p1)
	-- upvalues: FFlagUserListSurfaceExtensions (copy), ReactModule (copy), View (copy), EntityRow (copy), FFlagUserListCtaIntegrationEnabled (copy), FFlagAddStatusIndicatorToBaseRow (copy)
	local OnActivated = p1.onActivated
	local RenderRowFunction = p1.renderRow
	local EntitiesMap = p1.entitiesMap
	local Configs = p1.configs
	local LayoutMode = p1.layoutMode
	local FirstRowRef = if FFlagUserListSurfaceExtensions then p1.firstRowRef else nil
	
	return (ReactModule.useCallback(function(p2, LayoutOrder, Size)
		-- upvalues: EntitiesMap (copy), RenderRowFunction (copy), OnActivated (copy), ReactModule (upval), View (upval), FFlagUserListSurfaceExtensions (upval), FirstRowRef (copy), EntityRow (upval), FFlagUserListCtaIntegrationEnabled (upval), FFlagAddStatusIndicatorToBaseRow (upval), Configs (copy), LayoutMode (copy)
		local Entities = EntitiesMap[p2]
		
		return if Entities then if RenderRowFunction then RenderRowFunction(function(p3)
			-- upvalues: Entities (copy), LayoutOrder (copy), OnActivated (upval), ReactModule (upval), View (upval), Size (copy), FFlagUserListSurfaceExtensions (upval), FirstRowRef (upval), EntityRow (upval), FFlagUserListCtaIntegrationEnabled (upval), FFlagAddStatusIndicatorToBaseRow (upval), Configs (upval), LayoutMode (upval)
			return ReactModule.createElement(View, {
				tag = "size-full-full",
				Size = Size,
				LayoutOrder = LayoutOrder,
				ref = if FFlagUserListSurfaceExtensions and LayoutOrder == 1 then FirstRowRef else nil
			}, {
				ReactModule.createElement(EntityRow, {
					entity = Entities,
					onActivated = if p3.onRowActivated then function()
						-- upvalues: p3 (copy), Entities (upval), LayoutOrder (upval)
						p3.onRowActivated(Entities.id, Entities.type, LayoutOrder)
					end else OnActivated,
					primaryCta = p3.primaryCta,
					secondaryCta = p3.secondaryCta,
					ctaLoading = if FFlagUserListCtaIntegrationEnabled then p3.ctaLoading else nil,
					contextualInfo = p3.contextualInfo,
					loadingState = p3.loadingState,
					presence = p3.presence,
					shouldShowNewIndicator = if FFlagAddStatusIndicatorToBaseRow then p3.shouldShowNewIndicator else nil,
					trailingContent = p3.trailingContent,
					configs = Configs,
					layoutMode = LayoutMode
				})
			})
		end, Entities, LayoutOrder) else ReactModule.createElement(View, {
			tag = "size-full-full",
			Size = Size,
			LayoutOrder = LayoutOrder,
			ref = if FFlagUserListSurfaceExtensions and LayoutOrder == 1 then FirstRowRef else nil
		}, {
			ReactModule.createElement(EntityRow, {
				entity = Entities,
				onActivated = OnActivated,
				configs = Configs,
				layoutMode = LayoutMode
			})
		}) else nil
	end, {
		OnActivated, RenderRowFunction, EntitiesMap, Configs, LayoutMode,
		if FFlagUserListSurfaceExtensions then FirstRowRef else nil
	}))
end