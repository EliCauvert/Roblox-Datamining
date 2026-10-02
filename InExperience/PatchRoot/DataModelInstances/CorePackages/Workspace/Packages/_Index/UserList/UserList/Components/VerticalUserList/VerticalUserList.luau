local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local view = require(parent.Foundation).View
local flatList = require(parent.VirtualizedList).FlatList
local _ = require(userList.Common.Types)
local enumsModule = require(userList.Common.Enums)
local useEntitiesModule = require(userList.Hooks.useEntities)
local useEntitySelectionHandlerModule = require(userList.Hooks.useEntitySelectionHandler)
local useRenderEntityModule = require(userList.Hooks.useRenderEntity)
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local fFlagUserListComposeRenderRowWithCta = require(parent.SharedFlags).FFlagUserListComposeRenderRowWithCta
local fFlagUserListSurfaceExtensions = require(parent.SharedFlags).FFlagUserListSurfaceExtensions
local var1 = if fFlagUserListCtaIntegrationEnabled then require(userList.Cta) else nil
local t = {
	BackgroundTransparency = 1,
	ScrollBarThickness = 0,
	BorderSizePixel = 0
}
local var2 = cryoModule.Dictionary.join(t, { Selectable = false })
local t_1 = { BackgroundTransparency = 1 }

local function keyExtractor(p1, _)
	return p1
end

local function VerticalUserList(p1)
	-- upvalues: useEntitiesModule (ref), useEntitySelectionHandlerModule (ref), reactModule (ref), useRenderEntityModule (ref), enumsModule (ref), fFlagUserListSurfaceExtensions (ref), view (ref), flatList (ref), keyExtractor (ref), var2 (ref), t (ref), t_1 (ref)
	local var3 = useEntitiesModule(p1.entities)
	local var4 = useEntitySelectionHandlerModule(p1.onRowSelected)
	local var5 = reactModule.useMemo(function()
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
	local var6 = reactModule.useMemo(function()
		-- upvalues: var5 (ref)
		local t = {}
		
		for i, v in var5 do
			table.insert(t, v.id)
		end
		return t
	end, { var5 })
	local var7 = useRenderEntityModule({
		entitiesMap = var3.entitiesMap,
		onActivated = var4,
		renderRow = p1.renderRow,
		configs = p1.configs,
		layoutMode = enumsModule.LayoutMode.Vertical,
		firstRowRef = if fFlagUserListSurfaceExtensions then p1.firstRowRef else nil
	})
	
	return if #p1.entities == 0 then nil elseif p1.isScrollEnabled then reactModule.createElement(view, { tag = "size-full-0 fill", LayoutOrder = p1.layoutOrder }, {
		List = reactModule.createElement(flatList, {
			windowSize = 3,
			initialNumToRender = 10,
			onEndReachedThreshold = 2,
			data = var6,
			renderItem = reactModule.useCallback(function(p2)
				-- upvalues: var7 (ref)
				return var7(p2.item, p2.index)
			end, { var7 }),
			keyExtractor = keyExtractor,
			onEndReached = if fFlagUserListSurfaceExtensions then p1.onEndReached else nil,
			style = if fFlagUserListSurfaceExtensions and p1.configs and p1.configs.disableRowActivation then var2 else t,
			contentContainerStyle = t_1,
			ListHeaderComponent = p1.ListHeaderComponent,
			ListFooterComponent = p1.ListFooterComponent
		})
	}) else reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-xxsmall",
		LayoutOrder = p1.layoutOrder
	}, {
		EntityRows = reactModule.createElement(reactModule.Fragment, {}, unpack(reactModule.useMemo(function()
			-- upvalues: var6 (ref), reactModule (copy), view (copy), var7 (ref)
			local t = {}
			
			for i, v in ipairs(var6) do
				t[i] = reactModule.createElement(view, { tag = "size-full-0 auto-y", key = v, LayoutOrder = i }, { Content = var7(v, i) })
			end
			return t
		end, { var6, var7 })))
	})
end

return if fFlagUserListCtaIntegrationEnabled then function(p2)
	-- upvalues: var1 (ref), fFlagUserListComposeRenderRowWithCta (ref), reactModule (ref), VerticalUserList (ref)
	local var8 = var1 ~= nil and (p2.ctaConfig ~= nil and p2.renderRow == nil)
	
	if fFlagUserListComposeRenderRowWithCta then
		var8 = var1 ~= nil and p2.ctaConfig ~= nil
	end
	return if var8 then reactModule.createElement(var1.CtaRenderRowBridge, {
		ctaConfig = p2.ctaConfig,
		renderRow = if fFlagUserListComposeRenderRowWithCta then p2.renderRow else nil,
		render = function(p3)
			-- upvalues: p2 (ref), reactModule (copy), VerticalUserList (copy)
			local cloned = table.clone(p2)
			cloned.renderRow = p3
			
			return reactModule.createElement(VerticalUserList, cloned)
		end
	}) else reactModule.createElement(VerticalUserList, p2)
end else VerticalUserList