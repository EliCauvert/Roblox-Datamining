local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.SduiCompat)
local CollectionViewsModule = require(Parent.CollectionViews)
local UseCollectionLayoutFunction = CollectionViewsModule.useCollectionLayout
local CalculateItemWidthFunction = CollectionViewsModule.calculateItemWidth
local SduiPlaceholder = require(Parent.SduiSharedContent).SduiPlaceholder
local UsePreferredTextSizeLineBudgetFunction = require(Parent.SduiSharedUtilities).usePreferredTextSizeLineBudget
local SharedFlagsModule = require(Parent.SharedFlags)
local FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx = SharedFlagsModule.FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx
local FFlagSduiCollectionCarouselPlaceholderItem = SharedFlagsModule.FFlagSduiCollectionCarouselPlaceholderItem
local FFlagSduiPreferredTextSizeLineBudgets = SharedFlagsModule.FFlagSduiPreferredTextSizeLineBudgets
local LuaAppSduiCarouselPlaceholderHeaderMinWidthPct = game:DefineFastInt("LuaAppSduiCarouselPlaceholderHeaderMinWidthPct", 30)
local LuaAppSduiCarouselPlaceholderHeaderMaxWidthPct = game:DefineFastInt("LuaAppSduiCarouselPlaceholderHeaderMaxWidthPct", 60)
local _UDim = UDim.new(1, 72)

local function SduiCollectionCarouselItemPlaceholderRow(p1) --[[ Line: 53 ]]
	-- upvalues: ReactModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 54 ]]
		-- upvalues: p1 (copy)
		return p1.itemSizeBinding:map(function(Vector): UDim2 --[[ Line: 55 ]]
			return UDim2.new(0, Vector.X, 0, Vector.Y)
		end)
	end, { p1.itemSizeBinding })
	local config = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p1.gutter)
		})
	}
	local NewItemsPerRow = if p1.carouselPeek > 0 then p1.itemsPerRow + 1 else p1.itemsPerRow
	for i = 1, NewItemsPerRow do
		config[`Item{i}`] = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = i,
			Size = UseMemoResult
		}, {
			ItemPlaceholder = ReactModule.cloneElement(p1.itemPlaceholderComponent, { transparencyBinding = p1.transparencyBinding })
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p1.layoutOrder,
		Size = p1.rowSizeBinding
	}, config)
end

return ReactModule.memo(function(p2) --[[ Line: 119 | Named "SduiCollectionCarouselPlaceholder" ]]
	-- upvalues: UseTokensFunction (copy), FFlagSduiPreferredTextSizeLineBudgets (copy), UsePreferredTextSizeLineBudgetFunction (copy), UseCollectionLayoutFunction (copy), SignalsReactModule (copy), _UDim (copy), FFlagSduiCollectionCarouselPlaceholderItem (copy), ReactModule (copy), CalculateItemWidthFunction (copy), LuaAppSduiCarouselPlaceholderHeaderMinWidthPct (copy), LuaAppSduiCarouselPlaceholderHeaderMaxWidthPct (copy), SduiPlaceholder (copy), FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx (copy), SduiCollectionCarouselItemPlaceholderRow (copy)
	local UseTokensResult = UseTokensFunction()
	local Scale = UseTokensResult.Config.UI.Scale
	local UsePreferredTextSizeLineBudgetResult = if FFlagSduiPreferredTextSizeLineBudgets then UsePreferredTextSizeLineBudgetFunction(p2.preferredTextSizeLineCount) else nil
	local UseCollectionLayoutResult = UseCollectionLayoutFunction(p2.collectionItemSize)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(UseCollectionLayoutResult.getContainerWidth)
	local ItemHeightFromWidth = p2.itemHeightFromWidth or _UDim
	local UseMemoResult = nil
	local UseMemoResult1 = nil
	
	if FFlagSduiCollectionCarouselPlaceholderItem then
		UseMemoResult = ReactModule.useMemo(function() --[[ Line: 137 ]]
			-- upvalues: UseSignalBindingResult (copy), CalculateItemWidthFunction (upval), UseCollectionLayoutResult (copy), ItemHeightFromWidth (copy), Scale (copy), UsePreferredTextSizeLineBudgetResult (ref)
			return UseSignalBindingResult:map(function(p3): Vector2 --[[ Line: 138 ]]
				-- upvalues: CalculateItemWidthFunction (upval), UseCollectionLayoutResult (upval), ItemHeightFromWidth (upval), Scale (upval), UsePreferredTextSizeLineBudgetResult (upval)
				local ItemWidth = CalculateItemWidthFunction(UseCollectionLayoutResult.itemsPerRow, UseCollectionLayoutResult.gutter, UseCollectionLayoutResult.margin, p3, 0, UseCollectionLayoutResult.carouselPeek)
				
				return Vector2.new(ItemWidth, (math.max(ItemWidth * ItemHeightFromWidth.Scale + ItemHeightFromWidth.Offset * Scale + (UsePreferredTextSizeLineBudgetResult or 0), 0)))
			end)
		end, {
			UseSignalBindingResult, UseCollectionLayoutResult.itemsPerRow,
			UseCollectionLayoutResult.gutter, UseCollectionLayoutResult.margin,
			UseCollectionLayoutResult.carouselPeek, ItemHeightFromWidth, Scale,
			if FFlagSduiPreferredTextSizeLineBudgets then UsePreferredTextSizeLineBudgetResult else nil
		})
		UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 166 ]]
			-- upvalues: UseMemoResult (ref)
			return UseMemoResult:map(function(p3): UDim2 --[[ Line: 167 ]]
				return UDim2.new(1, 0, 0, p3.Y)
			end)
		end, { UseMemoResult })
	else
		UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 173 ]]
			-- upvalues: UseSignalBindingResult (copy), CalculateItemWidthFunction (upval), UseCollectionLayoutResult (copy), ItemHeightFromWidth (copy), Scale (copy), UsePreferredTextSizeLineBudgetResult (ref)
			return UseSignalBindingResult:map(function(p3): UDim2 --[[ Line: 174 ]]
				-- upvalues: CalculateItemWidthFunction (upval), UseCollectionLayoutResult (upval), ItemHeightFromWidth (upval), Scale (upval), UsePreferredTextSizeLineBudgetResult (upval)
				return UDim2.new(1, 0, 0, (math.max(CalculateItemWidthFunction(UseCollectionLayoutResult.itemsPerRow, UseCollectionLayoutResult.gutter, UseCollectionLayoutResult.margin, p3, 0, UseCollectionLayoutResult.carouselPeek) * ItemHeightFromWidth.Scale + ItemHeightFromWidth.Offset * Scale + (UsePreferredTextSizeLineBudgetResult or 0), 0)))
			end)
		end, {
			UseSignalBindingResult, UseCollectionLayoutResult.itemsPerRow,
			UseCollectionLayoutResult.gutter, UseCollectionLayoutResult.margin,
			UseCollectionLayoutResult.carouselPeek, ItemHeightFromWidth, Scale,
			if FFlagSduiPreferredTextSizeLineBudgets then UsePreferredTextSizeLineBudgetResult else nil
		})
	end
	local UseMemoResult2 = ReactModule.useMemo(function(): number --[[ Line: 208 ]]
		-- upvalues: LuaAppSduiCarouselPlaceholderHeaderMinWidthPct (upval), LuaAppSduiCarouselPlaceholderHeaderMaxWidthPct (upval)
		local LuaAppSduiCarouselPlaceholderHeaderMinWidthPctRatio = LuaAppSduiCarouselPlaceholderHeaderMinWidthPct / 100
		
		return LuaAppSduiCarouselPlaceholderHeaderMinWidthPctRatio + math.random() * (LuaAppSduiCarouselPlaceholderHeaderMaxWidthPct / 100 - LuaAppSduiCarouselPlaceholderHeaderMinWidthPctRatio)
	end, {})
	
	return ReactModule.createElement("Frame", {
		AnchorPoint = p2.anchorPoint,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p2.layoutOrder,
		Position = p2.position,
		Size = UDim2.fromScale(1, 0),
		ZIndex = p2.zIndex,
		[ReactModule.Tag] = if p2.testId then `data-testid={p2.testId}` else nil
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if FFlagSduiCollectionCarouselPlaceholderItem and p2.hideHeader then 0 else UseTokensResult.Padding.Medium)
		}),
		Header = if FFlagSduiCollectionCarouselPlaceholderItem and p2.hideHeader then nil else ReactModule.createElement(SduiPlaceholder, {
			layoutOrder = 1,
			backgroundStyle = p2.backgroundStyle,
			cornerRadius = p2.cornerRadius,
			size = UDim2.new(UseMemoResult2, 0, 0, FIntLuaAppSduiCarouselPlaceholderHeaderHeightPx * Scale),
			transparencyBinding = p2.transparencyBinding
		}),
		Row = if FFlagSduiCollectionCarouselPlaceholderItem and p2.itemPlaceholderComponent then ReactModule.createElement(SduiCollectionCarouselItemPlaceholderRow, {
			layoutOrder = 2,
			carouselPeek = UseCollectionLayoutResult.carouselPeek,
			gutter = UseCollectionLayoutResult.gutter,
			itemPlaceholderComponent = p2.itemPlaceholderComponent,
			itemSizeBinding = UseMemoResult,
			itemsPerRow = UseCollectionLayoutResult.itemsPerRow,
			rowSizeBinding = UseMemoResult1,
			transparencyBinding = p2.transparencyBinding
		}) else ReactModule.createElement(SduiPlaceholder, {
			layoutOrder = 2,
			backgroundStyle = p2.backgroundStyle,
			cornerRadius = p2.cornerRadius,
			size = UseMemoResult1,
			transparencyBinding = p2.transparencyBinding
		})
	})
end)