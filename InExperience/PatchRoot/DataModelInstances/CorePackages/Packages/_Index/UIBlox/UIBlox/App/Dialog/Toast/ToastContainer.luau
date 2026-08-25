local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local getTextSizeModule = require(parent_1.Core.Text.GetTextSize)
local imagesModule = require(parent_1.App.ImageSet.Images)
local memoizeModule = require(parent_1.Utility.memoize)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local validateColorInfoModule = require(parent_1.Core.Style.Validator.validateColorInfo)
local buttonTypeModule = require(parent.Button.Enum.ButtonType)
local foundationButtonUtilsModule = require(parent.Button.FoundationButtonUtils)
local standardButtonSizeModule = require(parent_1.Core.Button.Enum.StandardButtonSize)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local vector2 = Vector2.new(36, 36)
local small = standardButtonSizeModule.Small

local function _(p0, p1, p2, p3)
	-- upvalues: getTextSizeModule (ref)
	return getTextSizeModule(p0, p2, p1, Vector2.new(p3, 10000)).Y
end

local toastContainer = roactModule.PureComponent:extend("ToastContainer")
toastContainer.validateProps = tModule.strictInterface({
	anchorPoint = tModule.optional(tModule.Vector2),
	buttonText = tModule.optional(tModule.string),
	fitHeight = tModule.optional(tModule.boolean),
	iconColorStyle = tModule.optional(validateColorInfoModule),
	iconImage = tModule.optional(tModule.union(tModule.table, tModule.string, tModule.callback)),
	iconSize = tModule.optional(tModule.Vector2),
	iconChildren = tModule.optional(tModule.table),
	layoutOrder = tModule.optional(tModule.integer),
	onActivated = tModule.optional(tModule.callback),
	onTouchSwipe = tModule.optional(tModule.callback),
	padding = tModule.numberMin(0),
	position = tModule.UDim2,
	pressedScale = tModule.optional(tModule.number),
	renderToast = tModule.callback,
	size = tModule.UDim2,
	sizeConstraint = tModule.optional(tModule.table),
	toastSubtitle = tModule.optional(tModule.string),
	toastTitle = tModule.string,
	buttonType = tModule.optional(buttonTypeModule.isEnumValue)
})
toastContainer.defaultProps = {
	fitHeight = true,
	padding = 12,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.new(0, 0, 0, 0),
	size = UDim2.new(1, -24, 0, 0),
	sizeConstraint = {
		MaxSize = Vector2.new(400, 1e999),
		MinSize = Vector2.new(24, 60)
	}
}

function toastContainer.init(p4)
	-- upvalues: roactModule (ref), imagesModule (ref), vector2 (ref), getTextSizeModule (ref), UIBloxConfigModule (ref), memoizeModule (ref), foundationButtonUtilsModule (ref), small (ref)
	p4.containerRef = roactModule.createRef()
	p4.isMounted = false
	p4.state = {
		containerWidth = 0,
		pressed = false,
		subtitleHeight = 0,
		titleHeight = 0
	}
	
	function p4.getIconSize()
		-- upvalues: p4 (ref), imagesModule (copy), vector2 (copy)
		local iconSize = p4.props.iconSize
		local iconImage = p4.props.iconImage
		local imagesResolutionScale = imagesModule.ImagesResolutionScale
		
		return if iconImage then iconSize or (if iconImage.ImageRectSize and imagesResolutionScale and imagesResolutionScale > 0 then iconImage.ImageRectSize / imagesResolutionScale else vector2) else Vector2.new(0, 0)
	end
	
	function p4.onButtonInputBegan(_, p5)
		-- upvalues: p4 (ref)
		if p5.UserInputState == Enum.UserInputState.Begin and (p5.UserInputType == Enum.UserInputType.Touch or p5.UserInputType == Enum.UserInputType.MouseButton1) and not p4.state.pressed then
			p4:setState({ pressed = true })
		end
	end
	
	function p4.onButtonInputEnded()
		-- upvalues: p4 (ref)
		if p4.state.pressed then
			p4:setState({ pressed = false })
		end
	end
	
	function p4.getTextHeights(p6)
		-- upvalues: p4 (ref), getTextSizeModule (copy)
		local iconImage = p4.props.iconImage
		local iconSize = p4.getIconSize()
		local buttonText = p4.props.buttonText
		local onActivated = p4.props.onActivated
		local padding = p4.props.padding
		local toastSubtitle = p4.props.toastSubtitle
		local toastTitle = p4.props.toastTitle
		local font = p6.Font
		local header2 = font.Header2
		local captionBody = font.CaptionBody
		local var14 = p4.state.containerWidth - padding * 2
		
		if iconImage then
			var14 = var14 - iconSize.X - padding
		end
		if buttonText and onActivated and not p4.showCompactToast() then
			var14 = var14 - p4.getButtonDimensions(p6).X - p4.getButtonGap()
		end
		return if toastSubtitle then math.max(0, getTextSizeModule(toastSubtitle, captionBody.RelativeSize * font.BaseSize, captionBody.Font, Vector2.new(var14, 10000)).Y) else 0, math.max(0, getTextSizeModule(toastTitle, header2.RelativeSize * font.BaseSize, header2.Font, Vector2.new(var14, 10000)).Y)
	end
	
	function p4.showCompactToast()
		-- upvalues: p4 (ref)
		return p4.state.containerWidth < 400
	end
	
	function p4.getButtonGap()
		-- upvalues: UIBloxConfigModule (copy), p4 (ref)
		return if UIBloxConfigModule.useFoundationToastButtonSizing then p4.props.padding else 0
	end
	
	function p4.showPressed()
		-- upvalues: p4 (ref)
		return if p4.props.buttonText or not p4.props.onActivated then nil else p4.state.pressed
	end
	
	p4.getButtonDimensions = memoizeModule(function(p7)
		-- upvalues: p4 (ref), UIBloxConfigModule (copy), foundationButtonUtilsModule (copy), small (copy), getTextSizeModule (copy)
		local buttonText = p4.props.buttonText
		
		if not buttonText or not p4.props.onActivated then
			return Vector2.new(0, 0)
		end
		local var15 = (if UIBloxConfigModule.useFoundationToastButtonSizing and UIBloxConfigModule.useFoundationButton then foundationButtonUtilsModule.getFitContentSize(buttonText, small, p7.Tokens) else nil) or (if UIBloxConfigModule.useFoundationToastButtonSizing then Vector2.new(32, 16) else Vector2.new(40, 40)) + getTextSizeModule(buttonText, p7.Font.Header2.RelativeSize * p7.Font.BaseSize, p7.Font.Header2.Font, Vector2.new(1000, 1000))
		
		return if p4.showCompactToast() then Vector2.new(math.min(var15.X, 200), var15.Y) else var15
	end)
end

function toastContainer.render(p8)
	-- upvalues: withStyleModule (ref), roactModule (ref)
	local iconImage = p8.props.iconImage
	local iconSize = p8.getIconSize()
	local padding = p8.props.padding
	local toastSubtitle = p8.props.toastSubtitle
	local toastTitle = p8.props.toastTitle
	
	return withStyleModule(function(p9)
		-- upvalues: p8 (ref), iconSize (ref), padding (ref), roactModule (copy), iconImage (ref), toastSubtitle (ref), toastTitle (ref)
		local textHeights, textHeights_1 = p8.getTextHeights(p9)
		local var19 = textHeights_1 + textHeights
		local y = p8.getButtonDimensions(p9).Y
		local size = p8.props.size
		
		if p8.props.fitHeight then
			size = UDim2.new(size.X.Scale, size.X.Offset, 0, math.max(iconSize.Y, var19) + padding * 2 + (if p8.showCompactToast() and p8.props.buttonText and p8.props.onActivated then y + p8.getButtonGap() else 0))
		end
		local theme = p9.Theme
		local font = p9.Font
		
		return roactModule.createElement("TextButton", {
			AnchorPoint = p8.props.anchorPoint,
			BackgroundTransparency = 1,
			LayoutOrder = p8.props.layoutOrder,
			Position = p8.props.position,
			Size = size,
			Text = "",
			[roactModule.Change.AbsoluteSize] = function(p10)
				-- upvalues: p8 (copy)
				if p8.state.containerWidth ~= p10.AbsoluteSize.X then
					p8:setState({ containerWidth = p10.AbsoluteSize.X })
				end
			end,
			[roactModule.Event.Activated] = if not p8.props.buttonText then p8.props.onActivated else nil,
			[roactModule.Event.InputBegan] = p8.onButtonInputBegan,
			[roactModule.Event.InputEnded] = p8.onButtonInputEnded,
			[roactModule.Event.TouchSwipe] = p8.props.onTouchSwipe,
			[roactModule.Ref] = p8.containerRef
		}, {
			UISizeConstraint = roactModule.createElement("UISizeConstraint", p8.props.sizeConstraint),
			Toast = p8.props.renderToast({
				buttonProps = if p8.props.buttonText and p8.props.onActivated then {
					buttonDimensions = p8.getButtonDimensions(p9),
					buttonText = p8.props.buttonText,
					onActivated = p8.props.onActivated,
					buttonType = p8.props.buttonType
				} else nil,
				iconProps = iconImage and ({
					colorStyle = p8.props.iconColorStyle,
					Image = iconImage,
					Size = UDim2.new(0, iconSize.X, 0, iconSize.Y)
				} or nil),
				iconChildren = p8.props.iconChildren,
				isCompact = if p8.props.buttonText and p8.props.onActivated then p8.showCompactToast() else nil,
				padding = padding,
				pressed = p8.showPressed(),
				pressedScale = p8.props.pressedScale,
				subtitleTextProps = toastSubtitle and ({
					colorStyle = theme.TextEmphasis,
					fontStyle = font.CaptionBody,
					Size = UDim2.new(1, 0, 0, textHeights),
					Text = toastSubtitle
				} or nil),
				textFrameSize = UDim2.new(1, if iconImage then (-iconSize.X) - padding else 0, 0, var19),
				titleTextProps = {
					colorStyle = theme.TextEmphasis,
					fontStyle = font.Header2,
					Size = UDim2.new(1, 0, 0, textHeights_1),
					Text = toastTitle
				}
			})
		})
	end)
end

function toastContainer.didMount(p11)
	p11:setState({
		containerWidth = if p11.containerRef.current then p11.containerRef.current.AbsoluteSize.X else 0
	})
end

return toastContainer