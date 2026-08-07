-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:54 2026 Pacific Standard Time.

local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local tModule = require(parent_1.t)
local gridViewModule = require(parent.GridView)

local function validateWindowHeight(p0) --[[ line: 15 ]]
	if p0.windowHeight == nil or p0.maxHeight >= p0.windowHeight then
		return true
	end
	return false, ("windowHeight must be less than or equal to maxHeight\nmaxHeight: %f\nwindowHeight: %f"):format(p0.maxHeight, p0.windowHeight)
end

local defaultMetricsGridView = roactModule.PureComponent:extend("DefaultMetricsGridView")
defaultMetricsGridView.validateProps = tModule.strictInterface({
	getItemHeight = tModule.callback,
	getItemMetrics = tModule.callback,
	windowHeight = tModule.optional(tModule.numberMin(0)),
	renderItem = tModule.callback,
	itemPadding = tModule.Vector2,
	items = tModule.table,
	maxHeight = tModule.numberMin(0),
	LayoutOrder = tModule.optional(tModule.integer),
	onNumItemsPerRowChanged = tModule.optional(tModule.callback),
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
defaultMetricsGridView.defaultProps = { maxHeight = 1e999, isRoactGamepadEnabled = true }

function defaultMetricsGridView.init(p1) --[[ line: 75 ]]
	-- upvalues: roactModule (ref)
	p1.isMounted = false
	p1.state = { containerWidth = 0 }
	p1.initialSizeCheckerRef = roactModule.createRef()
end

function defaultMetricsGridView.render(p2) --[[ line: 85 ]]
	-- upvalues: validateWindowHeight (ref), roactModule (ref), gridViewModule (ref)
	assert(validateWindowHeight(p2.props))
	local itemMetrics = p2.props.getItemMetrics(p2.state.containerWidth, p2.props.itemPadding.X)
	
	return roactModule.createElement(gridViewModule, {
		renderItem = p2.props.renderItem,
		windowHeight = p2.props.windowHeight,
		maxHeight = p2.props.maxHeight,
		itemSize = Vector2.new(math.max(0, itemMetrics.itemWidth), math.max(0, p2.props.getItemHeight(itemMetrics.itemWidth))),
		itemPadding = p2.props.itemPadding,
		items = p2.props.items,
		LayoutOrder = p2.props.LayoutOrder,
		onNumItemsPerRowChanged = p2.props.onNumItemsPerRowChanged,
		NextSelectionLeft = p2.props.NextSelectionLeft,
		NextSelectionRight = p2.props.NextSelectionRight,
		NextSelectionUp = p2.props.NextSelectionUp,
		NextSelectionDown = p2.props.NextSelectionDown,
		[roactModule.Ref] = p2.props.frameRef,
		defaultChildIndex = if p2.props.isRoactGamepadEnabled then p2.props.defaultChildIndex else nil,
		restorePreviousChildFocus = if p2.props.isRoactGamepadEnabled then p2.props.restorePreviousChildFocus else nil,
		onFocusGained = if p2.props.isRoactGamepadEnabled then p2.props.onFocusGained else nil,
		isRoactGamepadEnabled = p2.props.isRoactGamepadEnabled,
		onWidthChanged = function(p3) --[[ line: 117 ]]
			-- upvalues: p2 (ref)
			if p2.isMounted then
				p2:setState({ containerWidth = p3 })
			end
		end
	})
end

function defaultMetricsGridView.didMount(p4) --[[ line: 127 ]]
	p4.isMounted = true
end

function defaultMetricsGridView.willUnmount(p5) --[[ line: 131 ]]
	p5.isMounted = false
end

return roactModule.forwardRef(function(p6, p7) --[[ line: 135 ]]
	-- upvalues: roactModule (ref), defaultMetricsGridView (ref), cryoModule (ref)
	return roactModule.createElement(defaultMetricsGridView, cryoModule.Dictionary.join(p6, { frameRef = p7 }))
end)