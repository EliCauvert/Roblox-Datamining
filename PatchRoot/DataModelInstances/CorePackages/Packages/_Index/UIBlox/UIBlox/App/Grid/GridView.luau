-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

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

function gridView.itemsAreVisible(p0) --[[ line: 60 ]]
	return p0.state.isInDataModel and (p0.state.containerWidth ~= 0 and p0.props.itemSize.X ~= 0)
end

gridView.defaultProps = {
	maxHeight = 1e999,
	restorePreviousChildFocus = true,
	isRoactGamepadEnabled = true
}

function gridView.init(p1) --[[ line: 74 ]]
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
	
	function p1.onAncestryChanged(p2) --[[ line: 87 ]]
		-- upvalues: p1 (ref)
		if p2:IsDescendantOf(game) then
			p1:setState(function(p3) --[[ line: 89 ]]
				-- upvalues: p2 (ref)
				return if p3.isInDataModel and p3.containerWidth == p2.AbsoluteSize.X then nil else { isInDataModel = true, containerWidth = p2.AbsoluteSize.X }
			end)
		end
	end
end

function gridView.render(p4) --[[ line: 102 ]]
	-- upvalues: roactModule (ref), roactGamepadModule (ref), UIBloxConfigModule (ref)
	local items = p4.props.items
	local itemsCount = #items
	local itemSize = p4.props.itemSize
	local itemPadding = p4.props.itemPadding
	local maxHeight = p4.props.maxHeight
	local containerWidth = p4.state.containerWidth
	local containerYPosition = p4.state.containerYPosition
	local defaultChildIndex = p4.props.defaultChildIndex
	local onNumItemsPerRowChanged = p4.props.onNumItemsPerRowChanged
	local var8 = 1
	local var9 = itemsCount
	local t = {}
	local var11 = 0
	local var12 = 0
	local _ = nil
	local _ = nil
	local floored = math.floor((containerWidth + itemPadding.X) / math.max(1, itemSize.X + itemPadding.X))
	local floored_1 = math.floor((maxHeight + itemPadding.Y) / math.max(1, itemSize.Y + itemPadding.Y))
	
	if floored ~= p4.currentItemsPerRow then
		p4.currentItemsPerRow = floored
		
		if onNumItemsPerRowChanged then
			onNumItemsPerRowChanged(floored)
		end
	end
	local minValue = math.min(floored_1, math.ceil(itemsCount / floored))
	local var16 = minValue * itemSize.Y + math.max(minValue - 1, 0) * itemPadding.Y
	
	if p4.props.windowHeight ~= nil then
		local floored_2 = math.floor((containerYPosition + itemPadding.Y) / (itemSize.Y + itemPadding.Y))
		var8 = math.max(1, floored_2 * floored + 1)
		var9 = math.min(itemsCount, (math.min(minValue, floored_2 + (math.floor((p4.props.windowHeight + itemPadding.Y) / (itemSize.Y + itemPadding.Y)) + 2)) + 1) * floored)
		var12 = floored_2 * itemSize.Y + floored_2 * itemPadding.Y
	end
	local function _(a, b) --[[ line: 152 | named "getItemIndexRef" ]]
		-- upvalues: floored (write), var8 (write), var9 (write), p4 (ref)
		local var21 = 1 + ((a - 1) * floored + (b - 1))
		
		return (var8 <= var21 and var21 <= var9) and ((a > 0 and (b > 0 and b <= floored)) and (p4.focusableRefs[var21] or nil))
	end
	
	local function renderItem(p5) --[[ line: 161 ]]
		-- upvalues: floored (write), p4 (ref), roactModule (copy), roactGamepadModule (copy), var11 (write), var12 (write), itemSize (ref), var8 (write), var9 (write), items (ref), UIBloxConfigModule (copy)
		local var22 = math.floor((p5 - 1) / floored) + 1
		local var23 = 1 + (p5 - 1) % floored
		local var24 = p4:itemsAreVisible()
		
		if not p4.props.isRoactGamepadEnabled then
			p4.focusableRefs[p5] = p4.focusableRefs[p5] or roactModule.createRef()
		end
		local createElement = roactModule.createElement
		local var25 = if p4.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame"
		local t = {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, var11, 0, var12),
			Size = UDim2.new(0, itemSize.X, 0, itemSize.Y)
		}
		local var27 = var23 - 1
		local var28 = 1 + ((var22 - 1) * floored + (var27 - 1))
		t.NextSelectionLeft = (var8 <= var28 and var28 <= var9) and ((var22 > 0 and (var27 > 0 and var27 <= floored)) and (p4.focusableRefs[var28] or nil))
		local var29 = var23 + 1
		local var30 = 1 + ((var22 - 1) * floored + (var29 - 1))
		t.NextSelectionRight = (var8 <= var30 and var30 <= var9) and ((var22 > 0 and (var29 > 0 and var29 <= floored)) and (p4.focusableRefs[var30] or nil))
		local var31 = var22 - 1
		local var32 = 1 + ((var31 - 1) * floored + (var23 - 1))
		t.NextSelectionUp = (var8 <= var32 and var32 <= var9) and ((var31 > 0 and (var23 > 0 and var23 <= floored)) and (p4.focusableRefs[var32] or nil))
		local var33 = var22 + 1
		local var34 = 1 + ((var33 - 1) * floored + (var23 - 1))
		t.NextSelectionDown = (var8 <= var34 and var34 <= var9) and ((var33 > 0 and (var23 > 0 and var23 <= floored)) and (p4.focusableRefs[var34] or nil))
		t[roactModule.Ref] = p4.focusableRefs[p5]
		t.onFocusGained = if p4.props.isRoactGamepadEnabled then p4.props.onFocusGained else nil
		
		return createElement(var25, t, {
			Content = var24 and p4.props.renderItem(items[p5], p5, if UIBloxConfigModule.passRowAndColumnDataToItemInGridView then { row = var22, column = var23 } else nil)
		})
	end
	
	if var16 < maxHeight then
		local var19 = false
		local var20 = defaultChildIndex and defaultChildIndex <= itemsCount
		
		for i = var8, var9 do
			if i == defaultChildIndex then
				var19 = true
			end
			t[tostring(i)] = renderItem(i)
			var11 = math.floor(var11 + itemSize.X + itemPadding.X)
			
			if containerWidth < var11 + itemSize.X and i < var9 then
				var11 = 0
				var12 = var12 + itemPadding.Y + itemSize.Y
			end
		end
		if var20 and not var19 then
			var11 = (defaultChildIndex - 1) % floored * (itemSize.X + itemPadding.X)
			var12 = math.floor((defaultChildIndex - 1) / floored) * (itemPadding.Y + itemSize.Y)
			t[tostring(defaultChildIndex)] = renderItem(defaultChildIndex)
		end
	end
	return roactModule.createElement(if p4.props.isRoactGamepadEnabled then roactGamepadModule.Focusable.Frame else "Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p4.props.LayoutOrder,
		Size = UDim2.new(1, 0, 0, var16),
		[roactModule.Change.AbsolutePosition] = if p4.props.windowHeight ~= nil then function(p6) --[[ line: 238 ]]
			-- upvalues: p4 (ref)
			if p4.isMounted then
				p4:setState({ containerYPosition = -math.min(0, p6.AbsolutePosition.Y) })
			end
		end else nil,
		[roactModule.Change.AbsoluteSize] = function(p7) --[[ line: 245 ]]
			-- upvalues: p4 (ref)
			if p4.isMounted then
				if p4.state.isInDataModel then
					p4:setState({ containerWidth = p7.AbsoluteSize.X })
				end
				if p4.props.onWidthChanged ~= nil then
					p4.props.onWidthChanged(p7.AbsoluteSize.X)
				end
			end
		end,
		[roactModule.Event.AncestryChanged] = p4.onAncestryChanged,
		[roactModule.Ref] = p4.props.frameRef or p4.frameRef,
		NextSelectionLeft = p4.props.NextSelectionLeft,
		NextSelectionRight = p4.props.NextSelectionRight,
		NextSelectionUp = p4.props.NextSelectionUp,
		NextSelectionDown = p4.props.NextSelectionDown,
		defaultChild = if p4.props.isRoactGamepadEnabled and defaultChildIndex then p4.focusableRefs[defaultChildIndex] else nil,
		restorePreviousChildFocus = if p4.props.isRoactGamepadEnabled then p4.props.restorePreviousChildFocus else nil
	}, t)
end

function gridView.didMount(p8) --[[ line: 273 ]]
	p8.isMounted = true
	local frameRef = p8.props.frameRef or p8.frameRef
	
	if frameRef:getValue() and frameRef:getValue().AbsoluteSize.X ~= 0 then
		if frameRef:getValue():IsDescendantOf(game) then
			p8:setState(function(_) --[[ line: 283 ]]
				-- upvalues: frameRef (ref)
				return if frameRef:getValue() then {
					isInDataModel = true,
					containerWidth = frameRef:getValue().AbsoluteSize.X
				} else nil
			end)
		end
		if p8.props.onWidthChanged ~= nil then
			delay(0, function() --[[ line: 296 ]]
				-- upvalues: frameRef (ref), p8 (ref)
				if frameRef:getValue() then
					p8.props.onWidthChanged(frameRef:getValue().AbsoluteSize.X)
				end
			end)
		end
	end
end

function gridView.willUnmount(p9) --[[ line: 305 ]]
	p9.isMounted = false
end

return roactModule.forwardRef(function(p10, p11) --[[ line: 309 ]]
	-- upvalues: roactModule (ref), gridView (ref), cryoModule (ref)
	return roactModule.createElement(gridView, cryoModule.Dictionary.join(p10, { frameRef = p11 }))
end)