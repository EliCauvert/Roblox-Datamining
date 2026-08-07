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
local var6 = if fFlagUserListCtaIntegrationEnabled then require(userList.Cta) else nil
local t = {
	BackgroundTransparency = 1,
	ScrollBarThickness = 0,
	BorderSizePixel = 0
}
local t_1 = { BackgroundTransparency = 1 }

local function keyExtractor(p0, _) --[[ line: 58 ]]
	return p0
end

local function VerticalUserList(p1) --[[ line: 62 ]]
	-- upvalues: useEntitiesModule (ref), useEntitySelectionHandlerModule (ref), reactModule (ref), useRenderEntityModule (ref), enumsModule (ref), view (ref), flatList (ref), keyExtractor (ref), t (ref), t_1 (ref)
	local var11 = useEntitiesModule(p1.entities)
	local var12 = useEntitySelectionHandlerModule(p1.onRowSelected)
	local var13 = reactModule.useMemo(function() --[[ line: 67 ]]
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
	local var14 = reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: var13 (ref)
		local t = {}
		
		for i, v in var13 do
			table.insert(t, v.id)
		end
		return t
	end, { var13 })
	local var15 = useRenderEntityModule({
		entitiesMap = var11.entitiesMap,
		onActivated = var12,
		renderRow = p1.renderRow,
		configs = p1.configs,
		layoutMode = enumsModule.LayoutMode.Vertical
	})
	
	return if #p1.entities == 0 then nil elseif p1.isScrollEnabled then reactModule.createElement(view, { tag = "size-full-0 fill", LayoutOrder = p1.layoutOrder }, {
		List = reactModule.createElement(flatList, {
			windowSize = 3,
			initialNumToRender = 10,
			onEndReachedThreshold = 2,
			data = var14,
			renderItem = reactModule.useCallback(function(p2) --[[ line: 96 ]]
				-- upvalues: var15 (ref)
				return var15(p2.item, p2.index)
			end, { var15 }),
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
		EntityRows = reactModule.createElement(reactModule.Fragment, {}, unpack(reactModule.useMemo(function() --[[ line: 133 ]]
			-- upvalues: var14 (ref), reactModule (copy), view (copy), var15 (ref)
			local t = {}
			
			for i, v in ipairs(var14) do
				t[i] = reactModule.createElement(view, { tag = "size-full-0 auto-y", key = v, LayoutOrder = i }, { Content = var15(v, i) })
			end
			return t
		end, { var14, var15 })))
	})
end

return if fFlagUserListCtaIntegrationEnabled then function(p3) --[[ line: 151 | named "VerticalUserListWithCta" ]]
	-- upvalues: var6 (ref), reactModule (ref), VerticalUserList (ref)
	return if var6 ~= nil and (p3.ctaConfig ~= nil and p3.renderRow == nil) then reactModule.createElement(var6.CtaRenderRowBridge, {
		ctaConfig = p3.ctaConfig,
		render = function(p4) --[[ line: 157 ]]
			-- upvalues: p3 (ref), reactModule (copy), VerticalUserList (copy)
			local cloned = table.clone(p3)
			cloned.renderRow = p4
			
			return reactModule.createElement(VerticalUserList, cloned)
		end
	}) else reactModule.createElement(VerticalUserList, p3)
end else VerticalUserList