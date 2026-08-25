local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useTokens = require(parent.Foundation).Hooks.useTokens
local usePreferredInput = require(parent.Responsive).usePreferredInput
local displayModule = require(parent.Display)
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local collectionLayoutCalculatorsModule = require(collectionViews.CollectionLayoutCalculators)
local calculateItemWidthModule = require(collectionViews.calculateItemWidth)
local _ = require(collectionViews.CollectionViewTypes)
local fFlagLuaAppLayoutParamsInContext = require(parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local luaAppUseDisplayStoreForCollectionLayoutParams = game:DefineFastFlag("LuaAppUseDisplayStoreForCollectionLayoutParams", false)

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: useStore (ref), luaAppUseDisplayStoreForCollectionLayoutParams (ref), displayModule (ref), collectionLayoutCalculatorsModule (ref), fFlagLuaAppLayoutParamsInContext (ref), useTokens (ref), useDesignTokens (ref), usePreferredInput (ref), reactModule (ref), calculateItemWidthModule (ref)
	local var6 = useStore()
	local var7 = if luaAppUseDisplayStoreForCollectionLayoutParams then displayModule.GetDisplayStore(false).getViewportSize(false) or Vector2.new(0, 0) else var6:getState().ScreenSize or Vector2.new(0, 0)
	p4 = p4 or collectionLayoutCalculatorsModule
	local var9 = if p3 then p3.sideMargin else nil
	local var10 = if p3 then p3.columnGap else nil
	local var11 = if p3 then p3.numColumns else nil
	local var12 = if p3 then p3.fractionalItemAmount else nil
	local var13 = if p3 then p3.loadMoreThreshold else nil
	local var14 = if p3 then p3.verticalPadding else nil
	local var15 = if fFlagLuaAppLayoutParamsInContext then useTokens() else useDesignTokens()
	local var16 = usePreferredInput()
	local var14_1 = var14 or p4.calculateVerticalPadding(var15, p0)
	local var18 = p4.calculateMaxTilesToShow(var16)
	local var19 = reactModule.useRef(nil)
	
	if var19.current == nil then
		var19.current = p5 or var7
	end
	local x = var19.current.X
	local var20, var21 = reactModule.useState(function()
		-- upvalues: var9 (ref), p4 (ref), x (ref), var15 (ref), var7 (ref)
		return var9 or p4.calculateSideMargin(x, var15, var7.X)
	end)
	local var22, var23 = reactModule.useState(function()
		-- upvalues: var10 (ref), p4 (ref), x (ref), var15 (ref), var7 (ref)
		return var10 or p4.calculateColumnGap(x, var15, var7.X)
	end)
	local var24, var25 = reactModule.useState(function()
		-- upvalues: var12 (ref), p4 (ref), p0 (ref), var16 (ref)
		return var12 or p4.calculateFractionalItemAmount(p0, var16)
	end)
	local var26, var27 = reactModule.useState(function()
		-- upvalues: var11 (ref), p4 (ref), x (ref), var20 (ref), var22 (ref), p0 (ref), var15 (ref)
		return var11 or p4.calculateNumColumns(x, var20, var22, p0, var15)
	end)
	local var28, var29 = reactModule.useState(function()
		-- upvalues: var13 (ref), p4 (ref), x (ref)
		return var13 or p4.calculateLoadMoreThreshold(x)
	end)
	local var30, var31 = reactModule.useState(function()
		-- upvalues: p2 (ref), calculateItemWidthModule (copy), var26 (ref), var22 (ref), var20 (ref), x (ref), var24 (ref)
		return if p2 then calculateItemWidthModule(var26, var22, var20, x, var24) else 1
	end)
	local var32 = reactModule.useCallback(function(p6)
		-- upvalues: luaAppUseDisplayStoreForCollectionLayoutParams (copy), displayModule (copy), var6 (ref), var9 (ref), p4 (ref), var15 (ref), var21 (ref), var10 (ref), var23 (ref), var11 (ref), p0 (ref), var27 (ref), var12 (ref), var16 (ref), var25 (ref), var13 (ref), var29 (ref), var19 (ref), p2 (ref), calculateItemWidthModule (copy), var31 (ref)
		local x = p6.X
		local var33 = if luaAppUseDisplayStoreForCollectionLayoutParams then displayModule.GetDisplayStore(false).getViewportSize(false) and displayModule.GetDisplayStore(false).getViewportSize(false).X or 0 else var6:getState().ScreenSize and var6:getState().ScreenSize.X or 0
		local var9_1 = var9 or p4.calculateSideMargin(x, var15, var33)
		var21(var9_1)
		local var10_1 = var10 or p4.calculateColumnGap(x, var15, var33)
		var23(var10_1)
		local var11_1 = var11 or p4.calculateNumColumns(x, var9_1, var10_1, p0, var15)
		var27(var11_1)
		local var12_1 = var12 or p4.calculateFractionalItemAmount(p0, var16)
		var25(var12_1)
		var29(var13 or p4.calculateLoadMoreThreshold(x))
		var19.current = p6
		
		if p2 then
			var31(calculateItemWidthModule(var11_1, var10_1, var9_1, x, var12_1))
		end
	end, {
		p0, p2, var10, var9, var11, var12, var13, var15, var6
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var32 (ref)
		local var38 = nil
		
		if p1 then
			var32(p1.AbsoluteSize)
			var38 = p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var32 (copy), p1 (copy)
				var32(p1.AbsoluteSize)
			end)
		end
		return function()
			-- upvalues: var38 (write)
			if var38 then
				var38:Disconnect()
			end
		end
	end, { var32, p1 })
	
	return {
		numColumns = var26,
		fractionalItemAmount = var24,
		columnGap = var22,
		sideMargin = var20,
		verticalPadding = var14_1,
		maxTilesToShow = var18,
		itemWidth = var30,
		loadMoreThreshold = var28
	}
end