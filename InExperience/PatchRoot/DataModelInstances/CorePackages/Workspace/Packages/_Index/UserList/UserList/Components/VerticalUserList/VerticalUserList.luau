local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local FlatList = require(Parent.VirtualizedList).FlatList
local _ = require(UserList.Common.Types)
local EnumsModule = require(UserList.Common.Enums)
local UseEntitiesModule = require(UserList.Hooks.useEntities)
local UseEntitySelectionHandlerModule = require(UserList.Hooks.useEntitySelectionHandler)
local UseRenderEntityModule = require(UserList.Hooks.useRenderEntity)
local FFlagUserListCtaIntegrationEnabled = require(Parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local FFlagUserListComposeRenderRowWithCta = require(Parent.SharedFlags).FFlagUserListComposeRenderRowWithCta
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions
local CtaModule = if FFlagUserListCtaIntegrationEnabled then require(UserList.Cta) else nil
local config = {
	BackgroundTransparency = 1,
	ScrollBarThickness = 0,
	BorderSizePixel = 0
}
local JoinResult = require(Parent.Cryo).Dictionary.join(config, { Selectable = false })
local ContentContainerStyle = { BackgroundTransparency = 1 }

local function keyExtractor(p1, _) --[[ Line: 66 ]]
	return p1
end

local function VerticalUserList(p1) --[[ Line: 70 ]]
	-- upvalues: UseEntitiesModule (copy), UseEntitySelectionHandlerModule (copy), ReactModule (copy), UseRenderEntityModule (copy), EnumsModule (copy), FFlagUserListSurfaceExtensions (copy), View (copy), FlatList (copy), keyExtractor (copy), JoinResult (copy), config (copy), ContentContainerStyle (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 75 ]]
		-- upvalues: p1 (copy)
		if not p1.initialRowCount or p1.initialRowCount >= #p1.entities then
			return p1.entities
		end
		local Entities = {}
		
		for i = 1, p1.initialRowCount do
			table.insert(Entities, p1.entities[i])
		end
		return Entities
	end, { p1.entities, p1.initialRowCount })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 87 ]]
		-- upvalues: UseMemoResult (copy)
		local Ids = {}
		
		for _, value in UseMemoResult do
			table.insert(Ids, value.id)
		end
		return Ids
	end, { UseMemoResult })
	local UseRenderEntityModuleResult = UseRenderEntityModule({
		entitiesMap = UseEntitiesModule(p1.entities).entitiesMap,
		onActivated = UseEntitySelectionHandlerModule(p1.onRowSelected),
		renderRow = p1.renderRow,
		configs = p1.configs,
		layoutMode = EnumsModule.LayoutMode.Vertical,
		firstRowRef = if FFlagUserListSurfaceExtensions then p1.firstRowRef else nil
	})
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 105 ]]
		-- upvalues: UseRenderEntityModuleResult (copy)
		return UseRenderEntityModuleResult(p2.item, p2.index)
	end, { UseRenderEntityModuleResult })
	
	return if #p1.entities == 0 then nil elseif p1.isScrollEnabled then ReactModule.createElement(View, { tag = "size-full-0 fill", LayoutOrder = p1.layoutOrder }, {
		List = ReactModule.createElement(FlatList, {
			windowSize = 3,
			initialNumToRender = 10,
			onEndReachedThreshold = 2,
			data = UseMemoResult1,
			renderItem = UseResult,
			keyExtractor = keyExtractor,
			onEndReached = if FFlagUserListSurfaceExtensions then p1.onEndReached else nil,
			style = if FFlagUserListSurfaceExtensions and p1.configs and p1.configs.disableRowActivation then JoinResult else config,
			contentContainerStyle = ContentContainerStyle,
			ListHeaderComponent = p1.ListHeaderComponent,
			ListFooterComponent = p1.ListFooterComponent
		})
	}) else ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-xxsmall",
		LayoutOrder = p1.layoutOrder
	}, {
		EntityRows = ReactModule.createElement(ReactModule.Fragment, {}, unpack(ReactModule.useMemo(function() --[[ Line: 147 ]]
			-- upvalues: UseMemoResult1 (copy), ReactModule (upval), View (upval), UseRenderEntityModuleResult (copy)
			local Elements = {}
			
			for LayoutOrder, Key in ipairs(UseMemoResult1) do
				Elements[LayoutOrder] = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y",
					key = Key,
					LayoutOrder = LayoutOrder
				}, { Content = UseRenderEntityModuleResult(Key, LayoutOrder) })
			end
			return Elements
		end, { UseMemoResult1, UseRenderEntityModuleResult })))
	})
end

local function VerticalUserListWithCta(Tbl) --[[ Line: 165 ]]
	-- upvalues: CtaModule (copy), FFlagUserListComposeRenderRowWithCta (copy), ReactModule (copy), VerticalUserList (copy)
	local HasCtaConfig: boolean = if FFlagUserListComposeRenderRowWithCta then CtaModule ~= nil and Tbl.ctaConfig ~= nil else CtaModule ~= nil and (Tbl.ctaConfig ~= nil and Tbl.renderRow == nil)
	
	return if HasCtaConfig then ReactModule.createElement(CtaModule.CtaRenderRowBridge, {
		ctaConfig = Tbl.ctaConfig,
		renderRow = if FFlagUserListComposeRenderRowWithCta then Tbl.renderRow else nil,
		render = function(RenderRow) --[[ Line: 175 ]]
			-- upvalues: Tbl (copy), ReactModule (upval), VerticalUserList (upval)
			local Copy = table.clone(Tbl)
			Copy.renderRow = RenderRow
			
			return ReactModule.createElement(VerticalUserList, Copy)
		end
	}) else ReactModule.createElement(VerticalUserList, Tbl)
end

return if FFlagUserListCtaIntegrationEnabled then VerticalUserListWithCta else VerticalUserList