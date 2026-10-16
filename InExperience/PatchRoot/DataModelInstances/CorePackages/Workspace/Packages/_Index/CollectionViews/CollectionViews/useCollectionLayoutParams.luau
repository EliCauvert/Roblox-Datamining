local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UsePreferredInputFunction = require(Parent.Responsive).usePreferredInput
local DisplayModule = require(Parent.Display)
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local CollectionLayoutCalculatorsModule = require(CollectionViews.CollectionLayoutCalculators)
local CalculateItemWidthModule = require(CollectionViews.calculateItemWidth)
local _ = require(CollectionViews.CollectionViewTypes)
local FFlagLuaAppLayoutParamsInContext = require(Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local LuaAppUseDisplayStoreForCollectionLayoutParams = game:DefineFastFlag("LuaAppUseDisplayStoreForCollectionLayoutParams", false)

return function(p1, Frame: Frame, p2, p3, p4, p5) --[[ Line: 35 | Named "useCollectionLayoutParams" ]]
	-- upvalues: UseStoreFunction (copy), LuaAppUseDisplayStoreForCollectionLayoutParams (copy), DisplayModule (copy), CollectionLayoutCalculatorsModule (copy), FFlagLuaAppLayoutParamsInContext (copy), UseTokensFunction (copy), UseDesignTokensFunction (copy), UsePreferredInputFunction (copy), ReactModule (copy), CalculateItemWidthModule (copy)
	local UseStoreResult = UseStoreFunction()
	local ViewportSize = (if LuaAppUseDisplayStoreForCollectionLayoutParams then DisplayModule.GetDisplayStore(false).getViewportSize(false) else UseStoreResult:getState().ScreenSize) or Vector2.new(0, 0)
	local P4 = p4 or CollectionLayoutCalculatorsModule
	local SideMargin = p3 and p3.sideMargin or nil
	local ColumnGap = p3 and p3.columnGap or nil
	local NumColumns = p3 and p3.numColumns or nil
	local FractionalItemAmount = p3 and p3.fractionalItemAmount or nil
	local LoadMoreThreshold = p3 and p3.loadMoreThreshold or nil
	local VerticalPadding = p3 and p3.verticalPadding or nil
	local UseTokensResult = if FFlagLuaAppLayoutParamsInContext then UseTokensFunction() else UseDesignTokensFunction()
	local UsePreferredInputResult = UsePreferredInputFunction()
	local VerticalPadding1 = VerticalPadding or P4.calculateVerticalPadding(UseTokensResult, p1)
	local MaxTilesToShow = P4.calculateMaxTilesToShow(UsePreferredInputResult)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = p5 or ViewportSize
	end
	local X = UseRefResult.current.X
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 80 ]]
		-- upvalues: SideMargin (copy), P4 (copy), X (copy), UseTokensResult (copy), ViewportSize (copy)
		return SideMargin or P4.calculateSideMargin(X, UseTokensResult, ViewportSize.X)
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function() --[[ Line: 83 ]]
		-- upvalues: ColumnGap (copy), P4 (copy), X (copy), UseTokensResult (copy), ViewportSize (copy)
		return ColumnGap or P4.calculateColumnGap(X, UseTokensResult, ViewportSize.X)
	end)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(function() --[[ Line: 86 ]]
		-- upvalues: FractionalItemAmount (copy), P4 (copy), p1 (copy), UsePreferredInputResult (copy)
		return FractionalItemAmount or P4.calculateFractionalItemAmount(p1, UsePreferredInputResult)
	end)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(function() --[[ Line: 90 ]]
		-- upvalues: NumColumns (copy), P4 (copy), X (copy), UseStateResult (copy), UseStateResult1 (copy), p1 (copy), UseTokensResult (copy)
		return NumColumns or P4.calculateNumColumns(X, UseStateResult, UseStateResult1, p1, UseTokensResult)
	end)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(function() --[[ Line: 94 ]]
		-- upvalues: LoadMoreThreshold (copy), P4 (copy), X (copy)
		return LoadMoreThreshold or P4.calculateLoadMoreThreshold(X)
	end)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(function() --[[ Line: 99 ]]
		-- upvalues: p2 (copy), CalculateItemWidthModule (upval), UseStateResult4 (copy), UseStateResult1 (copy), UseStateResult (copy), X (copy), UseStateResult3 (copy)
		return if p2 then CalculateItemWidthModule(UseStateResult4, UseStateResult1, UseStateResult, X, UseStateResult3) else 1
	end)
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 108 ]]
		-- upvalues: LuaAppUseDisplayStoreForCollectionLayoutParams (upval), DisplayModule (upval), UseStoreResult (copy), SideMargin (copy), P4 (copy), UseTokensResult (copy), UseStateResult2 (copy), ColumnGap (copy), UseStateResult2_1 (copy), NumColumns (copy), p1 (copy), UseStateResult2_3 (copy), FractionalItemAmount (copy), UsePreferredInputResult (copy), UseStateResult2_2 (copy), LoadMoreThreshold (copy), UseStateResult2_4 (copy), UseRefResult (copy), p2 (copy), CalculateItemWidthModule (upval), UseStateResult2_5 (copy)
		local X = Current.X
		local X1 = (if LuaAppUseDisplayStoreForCollectionLayoutParams then DisplayModule.GetDisplayStore(false).getViewportSize(false) and DisplayModule.GetDisplayStore(false).getViewportSize(false).X else UseStoreResult:getState().ScreenSize and UseStoreResult:getState().ScreenSize.X) or 0
		local SideMargin1 = SideMargin or P4.calculateSideMargin(X, UseTokensResult, X1)
		UseStateResult2(SideMargin1)
		local ColumnGap1 = ColumnGap or P4.calculateColumnGap(X, UseTokensResult, X1)
		UseStateResult2_1(ColumnGap1)
		local NumColumns1 = NumColumns or P4.calculateNumColumns(X, SideMargin1, ColumnGap1, p1, UseTokensResult)
		UseStateResult2_3(NumColumns1)
		local FractionalItemAmount1 = FractionalItemAmount or P4.calculateFractionalItemAmount(p1, UsePreferredInputResult)
		UseStateResult2_2(FractionalItemAmount1)
		UseStateResult2_4(LoadMoreThreshold or P4.calculateLoadMoreThreshold(X))
		UseRefResult.current = Current
		
		if p2 then
			UseStateResult2_5((CalculateItemWidthModule(NumColumns1, ColumnGap1, SideMargin1, X, FractionalItemAmount1)))
		end
	end, {
		p1, p2, ColumnGap, SideMargin, NumColumns, FractionalItemAmount,
		LoadMoreThreshold, UseTokensResult, UseStoreResult
	})
	ReactModule.useEffect(function() --[[ Line: 168 ]]
		-- upvalues: Frame (copy), UseResult (copy)
		local Connection = nil
		
		if Frame then
			UseResult(Frame.AbsoluteSize)
			Connection = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 172 ]]
				-- upvalues: UseResult (upval), Frame (upval)
				UseResult(Frame.AbsoluteSize)
			end)
		end
		return function() --[[ Line: 176 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseResult, Frame })
	
	return {
		numColumns = UseStateResult4,
		fractionalItemAmount = UseStateResult3,
		columnGap = UseStateResult1,
		sideMargin = UseStateResult,
		verticalPadding = VerticalPadding1,
		maxTilesToShow = MaxTilesToShow,
		itemWidth = UseStateResult6,
		loadMoreThreshold = UseStateResult5
	}
end