-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:53 2026 Pacific Standard Time.

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

function alert.init(p0) --[[ line: 79 ]]
	-- upvalues: roactModule (ref)
	local var11, var12 = roactModule.createBinding(Vector2.new(0, 0))
	p0.contentSize = var11
	p0.changeContentSize = var12
	p0.middleContentRef = roactModule.createRef()
	p0.footerContentRef = roactModule.createRef()
	p0.buttonStackRef = roactModule.createRef()
end

function alert.didMount(p1) --[[ line: 87 ]]
	if p1.props.onMounted then
		p1.props.onMounted()
	end
end

function alert.render(p2) --[[ line: 93 ]]
	-- upvalues: withStyleModule (ref), alertTypeModule (ref), cryoModule (ref), roactModule (ref), roactGamepadModule (ref), imageSetComponentModule (ref), imagesModule (ref), fitFrameOnAxis (ref), alertTitleModule (ref), buttonStackModule (ref)
	local isMiddleContentFocusable = p2.props.isMiddleContentFocusable
	local isFooterContentFocusable = p2.props.isFooterContentFocusable
	local isRoactGamepadEnabled = p2.props.isRoactGamepadEnabled
	local clampedValue = math.clamp(p2.props.screenSize.X - p2.props.margin.left - p2.props.margin.right, p2.props.minWidth, p2.props.maxWidth)
	
	return withStyleModule(function(p3) --[[ line: 104 ]]
		-- upvalues: p2 (ref), alertTypeModule (copy), cryoModule (copy), roactModule (copy), isRoactGamepadEnabled (ref), isMiddleContentFocusable (ref), isFooterContentFocusable (ref), roactGamepadModule (copy), imageSetComponentModule (copy), imagesModule (copy), fitFrameOnAxis (copy), clampedValue (ref), alertTitleModule (copy), buttonStackModule (copy)
		local transparency, var14
		local theme = p3.Theme
		local _ = nil
		local color = nil
		local _ = nil
		
		if p2.props.alertType == alertTypeModule.Interactive then
			color = theme.BackgroundUIDefault.Color
			transparency = theme.BackgroundUIDefault.Transparency
			var14 = 1
		else
			var14 = theme.BackgroundUIContrast.Transparency
			transparency = 1
		end
		local buttonStackInfo = p2.props.buttonStackInfo
		buttonStackInfo = buttonStackInfo and cryoModule.Dictionary.join(buttonStackInfo, {
			[roactModule.Ref] = if isRoactGamepadEnabled then p2.buttonStackRef else nil,
			NextSelectionUp = if isRoactGamepadEnabled then if isMiddleContentFocusable then p2.middleContentRef else nil else nil,
			NextSelectionDown = if isRoactGamepadEnabled then if isFooterContentFocusable then p2.footerContentRef else nil else nil,
			isRoactGamepadEnabled = isRoactGamepadEnabled
		})
		
		return roactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[imageSetComponentModule.Button] else imageSetComponentModule.Button, {
			Position = p2.props.position,
			AnchorPoint = p2.props.anchorPoint,
			Size = p2.contentSize:map(function(p4) --[[ line: 138 ]]
				return UDim2.new(0, p4.X, 0, p4.Y)
			end),
			BackgroundColor3 = theme.BackgroundUIDefault.Color,
			BackgroundTransparency = var14,
			BorderSizePixel = 0,
			Image = imagesModule["component_assets/circle_17"],
			ImageColor3 = color,
			ImageTransparency = transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			AutoButtonColor = false,
			ClipsDescendants = true,
			Selectable = false,
			[roactModule.Ref] = if isRoactGamepadEnabled then p2.props.defaultChildRef else nil,
			[roactModule.Change.AbsoluteSize] = p2.props.onAbsoluteSizeChanged,
			defaultChild = if isRoactGamepadEnabled then p2.buttonStackRef else nil
		}, {
			AlertContents = roactModule.createElement(fitFrameOnAxis, {
				contentPadding = UDim.new(0, 24),
				margin = p2.props.margin,
				minimumSize = UDim2.new(0, clampedValue, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[roactModule.Change.AbsoluteSize] = function(p5) --[[ line: 164 ]]
					-- upvalues: p2 (copy)
					p2.changeContentSize(p5.AbsoluteSize)
				end
			}, {
				TitleContainer = roactModule.createElement(alertTitleModule, {
					layoutOrder = 1,
					margin = p2.props.margin,
					maxWidth = p2.props.maxWidth,
					minWidth = p2.props.minWidth,
					screenSize = p2.props.screenSize,
					title = p2.props.title,
					titleContent = p2.props.titleContent,
					onCloseClicked = p2.props.onCloseClicked
				}),
				MiddleContent = p2.props.middleContent and roactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[fitFrameOnAxis] else fitFrameOnAxis, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					minimumSize = UDim2.new(1, 0, 0, 0),
					[roactModule.Ref] = if isRoactGamepadEnabled then p2.middleContentRef else nil,
					NextSelectionDown = if isRoactGamepadEnabled then if isMiddleContentFocusable then p2.buttonStackRef else nil else nil
				}, { Content = p2.props.middleContent() }),
				Footer = roactModule.createElement(fitFrameOnAxis, {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					contentPadding = UDim.new(0, 12),
					minimumSize = UDim2.new(1, 0, 0, 0)
				}, {
					Buttons = buttonStackInfo and roactModule.createElement(buttonStackModule, buttonStackInfo),
					FooterContent = p2.props.footerContent and roactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[fitFrameOnAxis] else fitFrameOnAxis, {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						minimumSize = UDim2.new(1, 0, 0, 0),
						[roactModule.Ref] = if isRoactGamepadEnabled then p2.footerContentRef else nil,
						NextSelectionUp = if isRoactGamepadEnabled then if isFooterContentFocusable then p2.buttonStackRef else nil else nil
					}, { Content = p2.props.footerContent() })
				})
			}) or nil
		})
	end)
end

return alert