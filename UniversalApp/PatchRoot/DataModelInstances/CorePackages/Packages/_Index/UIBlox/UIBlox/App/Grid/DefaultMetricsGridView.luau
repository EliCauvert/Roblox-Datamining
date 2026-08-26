local parent = script.Parent
local parent_1 = parent.Parent.Parent.Parent
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local tModule = require(parent_1.t)
local gridViewModule = require(parent.GridView)

local function validateWindowHeight(p1)
	if p1.windowHeight == nil or p1.maxHeight >= p1.windowHeight then
		return true
	end
	return false, ("windowHeight must be less than or equal to maxHeight\nmaxHeight: %f\nwindowHeight: %f"):format(p1.maxHeight, p1.windowHeight)
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

function defaultMetricsGridView.init(p1)
	-- upvalues: roactModule (ref)
	p1.isMounted = false
	p1.state = { containerWidth = 0 }
	p1.initialSizeCheckerRef = roactModule.createRef()
end

function defaultMetricsGridView.render(p1)
	-- upvalues: validateWindowHeight (ref), roactModule (ref), gridViewModule (ref)
	assert(validateWindowHeight(p1.props))
	local itemMetrics = p1.props.getItemMetrics(p1.state.containerWidth, p1.props.itemPadding.X)
	
	return roactModule.createElement(gridViewModule, {
		renderItem = p1.props.renderItem,
		windowHeight = p1.props.windowHeight,
		maxHeight = p1.props.maxHeight,
		itemSize = Vector2.new(math.max(0, itemMetrics.itemWidth), math.max(0, p1.props.getItemHeight(itemMetrics.itemWidth))),
		itemPadding = p1.props.itemPadding,
		items = p1.props.items,
		LayoutOrder = p1.props.LayoutOrder,
		onNumItemsPerRowChanged = p1.props.onNumItemsPerRowChanged,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[roactModule.Ref] = p1.props.frameRef,
		defaultChildIndex = if p1.props.isRoactGamepadEnabled then p1.props.defaultChildIndex else nil,
		restorePreviousChildFocus = if p1.props.isRoactGamepadEnabled then p1.props.restorePreviousChildFocus else nil,
		onFocusGained = if p1.props.isRoactGamepadEnabled then p1.props.onFocusGained else nil,
		isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled,
		onWidthChanged = function(p2)
			-- upvalues: p1 (ref)
			if p1.isMounted then
				p1:setState({ containerWidth = p2 })
			end
		end
	})
end

function defaultMetricsGridView.didMount(p1)
	p1.isMounted = true
end

function defaultMetricsGridView.willUnmount(p1)
	p1.isMounted = false
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), defaultMetricsGridView (ref), cryoModule (ref)
	return roactModule.createElement(defaultMetricsGridView, cryoModule.Dictionary.join(p1, { frameRef = p2 }))
end)