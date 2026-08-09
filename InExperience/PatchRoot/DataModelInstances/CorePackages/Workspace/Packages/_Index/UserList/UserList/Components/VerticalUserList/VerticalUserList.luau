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
local t = {
	BackgroundTransparency = 1,
	ScrollBarThickness = 0,
	BorderSizePixel = 0
}
local t_1 = { BackgroundTransparency = 1 }

local function keyExtractor(p0, _) --[[ line: 52 ]]
	return p0
end

return function(p1) --[[ line: 56 | named "VerticalUserList" ]]
	-- upvalues: useEntitiesModule (ref), useEntitySelectionHandlerModule (ref), reactModule (ref), useRenderEntityModule (ref), enumsModule (ref), view (ref), flatList (ref), keyExtractor (ref), t (ref), t_1 (ref)
	local var9 = useEntitiesModule(p1.entities)
	local var10 = useEntitySelectionHandlerModule(p1.onRowSelected)
	local var11 = reactModule.useMemo(function() --[[ line: 61 ]]
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
	local var12 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: var11 (ref)
		local t = {}
		
		for i, v in var11 do
			table.insert(t, v.id)
		end
		return t
	end, { var11 })
	local var13 = useRenderEntityModule({
		entitiesMap = var9.entitiesMap,
		onActivated = var10,
		renderRow = p1.renderRow,
		configs = p1.configs,
		layoutMode = enumsModule.LayoutMode.Vertical
	})
	
	return if #p1.entities == 0 then nil elseif p1.isScrollEnabled then reactModule.createElement(view, { tag = "size-full-0 fill", LayoutOrder = p1.layoutOrder }, {
		List = reactModule.createElement(flatList, {
			windowSize = 3,
			initialNumToRender = 10,
			onEndReachedThreshold = 2,
			data = var12,
			renderItem = reactModule.useCallback(function(p2) --[[ line: 90 ]]
				-- upvalues: var13 (ref)
				return var13(p2.item, p2.index)
			end, { var13 }),
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
		EntityRows = reactModule.createElement(reactModule.Fragment, {}, unpack(reactModule.useMemo(function() --[[ line: 127 ]]
			-- upvalues: var12 (ref), reactModule (copy), view (copy), var13 (ref)
			local t = {}
			
			for i, v in ipairs(var12) do
				t[i] = reactModule.createElement(view, { tag = "size-full-0 auto-y", key = v, LayoutOrder = i }, { Content = var13(v, i) })
			end
			return t
		end, { var12, var13 })))
	})
end