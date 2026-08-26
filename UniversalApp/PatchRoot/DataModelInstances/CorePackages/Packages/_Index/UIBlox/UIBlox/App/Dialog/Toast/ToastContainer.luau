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

local function _(p1, p2, p3, p4)
	-- upvalues: getTextSizeModule (ref)
	return getTextSizeModule(p1, p3, p2, Vector2.new(p4, 10000)).Y
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

function toastContainer.init(p1)
	-- upvalues: roactModule (ref), imagesModule (ref), vector2 (ref), getTextSizeModule (ref), UIBloxConfigModule (ref), memoizeModule (ref), foundationButtonUtilsModule (ref), small (ref)
	p1.containerRef = roactModule.createRef()
	p1.isMounted = false
	p1.state = {
		containerWidth = 0,
		pressed = false,
		subtitleHeight = 0,
		titleHeight = 0
	}
	
	function p4.getIconSize()
		-- upvalues: p1 (ref), imagesModule (copy), vector2 (copy)
		local iconSize = p1.props.iconSize
		local iconImage = p1.props.iconImage
		local imagesResolutionScale = imagesModule.ImagesResolutionScale
		
		return if iconImage then iconSize or (if iconImage.ImageRectSize and imagesResolutionScale and imagesResolutionScale > 0 then iconImage.ImageRectSize / imagesResolutionScale else vector2) else Vector2.new(0, 0)
	end
	
	function p4.onButtonInputBegan(_, p2)
		-- upvalues: p1 (ref)
		if p2.UserInputState == Enum.UserInputState.Begin and (p2.UserInputType == Enum.UserInputType.Touch or p2.UserInputType == Enum.UserInputType.MouseButton1) and not p1.state.pressed then
			p1:setState({ pressed = true })
		end
	end
	
	function p4.onButtonInputEnded()
		-- upvalues: p1 (ref)
		if p1.state.pressed then
			p1:setState({ pressed = false })
		end
	end
	
	function p4.getTextHeights(p2)
		-- upvalues: p1 (ref), getTextSizeModule (copy)
		local iconImage = p1.props.iconImage
		local iconSize = p1.getIconSize()
		local buttonText = p1.props.buttonText
		local onActivated = p1.props.onActivated
		local padding = p1.props.padding
		local toastSubtitle = p1.props.toastSubtitle
		local toastTitle = p1.props.toastTitle
		local font = p2.Font
		local header2 = font.Header2
		local captionBody = font.CaptionBody
		local var1 = p1.state.containerWidth - padding * 2
		
		if iconImage then
			var1 = var1 - iconSize.X - padding
		end
		if buttonText and onActivated and not p1.showCompactToast() then
			var1 = var1 - p1.getButtonDimensions(p2).X - p1.getButtonGap()
		end
		return if toastSubtitle then math.max(0, getTextSizeModule(toastSubtitle, captionBody.RelativeSize * font.BaseSize, captionBody.Font, Vector2.new(var1, 10000)).Y) else 0, math.max(0, getTextSizeModule(toastTitle, header2.RelativeSize * font.BaseSize, header2.Font, Vector2.new(var1, 10000)).Y)
	end
	
	function p4.showCompactToast()
		-- upvalues: p1 (ref)
		return p1.state.containerWidth < 400
	end
	
	function p4.getButtonGap()
		-- upvalues: UIBloxConfigModule (copy), p1 (ref)
		return if UIBloxConfigModule.useFoundationToastButtonSizing then p1.props.padding else 0
	end
	
	function p4.showPressed()
		-- upvalues: p1 (ref)
		return if p1.props.buttonText or not p1.props.onActivated then nil else p1.state.pressed
	end
	
	p1.getButtonDimensions = memoizeModule(function(p2)
		-- upvalues: p1 (ref), UIBloxConfigModule (copy), foundationButtonUtilsModule (copy), small (copy), getTextSizeModule (copy)
		local buttonText = p1.props.buttonText
		
		if not buttonText or not p1.props.onActivated then
			return Vector2.new(0, 0)
		end
		local var1 = (if UIBloxConfigModule.useFoundationToastButtonSizing and UIBloxConfigModule.useFoundationButton then foundationButtonUtilsModule.getFitContentSize(buttonText, small, p2.Tokens) else nil) or (if UIBloxConfigModule.useFoundationToastButtonSizing then Vector2.new(32, 16) else Vector2.new(40, 40)) + getTextSizeModule(buttonText, p2.Font.Header2.RelativeSize * p2.Font.BaseSize, p2.Font.Header2.Font, Vector2.new(1000, 1000))
		
		return if p1.showCompactToast() then Vector2.new(math.min(var1.X, 200), var1.Y) else var1
	end)
end

function toastContainer.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref)
	local iconImage = p1.props.iconImage
	local iconSize = p1.getIconSize()
	local padding = p1.props.padding
	local toastSubtitle = p1.props.toastSubtitle
	local toastTitle = p1.props.toastTitle
	
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), iconSize (ref), padding (ref), roactModule (copy), iconImage (ref), toastSubtitle (ref), toastTitle (ref)
		local textHeights, textHeights_1 = p1.getTextHeights(p2)
		local var1 = textHeights_1 + textHeights
		local y = p1.getButtonDimensions(p2).Y
		local size = p1.props.size
		
		if p1.props.fitHeight then
			size = UDim2.new(size.X.Scale, size.X.Offset, 0, math.max(iconSize.Y, var1) + padding * 2 + (if p1.showCompactToast() and p1.props.buttonText and p1.props.onActivated then y + p1.getButtonGap() else 0))
		end
		local theme = p2.Theme
		local font = p2.Font
		
		return roactModule.createElement("TextButton", {
			AnchorPoint = p1.props.anchorPoint,
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			Size = size,
			Text = "",
			[roactModule.Change.AbsoluteSize] = function(p3)
				-- upvalues: p1 (copy)
				if p1.state.containerWidth ~= p3.AbsoluteSize.X then
					p1:setState({ containerWidth = p3.AbsoluteSize.X })
				end
			end,
			[roactModule.Event.Activated] = if not p1.props.buttonText then p1.props.onActivated else nil,
			[roactModule.Event.InputBegan] = p1.onButtonInputBegan,
			[roactModule.Event.InputEnded] = p1.onButtonInputEnded,
			[roactModule.Event.TouchSwipe] = p1.props.onTouchSwipe,
			[roactModule.Ref] = p1.containerRef
		}, {
			UISizeConstraint = roactModule.createElement("UISizeConstraint", p1.props.sizeConstraint),
			Toast = p1.props.renderToast({
				buttonProps = if p1.props.buttonText and p1.props.onActivated then {
					buttonDimensions = p1.getButtonDimensions(p2),
					buttonText = p1.props.buttonText,
					onActivated = p1.props.onActivated,
					buttonType = p1.props.buttonType
				} else nil,
				iconProps = iconImage and ({
					colorStyle = p1.props.iconColorStyle,
					Image = iconImage,
					Size = UDim2.new(0, iconSize.X, 0, iconSize.Y)
				} or nil),
				iconChildren = p1.props.iconChildren,
				isCompact = if p1.props.buttonText and p1.props.onActivated then p1.showCompactToast() else nil,
				padding = padding,
				pressed = p1.showPressed(),
				pressedScale = p1.props.pressedScale,
				subtitleTextProps = toastSubtitle and ({
					colorStyle = theme.TextEmphasis,
					fontStyle = font.CaptionBody,
					Size = UDim2.new(1, 0, 0, textHeights),
					Text = toastSubtitle
				} or nil),
				textFrameSize = UDim2.new(1, if iconImage then (-iconSize.X) - padding else 0, 0, var1),
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

function toastContainer.didMount(p1)
	p1:setState({
		containerWidth = if p1.containerRef.current then p1.containerRef.current.AbsoluteSize.X else 0
	})
end

return toastContainer