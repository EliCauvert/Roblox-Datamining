local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(Parent.AppCommonLib)
local View = require(Parent.Foundation).View
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local CollectionLayoutStoreContext = CollectionViewsModule.CollectionLayoutStoreContext
local CreateColumnSpanCollectionLayoutStoreFunction = CollectionViewsModule.createColumnSpanCollectionLayoutStore
local GetMainCollectionLayoutStoreFunction = CollectionViewsModule.getMainCollectionLayoutStore
local UseCollectionLayoutFunction = CollectionViewsModule.useCollectionLayout
local _ = require(Parent.SduiCoreSystem)
local GetCollectionSlotsLayoutModule = require(script.Parent.getCollectionSlotsLayout)

local function LayoutSlot(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), CreateColumnSpanCollectionLayoutStoreFunction (copy), View (copy), CollectionLayoutStoreContext (copy)
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		return SignalsModule.createSignal(0)
	end, {})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local GetColumnFraction = p1.getColumnFraction
	local Name = p1.name
	local VerticalOverflow = p1.verticalOverflow
	
	local function _(p2)
		-- upvalues: Name (copy)
		return p2[Name]
	end
	
	local Element = ReactModule.createElement(View, {
		Position = p1.layoutBinding:map(function(p2)
			-- upvalues: Name (copy), VerticalOverflow (copy)
			local Position = p2[Name].position
			
			return if VerticalOverflow then Position + UDim2.fromOffset(0, VerticalOverflow) else Position
		end),
		Size = p1.layoutBinding:map(function(p2)
			-- upvalues: Name (copy)
			return p2[Name].size
		end),
		tag = p1.tag,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: UseMemoResult2 (copy), UseBindingResult2 (copy)
			UseMemoResult2(Frame.AbsoluteSize.X)
			UseBindingResult2(Frame.AbsoluteSize.Y)
		end, { UseMemoResult2 }),
		testId = `--sdui-collection-slots-layout-{Name}`
	}, {
		Provider = ReactModule.createElement(CollectionLayoutStoreContext.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: GetColumnFraction (copy), CreateColumnSpanCollectionLayoutStoreFunction (upval), p1 (copy), UseMemoResult (copy)
				return if GetColumnFraction then CreateColumnSpanCollectionLayoutStoreFunction(p1.parentStore, GetColumnFraction, UseMemoResult) else p1.parentStore
			end, { p1.parentStore, GetColumnFraction, UseMemoResult })
		}, p1.children)
	})
	
	return if VerticalOverflow then ReactModule.createElement(View, {
		tag = "col auto-y",
		Position = p1.layoutBinding:map(function(p2)
			-- upvalues: Name (copy)
			return p2[Name].clipPosition
		end),
		Size = p1.layoutBinding:map(function(p2): UDim2
			-- upvalues: Name (copy)
			return UDim2.fromScale(p2[Name].clipSize.X.Scale, 0)
		end),
		testId = `--sdui-collection-slots-layout-{Name}-overflow`
	}, {
		Box = ReactModule.createElement(View, {
			Size = UseBindingResult:map(function(YOffset): UDim2
				return UDim2.new(1, 0, 0, YOffset)
			end)
		}, {
			Clip = ReactModule.createElement(View, {
				Position = UDim2.fromOffset(0, -VerticalOverflow),
				Size = UseBindingResult:map(function(p2): UDim2
					-- upvalues: VerticalOverflow (copy)
					return UDim2.new(1, 0, 0, p2 + 2 * VerticalOverflow)
				end),
				tag = p1.overflowClipTag,
				testId = `--sdui-collection-slots-layout-{Name}-clip`
			}, { Slot = Element })
		})
	}) else ReactModule.createElement(View, {
		Position = p1.layoutBinding:map(function(p2)
			-- upvalues: Name (copy)
			return p2[Name].clipPosition
		end),
		Size = p1.layoutBinding:map(function(p2)
			-- upvalues: Name (copy)
			return p2[Name].clipSize
		end),
		tag = p1.clipTag,
		testId = `--sdui-collection-slots-layout-{Name}-clip`
	}, { Slot = Element })
end

local function _(p1, ExtraLocalProps)
	-- upvalues: ReactModule (copy)
	return if p1 then ReactModule.cloneElement(p1, { extraLocalProps = ExtraLocalProps }) else nil
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), CollectionItemSize (copy), CollectionLayoutStoreContext (copy), GetMainCollectionLayoutStoreFunction (copy), UseCollectionLayoutFunction (copy), GetCollectionSlotsLayoutModule (copy), View (copy), LayoutSlot (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		if Frame then
			UseBindingResult2(Frame.AbsoluteSize)
		end
	end, {})
	local LeadingCollectionItemSize = if p1.leadingCollectionItemSize and CollectionItemSize[p1.leadingCollectionItemSize] then p1.leadingCollectionItemSize else CollectionItemSize.Small
	local TrailingCollectionItemSize = if p1.trailingCollectionItemSize and CollectionItemSize[p1.trailingCollectionItemSize] then p1.trailingCollectionItemSize else CollectionItemSize.Small
	local UseContextResult = ReactModule.useContext(CollectionLayoutStoreContext) or GetMainCollectionLayoutStoreFunction(false)
	local UseCollectionLayoutResult = UseCollectionLayoutFunction(LeadingCollectionItemSize)
	local ItemsPerRow: number = UseCollectionLayoutResult.itemsPerRow
	local ItemsPerRow1: number = UseCollectionLayoutFunction(TrailingCollectionItemSize).itemsPerRow
	local Gutter = UseCollectionLayoutResult.gutter
	local CarouselPeek = UseCollectionLayoutResult.carouselPeek or 0
	local Margin = UseCollectionLayoutResult.margin
	local HasLeading = p1.leading ~= nil
	local HasTrailing = p1.trailing ~= nil
	local Floored: number = if HasLeading then math.floor(p1.leadingColumns or 0) else 0
	local Floored1: number = if HasTrailing then math.floor(p1.trailingColumns or 0) else 0
	local NewFloored = Floored / ItemsPerRow + Floored1 / ItemsPerRow1
	local v1 = 1 / math.max(ItemsPerRow, ItemsPerRow1)
	local IsNewFlooredBelow: boolean = if HasLeading then if HasLeading then Floored >= 1 and (if HasTrailing then Floored1 >= 1 and NewFloored <= 1 - v1 + 0.000001 else NewFloored <= 1 - v1 + 0.000001) elseif HasTrailing then Floored1 >= 1 and NewFloored <= 1 - v1 + 0.000001 else NewFloored <= 1 - v1 + 0.000001 else HasTrailing and (if HasLeading then Floored >= 1 and (if HasTrailing then Floored1 >= 1 and NewFloored <= 1 - v1 + 0.000001 else NewFloored <= 1 - v1 + 0.000001) elseif HasTrailing then Floored1 >= 1 and NewFloored <= 1 - v1 + 0.000001 else NewFloored <= 1 - v1 + 0.000001)
	local MapResult = UseBindingResult:map(function(p2)
		-- upvalues: GetCollectionSlotsLayoutModule (upval), IsNewFlooredBelow (copy), Floored (copy), ItemsPerRow (copy), Floored1 (copy), ItemsPerRow1 (copy), Gutter (copy), CarouselPeek (copy), Margin (copy), p1 (copy)
		return GetCollectionSlotsLayoutModule(p2.X, {
			sideMargin = 0,
			fractionalItemAmount = 0,
			leadingColumns = if IsNewFlooredBelow then Floored else 0,
			leadingNumColumns = ItemsPerRow,
			trailingColumns = if IsNewFlooredBelow then Floored1 else 0,
			trailingNumColumns = ItemsPerRow1,
			columnGap = Gutter,
			carouselPeek = CarouselPeek,
			bleed = Margin,
			hoverOverflow = if p1.enableHoverOverflow then Gutter / 2 else 0
		})
	end)
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: Floored (copy), UseContextResult (copy), LeadingCollectionItemSize (copy)
		return Floored / UseContextResult.getItemsPerRow[LeadingCollectionItemSize](p2)
	end, { UseContextResult, LeadingCollectionItemSize, Floored })
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: Floored1 (copy), UseContextResult (copy), TrailingCollectionItemSize (copy)
		return Floored1 / UseContextResult.getItemsPerRow[TrailingCollectionItemSize](p2)
	end, { UseContextResult, TrailingCollectionItemSize, Floored1 })
	local UseResult4 = ReactModule.useCallback(function(p2): number
		-- upvalues: UseResult2 (copy), UseResult3 (copy)
		return 1 - UseResult2(p2) - UseResult3(p2)
	end, { UseResult2, UseResult3 })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), IsNewFlooredBelow (copy), ReactModule (upval)
		local function getExtraLocalProps(SideMargin)
			-- upvalues: p1 (upval), IsNewFlooredBelow (upval)
			return {
				appCompositionEnabled = true,
				scrollViewPositionChangedSignal = p1.scrollViewPositionChangedSignal,
				verticalScrollingFrameRef = p1.verticalScrollingFrameRef,
				startRow = p1.startRow,
				numUpdatesToDelayImpressions = p1.numUpdatesToDelayImpressions,
				index = p1.index,
				selectionOrderBase = p1.selectionOrderBase,
				sideMargin = SideMargin,
				pageSideMargin = if IsNewFlooredBelow then nil else p1.pageSideMargin,
				shouldUseFrameBoundsForImpressions = if IsNewFlooredBelow then true else nil,
				respectClipAncestors = if IsNewFlooredBelow then true else nil
			}
		end
		
		local t = {}
		local CloneElementResult = nil
		
		if IsNewFlooredBelow then
			local Leading = p1.leading
			local ExtraLocalProps = getExtraLocalProps(0)
			CloneElementResult = if Leading then ReactModule.cloneElement(Leading, { extraLocalProps = ExtraLocalProps }) else nil
		else
			CloneElementResult = nil
		end
		t.leading = CloneElementResult
		local Content = p1.content
		local ExtraLocalProps = getExtraLocalProps(nil)
		t.content = if Content then ReactModule.cloneElement(Content, { extraLocalProps = ExtraLocalProps }) else nil
		local CloneElementResult1 = nil
		
		if IsNewFlooredBelow then
			local Trailing = p1.trailing
			local ExtraLocalProps1 = getExtraLocalProps(0)
			CloneElementResult1 = if Trailing then ReactModule.cloneElement(Trailing, { extraLocalProps = ExtraLocalProps1 }) else nil
		else
			CloneElementResult1 = nil
		end
		t.trailing = CloneElementResult1
		
		return t
	end, {
		p1.leading, p1.content, p1.trailing, IsNewFlooredBelow,
		p1.scrollViewPositionChangedSignal, p1.verticalScrollingFrameRef,
		p1.startRow, p1.numUpdatesToDelayImpressions, p1.index,
		p1.selectionOrderBase, p1.pageSideMargin
	})
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "--sdui-collection-slots-layout"
	}, {
		Row = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			ref = UseResult1,
			onAbsoluteSizeChanged = UseResult
		}, {
			Leading = if IsNewFlooredBelow and Floored > 0 then ReactModule.createElement(LayoutSlot, {
				name = "leading",
				clipTag = "clip",
				tag = "col align-y-center",
				layoutBinding = MapResult,
				parentStore = UseContextResult,
				getColumnFraction = UseResult2
			}, { Item = UseMemoResult.leading }) else nil,
			Content = ReactModule.createElement(LayoutSlot, {
				name = "content",
				tag = "col auto-y",
				layoutBinding = MapResult,
				parentStore = UseContextResult,
				getColumnFraction = if IsNewFlooredBelow then UseResult4 else nil,
				clipTag = if IsNewFlooredBelow then "auto-y clip" else "auto-y",
				overflowClipTag = if IsNewFlooredBelow then "clip" else nil,
				verticalOverflow = if p1.enableHoverOverflow then 500 else nil
			}, { Item = UseMemoResult.content }),
			Trailing = if IsNewFlooredBelow and Floored1 > 0 then ReactModule.createElement(LayoutSlot, {
				name = "trailing",
				clipTag = "clip",
				tag = "col align-y-center",
				layoutBinding = MapResult,
				parentStore = UseContextResult,
				getColumnFraction = UseResult3
			}, { Item = UseMemoResult.trailing }) else nil
		})
	})
end)