local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactGamepadModule = require(parent_1.RoactGamepad)
local isCallableModule = require(parent.Utility.isCallable)
local UIBloxConfigModule = require(parent.UIBloxConfig)
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local tModule = require(parent_1.t)
local gridView = roactModule.PureComponent:extend("GridView")
gridView.validateProps = tModule.strictInterface({
	renderItem = isCallableModule,
	itemSize = require(parent.Utility.isPositiveVector2),
	itemPadding = tModule.Vector2,
	items = tModule.table,
	maxHeight = tModule.numberMin(0),
	windowHeight = tModule.optional(tModule.numberMin(0)),
	LayoutOrder = tModule.optional(tModule.integer),
	onWidthChanged = tModule.optional(isCallableModule),
	onNumItemsPerRowChanged = tModule.optional(isCallableModule),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	frameRef = tModule.optional(tModule.table),
	restorePreviousChildFocus = tModule.optional(tModule.boolean),
	onFocusGained = tModule.optional(tModule.callback),
	defaultChildIndex = tModule.optional(tModule.numberMin(1)),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})

function gridView.itemsAreVisible(p1)
	return p1.state.isInDataModel and (p1.state.containerWidth ~= 0 and p1.props.itemSize.X ~= 0)
end

gridView.defaultProps = {
	maxHeight = 1e999,
	restorePreviousChildFocus = true,
	isRoactGamepadEnabled = true
}

function gridView.init(p1)
	-- upvalues: roactModule (ref), roactGamepadModule (ref)
	p1.currentItemsPerRow = -1
	p1.frameRef = roactModule.createRef()
	p1.isMounted = false
	p1.state = {
		containerWidth = 0,
		containerYPosition = 0,
		isInDataModel = false
	}
	p1.focusableRefs = p1.props.isRoactGamepadEnabled and roactGamepadModule.createRefCache() or {}
	
	function p1.onAncestryChanged(p2)
		-- upvalues: p1 (ref)
		if p2:IsDescendantOf(game) then
			p1:setState(function(p3)
				-- upvalues: p2 (ref)
				return if p3.isInDataModel and p3.containerWidth == p2.AbsoluteSize.X then nil else { isInDataModel = true, containerWidth = p2.AbsoluteSize.X }
			end)
		end
	end
end

function gridView.render(p1)
	-- upvalues: roactModule (ref), roactGamepadModule (ref), UIBloxConfigModule (ref)
	local items = p1.props.items
	local itemsCount = #items
	local itemSize = p1.props.itemSize
	local itemPadding = p1.props.itemPadding
	local maxHeight = p1.props.maxHeight
	local containerWidth = p1.state.containerWidth
	local containerYPosition = p1.state.containerYPosition
	local defaultChildIndex = p1.props.defaultChildIndex
	local onNumItemsPerRowChanged = p1.props.onNumItemsPerRowChanged
	local var1 = 1
	local var2 = itemsCount
	local t = {}
	local var3 = 0
	local var4 = 0
	local _ = nil
	local _ = nil
	local floored = math.floor((containerWidth + itemPadding.X) / math.max(1, itemSize.X + itemPadding.X))
	local floored_1 = math.floor((maxHeight + itemPadding.Y) / math.max(1, itemSize.Y + itemPadding.Y))
	
	if floored ~= p1.currentItemsPerRow then
		p1.currentItemsPerRow = floored
		
		if onNumItemsPerRowChanged then
			onNumItemsPerRowChanged(floored)
		end
	end
	local minValue = math.min(floored_1, math.ceil(itemsCount / floored))
	local var5 = minValue * itemSize.Y + math.max(minValue - 1, 0) * itemPadding.Y
	
	if p1.props.windowHeight ~= nil then
		local floored_2 = math.floor((containerYPosition + itemPadding.Y) / (itemSize.Y + itemPadding.Y))
		var1 = math.max(1, floored_2 * floored + 1)
		var2 = math.min(itemsCount, (math.min(minValue, floored_2 + (math.floor((p1.props.windowHeight + itemPadding.Y) / (itemSize.Y + itemPadding.Y)) + 2)) + 1) * floored)
		var4 = floored_2 * itemSize.Y + floored_2 * itemPadding.Y
	end
	local function _(a, b)
		-- upvalues: floored (write), var1 (write), var2 (write), p1 (ref)
		local var6 = 1 + ((a - 1) * floored + (b - 1))
		
		return (var1 <= var6 and var6 <= var2) and ((a > 0 and (b > 0 and b <= floored)) and (p1.focusableRefs[var6] or nil))
	end
	
	local function renderItem(p2)
		-- upvalues: floored (write), p1 (ref), roactModule (copy), roactGamepadModule (copy), var3 (write), var4 (write), itemSize (ref), var1 (write), var2 (write), items (ref), UIBloxConfigModule (copy)
		local var6 = math.floor((p2 - 1) / floored) + 1
		local var7 = 1 + (p2 - 1) % floored
		local var8 = p1:itemsAreVisible()
		
		if not p1.props.isRoactGamepadEnabled then
			p1.focusableRefs[p2] = p1.focusableRefs[p2] or roactModule.createRef()
		end
		local createElement = roactModule.createElement
		local var9 = if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame"
		local t = {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, var3, 0, var4),
			Size = UDim2.new(0, itemSize.X, 0, itemSize.Y)
		}
		local var10 = var7 - 1
		local var11 = 1 + ((var6 - 1) * floored + (var10 - 1))
		t.NextSelectionLeft = (var1 <= var11 and var11 <= var2) and ((var6 > 0 and (var10 > 0 and var10 <= floored)) and (p1.focusableRefs[var11] or nil))
		local var12 = var7 + 1
		local var13 = 1 + ((var6 - 1) * floored + (var12 - 1))
		t.NextSelectionRight = (var1 <= var13 and var13 <= var2) and ((var6 > 0 and (var12 > 0 and var12 <= floored)) and (p1.focusableRefs[var13] or nil))
		local var14 = var6 - 1
		local var15 = 1 + ((var14 - 1) * floored + (var7 - 1))
		t.NextSelectionUp = (var1 <= var15 and var15 <= var2) and ((var14 > 0 and (var7 > 0 and var7 <= floored)) and (p1.focusableRefs[var15] or nil))
		local var16 = var6 + 1
		local var17 = 1 + ((var16 - 1) * floored + (var7 - 1))
		t.NextSelectionDown = (var1 <= var17 and var17 <= var2) and ((var16 > 0 and (var7 > 0 and var7 <= floored)) and (p1.focusableRefs[var17] or nil))
		t[roactModule.Ref] = p1.focusableRefs[p2]
		t.onFocusGained = if p1.props.isRoactGamepadEnabled then p1.props.onFocusGained else nil
		
		return createElement(var9, t, {
			Content = var8 and p1.props.renderItem(items[p2], p2, if UIBloxConfigModule.passRowAndColumnDataToItemInGridView then { row = var6, column = var7 } else nil)
		})
	end
	
	if var5 < maxHeight then
		local var6 = false
		local var7 = defaultChildIndex and defaultChildIndex <= itemsCount
		
		for i = var1, var2 do
			if i == defaultChildIndex then
				var6 = true
			end
			t[tostring(i)] = renderItem(i)
			var3 = math.floor(var3 + itemSize.X + itemPadding.X)
			
			if containerWidth < var3 + itemSize.X and i < var2 then
				var3 = 0
				var4 = var4 + itemPadding.Y + itemSize.Y
			end
		end
		if var7 and not var6 then
			var3 = (defaultChildIndex - 1) % floored * (itemSize.X + itemPadding.X)
			var4 = math.floor((defaultChildIndex - 1) / floored) * (itemPadding.Y + itemSize.Y)
			t[tostring(defaultChildIndex)] = renderItem(defaultChildIndex)
		end
	end
	return roactModule.createElement(if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.LayoutOrder,
		Size = UDim2.new(1, 0, 0, var5),
		[roactModule.Change.AbsolutePosition] = if p1.props.windowHeight ~= nil then function(p2)
			-- upvalues: p1 (ref)
			if p1.isMounted then
				p1:setState({ containerYPosition = -math.min(0, p2.AbsolutePosition.Y) })
			end
		end else nil,
		[roactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: p1 (ref)
			if p1.isMounted then
				if p1.state.isInDataModel then
					p1:setState({ containerWidth = p2.AbsoluteSize.X })
				end
				if p1.props.onWidthChanged ~= nil then
					p1.props.onWidthChanged(p2.AbsoluteSize.X)
				end
			end
		end,
		[roactModule.Event.AncestryChanged] = p1.onAncestryChanged,
		[roactModule.Ref] = p1.props.frameRef or p1.frameRef,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		defaultChild = if p1.props.isRoactGamepadEnabled and defaultChildIndex then p1.focusableRefs[defaultChildIndex] else nil,
		restorePreviousChildFocus = if p1.props.isRoactGamepadEnabled then p1.props.restorePreviousChildFocus else nil
	}, t)
end

function gridView.didMount(p2)
	p2.isMounted = true
	local frameRef = p2.props.frameRef or p2.frameRef
	
	if frameRef:getValue() and frameRef:getValue().AbsoluteSize.X ~= 0 then
		if frameRef:getValue():IsDescendantOf(game) then
			p2:setState(function(_)
				-- upvalues: frameRef (ref)
				return if frameRef:getValue() then {
					isInDataModel = true,
					containerWidth = frameRef:getValue().AbsoluteSize.X
				} else nil
			end)
		end
		if p2.props.onWidthChanged ~= nil then
			delay(0, function()
				-- upvalues: frameRef (ref), p2 (ref)
				if frameRef:getValue() then
					p2.props.onWidthChanged(frameRef:getValue().AbsoluteSize.X)
				end
			end)
		end
	end
end

function gridView.willUnmount(p2)
	p2.isMounted = false
end

return roactModule.forwardRef(function(p2, p3)
	-- upvalues: roactModule (ref), gridView (ref), cryoModule (ref)
	return roactModule.createElement(gridView, cryoModule.Dictionary.join(p2, { frameRef = p3 }))
end)