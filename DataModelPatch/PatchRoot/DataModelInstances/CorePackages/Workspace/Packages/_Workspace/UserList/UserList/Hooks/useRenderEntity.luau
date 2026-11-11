local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local _ = require(UserList.Common.Types)
local EntityRow = require(UserList.Components.UserRow).EntityRow

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), EntityRow (copy)
	local OnActivated = p1.onActivated
	local RenderRowFunction = p1.renderRow
	local EntitiesMap = p1.entitiesMap
	local Configs = p1.configs
	local LayoutMode = p1.layoutMode
	
	return (ReactModule.useCallback(function(p2, LayoutOrder, Size)
		-- upvalues: EntitiesMap (copy), RenderRowFunction (copy), OnActivated (copy), ReactModule (upval), View (upval), EntityRow (upval), Configs (copy), LayoutMode (copy)
		local Entities = EntitiesMap[p2]
		
		return if Entities then if RenderRowFunction then RenderRowFunction(function(p3)
			-- upvalues: Entities (copy), LayoutOrder (copy), OnActivated (upval), ReactModule (upval), View (upval), Size (copy), EntityRow (upval), Configs (upval), LayoutMode (upval)
			return ReactModule.createElement(View, {
				tag = "size-full-full",
				Size = Size,
				LayoutOrder = LayoutOrder
			}, {
				ReactModule.createElement(EntityRow, {
					entity = Entities,
					onActivated = if p3.onRowActivated then function()
						-- upvalues: p3 (copy), Entities (upval), LayoutOrder (upval)
						p3.onRowActivated(Entities.id, Entities.type, LayoutOrder)
					end else OnActivated,
					primaryCta = p3.primaryCta,
					secondaryCta = p3.secondaryCta,
					contextualInfo = p3.contextualInfo,
					loadingState = p3.loadingState,
					presence = p3.presence,
					trailingContent = p3.trailingContent,
					configs = Configs,
					layoutMode = LayoutMode
				})
			})
		end, Entities, LayoutOrder) else ReactModule.createElement(View, {
			tag = "size-full-full",
			Size = Size,
			LayoutOrder = LayoutOrder
		}, {
			ReactModule.createElement(EntityRow, {
				entity = Entities,
				onActivated = OnActivated,
				configs = Configs,
				layoutMode = LayoutMode
			})
		}) else nil
	end, {
		OnActivated,
		RenderRowFunction,
		EntitiesMap,
		Configs,
		LayoutMode
	}))
end