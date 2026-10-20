local Parent = script.Parent
local Parent1 = Parent.Parent.Parent.Parent
local RoactModule = require(Parent1.Roact)
local CryoModule = require(Parent1.Cryo)
local TModule = require(Parent1.t)
local GridViewModule = require(Parent.GridView)

local function validateWindowHeight(Props)
	if Props.windowHeight == nil or Props.maxHeight >= Props.windowHeight then
		return true
	else
		return false, ("windowHeight must be less than or equal to maxHeight\nmaxHeight: %f\nwindowHeight: %f"):format(Props.maxHeight, Props.windowHeight)
	end
end

local DefaultMetricsGridView = RoactModule.PureComponent:extend("DefaultMetricsGridView")
DefaultMetricsGridView.validateProps = TModule.strictInterface({
	getItemHeight = TModule.callback,
	getItemMetrics = TModule.callback,
	windowHeight = TModule.optional(TModule.numberMin(0)),
	renderItem = TModule.callback,
	itemPadding = TModule.Vector2,
	items = TModule.table,
	maxHeight = TModule.numberMin(0),
	LayoutOrder = TModule.optional(TModule.integer),
	onNumItemsPerRowChanged = TModule.optional(TModule.callback),
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
DefaultMetricsGridView.defaultProps = { maxHeight = 1e999, isRoactGamepadEnabled = true }

function DefaultMetricsGridView.init(p1)
	-- upvalues: RoactModule (copy)
	p1.isMounted = false
	p1.state = { containerWidth = 0 }
	p1.initialSizeCheckerRef = RoactModule.createRef()
end

function DefaultMetricsGridView.render(p1)
	-- upvalues: validateWindowHeight (copy), RoactModule (copy), GridViewModule (copy)
	assert(validateWindowHeight(p1.props))
	local ItemMetrics = p1.props.getItemMetrics(p1.state.containerWidth, p1.props.itemPadding.X)
	
	return RoactModule.createElement(GridViewModule, {
		renderItem = p1.props.renderItem,
		windowHeight = p1.props.windowHeight,
		maxHeight = p1.props.maxHeight,
		itemSize = Vector2.new(math.max(0, ItemMetrics.itemWidth), (math.max(0, (p1.props.getItemHeight(ItemMetrics.itemWidth))))),
		itemPadding = p1.props.itemPadding,
		items = p1.props.items,
		LayoutOrder = p1.props.LayoutOrder,
		onNumItemsPerRowChanged = p1.props.onNumItemsPerRowChanged,
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = p1.props.frameRef,
		defaultChildIndex = if p1.props.isRoactGamepadEnabled then p1.props.defaultChildIndex else nil,
		restorePreviousChildFocus = if p1.props.isRoactGamepadEnabled then p1.props.restorePreviousChildFocus else nil,
		onFocusGained = if p1.props.isRoactGamepadEnabled then p1.props.onFocusGained else nil,
		isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled,
		onWidthChanged = function(ContainerWidth)
			-- upvalues: p1 (copy)
			if p1.isMounted then
				p1:setState({ containerWidth = ContainerWidth })
			end
		end
	})
end

function DefaultMetricsGridView.didMount(p1)
	p1.isMounted = true
end

function DefaultMetricsGridView.willUnmount(p1)
	p1.isMounted = false
end

return RoactModule.forwardRef(function(p1, FrameRef)
	-- upvalues: RoactModule (copy), DefaultMetricsGridView (copy), CryoModule (copy)
	return RoactModule.createElement(DefaultMetricsGridView, CryoModule.Dictionary.join(p1, { frameRef = FrameRef }))
end)