local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local roactGamepadModule = require(corePackagesService.Packages.RoactGamepad)
local tModule = require(corePackagesService.Packages.t)
local roactFitComponents = require(corePackagesService.Packages.AvatarExperienceDeps).RoactFitComponents
local listEntryModule = require(script.Parent.ListEntry)
local listSection = roactModule.PureComponent:extend("ListSection")
listSection.validateProps = tModule.strictInterface({
	headerText = tModule.string,
	items = tModule.array(tModule.string),
	layoutOrder = tModule.integer,
	isFirstSection = tModule.boolean,
	isLastSection = tModule.boolean,
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	forwardRef = tModule.table
})

function listSection.init(p0) --[[ line: 29 ]]
	-- upvalues: roactGamepadModule (ref)
	p0.listRefCache = roactGamepadModule.createRefCache()
end

function listSection.render(p1) --[[ line: 33 ]]
	-- upvalues: roactModule (ref), roactGamepadModule (ref), listEntryModule (ref), roactFitComponents (ref)
	local t = {
		[0] = roactModule.createElement(roactGamepadModule.Focusable[listEntryModule], {
			text = p1.props.headerText,
			hasBullet = false,
			layoutOrder = 0,
			positionChangedCallback = if p1.props.isFirstSection then p1.firstEntryPositionChanged else nil,
			NextSelectionDown = if #p1.props.items > 0 then p1.listRefCache[1] else nil,
			[roactModule.Ref] = p1.listRefCache[0]
		})
	}
	
	for i, v in ipairs(p1.props.items) do
		t[i] = roactModule.createElement(roactGamepadModule.Focusable[listEntryModule], {
			text = v,
			hasBullet = true,
			layoutOrder = i,
			positionChangedCallback = if p1.props.isLastSection and i == #p1.props.items then p1.lastEntryPositionChanged else nil,
			NextSelectionUp = p1.listRefCache[i - 1],
			NextSelectionDown = if i ~= #p1.props.items then p1.listRefCache[i + 1] else nil,
			[roactModule.Ref] = p1.listRefCache[i]
		})
	end
	return roactModule.createElement(roactGamepadModule.Focusable[roactFitComponents.FitFrameVertical], {
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
		[roactModule.Ref] = p1.props.forwardRef
	}, t)
end

return roactModule.forwardRef(function(p2, p3) --[[ line: 84 ]]
	-- upvalues: roactModule (ref), listSection (ref), cryoModule (ref)
	return roactModule.createElement(listSection, cryoModule.Dictionary.join(p2, { forwardRef = p3 }))
end)