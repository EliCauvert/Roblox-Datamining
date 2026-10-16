local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactGamepadModule = require(Parent1.RoactGamepad)
local IsCallableModule = require(Parent.Utility.isCallable)
local UIBloxConfigModule = require(Parent.UIBloxConfig)
local RoactModule = require(Parent1.Roact)
local CryoModule = require(Parent1.Cryo)
local TModule = require(Parent1.t)
local GridView = RoactModule.PureComponent:extend("GridView")
GridView.validateProps = TModule.strictInterface({
	renderItem = IsCallableModule,
	itemSize = require(Parent.Utility.isPositiveVector2),
	itemPadding = TModule.Vector2,
	items = TModule.table,
	maxHeight = TModule.numberMin(0),
	windowHeight = TModule.optional(TModule.numberMin(0)),
	LayoutOrder = TModule.optional(TModule.integer),
	onWidthChanged = TModule.optional(IsCallableModule),
	onNumItemsPerRowChanged = TModule.optional(IsCallableModule),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	frameRef = TModule.optional(TModule.table),
	restorePreviousChildFocus = TModule.optional(TModule.boolean),
	onFocusGained = TModule.optional(TModule.callback),
	defaultChildIndex = TModule.optional(TModule.numberMin(1)),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})

function GridView.itemsAreVisible(p1): boolean --[[ Line: 60 ]]
	return p1.state.isInDataModel and (p1.state.containerWidth ~= 0 and p1.props.itemSize.X ~= 0)
end

GridView.defaultProps = {
	maxHeight = 1e999,
	restorePreviousChildFocus = true,
	isRoactGamepadEnabled = true
}

function GridView.init(p1) --[[ Line: 74 ]]
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy)
	p1.currentItemsPerRow = -1
	p1.frameRef = RoactModule.createRef()
	p1.isMounted = false
	p1.state = {
		containerWidth = 0,
		containerYPosition = 0,
		isInDataModel = false
	}
	p1.focusableRefs = p1.props.isRoactGamepadEnabled and RoactGamepadModule.createRefCache() or {}
	
	function p1.onAncestryChanged(Frame: Frame) --[[ Line: 87 ]]
		-- upvalues: p1 (copy)
		if Frame:IsDescendantOf(game) then
			p1:setState(function(State) --[[ Line: 89 ]]
				-- upvalues: Frame (copy)
				return if State.isInDataModel and State.containerWidth == Frame.AbsoluteSize.X then nil else {
					isInDataModel = true,
					containerWidth = Frame.AbsoluteSize.X
				}
			end)
		end
	end
end

function GridView.render(p1) --[[ Line: 102 ]]
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), UIBloxConfigModule (copy)
	local Items = p1.props.items
	local CountItems = #Items
	local ItemSize = p1.props.itemSize
	local ItemPadding = p1.props.itemPadding
	local MaxHeight = p1.props.maxHeight
	local ContainerWidth = p1.state.containerWidth
	local ContainerYPosition = p1.state.containerYPosition
	local DefaultChildIndex: number = p1.props.defaultChildIndex
	local OnNumItemsPerRowChangedFunction: (any) -> () = p1.props.onNumItemsPerRowChanged
	local Largest = 1
	local Smallest: number = CountItems
	local t = {}
	local XOffset = 0
	local YOffset = 0
	local Floored = nil
	Floored = math.floor((ContainerWidth + ItemPadding.X) / math.max(1, ItemSize.X + ItemPadding.X))
	local Floored1 = math.floor((MaxHeight + ItemPadding.Y) / math.max(1, ItemSize.Y + ItemPadding.Y))
	
	if Floored ~= p1.currentItemsPerRow then
		p1.currentItemsPerRow = Floored
		
		if OnNumItemsPerRowChangedFunction then
			OnNumItemsPerRowChangedFunction(Floored)
		end
	end
	local Smallest1 = math.min(Floored1, (math.ceil(CountItems / Floored)))
	local NewSmallest = Smallest1 * ItemSize.Y + math.max(Smallest1 - 1, 0) * ItemPadding.Y
	
	if p1.props.windowHeight ~= nil then
		local Floored2 = math.floor((ContainerYPosition + ItemPadding.Y) / (ItemSize.Y + ItemPadding.Y))
		Largest = math.max(1, Floored2 * Floored + 1)
		Smallest = math.min(CountItems, (math.min(Smallest1, Floored2 + (math.floor((p1.props.windowHeight + ItemPadding.Y) / (ItemSize.Y + ItemPadding.Y)) + 2)) + 1) * Floored)
		YOffset = Floored2 * ItemSize.Y + Floored2 * ItemPadding.Y
	end
	local function _(p2: number, p3: number) --[[ Line: 152 | Named "getItemIndexRef" ]]
		-- upvalues: Floored (ref), Largest (ref), Smallest (ref), p1 (copy)
		local NewFloored = 1 + ((p2 - 1) * Floored + (p3 - 1))
		
		return Largest <= NewFloored and NewFloored <= Smallest and (p2 > 0 and p3 > 0 and p3 <= Floored) and p1.focusableRefs[NewFloored] or nil
	end
	
	local function renderItem(DefaultChildIndex: number) --[[ Line: 161 ]]
		-- upvalues: Floored (ref), p1 (copy), RoactModule (upval), RoactGamepadModule (upval), XOffset (ref), YOffset (ref), ItemSize (copy), Largest (ref), Smallest (ref), Items (copy), UIBloxConfigModule (upval)
		local NewFloored = math.floor((DefaultChildIndex - 1) / Floored) + 1
		local NewDefaultChildIndex = 1 + (DefaultChildIndex - 1) % Floored
		local ItemsAreVisibleResult = p1:itemsAreVisible()
		
		if not p1.props.isRoactGamepadEnabled then
			p1.focusableRefs[DefaultChildIndex] = p1.focusableRefs[DefaultChildIndex] or RoactModule.createRef()
		end
		local NewDefaultChildIndexDelta = NewDefaultChildIndex - 1
		local NewNewFloored = 1 + ((NewFloored - 1) * Floored + (NewDefaultChildIndexDelta - 1))
		local FocusableRef = Largest <= NewNewFloored and NewNewFloored <= Smallest and (NewFloored > 0 and NewDefaultChildIndexDelta > 0 and NewDefaultChildIndexDelta <= Floored) and p1.focusableRefs[NewNewFloored] or nil
		local NewNewDefaultChildIndex = NewDefaultChildIndex + 1
		local NewNewFloored1 = 1 + ((NewFloored - 1) * Floored + (NewNewDefaultChildIndex - 1))
		local FocusableRef1 = Largest <= NewNewFloored1 and NewNewFloored1 <= Smallest and (NewFloored > 0 and NewNewDefaultChildIndex > 0 and NewNewDefaultChildIndex <= Floored) and p1.focusableRefs[NewNewFloored1] or nil
		local NewFlooredDelta = NewFloored - 1
		local NewNewFlooredDelta = 1 + ((NewFlooredDelta - 1) * Floored + (NewDefaultChildIndex - 1))
		local FocusableRef2 = Largest <= NewNewFlooredDelta and NewNewFlooredDelta <= Smallest and (NewFlooredDelta > 0 and NewDefaultChildIndex > 0 and NewDefaultChildIndex <= Floored) and p1.focusableRefs[NewNewFlooredDelta] or nil
		local NewNewFloored2 = NewFloored + 1
		local NewNewNewFloored = 1 + ((NewNewFloored2 - 1) * Floored + (NewDefaultChildIndex - 1))
		
		return RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable.Frame else "Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, XOffset, 0, YOffset),
			Size = UDim2.new(0, ItemSize.X, 0, ItemSize.Y),
			NextSelectionLeft = FocusableRef,
			NextSelectionRight = FocusableRef1,
			NextSelectionUp = FocusableRef2,
			NextSelectionDown = Largest <= NewNewNewFloored and NewNewNewFloored <= Smallest and (NewNewFloored2 > 0 and NewDefaultChildIndex > 0 and NewDefaultChildIndex <= Floored) and p1.focusableRefs[NewNewNewFloored] or nil,
			[RoactModule.Ref] = p1.focusableRefs[DefaultChildIndex],
			onFocusGained = if p1.props.isRoactGamepadEnabled then p1.props.onFocusGained else nil
		}, {
			Content = ItemsAreVisibleResult and p1.props.renderItem(Items[DefaultChildIndex], DefaultChildIndex, if UIBloxConfigModule.passRowAndColumnDataToItemInGridView then { row = NewFloored, column = NewDefaultChildIndex } else nil)
		})
	end
	
	if NewSmallest < MaxHeight then
		local Flag = false
		local IsDefaultChildIndexBelow: boolean = DefaultChildIndex and DefaultChildIndex <= CountItems
		for i = Largest, Smallest do
			if i == DefaultChildIndex then
				Flag = true
			end
			t[tostring(i)] = renderItem(i)
			XOffset = math.floor(XOffset + ItemSize.X + ItemPadding.X)
			
			if ContainerWidth < XOffset + ItemSize.X and i < Smallest then
				XOffset = 0
				YOffset = YOffset + ItemPadding.Y + ItemSize.Y
			end
		end
		if IsDefaultChildIndexBelow and not Flag then
			XOffset = (DefaultChildIndex - 1) % Floored * (ItemSize.X + ItemPadding.X)
			YOffset = math.floor((DefaultChildIndex - 1) / Floored) * (ItemPadding.Y + ItemSize.Y)
			t[tostring(DefaultChildIndex)] = renderItem(DefaultChildIndex)
		end
	end
	return RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable.Frame else "Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.LayoutOrder,
		Size = UDim2.new(1, 0, 0, NewSmallest),
		[RoactModule.Change.AbsolutePosition] = if p1.props.windowHeight == nil then nil else function(Frame) --[[ Line: 238 ]]
			-- upvalues: p1 (copy)
			if p1.isMounted then
				p1:setState({
					containerYPosition = -math.min(0, Frame.AbsolutePosition.Y)
				})
			end
		end or nil,
		[RoactModule.Change.AbsoluteSize] = function(Frame: Frame) --[[ Line: 245 ]]
			-- upvalues: p1 (copy)
			if p1.isMounted then
				if p1.state.isInDataModel then
					p1:setState({ containerWidth = Frame.AbsoluteSize.X })
				end
				if p1.props.onWidthChanged ~= nil then
					p1.props.onWidthChanged(Frame.AbsoluteSize.X)
				end
			end
		end,
		[RoactModule.Event.AncestryChanged] = p1.onAncestryChanged,
		[RoactModule.Ref] = p1.props.frameRef or p1.frameRef,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		defaultChild = if p1.props.isRoactGamepadEnabled and DefaultChildIndex then p1.focusableRefs[DefaultChildIndex] else nil,
		restorePreviousChildFocus = if p1.props.isRoactGamepadEnabled then p1.props.restorePreviousChildFocus else nil
	}, t)
end

function GridView.didMount(p2) --[[ Line: 273 ]]
	p2.isMounted = true
	local FrameRef = p2.props.frameRef or p2.frameRef
	
	if FrameRef:getValue() and FrameRef:getValue().AbsoluteSize.X ~= 0 then
		if FrameRef:getValue():IsDescendantOf(game) then
			p2:setState(function(_) --[[ Line: 283 ]]
				-- upvalues: FrameRef (copy)
				return if FrameRef:getValue() then {
					isInDataModel = true,
					containerWidth = FrameRef:getValue().AbsoluteSize.X
				} else nil
			end)
		end
		if p2.props.onWidthChanged ~= nil then
			delay(0, function() --[[ Line: 296 ]]
				-- upvalues: FrameRef (copy), p2 (copy)
				if FrameRef:getValue() then
					p2.props.onWidthChanged(FrameRef:getValue().AbsoluteSize.X)
				end
			end)
		end
	end
end

function GridView.willUnmount(p2) --[[ Line: 305 ]]
	p2.isMounted = false
end

return RoactModule.forwardRef(function(p2, FrameRef) --[[ Line: 309 ]]
	-- upvalues: RoactModule (copy), GridView (copy), CryoModule (copy)
	return RoactModule.createElement(GridView, CryoModule.Dictionary.join(p2, { frameRef = FrameRef }))
end)