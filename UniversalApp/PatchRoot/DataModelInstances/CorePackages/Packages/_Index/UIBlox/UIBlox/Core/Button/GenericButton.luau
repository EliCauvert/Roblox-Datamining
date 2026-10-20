local RunService = game:GetService("RunService")
local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local CryoModule = require(Parent3.Cryo)
local EventConnection = require(Parent3.ReactUtils).EventConnection
local InteractableModule = require(Parent1.Control.Interactable)
local ControlStateModule = require(Parent1.Control.Enum.ControlState)
local GetContentStyleModule = require(script.Parent.getContentStyle)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local ImageSetComponentModule = require(Parent1.ImageSet.ImageSetComponent)
local Skeleton = require(Parent3.Foundation).Skeleton
local IconSizeModule = require(Parent2.App.ImageSet.Enum.IconSize)
local GetClosestRadiusModule = require(Parent2.App.Loading.getClosestRadius)
local GetIconSizeModule = require(Parent2.App.ImageSet.getIconSize)
local GenericTextLabelModule = require(Parent1.Text.GenericTextLabel.GenericTextLabel)
local WithAnimationModule = require(Parent2.Core.Animation.withAnimation)
local ValidateFontInfoModule = require(Parent1.Style.Validator.validateFontInfo)
local ValidateTypographyInfoModule = require(Parent2.Core.Style.Validator.validateTypographyInfo)
local HoverButtonBackgroundModule = require(Parent1.Button.HoverButtonBackground)
local StandardButtonSizeModule = require(Parent.Enum.StandardButtonSize)
local ValidateImageModule = require(Parent1.ImageSet.Validator.validateImage)
local GenericButton = RoactModule.PureComponent:extend("GenericButton")

function GenericButton.init(p1)
	-- upvalues: ControlStateModule (copy), RunService (copy), RoactModule (copy)
	p1:setState({
		targetLoadingProgress = 1,
		controlState = ControlStateModule.Initialize,
		absoluteSize = Vector2.new(100, 100),
		isButtonUnfocused = RunService:GetRobloxGuiFocused()
	})
	
	function p1.onStateChanged(p2, ControlState)
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, ControlState)
		end
	end
	
	function p1.onAbsoluteSizeChanged(Frame)
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ absoluteSize = Frame.AbsoluteSize })
		
		if p1.props[RoactModule.Change.AbsoluteSize] then
			p1.props[RoactModule.Change.AbsoluteSize](Frame)
		end
	end
	
	function p1.onRobloxGuiFocusedChanged(p2)
		-- upvalues: p1 (copy)
		if p2 then
			p1:setState({ targetLoadingProgress = 1, isButtonUnfocused = true })
			
			return
		else
			p1:setState({ isButtonUnfocused = false })
		end
	end
end

local InterfaceResult = TModule.interface({ [ControlStateModule.Default] = TModule.string })
GenericButton.validateProps = TModule.interface({
	icon = TModule.optional(ValidateImageModule),
	text = TModule.optional(TModule.string),
	inputIcon = TModule.optional(ValidateImageModule),
	buttonImage = ValidateImageModule,
	fontStyle = TModule.optional(TModule.union(TModule.string, ValidateFontInfoModule, ValidateTypographyInfoModule)),
	delayedInputImage = TModule.optional(ValidateImageModule),
	buttonStateColorMap = InterfaceResult,
	contentStateColorMap = TModule.optional(InterfaceResult),
	textStateColorMap = TModule.optional(InterfaceResult),
	iconStateColorMap = TModule.optional(InterfaceResult),
	inputIconStateColorMap = TModule.optional(InterfaceResult),
	isDisabled = TModule.optional(TModule.boolean),
	isLoading = TModule.optional(TModule.boolean),
	isDelayedInput = TModule.optional(TModule.boolean),
	isHoverBackgroundEnabled = TModule.optional(TModule.boolean),
	hoverImage = TModule.optional(ValidateImageModule),
	enableInputDelayed = TModule.optional(TModule.boolean),
	delayInputSeconds = TModule.optional(TModule.numberPositive),
	onActivated = TModule.callback,
	onStateChanged = TModule.optional(TModule.callback),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	standardSize = TModule.optional(StandardButtonSizeModule.isEnumValue),
	maxWidth = TModule.optional(TModule.numberPositive),
	fitContent = TModule.optional(TModule.boolean),
	buttonTextOverride = TModule.optional(TModule.strictInterface({
		RichText = TModule.optional(TModule.boolean),
		Size = TModule.optional(TModule.UDim2),
		TextSize = TModule.optional(TModule.number),
		TextWrapped = TModule.optional(TModule.boolean),
		TextTruncate = TModule.optional(TModule.enum(Enum.TextTruncate)),
		TextXAlignment = TModule.optional(TModule.enum(Enum.TextXAlignment))
	})),
	forwardedRef = TModule.optional(TModule.union(TModule.table, TModule.callback)),
	feedbackType = TModule.optional(TModule.string)
})
GenericButton.defaultProps = {
	fontStyle = "Header2",
	isDisabled = false,
	isLoading = false,
	isDelayedInput = false,
	enableInputDelayed = false,
	delayInputSeconds = 3,
	SliceCenter = Rect.new(8, 8, 9, 9)
}

function GenericButton.didMount(p1)
	p1:setState({
		targetLoadingProgress = if p1.state.isButtonUnfocused or not p1.props.enableInputDelayed then 1 else 0
	})
end

function GenericButton.render(p1)
	-- upvalues: WithAnimationModule (copy)
	local DelayInputSeconds: number = p1.props.delayInputSeconds
	local NoIsButtonUnfocused: boolean = p1.props.isDelayedInput and not p1.state.isButtonUnfocused
	
	return if NoIsButtonUnfocused then WithAnimationModule({ loadingProgress = p1.state.targetLoadingProgress }, function(p2)
		-- upvalues: p1 (copy)
		return p1:renderButton((math.clamp(p2.loadingProgress, 0, 1)))
	end, { dampingRatio = 0.8, frequency = 1 / DelayInputSeconds }) elseif p1.state.isButtonUnfocused then p1:renderButton(1) else p1:renderButton()
end

function GenericButton.renderButton(p1, XScale)
	-- upvalues: WithStyleModule (copy), TModule (copy), InterfaceResult (copy), GetContentStyleModule (copy), ControlStateModule (copy), StandardButtonSizeModule (copy), RoactModule (copy), Skeleton (copy), GetClosestRadiusModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), ImageSetComponentModule (copy), GenericTextLabelModule (copy), CryoModule (copy), InteractableModule (copy), HoverButtonBackgroundModule (copy), EventConnection (copy), RunService (copy)
	return WithStyleModule(function(p2)
		-- upvalues: TModule (upval), p1 (copy), InterfaceResult (upval), XScale (copy), GetContentStyleModule (upval), ControlStateModule (upval), StandardButtonSizeModule (upval), RoactModule (upval), Skeleton (upval), GetClosestRadiusModule (upval), GetIconSizeModule (upval), IconSizeModule (upval), ImageSetComponentModule (upval), GenericTextLabelModule (upval), CryoModule (upval), InteractableModule (upval), HoverButtonBackgroundModule (upval), EventConnection (upval), RunService (upval)
		assert(TModule.table(p2), "Style provider is missing.")
		local ControlState = p1.state.controlState
		local Text = p1.props.text
		local Icon = p1.props.icon
		local InputIcon = p1.props.inputIcon
		local IsLoading = p1.props.isLoading
		local IsDisabled = p1.props.isDisabled
		local IsDelayedInput = p1.props.isDelayedInput
		local UserInteractionEnabled = p1.props.userInteractionEnabled
		local ButtonImage = p1.props.buttonImage
		local FontStyle = p1.props.fontStyle
		local DelayedInputImage = p1.props.delayedInputImage
		local ButtonStateColorMap = p1.props.buttonStateColorMap
		local ContentStateColorMap = p1.props.contentStateColorMap
		local TextStateColorMap = p1.props.textStateColorMap or ContentStateColorMap
		local IconStateColorMap = p1.props.iconStateColorMap or ContentStateColorMap
		local InputIconStateColorMap = p1.props.inputIconStateColorMap or ContentStateColorMap
		local Size = p1.props.Size
		local StandardSize = p1.props.standardSize
		local MaxWidth = p1.props.maxWidth or 640
		local FitContent = p1.props.fitContent
		
		if Text then
			assert(InterfaceResult(TextStateColorMap), "textStateColorMap is missing or invalid.")
		end
		if Icon then
			assert(InterfaceResult(IconStateColorMap), "iconStateColorMap is missing or invalid.")
		end
		if InputIcon then
			assert(InterfaceResult(InputIconStateColorMap), "inputIconStateColorMap is missing or invalid.")
		end
		if IsDelayedInput and DelayedInputImage == nil then
			IsDelayedInput = false
		end
		if IsLoading then
			IsDisabled = true
		end
		if IsDisabled then
			IsDelayedInput = false
		end
		if type(FontStyle) == "string" then
			FontStyle = p2.Font[FontStyle]
		end
		local ButtonImage1 = if XScale == 1 then ButtonImage else DelayedInputImage
		
		if IsDelayedInput and XScale ~= 0 then
			UserInteractionEnabled = false
		end
		local ContentStyleModule = GetContentStyleModule(ButtonStateColorMap, ControlState, p2)
		local ContentStyleModule1 = Text and GetContentStyleModule(TextStateColorMap, ControlState, p2)
		local ContentStyleModule2 = Icon and GetContentStyleModule(IconStateColorMap, ControlState, p2)
		local ContentStyleModule3 = InputIcon and GetContentStyleModule(InputIconStateColorMap, ControlState, p2)
		local IsIsHoverBackgroundEnabled: boolean = ControlState == ControlStateModule.Hover and p1.props.isHoverBackgroundEnabled == true
		local HoverImage = p1.props.hoverImage
		local Offset = 5
		
		if StandardSize then
			local YOffset: number? = nil
			local Flag: boolean? = nil
			
			if StandardSize == StandardButtonSizeModule.Regular then
				YOffset = 48
				Offset = 12
				FontStyle = p2.Font.Header2
				Flag = false
			elseif StandardSize == StandardButtonSizeModule.Small then
				YOffset = 36
				Offset = 8
				FontStyle = p2.Font.Header2
				Flag = false
			elseif StandardSize == StandardButtonSizeModule.XSmall then
				YOffset = 28
				Offset = 8
				FontStyle = p2.Font.CaptionHeader
				Flag = true
			end
			if FitContent == nil then
				FitContent = Flag
			end
			Size = UDim2.new(if FitContent then 0 else 1, 0, 0, YOffset)
		end
		local Prop = nil
		if IsLoading then
			Prop = {
				isLoadingShimmer = RoactModule.createElement(Skeleton, {
					Size = if StandardSize then UDim2.new(1, Offset * 2, 1, 0) else UDim2.new(1, 0, 1, 0),
					Position = if StandardSize then UDim2.new(0, -Offset, 0, 0) else nil,
					radius = GetClosestRadiusModule({
						None = p2.Tokens.Radius.None,
						Small = p2.Tokens.Radius.Small,
						Medium = p2.Tokens.Radius.Medium,
						Large = p2.Tokens.Size.Size_300,
						XLarge = p2.Tokens.Radius.Large,
						Circle = p2.Tokens.Radius.Circle
					}, UDim.new(0, 8))
				})
			}
		else
			local YDelta = p1.state.absoluteSize.Y - 10
			local X = (if StandardSize and FitContent then MaxWidth else p1.state.absoluteSize.X) - Offset * 2
			
			if Icon then
				X -= 5 + GetIconSizeModule(IconSizeModule.Medium)
			end
			local _Vector2 = Vector2.new(X, YDelta)
			local Prop1 = p1.props[RoactModule.Children] or {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 5)
				}),
				Icon = Icon and RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(0, GetIconSizeModule(IconSizeModule.Medium), 0, GetIconSizeModule(IconSizeModule.Medium)),
					Image = Icon,
					ImageColor3 = ContentStyleModule2.Color,
					ImageTransparency = ContentStyleModule2.Transparency
				}) or nil,
				Text = Text and RoactModule.createElement(GenericTextLabelModule, CryoModule.Dictionary.join({
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Text = Text,
					fontStyle = FontStyle,
					colorStyle = ContentStyleModule1,
					maxSize = _Vector2,
					TextWrapped = not StandardSize and nil,
					TextTruncate = if StandardSize then Enum.TextTruncate.AtEnd else nil,
					TextXAlignment = if StandardSize and Icon then Enum.TextXAlignment.Left else nil
				}, p1.props.buttonTextOverride or {})) or nil
			}
			Prop = p1.props[RoactModule.Children] or {
				ButtonMiddleContent = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = if FitContent then Enum.AutomaticSize.X else nil,
					Size = if FitContent then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1)
				}, Prop1),
				ButtonIcon = InputIcon and RoactModule.createElement(ImageSetComponentModule.Label, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -4, 0.5, 0),
					Size = UDim2.new(0, GetIconSizeModule(IconSizeModule.Medium), 0, GetIconSizeModule(IconSizeModule.Medium)),
					Image = InputIcon,
					ImageColor3 = ContentStyleModule3.Color,
					ImageTransparency = ContentStyleModule3.Transparency
				}) or nil
			}
		end
		return RoactModule.createElement(InteractableModule, CryoModule.Dictionary.join(p1.props, {
			forwardedRef = CryoModule.None,
			icon = CryoModule.None,
			text = CryoModule.None,
			inputIcon = CryoModule.None,
			buttonImage = CryoModule.None,
			fontStyle = CryoModule.None,
			delayedInputImage = CryoModule.None,
			buttonStateColorMap = CryoModule.None,
			contentStateColorMap = CryoModule.None,
			textStateColorMap = CryoModule.None,
			iconStateColorMap = CryoModule.None,
			inputIconStateColorMap = CryoModule.None,
			onActivated = CryoModule.None,
			isLoading = CryoModule.None,
			isHoverBackgroundEnabled = CryoModule.None,
			hoverImage = CryoModule.None,
			isDelayedInput = CryoModule.None,
			enableInputDelayed = CryoModule.None,
			delayInputSeconds = CryoModule.None,
			standardSize = CryoModule.None,
			maxWidth = CryoModule.None,
			fitContent = CryoModule.None,
			buttonTextOverride = CryoModule.None,
			[RoactModule.Children] = CryoModule.None,
			Size = Size,
			AutomaticSize = if FitContent then Enum.AutomaticSize.X else nil,
			[RoactModule.Ref] = p1.props.forwardedRef,
			isDisabled = IsDisabled,
			onStateChanged = p1.onStateChanged,
			userInteractionEnabled = UserInteractionEnabled,
			Image = ButtonImage,
			ScaleType = Enum.ScaleType.Slice,
			ImageColor3 = ContentStyleModule.Color,
			ImageTransparency = ContentStyleModule.Transparency,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[RoactModule.Event.Activated] = p1.props.onActivated,
			[RoactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
		}), {
			UISizeConstraint = if StandardSize and MaxWidth then RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(MaxWidth, 1e999) }) else nil,
			UIPadding = if StandardSize then RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Offset),
				PaddingRight = UDim.new(0, Offset)
			}) else nil,
			ButtonContent = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = if FitContent then Enum.AutomaticSize.X else nil,
				Size = if FitContent then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1)
			}, Prop),
			LoadingImage = IsDelayedInput and RoactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.5,
				Size = UDim2.new(XScale, 0, 1, 0),
				Position = UDim2.new(1, 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Image = ButtonImage1,
				ImageColor3 = Color3.new(0, 0, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = p1.props.SliceCenter
			}),
			HoverBackground = IsIsHoverBackgroundEnabled and RoactModule.createElement(HoverButtonBackgroundModule, {
				sidePadding = if StandardSize then UDim.new(0, Offset) else nil,
				image = HoverImage,
				sliceCenter = p1.props.SliceCenter
			}) or nil,
			EventConnection = RoactModule.createElement(EventConnection, {
				event = RunService.RobloxGuiFocusedChanged,
				callback = p1.onRobloxGuiFocusedChanged
			})
		})
	end)
end

function GenericButton.didUpdate(p1, p2, p3)
	if p1.props.enableInputDelayed ~= p2.enableInputDelayed then
		p1:setState({
			targetLoadingProgress = if p1.props.enableInputDelayed then 0 else 1
		})
	end
	if not p1.state.isButtonUnfocused and p3.isButtonUnfocused and p1.state.targetLoadingProgress == 1 and p1.props.enableInputDelayed then
		p1:setState({ targetLoadingProgress = 0 })
	end
end

return RoactModule.forwardRef(function(p1, ForwardedRef)
	-- upvalues: RoactModule (copy), GenericButton (copy), CryoModule (copy)
	return RoactModule.createElement(GenericButton, CryoModule.Dictionary.join(p1, { forwardedRef = ForwardedRef }))
end)