local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local RoactGamepadModule = require(Parent3.RoactGamepad)
local CryoModule = require(Parent3.Cryo)
local ImagesModule = require(Parent1.ImageSet.Images)
local ImageSetComponentModule = require(Parent2.Core.ImageSet.ImageSetComponent)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local ButtonStackModule = require(Parent1.Button.ButtonStack)
local FitFrameOnAxis = require(Parent3.FitFrame).FitFrameOnAxis
local AlertTypeModule = require(Parent.Enum.AlertType)
local AlertTitleModule = require(Parent.AlertTitle)
local Alert = RoactModule.PureComponent:extend("Alert")
Alert.validateProps = TModule.strictInterface({
	alertType = AlertTypeModule.isEnumValue,
	maxWidth = TModule.optional(TModule.number),
	minWidth = TModule.optional(TModule.number),
	margin = TModule.optional(TModule.table),
	anchorPoint = TModule.optional(TModule.Vector2),
	onMounted = TModule.optional(TModule.callback),
	onAbsoluteSizeChanged = TModule.optional(TModule.callback),
	position = TModule.optional(TModule.UDim2),
	screenSize = TModule.Vector2,
	title = TModule.string,
	titleContent = TModule.optional(TModule.callback),
	middleContent = TModule.optional(TModule.callback),
	buttonStackInfo = TModule.optional(ButtonStackModule.validateProps),
	footerContent = TModule.optional(TModule.callback),
	onCloseClicked = TModule.optional(TModule.callback),
	defaultChildRef = TModule.optional(TModule.union(TModule.table, TModule.callback)),
	isMiddleContentFocusable = TModule.optional(TModule.boolean),
	isFooterContentFocusable = TModule.optional(TModule.boolean),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
Alert.defaultProps = {
	maxWidth = 400,
	minWidth = 272,
	isRoactGamepadEnabled = true,
	anchorPoint = Vector2.new(0.5, 0.5),
	margin = { top = 0, bottom = 24, left = 24, right = 24 },
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function Alert.init(p1)
	-- upvalues: RoactModule (copy)
	p1.contentSize, p1.changeContentSize = RoactModule.createBinding(Vector2.new(0, 0))
	p1.middleContentRef = RoactModule.createRef()
	p1.footerContentRef = RoactModule.createRef()
	p1.buttonStackRef = RoactModule.createRef()
end

function Alert.didMount(p1)
	if p1.props.onMounted then
		p1.props.onMounted()
	end
end

function Alert.render(p1)
	-- upvalues: WithStyleModule (copy), AlertTypeModule (copy), CryoModule (copy), RoactModule (copy), RoactGamepadModule (copy), ImageSetComponentModule (copy), ImagesModule (copy), FitFrameOnAxis (copy), AlertTitleModule (copy), ButtonStackModule (copy)
	local IsMiddleContentFocusable = p1.props.isMiddleContentFocusable
	local IsFooterContentFocusable = p1.props.isFooterContentFocusable
	local IsRoactGamepadEnabled = p1.props.isRoactGamepadEnabled
	local ClampedValue = math.clamp(p1.props.screenSize.X - p1.props.margin.left - p1.props.margin.right, p1.props.minWidth, p1.props.maxWidth)
	
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), AlertTypeModule (upval), CryoModule (upval), RoactModule (upval), IsRoactGamepadEnabled (copy), IsMiddleContentFocusable (copy), IsFooterContentFocusable (copy), RoactGamepadModule (upval), ImageSetComponentModule (upval), ImagesModule (upval), FitFrameOnAxis (upval), ClampedValue (copy), AlertTitleModule (upval), ButtonStackModule (upval)
		local Theme = p2.Theme
		local Color = nil
		local Transparency = nil
		local Transparency1 = nil
		
		if p1.props.alertType == AlertTypeModule.Interactive then
			Color = Theme.BackgroundUIDefault.Color
			Transparency = Theme.BackgroundUIDefault.Transparency
			Transparency1 = 1
		else
			Transparency1 = Theme.BackgroundUIContrast.Transparency
			Transparency = 1
		end
		local ButtonStackInfo = p1.props.buttonStackInfo
		
		if ButtonStackInfo then
			ButtonStackInfo = CryoModule.Dictionary.join(ButtonStackInfo, {
				[RoactModule.Ref] = if IsRoactGamepadEnabled then p1.buttonStackRef else nil,
				NextSelectionUp = IsRoactGamepadEnabled and (IsMiddleContentFocusable and p1.middleContentRef) or nil,
				NextSelectionDown = IsRoactGamepadEnabled and (IsFooterContentFocusable and p1.footerContentRef) or nil,
				isRoactGamepadEnabled = IsRoactGamepadEnabled
			})
		end
		return RoactModule.createElement(if IsRoactGamepadEnabled then RoactGamepadModule.Focusable[ImageSetComponentModule.Button] else ImageSetComponentModule.Button, {
			Position = p1.props.position,
			AnchorPoint = p1.props.anchorPoint,
			Size = p1.contentSize:map(function(Vector): UDim2
				return UDim2.new(0, Vector.X, 0, Vector.Y)
			end),
			BackgroundColor3 = Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = Transparency1,
			BorderSizePixel = 0,
			Image = ImagesModule["component_assets/circle_17"],
			ImageColor3 = Color,
			ImageTransparency = Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9),
			AutoButtonColor = false,
			ClipsDescendants = true,
			Selectable = false,
			[RoactModule.Ref] = if IsRoactGamepadEnabled then p1.props.defaultChildRef else nil,
			[RoactModule.Change.AbsoluteSize] = p1.props.onAbsoluteSizeChanged,
			defaultChild = if IsRoactGamepadEnabled then p1.buttonStackRef else nil
		}, {
			AlertContents = RoactModule.createElement(FitFrameOnAxis, {
				contentPadding = UDim.new(0, 24),
				margin = p1.props.margin,
				minimumSize = UDim2.new(0, ClampedValue, 0, 0),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				[RoactModule.Change.AbsoluteSize] = function(Frame)
					-- upvalues: p1 (upval)
					p1.changeContentSize(Frame.AbsoluteSize)
				end
			}, {
				TitleContainer = RoactModule.createElement(AlertTitleModule, {
					layoutOrder = 1,
					margin = p1.props.margin,
					maxWidth = p1.props.maxWidth,
					minWidth = p1.props.minWidth,
					screenSize = p1.props.screenSize,
					title = p1.props.title,
					titleContent = p1.props.titleContent,
					onCloseClicked = p1.props.onCloseClicked
				}),
				MiddleContent = p1.props.middleContent and RoactModule.createElement(if IsRoactGamepadEnabled then RoactGamepadModule.Focusable[FitFrameOnAxis] else FitFrameOnAxis, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					minimumSize = UDim2.new(1, 0, 0, 0),
					[RoactModule.Ref] = if IsRoactGamepadEnabled then p1.middleContentRef else nil,
					NextSelectionDown = IsRoactGamepadEnabled and (IsMiddleContentFocusable and p1.buttonStackRef) or nil
				}, { Content = p1.props.middleContent() }),
				Footer = RoactModule.createElement(FitFrameOnAxis, {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					contentPadding = UDim.new(0, 12),
					minimumSize = UDim2.new(1, 0, 0, 0)
				}, {
					Buttons = ButtonStackInfo and RoactModule.createElement(ButtonStackModule, ButtonStackInfo),
					FooterContent = p1.props.footerContent and RoactModule.createElement(if IsRoactGamepadEnabled then RoactGamepadModule.Focusable[FitFrameOnAxis] else FitFrameOnAxis, {
						BackgroundTransparency = 1,
						LayoutOrder = 5,
						minimumSize = UDim2.new(1, 0, 0, 0),
						[RoactModule.Ref] = if IsRoactGamepadEnabled then p1.footerContentRef else nil,
						NextSelectionUp = IsRoactGamepadEnabled and (IsFooterContentFocusable and p1.buttonStackRef) or nil
					}, { Content = p1.props.footerContent() })
				})
			}) or nil
		})
	end)
end

return Alert