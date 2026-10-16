local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local ListEntryModule = require(script.Parent.ListEntry)
local ListSection = RoactModule.PureComponent:extend("ListSection")
ListSection.validateProps = TModule.strictInterface({
	headerText = TModule.string,
	items = TModule.array(TModule.string),
	layoutOrder = TModule.integer,
	isFirstSection = TModule.boolean,
	isLastSection = TModule.boolean,
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	forwardRef = TModule.table
})

function ListSection.init(p1) --[[ Line: 29 ]]
	-- upvalues: RoactGamepadModule (copy)
	p1.listRefCache = RoactGamepadModule.createRefCache()
end

function ListSection.render(p1) --[[ Line: 33 ]]
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), ListEntryModule (copy), RoactFitComponents (copy)
	local config = {
		[0] = RoactModule.createElement(RoactGamepadModule.Focusable[ListEntryModule], {
			text = p1.props.headerText,
			hasBullet = false,
			layoutOrder = 0,
			positionChangedCallback = p1.props.isFirstSection and p1.firstEntryPositionChanged or nil,
			NextSelectionDown = #p1.props.items > 0 and p1.listRefCache[1] or nil,
			[RoactModule.Ref] = p1.listRefCache[0]
		})
	}
	
	for CountItems, item in ipairs(p1.props.items) do
		config[CountItems] = RoactModule.createElement(RoactGamepadModule.Focusable[ListEntryModule], {
			text = item,
			hasBullet = true,
			layoutOrder = CountItems,
			positionChangedCallback = if p1.props.isLastSection and CountItems == #p1.props.items then p1.lastEntryPositionChanged else nil,
			NextSelectionUp = p1.listRefCache[CountItems - 1],
			NextSelectionDown = if CountItems == #p1.props.items then nil else p1.listRefCache[CountItems + 1] or nil,
			[RoactModule.Ref] = p1.listRefCache[CountItems]
		})
	end
	return RoactModule.createElement(RoactGamepadModule.Focusable[RoactFitComponents.FitFrameVertical], {
		width = UDim.new(1, 0),
		FillDirection = Enum.FillDirection.Vertical,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.layoutOrder,
		defaultChild = p1.listRefCache[0],
		NextSelectionLeft = p1.props.NextSelectionLeft,
		NextSelectionRight = p1.props.NextSelectionRight,
		NextSelectionUp = p1.props.NextSelectionUp,
		NextSelectionDown = p1.props.NextSelectionDown,
		[RoactModule.Ref] = p1.props.forwardRef
	}, config)
end

return RoactModule.forwardRef(function(p2, ForwardRef) --[[ Line: 84 ]]
	-- upvalues: RoactModule (copy), ListSection (copy), CryoModule (copy)
	return RoactModule.createElement(ListSection, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)