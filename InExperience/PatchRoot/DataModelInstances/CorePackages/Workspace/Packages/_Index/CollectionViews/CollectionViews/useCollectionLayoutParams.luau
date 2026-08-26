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

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: useStore (ref), luaAppUseDisplayStoreForCollectionLayoutParams (ref), displayModule (ref), collectionLayoutCalculatorsModule (ref), fFlagLuaAppLayoutParamsInContext (ref), useTokens (ref), useDesignTokens (ref), usePreferredInput (ref), reactModule (ref), calculateItemWidthModule (ref)
	local var1 = useStore()
	local var2 = if luaAppUseDisplayStoreForCollectionLayoutParams then displayModule.GetDisplayStore(false).getViewportSize(false) or Vector2.new(0, 0) else var1:getState().ScreenSize or Vector2.new(0, 0)
	p5 = p5 or collectionLayoutCalculatorsModule
	local var3 = if p4 then p4.sideMargin else nil
	local var4 = if p4 then p4.columnGap else nil
	local var5 = if p4 then p4.numColumns else nil
	local var6 = if p4 then p4.fractionalItemAmount else nil
	local var7 = if p4 then p4.loadMoreThreshold else nil
	local var8 = if p4 then p4.verticalPadding else nil
	local var9 = if fFlagLuaAppLayoutParamsInContext then useTokens() else useDesignTokens()
	local var10 = usePreferredInput()
	local var11 = var8 or p5.calculateVerticalPadding(var9, p1)
	local var12 = p5.calculateMaxTilesToShow(var10)
	local var13 = reactModule.useRef(nil)
	
	if var13.current == nil then
		var13.current = p6 or var2
	end
	local x = var13.current.X
	local var14, var15 = reactModule.useState(function()
		-- upvalues: var3 (ref), p5 (ref), x (ref), var9 (ref), var2 (ref)
		return var3 or p5.calculateSideMargin(x, var9, var2.X)
	end)
	local var16, var17 = reactModule.useState(function()
		-- upvalues: var4 (ref), p5 (ref), x (ref), var9 (ref), var2 (ref)
		return var4 or p5.calculateColumnGap(x, var9, var2.X)
	end)
	local var18, var19 = reactModule.useState(function()
		-- upvalues: var6 (ref), p5 (ref), p1 (ref), var10 (ref)
		return var6 or p5.calculateFractionalItemAmount(p1, var10)
	end)
	local var20, var21 = reactModule.useState(function()
		-- upvalues: var5 (ref), p5 (ref), x (ref), var14 (ref), var16 (ref), p1 (ref), var9 (ref)
		return var5 or p5.calculateNumColumns(x, var14, var16, p1, var9)
	end)
	local var22, var23 = reactModule.useState(function()
		-- upvalues: var7 (ref), p5 (ref), x (ref)
		return var7 or p5.calculateLoadMoreThreshold(x)
	end)
	local var24, var25 = reactModule.useState(function()
		-- upvalues: p3 (ref), calculateItemWidthModule (copy), var20 (ref), var16 (ref), var14 (ref), x (ref), var18 (ref)
		return if p3 then calculateItemWidthModule(var20, var16, var14, x, var18) else 1
	end)
	local var26 = reactModule.useCallback(function(p7)
		-- upvalues: luaAppUseDisplayStoreForCollectionLayoutParams (copy), displayModule (copy), var1 (ref), var3 (ref), p5 (ref), var9 (ref), var15 (ref), var4 (ref), var17 (ref), var5 (ref), p1 (ref), var21 (ref), var6 (ref), var10 (ref), var19 (ref), var7 (ref), var23 (ref), var13 (ref), p3 (ref), calculateItemWidthModule (copy), var25 (ref)
		local x = p7.X
		local var27 = if luaAppUseDisplayStoreForCollectionLayoutParams then displayModule.GetDisplayStore(false).getViewportSize(false) and displayModule.GetDisplayStore(false).getViewportSize(false).X or 0 else var1:getState().ScreenSize and var1:getState().ScreenSize.X or 0
		local var28 = var3 or p5.calculateSideMargin(x, var9, var27)
		var15(var28)
		local var29 = var4 or p5.calculateColumnGap(x, var9, var27)
		var17(var29)
		local var30 = var5 or p5.calculateNumColumns(x, var28, var29, p1, var9)
		var21(var30)
		local var31 = var6 or p5.calculateFractionalItemAmount(p1, var10)
		var19(var31)
		var23(var7 or p5.calculateLoadMoreThreshold(x))
		var13.current = p7
		
		if p3 then
			var25(calculateItemWidthModule(var30, var29, var28, x, var31))
		end
	end, {
		p1, p3, var4, var3, var5, var6, var7, var9, var1
	})
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), var26 (ref)
		local var27 = nil
		
		if p2 then
			var26(p2.AbsoluteSize)
			var27 = p2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var26 (copy), p2 (copy)
				var26(p2.AbsoluteSize)
			end)
		end
		return function()
			-- upvalues: var27 (write)
			if var27 then
				var27:Disconnect()
			end
		end
	end, { var26, p2 })
	
	return {
		numColumns = var20,
		fractionalItemAmount = var18,
		columnGap = var16,
		sideMargin = var14,
		verticalPadding = var11,
		maxTilesToShow = var12,
		itemWidth = var24,
		loadMoreThreshold = var22
	}
end