local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local view = require(parent.Foundation).View
local peopleServiceModule = require(parent.PeopleService)
local virtualizedItemModule = require(script.Parent.VirtualizedItem)
local _ = require(peopleReactView.Stores.GetScrollingFrameStore)
local getVirtualizedGridStoreModule = require(peopleReactView.Stores.GetVirtualizedGridStore)
local fFlagFixVirtualizedGridNumItems = peopleServiceModule.getService("Flags").FFlagFixVirtualizedGridNumItems

return reactModule.memo(function(p0) --[[ line: 38 | named "VirtualizedGrid" ]]
	-- upvalues: signalsReactModule (ref), getVirtualizedGridStoreModule (ref), reactModule (ref), signalsModule (ref), fFlagFixVirtualizedGridNumItems (ref), virtualizedItemModule (ref), view (ref)
	local var7 = signalsReactModule.useSignalState(getVirtualizedGridStoreModule)
	local var8 = signalsReactModule.useSignalState(var7.getNumVirtualizedItems)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.joinBindings({
		itemWidth = p0.itemWidth,
		itemHeight = p0.itemHeight,
		numColumns = p0.numColumns
	})
	local var11 = reactModule.useMemo(function() --[[ line: 51 ]]
		-- upvalues: var10 (ref), p0 (ref)
		return var10:map(function(p1) --[[ line: 52 ]]
			-- upvalues: p0 (copy)
			return UDim2.new(1, 0, 0, math.ceil(p0.numItems / p1.numColumns) * (p1.itemHeight + p0.gapSize) - p0.gapSize)
		end)
	end, { p0.numItems, p0.gapSize })
	reactModule.useEffect(function() --[[ line: 62 ]]
		-- upvalues: p0 (ref), var9 (ref), var7 (ref), signalsModule (copy)
		local var13 = nil
		local var14 = nil
		
		if p0.scrollingFrameStore and var9.current then
			local function handleCalculateVirtualizedGridLimits() --[[ line: 68 ]]
				-- upvalues: var7 (copy), p0 (copy)
				var7.calculateVirtualizedGridLimits(p0.scrollingFrameStore.getCanvasPositionY(), p0.scrollingFrameStore.getAbsoluteSizeY(), p0.itemWidth:getValue(), p0.itemHeight:getValue(), p0.numColumns:getValue(), p0.gapSize)
			end
			
			if p0.onContainerWidthChanged then
				p0.onContainerWidthChanged(var9.current.AbsoluteSize.X)
			end
			handleCalculateVirtualizedGridLimits()
			var13 = signalsModule.createEffect(function(p2) --[[ line: 85 ]]
				-- upvalues: p0 (copy), handleCalculateVirtualizedGridLimits (ref)
				p0.scrollingFrameStore.getCanvasPositionY(p2)
				p0.scrollingFrameStore.getAbsoluteSizeY(p2)
				handleCalculateVirtualizedGridLimits()
			end)
			var14 = var9.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 93 ]]
				-- upvalues: p0 (copy), var9 (copy), handleCalculateVirtualizedGridLimits (ref)
				if p0.onContainerWidthChanged then
					p0.onContainerWidthChanged(var9.current.AbsoluteSize.X)
				end
				handleCalculateVirtualizedGridLimits()
			end)
		end
		return function() --[[ line: 102 ]]
			-- upvalues: var13 (write), var14 (write)
			if var13 then
				var13()
			end
			if var14 then
				var14:Disconnect()
			end
		end
	end, {
		p0.onContainerWidthChanged,
		p0.scrollingFrameStore,
		p0.gapSize
	})
	local t = {}
	
	for i = 1, if fFlagFixVirtualizedGridNumItems then math.min(var8, p0.numItems) else var8 do
		t["VirtualizedItem_" .. i] = reactModule.createElement(virtualizedItemModule, {
			relativeIndex = i,
			getMinVirtualizedIndex = var7.getMinVirtualizedIndex,
			getMaxVirtualizedIndex = var7.getMaxVirtualizedIndex,
			itemWidth = p0.itemWidth,
			itemHeight = p0.itemHeight,
			numColumns = p0.numColumns,
			gapSize = p0.gapSize,
			getElement = p0.getElement
		})
	end
	return reactModule.createElement(view, { Size = var11, LayoutOrder = p0.layoutOrder, ref = var9 }, t)
end)