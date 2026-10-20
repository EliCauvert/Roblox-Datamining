local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local RoactModule = require(Parent.Roact)
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local GridView = RoactModule.PureComponent:extend("GridView")
GridView.defaultProps = {
	onItemsPerRowChanged = nil,
	items = {},
	cellPaddingOffset = Vector2.new(0, 0),
	windowAbsoluteSize = Vector2.new(1, 1),
	itemAbsoluteSize = Vector2.new(1, 1),
	horizontalAlignment = Enum.HorizontalAlignment.Center
}

function GridView.init(p1)
	-- upvalues: RoactModule (copy), MemoizeFunction (copy)
	p1.state = { itemsPerRow = 0, itemWindowStart = 1 }
	p1.containerRef = RoactModule.createRef()
	p1.isMounted = false
	p1.itemsPerRow = 0
	p1.itemWindowStart = 1
	p1.getTotalRowsAndHeight = MemoizeFunction(function(p2: number, p3, p4: number, p5, p6)
		local Ceiled: number = if p2 > 0 then math.ceil(p3 / p2) else 0
		
		if p4 ~= nil then
			Ceiled = math.min(Ceiled, p4)
		end
		return Ceiled, (math.max(0, p6.Y * Ceiled + p5.Y * (Ceiled - 1)))
	end)
	
	function p1.getWindowHeight()
		-- upvalues: p1 (copy)
		local WindowAbsoluteSize = p1.props.windowAbsoluteSize
		local ScreenSize = p1.props.screenSize
		
		return if ScreenSize then ScreenSize.Y else WindowAbsoluteSize.Y
	end
	
	function p1.updateItemWindowBounds(p2)
		-- upvalues: p1 (copy)
		local Current = p1.containerRef.current
		
		if not Current then return end
		local Y = Current.AbsolutePosition.Y
		local CellPaddingOffset = p1.props.cellPaddingOffset
		local ItemAbsoluteSize = p1.props.itemAbsoluteSize
		local Floored = math.floor((p1.props.windowAbsoluteSize.X + CellPaddingOffset.X) / (ItemAbsoluteSize.X + CellPaddingOffset.X))
		local Largest = math.max(0, (math.floor(-Y / (ItemAbsoluteSize.Y + CellPaddingOffset.Y))))
		
		if Floored > 0 then
			local TotalRowsAndHeight, TotalRowsAndHeight2 = p1.getTotalRowsAndHeight(Floored, #p1.props.items, p1.props.numberOfRowsToShow, CellPaddingOffset, ItemAbsoluteSize)
			
			if p1.getWindowHeight() < Y or Y + TotalRowsAndHeight2 < 0 then
				Largest = TotalRowsAndHeight
			else
				Largest = math.min(Largest, TotalRowsAndHeight)
			end
		end
		local Largest1 = math.max(1, Largest * Floored + 1)
		local IsNotFlooredMatch: boolean = Floored ~= p1.itemsPerRow or Largest1 ~= p1.itemWindowStart
		
		if p1.props.onItemsPerRowChanged and Floored ~= p1.itemsPerRow then
			p1.props.onItemsPerRowChanged(Floored)
		end
		p1.itemsPerRow = Floored
		p1.itemWindowStart = Largest1
		
		if IsNotFlooredMatch and p1.isMounted then
			if p2 then
				spawn(function()
					-- upvalues: p1 (upval)
					if p1.isMounted then
						p1:setState({
							itemsPerRow = p1.itemsPerRow,
							itemWindowStart = p1.itemWindowStart
						})
					end
				end)
				
				return
			end
			p1:setState({
				itemsPerRow = p1.itemsPerRow,
				itemWindowStart = p1.itemWindowStart
			})
		end
	end
end

function GridView.render(p1)
	-- upvalues: RoactModule (copy)
	local LayoutOrder = p1.props.layoutOrder
	local Items = p1.props.items
	local RenderItemFunction = p1.props.renderItem
	local CellPaddingOffset = p1.props.cellPaddingOffset
	local ItemAbsoluteSize = p1.props.itemAbsoluteSize
	local HorizontalAlignment = p1.props.horizontalAlignment
	local ItemsPerRow: number = p1.state.itemsPerRow
	local ItemWindowStart: number = p1.state.itemWindowStart
	local CountItems = #Items
	local TotalRowsAndHeight, TotalRowsAndHeight2 = p1.getTotalRowsAndHeight(ItemsPerRow, CountItems, p1.props.numberOfRowsToShow, CellPaddingOffset, ItemAbsoluteSize)
	local ScaledCeiled = (math.ceil(p1.getWindowHeight() / (ItemAbsoluteSize.Y + CellPaddingOffset.Y)) + 1) * ItemsPerRow
	local Smallest = math.min(CountItems, TotalRowsAndHeight * ItemsPerRow, ItemWindowStart + ScaledCeiled - 1)
	local Smallest1 = math.min((ItemWindowStart - 1) / ItemsPerRow * (ItemAbsoluteSize.Y + CellPaddingOffset.Y), TotalRowsAndHeight2)
	local v1 = nil
	
	if typeof(RenderItemFunction) == "function" then
		v1 = {
			Layout = RoactModule.createElement("UIGridLayout", {
				CellPadding = UDim2.new(0, CellPaddingOffset.X, 0, CellPaddingOffset.Y),
				CellSize = UDim2.new(0, ItemAbsoluteSize.X, 0, ItemAbsoluteSize.Y),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = HorizontalAlignment,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		
		if ItemWindowStart > 0 then
			for i = ItemWindowStart, Smallest do
				v1[i % ScaledCeiled] = RenderItemFunction(Items[i], ItemAbsoluteSize, i, if ItemsPerRow > 0 then math.ceil(i / ItemsPerRow) else -1)
			end
		end
	end
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, TotalRowsAndHeight2),
		LayoutOrder = LayoutOrder,
		BackgroundTransparency = 1,
		[RoactModule.Ref] = p1.containerRef,
		[RoactModule.Change.AbsolutePosition] = function()
			-- upvalues: p1 (copy)
			p1.updateItemWindowBounds(true)
		end
	}, {
		Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, Smallest1) }),
		Content = v1 and RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, v1)
	})
end

function GridView.didMount(p2)
	p2.isMounted = true
	p2.updateItemWindowBounds(false)
end

function GridView.willUnmount(p2)
	p2.isMounted = false
end

function GridView.didUpdate(p2, DefaultProps, _)
	if p2.props.windowAbsoluteSize ~= DefaultProps.windowAbsoluteSize or (p2.props.itemAbsoluteSize ~= DefaultProps.itemAbsoluteSize or (p2.props.cellPaddingOffset ~= DefaultProps.cellPaddingOffset or p2.props.screenSize and p2.props.screenSize ~= DefaultProps.screenSize)) then
		p2.updateItemWindowBounds(false)
	end
end

return GridView