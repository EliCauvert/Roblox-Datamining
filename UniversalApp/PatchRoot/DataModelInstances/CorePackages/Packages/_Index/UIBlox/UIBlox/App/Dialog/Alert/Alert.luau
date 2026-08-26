local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local roactGamepadModule = require(parent_3.RoactGamepad)
local cryoModule = require(parent_3.Cryo)
local imagesModule = require(parent_1.ImageSet.Images)
local imageSetComponentModule = require(parent_2.Core.ImageSet.ImageSetComponent)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local buttonStackModule = require(parent_1.Button.ButtonStack)
local fitFrameOnAxis = require(parent_3.FitFrame).FitFrameOnAxis
local alertTypeModule = require(parent.Enum.AlertType)
local alertTitleModule = require(parent.AlertTitle)
local alert = roactModule.PureComponent:extend("Alert")
alert.validateProps = tModule.strictInterface({
	alertType = alertTypeModule.isEnumValue,
	maxWidth = tModule.optional(tModule.number),
	minWidth = tModule.optional(tModule.number),
	margin = tModule.optional(tModule.table),
	anchorPoint = tModule.optional(tModule.Vector2),
	onMounted = tModule.optional(tModule.callback),
	onAbsoluteSizeChanged = tModule.optional(tModule.callback),
	position = tModule.optional(tModule.UDim2),
	screenSize = tModule.Vector2,
	title = tModule.string,
	titleContent = tModule.optional(tModule.callback),
	middleContent = tModule.optional(tModule.callback),
	buttonStackInfo = tModule.optional(buttonStackModule.validateProps),
	footerContent = tModule.optional(tModule.callback),
	onCloseClicked = tModule.optional(tModule.callback),
	defaultChildRef = tModule.optional(tModule.union(tModule.table, tModule.callback)),
	isMiddleContentFocusable = tModule.optional(tModule.boolean),
	isFooterContentFocusable = tModule.optional(tModule.boolean),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
alert.defaultProps = {
	maxWidth = 400,
	minWidth = 272,
	isRoactGamepadEnabled = true,
	anchorPoint = Vector2.new(0.5, 0.5),
	margin = { top = 0, bottom = 24, left = 24, right = 24 },
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function alert.init(p1)
	-- upvalues: roactModule (ref)
	local var1, var2 = roactModule.createBinding(Vector2.new(0, 0))
	p1.contentSize = var1
	p1.changeContentSize = var2
	p1.middleContentRef = roactModule.createRef()
	p1.footerContentRef = roactModule.createRef()
	p1.buttonStackRef = roactModule.createRef()
end

function alert.didMount(p1)
	if p1.props.onMounted then
		p1.props.onMounted()
	end
end

function alert.render(p1)
	-- upvalues: withStyleModule (ref), alertTypeModule (ref), cryoModule (ref), roactModule (ref), roactGamepadModule (ref), imageSetComponentModule (ref), imagesModule (ref), fitFrameOnAxis (ref), alertTitleModule (ref), buttonStackModule (ref)
	local isMiddleContentFocusable = p1.props.isMiddleContentFocusable
	local isFooterContentFocusable = p1.props.isFooterContentFocusable
	local isRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
	local clampedValue = math.clamp(p1.props.screenSize.X - p1.props.margin.left - p1.props.margin.right, p1.props.minWidth, p1.props.maxWidth)
	
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), alertTypeModule (copy), cryoModule (copy), roactModule (copy), isRoactGamepadEnabled (ref), isMiddleContentFocusable (ref), isFooterContentFocusable (ref), roactGamepadModule (copy), imageSetComponentModule (copy), imagesModule (copy), fitFrameOnAxis (copy), clampedValue (ref), alertTitleModule (copy), buttonStackModule (copy)
		local transparency, var1
		local theme = p2.Theme
		local _ = nil
		local color = nil
		local _ = nil
		
		if p1.props.alertType == alertTypeModule.Interactive then
			color = theme.BackgroundUIDefault.Color
			transparency = theme.BackgroundUIDefault.Transparency
			var1 = 1
		else
			var1 = theme.BackgroundUIContrast.Transparency
			transparency = 1
		end
		local buttonStackInfo = p1.props.buttonStackInfo
		buttonStackInfo = buttonStackInfo and cryoModule.Dictionary.join(buttonStackInfo, {
			[roactModule.Ref] = if isRoactGamepadEnabled then p1.buttonStackRef else nil,
			NextSelectionUp = if isRoactGamepadEnabled then if isMiddleContentFocusable then p1.middleContentRef else nil else nil,
			NextSelectionDown = if isRoactGamepadEnabled then if isFooterContentFocusable then p1.footerContentRef else nil else nil,
			isRoactGamepadEnabled = isRoactGamepadEnabled
		})
		
		return roactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[imageSetComponentModule.Button] else imageSetComponentModule.Button, {
			Position = p1.props.position,
			AnchorPoint = p1.props.anchorPoint,
			Size = p1.contentSize:map(function(p3)
				return UDim2.new(0, p3.X, 0, p3.Y)
			end),
			BackgroundColor3 = theme.BackgroundUIDefault.Color,
			BackgroundTransparency = var1,
			BorderSizePixel = 0,
			Image = imagesModule["component_assets/circle_17"],
			ImageColor3 = color,
			ImageTransparency = transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			AutoButtonColor = false,
			ClipsDescendants = true,
			Selectable = false,
			[roactModule.Ref] = if isRoactGamepadEnabled then p1.props.defaultChildRef else nil,
			[roactModule.Change.AbsoluteSize] = p1.props.onAbsoluteSizeChanged,
			defaultChild = if isRoactGamepadEnabled then p1.buttonStackRef else nil
		}, {
			AlertContents = roactModule.createElement(fitFrameOnAxis, {
				contentPadding = UDim.new(0, 24),
				margin = p1.props.margin,
				minimumSize = UDim2.new(0, clampedValue, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[roactModule.Change.AbsoluteSize] = function(p3)
					-- upvalues: p1 (copy)
					p1.changeContentSize(p3.AbsoluteSize)
				end
			}, {
				TitleContainer = roactModule.createElement(alertTitleModule, {
					layoutOrder = 1,
					margin = p1.props.margin,
					maxWidth = p1.props.maxWidth,
					minWidth = p1.props.minWidth,
					screenSize = p1.props.screenSize,
					title = p1.props.title,
					titleContent = p1.props.titleContent,
					onCloseClicked = p1.props.onCloseClicked
				}),
				MiddleContent = p1.props.middleContent and roactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[fitFrameOnAxis] else fitFrameOnAxis, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					minimumSize = UDim2.new(1, 0, 0, 0),
					[roactModule.Ref] = if isRoactGamepadEnabled then p1.middleContentRef else nil,
					NextSelectionDown = if isRoactGamepadEnabled then if isMiddleContentFocusable then p1.buttonStackRef else nil else nil
				}, { Content = p1.props.middleContent() }),
				Footer = roactModule.createElement(fitFrameOnAxis, {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					contentPadding = UDim.new(0, 12),
					minimumSize = UDim2.new(1, 0, 0, 0)
				}, {
					Buttons = buttonStackInfo and roactModule.createElement(buttonStackModule, buttonStackInfo),
					FooterContent = p1.props.footerContent and roactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[fitFrameOnAxis] else fitFrameOnAxis, {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						minimumSize = UDim2.new(1, 0, 0, 0),
						[roactModule.Ref] = if isRoactGamepadEnabled then p1.footerContentRef else nil,
						NextSelectionUp = if isRoactGamepadEnabled then if isFooterContentFocusable then p1.buttonStackRef else nil else nil
					}, { Content = p1.props.footerContent() })
				})
			}) or nil
		})
	end)
end

return alert