local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local View = require(Parent.Foundation).View
local VirtualizedItemModule = require(script.Parent.VirtualizedItem)
local _ = require(PeopleReactView.Stores.GetScrollingFrameStore)
local GetVirtualizedGridStoreModule = require(PeopleReactView.Stores.GetVirtualizedGridStore)
local FFlagFixVirtualizedGridNumItems = require(Parent.PeopleService).getService("Flags").FFlagFixVirtualizedGridNumItems

return ReactModule.memo(function(p1) --[[ Line: 38 | Named "VirtualizedGrid" ]]
	-- upvalues: SignalsReactModule (copy), GetVirtualizedGridStoreModule (copy), ReactModule (copy), SignalsModule (copy), FFlagFixVirtualizedGridNumItems (copy), VirtualizedItemModule (copy), View (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetVirtualizedGridStoreModule)
	local UseSignalStateResult1: number = SignalsReactModule.useSignalState(UseSignalStateResult.getNumVirtualizedItems)
	local UseRefResult = ReactModule.useRef(nil)
	local JoinBindingsResult = ReactModule.joinBindings({
		itemWidth = p1.itemWidth,
		itemHeight = p1.itemHeight,
		numColumns = p1.numColumns
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 51 ]]
		-- upvalues: JoinBindingsResult (copy), p1 (copy)
		return JoinBindingsResult:map(function(p2): UDim2 --[[ Line: 52 ]]
			-- upvalues: p1 (upval)
			return UDim2.new(1, 0, 0, math.ceil(p1.numItems / p2.numColumns) * (p2.itemHeight + p1.gapSize) - p1.gapSize)
		end)
	end, { p1.numItems, p1.gapSize })
	ReactModule.useEffect(function() --[[ Line: 62 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), UseSignalStateResult (copy), SignalsModule (upval)
		local Callback = nil
		local Connection = nil
		
		if p1.scrollingFrameStore and UseRefResult.current then
			local function handleCalculateVirtualizedGridLimits() --[[ Line: 68 ]]
				-- upvalues: UseSignalStateResult (upval), p1 (upval)
				UseSignalStateResult.calculateVirtualizedGridLimits(p1.scrollingFrameStore.getCanvasPositionY(), p1.scrollingFrameStore.getAbsoluteSizeY(), p1.itemWidth:getValue(), p1.itemHeight:getValue(), p1.numColumns:getValue(), p1.gapSize)
			end
			
			if p1.onContainerWidthChanged then
				p1.onContainerWidthChanged(UseRefResult.current.AbsoluteSize.X)
			end
			handleCalculateVirtualizedGridLimits()
			Callback = SignalsModule.createEffect(function(p2) --[[ Line: 85 ]]
				-- upvalues: p1 (upval), handleCalculateVirtualizedGridLimits (copy)
				p1.scrollingFrameStore.getCanvasPositionY(p2)
				p1.scrollingFrameStore.getAbsoluteSizeY(p2)
				handleCalculateVirtualizedGridLimits()
			end)
			Connection = UseRefResult.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 93 ]]
				-- upvalues: p1 (upval), UseRefResult (upval), handleCalculateVirtualizedGridLimits (copy)
				if p1.onContainerWidthChanged then
					p1.onContainerWidthChanged(UseRefResult.current.AbsoluteSize.X)
				end
				handleCalculateVirtualizedGridLimits()
			end)
		end
		return function() --[[ Line: 102 ]]
			-- upvalues: Callback (ref), Connection (ref)
			if Callback then
				Callback()
			end
			if Connection then
				Connection:Disconnect()
			end
		end
	end, {
		p1.onContainerWidthChanged,
		p1.scrollingFrameStore,
		p1.gapSize
	})
	local Elements = {}
	local Smallest = if FFlagFixVirtualizedGridNumItems then math.min(UseSignalStateResult1, p1.numItems) else UseSignalStateResult1
	for i = 1, Smallest do
		Elements["VirtualizedItem_" .. i] = ReactModule.createElement(VirtualizedItemModule, {
			relativeIndex = i,
			getMinVirtualizedIndex = UseSignalStateResult.getMinVirtualizedIndex,
			getMaxVirtualizedIndex = UseSignalStateResult.getMaxVirtualizedIndex,
			itemWidth = p1.itemWidth,
			itemHeight = p1.itemHeight,
			numColumns = p1.numColumns,
			gapSize = p1.gapSize,
			getElement = p1.getElement
		})
	end
	return ReactModule.createElement(View, {
		Size = UseMemoResult,
		LayoutOrder = p1.layoutOrder,
		ref = UseRefResult
	}, Elements)
end)