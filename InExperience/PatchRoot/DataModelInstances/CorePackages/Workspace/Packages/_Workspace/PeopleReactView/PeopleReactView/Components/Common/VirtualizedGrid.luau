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

return reactModule.memo(function(p1)
	-- upvalues: signalsReactModule (ref), getVirtualizedGridStoreModule (ref), reactModule (ref), signalsModule (ref), fFlagFixVirtualizedGridNumItems (ref), virtualizedItemModule (ref), view (ref)
	local var1 = signalsReactModule.useSignalState(getVirtualizedGridStoreModule)
	local var2 = signalsReactModule.useSignalState(var1.getNumVirtualizedItems)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.joinBindings({
		itemWidth = p1.itemWidth,
		itemHeight = p1.itemHeight,
		numColumns = p1.numColumns
	})
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), p1 (ref)
		return var4:map(function(p2)
			-- upvalues: p1 (copy)
			return UDim2.new(1, 0, 0, math.ceil(p1.numItems / p2.numColumns) * (p2.itemHeight + p1.gapSize) - p1.gapSize)
		end)
	end, { p1.numItems, p1.gapSize })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var1 (ref), signalsModule (copy)
		local var6 = nil
		local var7 = nil
		
		if p1.scrollingFrameStore and var3.current then
			local function handleCalculateVirtualizedGridLimits()
				-- upvalues: var1 (copy), p1 (copy)
				var1.calculateVirtualizedGridLimits(p1.scrollingFrameStore.getCanvasPositionY(), p1.scrollingFrameStore.getAbsoluteSizeY(), p1.itemWidth:getValue(), p1.itemHeight:getValue(), p1.numColumns:getValue(), p1.gapSize)
			end
			
			if p1.onContainerWidthChanged then
				p1.onContainerWidthChanged(var3.current.AbsoluteSize.X)
			end
			handleCalculateVirtualizedGridLimits()
			var6 = signalsModule.createEffect(function(p2)
				-- upvalues: p1 (copy), handleCalculateVirtualizedGridLimits (ref)
				p1.scrollingFrameStore.getCanvasPositionY(p2)
				p1.scrollingFrameStore.getAbsoluteSizeY(p2)
				handleCalculateVirtualizedGridLimits()
			end)
			var7 = var3.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: p1 (copy), var3 (copy), handleCalculateVirtualizedGridLimits (ref)
				if p1.onContainerWidthChanged then
					p1.onContainerWidthChanged(var3.current.AbsoluteSize.X)
				end
				handleCalculateVirtualizedGridLimits()
			end)
		end
		return function()
			-- upvalues: var6 (write), var7 (write)
			if var6 then
				var6()
			end
			if var7 then
				var7:Disconnect()
			end
		end
	end, {
		p1.onContainerWidthChanged,
		p1.scrollingFrameStore,
		p1.gapSize
	})
	local t = {}
	
	for i = 1, if fFlagFixVirtualizedGridNumItems then math.min(var2, p1.numItems) else var2 do
		t["VirtualizedItem_" .. i] = reactModule.createElement(virtualizedItemModule, {
			relativeIndex = i,
			getMinVirtualizedIndex = var1.getMinVirtualizedIndex,
			getMaxVirtualizedIndex = var1.getMaxVirtualizedIndex,
			itemWidth = p1.itemWidth,
			itemHeight = p1.itemHeight,
			numColumns = p1.numColumns,
			gapSize = p1.gapSize,
			getElement = p1.getElement
		})
	end
	return reactModule.createElement(view, { Size = var5, LayoutOrder = p1.layoutOrder, ref = var3 }, t)
end)