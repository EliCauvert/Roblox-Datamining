local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)
local DefaultMetricsGridView = UIBloxModule.App.Grid.DefaultMetricsGridView
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local FFlagAXScrollingFramesShouldAnimateOnFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXScrollingFramesShouldAnimateOnFocus
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local LoadableGridView = RoactModule.PureComponent:extend("LoadableGridView")
LoadableGridView.validateProps = TModule.strictInterface({
	getItemMetrics = TModule.callback,
	items = TModule.optional(TModule.table),
	totalNumItems = TModule.optional(TModule.number),
	renderItem = TModule.callback,
	getItemHeight = TModule.callback,
	windowHeight = TModule.optional(TModule.number),
	LayoutOrder = TModule.optional(TModule.number),
	onNumItemsPerRowChanged = TModule.optional(TModule.callback),
	onAbsoluteSizeChanged = TModule.optional(TModule.callback),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	forwardRef = TModule.optional(TModule.table),
	onFocusGained = TModule.optional(TModule.callback),
	restorePreviousChildFocus = TModule.optional(TModule.boolean)
})
LoadableGridView.defaultProps = { getItemMetrics = GridMetrics.getSmallMetrics }

function LoadableGridView.render(p1)
	-- upvalues: RoactModule (copy), DefaultMetricsGridView (copy), ConstantsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXScrollingFramesShouldAnimateOnFocus (copy)
	local Items = p1.props.items
	local TotalNumItems = p1.props.totalNumItems
	local LayoutOrder = p1.props.LayoutOrder
	local GetItemHeight = p1.props.getItemHeight
	local WindowHeight = p1.props.windowHeight
	local GetItemMetrics = p1.props.getItemMetrics
	
	if not Items then
		Items = {}
		
		for i = 1, TotalNumItems do
			Items[i] = {}
		end
	end
	return RoactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		SelectionGroup = if FFlagAXScrollingFramesShouldAnimateOnFocus then true else nil,
		[RoactModule.Change.AbsoluteSize] = p1.props.onAbsoluteSizeChanged
	}, {
		DefaultMetricsGridView = RoactModule.createElement(DefaultMetricsGridView, {
			renderItem = p1.props.renderItem,
			windowHeight = WindowHeight,
			getItemHeight = GetItemHeight,
			getItemMetrics = GetItemMetrics,
			itemPadding = Vector2.new(ConstantsModule.LoadableGridViewCellPadding, ConstantsModule.LoadableGridViewCellPadding),
			items = Items,
			maxHeight = 1e999,
			LayoutOrder = LayoutOrder,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			[RoactModule.Ref] = p1.props.forwardRef,
			defaultChildIndex = 1,
			restorePreviousChildFocus = p1.props.restorePreviousChildFocus,
			onFocusGained = p1.props.onFocusGained,
			onNumItemsPerRowChanged = p1.props.onNumItemsPerRowChanged,
			isRoactGamepadEnabled = not FFlagAXMigrateAXToGlobalAutofocus and nil
		})
	})
end

return RoactModule.forwardRef(function(p2, ForwardRef)
	-- upvalues: RoactModule (copy), LoadableGridView (copy), CryoModule (copy)
	return RoactModule.createElement(LoadableGridView, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)