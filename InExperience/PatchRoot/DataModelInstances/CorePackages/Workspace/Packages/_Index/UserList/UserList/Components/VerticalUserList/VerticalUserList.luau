local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local flatList = require(parent.VirtualizedList).FlatList
local _ = require(userList.Common.Types)
local enumsModule = require(userList.Common.Enums)
local useEntitiesModule = require(userList.Hooks.useEntities)
local useEntitySelectionHandlerModule = require(userList.Hooks.useEntitySelectionHandler)
local useRenderEntityModule = require(userList.Hooks.useRenderEntity)
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local var1 = if fFlagUserListCtaIntegrationEnabled then require(userList.Cta) else nil
local t = {
	BackgroundTransparency = 1,
	ScrollBarThickness = 0,
	BorderSizePixel = 0
}
local t_1 = { BackgroundTransparency = 1 }

local function keyExtractor(p1, _)
	return p1
end

local function VerticalUserList(p1)
	-- upvalues: useEntitiesModule (ref), useEntitySelectionHandlerModule (ref), reactModule (ref), useRenderEntityModule (ref), enumsModule (ref), view (ref), flatList (ref), keyExtractor (ref), t (ref), t_1 (ref)
	local var2 = useEntitiesModule(p1.entities)
	local var3 = useEntitySelectionHandlerModule(p1.onRowSelected)
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		if not p1.initialRowCount or p1.initialRowCount >= #p1.entities then
			return p1.entities
		end
		local t = {}
		
		for i = 1, p1.initialRowCount do
			table.insert(t, p1.entities[i])
		end
		return t
	end, { p1.entities, p1.initialRowCount })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		local t = {}
		
		for i, v in var4 do
			table.insert(t, v.id)
		end
		return t
	end, { var4 })
	local var6 = useRenderEntityModule({
		entitiesMap = var2.entitiesMap,
		onActivated = var3,
		renderRow = p1.renderRow,
		configs = p1.configs,
		layoutMode = enumsModule.LayoutMode.Vertical
	})
	
	return if #p1.entities == 0 then nil elseif p1.isScrollEnabled then reactModule.createElement(view, { tag = "size-full-0 fill", LayoutOrder = p1.layoutOrder }, {
		List = reactModule.createElement(flatList, {
			windowSize = 3,
			initialNumToRender = 10,
			onEndReachedThreshold = 2,
			data = var5,
			renderItem = reactModule.useCallback(function(p2)
				-- upvalues: var6 (ref)
				return var6(p2.item, p2.index)
			end, { var6 }),
			keyExtractor = keyExtractor,
			style = t,
			contentContainerStyle = t_1,
			ListHeaderComponent = p1.ListHeaderComponent,
			ListFooterComponent = p1.ListFooterComponent
		})
	}) else reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-xxsmall",
		LayoutOrder = p1.layoutOrder
	}, {
		EntityRows = reactModule.createElement(reactModule.Fragment, {}, unpack(reactModule.useMemo(function()
			-- upvalues: var5 (ref), reactModule (copy), view (copy), var6 (ref)
			local t = {}
			
			for i, v in ipairs(var5) do
				t[i] = reactModule.createElement(view, { tag = "size-full-0 auto-y", key = v, LayoutOrder = i }, { Content = var6(v, i) })
			end
			return t
		end, { var5, var6 })))
	})
end

return if fFlagUserListCtaIntegrationEnabled then function(p2)
	-- upvalues: var1 (ref), reactModule (ref), VerticalUserList (ref)
	return if var1 ~= nil and (p2.ctaConfig ~= nil and p2.renderRow == nil) then reactModule.createElement(var1.CtaRenderRowBridge, {
		ctaConfig = p2.ctaConfig,
		render = function(p3)
			-- upvalues: p2 (ref), reactModule (copy), VerticalUserList (copy)
			local cloned = table.clone(p2)
			cloned.renderRow = p3
			
			return reactModule.createElement(VerticalUserList, cloned)
		end
	}) else reactModule.createElement(VerticalUserList, p2)
end else VerticalUserList