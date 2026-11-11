local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local GetTextSizeModule = require(Parent1.Core.Text.GetTextSize)
local ImagesModule = require(Parent1.App.ImageSet.Images)
local MemoizeModule = require(Parent1.Utility.memoize)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local _Vector2 = Vector2.new(36, 36)

local function _(p1, p2, p3, X)
	-- upvalues: GetTextSizeModule (copy)
	return GetTextSizeModule(p1, p3, p2, (Vector2.new(X, 10000))).Y
end

local ToastContainer = RoactModule.PureComponent:extend("ToastContainer")
ToastContainer.validateProps = TModule.strictInterface({
	anchorPoint = TModule.optional(TModule.Vector2),
	buttonText = TModule.optional(TModule.string),
	fitHeight = TModule.optional(TModule.boolean),
	iconColorStyle = TModule.optional((require(Parent1.Core.Style.Validator.validateColorInfo))),
	iconImage = TModule.optional(TModule.union(TModule.table, TModule.string, TModule.callback)),
	iconSize = TModule.optional(TModule.Vector2),
	iconChildren = TModule.optional(TModule.table),
	layoutOrder = TModule.optional(TModule.integer),
	onActivated = TModule.optional(TModule.callback),
	onTouchSwipe = TModule.optional(TModule.callback),
	padding = TModule.numberMin(0),
	position = TModule.UDim2,
	pressedScale = TModule.optional(TModule.number),
	renderToast = TModule.callback,
	size = TModule.UDim2,
	sizeConstraint = TModule.optional(TModule.table),
	toastSubtitle = TModule.optional(TModule.string),
	toastTitle = TModule.string,
	buttonType = TModule.optional(require(Parent.Button.Enum.ButtonType).isEnumValue)
})
ToastContainer.defaultProps = {
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

function ToastContainer.init(p1)
	-- upvalues: RoactModule (copy), ImagesModule (copy), _Vector2 (copy), GetTextSizeModule (copy), MemoizeModule (copy)
	p1.containerRef = RoactModule.createRef()
	p1.isMounted = false
	p1.state = {
		containerWidth = 0,
		pressed = false,
		subtitleHeight = 0,
		titleHeight = 0
	}
	
	function p1.getIconSize()
		-- upvalues: p1 (copy), ImagesModule (upval), _Vector2 (upval)
		local IconSize = p1.props.iconSize
		local IconImage = p1.props.iconImage
		local ImagesResolutionScale: number = ImagesModule.ImagesResolutionScale
		
		return if IconImage then if IconSize then IconSize elseif IconImage.ImageRectSize and ImagesResolutionScale and ImagesResolutionScale > 0 then IconImage.ImageRectSize / ImagesResolutionScale else _Vector2 else Vector2.new(0, 0)
	end
	
	function p1:onButtonInputBegan(Input)
		-- upvalues: p1 (copy)
		if Input.UserInputState == Enum.UserInputState.Begin and (Input.UserInputType == Enum.UserInputType.Touch or Input.UserInputType == Enum.UserInputType.MouseButton1) and not p1.state.pressed then
			p1:setState({ pressed = true })
		end
	end
	
	function p1.onButtonInputEnded()
		-- upvalues: p1 (copy)
		if p1.state.pressed then
			p1:setState({ pressed = false })
		end
	end
	
	function p1.getTextHeights(p2)
		-- upvalues: p1 (copy), GetTextSizeModule (upval)
		local IconSize = p1.getIconSize()
		local ButtonText = p1.props.buttonText
		local Padding: number = p1.props.padding
		local ToastSubtitle = p1.props.toastSubtitle
		local ToastTitle = p1.props.toastTitle
		local _Font = p2.Font
		local Header2 = _Font.Header2
		local CaptionBody = _Font.CaptionBody
		local ContainerWidthDelta = p1.state.containerWidth - Padding * 2
		
		if p1.props.iconImage then
			ContainerWidthDelta = ContainerWidthDelta - IconSize.X - Padding
		end
		if ButtonText and not p1.showCompactToast() then
			ContainerWidthDelta -= p1.getButtonDimensions(p2).X
		end
		return if ToastSubtitle then math.max(0, GetTextSizeModule(ToastSubtitle, CaptionBody.RelativeSize * _Font.BaseSize, CaptionBody.Font, (Vector2.new(ContainerWidthDelta, 10000))).Y) else 0, (math.max(0, GetTextSizeModule(ToastTitle, Header2.RelativeSize * _Font.BaseSize, Header2.Font, (Vector2.new(ContainerWidthDelta, 10000))).Y))
	end
	
	function p1.showCompactToast(): boolean
		-- upvalues: p1 (copy)
		return p1.state.containerWidth < 400
	end
	
	function p1.showPressed()
		-- upvalues: p1 (copy)
		return if p1.props.buttonText or not p1.props.onActivated then nil else p1.state.pressed
	end
	
	p1.getButtonDimensions = MemoizeModule(function(p2)
		-- upvalues: p1 (copy), GetTextSizeModule (upval)
		local ButtonText = p1.props.buttonText
		local OnActivated = p1.props.onActivated
		
		if ButtonText and OnActivated then
			local NewVector = Vector2.new(30, 30) + Vector2.new(10, 10) + GetTextSizeModule(ButtonText, p2.Font.Header2.RelativeSize * p2.Font.BaseSize, p2.Font.Header2.Font, Vector2.new(1000, 1000))
			
			return if p1.showCompactToast() then Vector2.new(math.min(NewVector.X, 200), NewVector.Y) else NewVector
		else
			return Vector2.new(0, 0)
		end
	end)
end

function ToastContainer.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy)
	local IconImage = p1.props.iconImage
	local IconSize = p1.getIconSize()
	local Padding = p1.props.padding
	local ToastSubtitle = p1.props.toastSubtitle
	local ToastTitle = p1.props.toastTitle
	
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), IconSize (copy), Padding (copy), RoactModule (upval), IconImage (copy), ToastSubtitle (copy), ToastTitle (copy)
		local TextHeights, TextHeights2 = p1.getTextHeights(p2)
		local YOffset = TextHeights2 + TextHeights
		local Y = p1.getButtonDimensions(p2).Y
		local Size = p1.props.size
		
		if p1.props.fitHeight then
			Size = UDim2.new(Size.X.Scale, Size.X.Offset, 0, math.max(IconSize.Y, YOffset) + Padding * 2 + (if p1.showCompactToast() and p1.props.buttonText then Y else 0))
		end
		local Theme = p2.Theme
		local _Font = p2.Font
		local CaptionBody = _Font.CaptionBody
		
		return RoactModule.createElement("TextButton", {
			AnchorPoint = p1.props.anchorPoint,
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			Size = Size,
			Text = "",
			[RoactModule.Change.AbsoluteSize] = function(Frame: Frame)
				-- upvalues: p1 (upval)
				if p1.state.containerWidth ~= Frame.AbsoluteSize.X then
					p1:setState({ containerWidth = Frame.AbsoluteSize.X })
				end
			end,
			[RoactModule.Event.Activated] = if p1.props.buttonText then nil else p1.props.onActivated,
			[RoactModule.Event.InputBegan] = p1.onButtonInputBegan,
			[RoactModule.Event.InputEnded] = p1.onButtonInputEnded,
			[RoactModule.Event.TouchSwipe] = p1.props.onTouchSwipe,
			[RoactModule.Ref] = p1.containerRef
		}, {
			UISizeConstraint = RoactModule.createElement("UISizeConstraint", p1.props.sizeConstraint),
			Toast = p1.props.renderToast({
				buttonProps = if p1.props.buttonText and p1.props.onActivated then {
					buttonDimensions = p1.getButtonDimensions(p2),
					buttonText = p1.props.buttonText,
					onActivated = p1.props.onActivated,
					buttonType = p1.props.buttonType
				} else nil,
				iconProps = IconImage and {
					colorStyle = p1.props.iconColorStyle,
					Image = IconImage,
					Size = UDim2.new(0, IconSize.X, 0, IconSize.Y)
				} or nil,
				iconChildren = p1.props.iconChildren,
				isCompact = if p1.props.buttonText and p1.props.onActivated then p1.showCompactToast() else nil,
				padding = Padding,
				pressed = p1.showPressed(),
				pressedScale = p1.props.pressedScale,
				subtitleTextProps = ToastSubtitle and {
					colorStyle = Theme.TextEmphasis,
					fontStyle = CaptionBody,
					Size = UDim2.new(1, 0, 0, TextHeights),
					Text = ToastSubtitle
				} or nil,
				textFrameSize = UDim2.new(1, IconImage and -IconSize.X - Padding or 0, 0, YOffset),
				titleTextProps = {
					colorStyle = Theme.TextEmphasis,
					fontStyle = _Font.Header2,
					Size = UDim2.new(1, 0, 0, TextHeights2),
					Text = ToastTitle
				}
			})
		})
	end)
end

function ToastContainer.didMount(p1)
	p1:setState({
		containerWidth = p1.containerRef.current and p1.containerRef.current.AbsoluteSize.X or 0
	})
end

return ToastContainer