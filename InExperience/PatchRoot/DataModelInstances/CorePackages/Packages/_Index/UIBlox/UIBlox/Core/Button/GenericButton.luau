local runService = game:GetService("RunService")
local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local UIBloxConfigModule = require(parent_2.UIBloxConfig)
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local cryoModule = require(parent_3.Cryo)
local foundationModule = require(parent_3.Foundation)
local eventConnection = require(parent_3.ReactUtils).EventConnection
local interactableModule = require(parent_1.Control.Interactable)
local controlStateModule = require(parent_1.Control.Enum.ControlState)
local getContentStyleModule = require(script.Parent.getContentStyle)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local imageSetComponentModule = require(parent_1.ImageSet.ImageSetComponent)
local skeleton = foundationModule.Skeleton
local iconSizeModule = require(parent_2.App.ImageSet.Enum.IconSize)
local getClosestRadiusModule = require(parent_2.App.Loading.getClosestRadius)
local getIconSizeModule = require(parent_2.App.ImageSet.getIconSize)
local genericTextLabelModule = require(parent_1.Text.GenericTextLabel.GenericTextLabel)
local withAnimationModule = require(parent_2.Core.Animation.withAnimation)
local validateFontInfoModule = require(parent_1.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(parent_2.Core.Style.Validator.validateTypographyInfo)
local hoverButtonBackgroundModule = require(parent_1.Button.HoverButtonBackground)
local standardButtonSizeModule = require(parent.Enum.StandardButtonSize)
local validateImageModule = require(parent_1.ImageSet.Validator.validateImage)
local genericButton = roactModule.PureComponent:extend("GenericButton")

function genericButton.init(p0)
	-- upvalues: controlStateModule (ref), runService (ref), roactModule (ref)
	p0:setState({
		targetLoadingProgress = 1,
		controlState = controlStateModule.Initialize,
		absoluteSize = Vector2.new(100, 100),
		isButtonUnfocused = runService:GetRobloxGuiFocused()
	})
	
	function p0.onStateChanged(p1, p2)
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p2 })
		
		if p0.props.onStateChanged then
			p0.props.onStateChanged(p1, p2)
		end
	end
	
	function p0.onAbsoluteSizeChanged(p3)
		-- upvalues: p0 (ref), roactModule (copy)
		p0:setState({ absoluteSize = p3.AbsoluteSize })
		
		if p0.props[roactModule.Change.AbsoluteSize] then
			p0.props[roactModule.Change.AbsoluteSize](p3)
		end
	end
	
	function p0.onRobloxGuiFocusedChanged(p4)
		-- upvalues: p0 (ref)
		if p4 then
			p0:setState({ targetLoadingProgress = 1, isButtonUnfocused = true })
			
			return
		end
		p0:setState({ isButtonUnfocused = false })
	end
end

local var22 = tModule.interface({ [controlStateModule.Default] = tModule.string })
genericButton.validateProps = tModule.interface({
	icon = tModule.optional(validateImageModule),
	text = tModule.optional(tModule.string),
	inputIcon = tModule.optional(validateImageModule),
	buttonImage = validateImageModule,
	fontStyle = tModule.optional(tModule.union(tModule.string, validateFontInfoModule, validateTypographyInfoModule)),
	delayedInputImage = tModule.optional(validateImageModule),
	buttonStateColorMap = var22,
	contentStateColorMap = tModule.optional(var22),
	textStateColorMap = tModule.optional(var22),
	iconStateColorMap = tModule.optional(var22),
	inputIconStateColorMap = tModule.optional(var22),
	isDisabled = tModule.optional(tModule.boolean),
	isLoading = tModule.optional(tModule.boolean),
	isDelayedInput = tModule.optional(tModule.boolean),
	isHoverBackgroundEnabled = tModule.optional(tModule.boolean),
	hoverImage = tModule.optional(validateImageModule),
	enableInputDelayed = tModule.optional(tModule.boolean),
	delayInputSeconds = tModule.optional(tModule.numberPositive),
	onActivated = tModule.callback,
	onStateChanged = tModule.optional(tModule.callback),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	standardSize = tModule.optional(standardButtonSizeModule.isEnumValue),
	maxWidth = tModule.optional(tModule.numberPositive),
	fitContent = tModule.optional(tModule.boolean),
	buttonTextOverride = tModule.optional(tModule.strictInterface({
		RichText = tModule.optional(tModule.boolean),
		Size = tModule.optional(tModule.UDim2),
		TextSize = tModule.optional(tModule.number),
		TextWrapped = tModule.optional(tModule.boolean),
		TextTruncate = tModule.optional(tModule.enum(Enum.TextTruncate)),
		TextXAlignment = tModule.optional(tModule.enum(Enum.TextXAlignment))
	})),
	forwardedRef = tModule.optional(tModule.union(tModule.table, tModule.callback)),
	feedbackType = tModule.optional(tModule.string)
})
genericButton.defaultProps = {
	fontStyle = "Header2",
	isDisabled = false,
	isLoading = false,
	isDelayedInput = false,
	enableInputDelayed = false,
	delayInputSeconds = 3,
	SliceCenter = Rect.new(8, 8, 9, 9)
}

function genericButton.didMount(p5)
	p5:setState({
		targetLoadingProgress = if p5.state.isButtonUnfocused or not p5.props.enableInputDelayed then 1 else 0
	})
end

function genericButton.render(p6)
	-- upvalues: withAnimationModule (ref)
	return if p6.props.isDelayedInput and not p6.state.isButtonUnfocused then withAnimationModule({ loadingProgress = p6.state.targetLoadingProgress }, function(p7)
		-- upvalues: p6 (ref)
		return p6:renderButton(math.clamp(p7.loadingProgress, 0, 1))
	end, {
		dampingRatio = 0.8,
		frequency = 1 / p6.props.delayInputSeconds
	}) elseif p6.state.isButtonUnfocused then p6:renderButton(1) else p6:renderButton()
end

function genericButton.renderButton(p8, p9)
	-- upvalues: withStyleModule (ref), tModule (ref), var22 (ref), getContentStyleModule (ref), controlStateModule (ref), standardButtonSizeModule (ref), roactModule (ref), skeleton (ref), getClosestRadiusModule (ref), UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), imageSetComponentModule (ref), genericTextLabelModule (ref), cryoModule (ref), interactableModule (ref), hoverButtonBackgroundModule (ref), eventConnection (ref), runService (ref)
	return withStyleModule(function(p10)
		-- upvalues: tModule (copy), p8 (ref), var22 (copy), p9 (ref), getContentStyleModule (copy), controlStateModule (copy), standardButtonSizeModule (copy), roactModule (copy), skeleton (copy), getClosestRadiusModule (copy), UIBloxConfigModule (copy), getIconSizeModule (copy), iconSizeModule (copy), imageSetComponentModule (copy), genericTextLabelModule (copy), cryoModule (copy), interactableModule (copy), hoverButtonBackgroundModule (copy), eventConnection (copy), runService (copy)
		assert(tModule.table(p10), "Style provider is missing.")
		local controlState = p8.state.controlState
		local text = p8.props.text
		local icon = p8.props.icon
		local inputIcon = p8.props.inputIcon
		local isLoading = p8.props.isLoading
		local isDisabled = p8.props.isDisabled
		local isDelayedInput = p8.props.isDelayedInput
		local userInteractionEnabled = p8.props.userInteractionEnabled
		local buttonImage = p8.props.buttonImage
		local fontStyle = p8.props.fontStyle
		local delayedInputImage = p8.props.delayedInputImage
		local buttonStateColorMap = p8.props.buttonStateColorMap
		local contentStateColorMap = p8.props.contentStateColorMap
		local textStateColorMap = p8.props.textStateColorMap or contentStateColorMap
		local iconStateColorMap = p8.props.iconStateColorMap or contentStateColorMap
		local inputIconStateColorMap = p8.props.inputIconStateColorMap or contentStateColorMap
		local size = p8.props.Size
		local standardSize = p8.props.standardSize
		local maxWidth = p8.props.maxWidth or 640
		local fitContent = p8.props.fitContent
		
		if text then
			assert(var22(textStateColorMap), "textStateColorMap is missing or invalid.")
		end
		if icon then
			assert(var22(iconStateColorMap), "iconStateColorMap is missing or invalid.")
		end
		if inputIcon then
			assert(var22(inputIconStateColorMap), "inputIconStateColorMap is missing or invalid.")
		end
		if isDelayedInput and delayedInputImage == nil then
			isDelayedInput = false
		end
		if isLoading then
			isDisabled = true
		end
		if isDisabled then
			isDelayedInput = false
		end
		if type(fontStyle) == "string" then
			fontStyle = p10.Font[fontStyle]
		end
		local var27 = if p9 == 1 then buttonImage else delayedInputImage
		
		if isDelayedInput and p9 ~= 0 then
			userInteractionEnabled = false
		end
		local var28 = getContentStyleModule(buttonStateColorMap, controlState, p10)
		local var29 = text and getContentStyleModule(textStateColorMap, controlState, p10)
		local var30 = icon and getContentStyleModule(iconStateColorMap, controlState, p10)
		local var31 = inputIcon and getContentStyleModule(inputIconStateColorMap, controlState, p10)
		local var32 = controlState == controlStateModule.Hover and p8.props.isHoverBackgroundEnabled == true
		local hoverImage = p8.props.hoverImage
		local var33 = 5
		
		if standardSize then
			local var34 = nil
			local var35 = nil
			
			if standardSize == standardButtonSizeModule.Regular then
				var34 = 48
				var33 = 12
				fontStyle = p10.Font.Header2
				var35 = false
			elseif standardSize == standardButtonSizeModule.Small then
				var34 = 36
				var33 = 8
				fontStyle = p10.Font.Header2
				var35 = false
			elseif standardSize == standardButtonSizeModule.XSmall then
				var34 = 28
				var33 = 8
				fontStyle = p10.Font.CaptionHeader
				var35 = true
			end
			if fitContent == nil then
				fitContent = var35
			end
			size = UDim2.new(if fitContent then 0 else 1, 0, 0, var34)
		end
		local t
		local _ = nil
		
		if isLoading then
			t = {
				isLoadingShimmer = roactModule.createElement(skeleton, {
					Size = if standardSize then UDim2.new(1, var33 * 2, 1, 0) else UDim2.new(1, 0, 1, 0),
					Position = if standardSize then UDim2.new(0, -var33, 0, 0) else nil,
					radius = getClosestRadiusModule(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then {
						None = p10.Tokens.Radius.None,
						Small = p10.Tokens.Radius.Small,
						Medium = p10.Tokens.Radius.Medium,
						Large = p10.Tokens.Size.Size_300,
						XLarge = p10.Tokens.Radius.Large,
						Circle = p10.Tokens.Radius.Circle
					} else p10.Tokens.Semantic.Radius, UDim.new(0, 8))
				})
			}
		else
			local var37 = p8.state.absoluteSize.Y - 10
			local var38 = (if standardSize and fitContent then maxWidth else p8.state.absoluteSize.X) - var33 * 2
			
			if icon then
				var38 -= 5 + getIconSizeModule(iconSizeModule.Medium)
			end
			local vector2 = Vector2.new(var38, var37)
			local children = p8.props[roactModule.Children]
			
			if not children then
				local createElement
				children = {
					UIListLayout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 5)
					}),
					Icon = icon and roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(0, getIconSizeModule(iconSizeModule.Medium), 0, getIconSizeModule(iconSizeModule.Medium)),
						Image = icon,
						ImageColor3 = var30.Color,
						ImageTransparency = var30.Transparency
					}) or nil
				}
				
				if text then
					createElement = roactModule.createElement
					createElement = createElement(genericTextLabelModule, cryoModule.Dictionary.join({
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Text = text,
						fontStyle = fontStyle,
						colorStyle = var29,
						maxSize = vector2,
						TextWrapped = if standardSize then false else nil,
						TextTruncate = if standardSize then Enum.TextTruncate.AtEnd else nil,
						TextXAlignment = if standardSize and icon then Enum.TextXAlignment.Left else nil
					}, p8.props.buttonTextOverride or {})) or nil
				end
				children.Text = createElement
			end
			children = p8.props[roactModule.Children]
			
			if not children then
				children = {
					ButtonMiddleContent = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = if fitContent then Enum.AutomaticSize.X else nil,
						Size = if fitContent then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1)
					}, children),
					ButtonIcon = inputIcon and roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(1, 0.5),
						Position = UDim2.new(1, -4, 0.5, 0),
						Size = UDim2.new(0, getIconSizeModule(iconSizeModule.Medium), 0, getIconSizeModule(iconSizeModule.Medium)),
						Image = inputIcon,
						ImageColor3 = var31.Color,
						ImageTransparency = var31.Transparency
					}) or nil
				}
			end
			t = children
		end
		return roactModule.createElement(interactableModule, cryoModule.Dictionary.join(p8.props, {
			forwardedRef = cryoModule.None,
			icon = cryoModule.None,
			text = cryoModule.None,
			inputIcon = cryoModule.None,
			buttonImage = cryoModule.None,
			fontStyle = cryoModule.None,
			delayedInputImage = cryoModule.None,
			buttonStateColorMap = cryoModule.None,
			contentStateColorMap = cryoModule.None,
			textStateColorMap = cryoModule.None,
			iconStateColorMap = cryoModule.None,
			inputIconStateColorMap = cryoModule.None,
			onActivated = cryoModule.None,
			isLoading = cryoModule.None,
			isHoverBackgroundEnabled = cryoModule.None,
			hoverImage = cryoModule.None,
			isDelayedInput = cryoModule.None,
			enableInputDelayed = cryoModule.None,
			delayInputSeconds = cryoModule.None,
			standardSize = cryoModule.None,
			maxWidth = cryoModule.None,
			fitContent = cryoModule.None,
			buttonTextOverride = cryoModule.None,
			[roactModule.Children] = cryoModule.None,
			Size = size,
			AutomaticSize = if fitContent then Enum.AutomaticSize.X else nil,
			[roactModule.Ref] = p8.props.forwardedRef,
			isDisabled = isDisabled,
			onStateChanged = p8.onStateChanged,
			userInteractionEnabled = userInteractionEnabled,
			Image = buttonImage,
			ScaleType = Enum.ScaleType.Slice,
			ImageColor3 = var28.Color,
			ImageTransparency = var28.Transparency,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[roactModule.Event.Activated] = p8.props.onActivated,
			[roactModule.Change.AbsoluteSize] = p8.onAbsoluteSizeChanged
		}), {
			UISizeConstraint = if standardSize and maxWidth then roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(maxWidth, 1e999) }) else nil,
			UIPadding = if standardSize then roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var33),
				PaddingRight = UDim.new(0, var33)
			}) else nil,
			ButtonContent = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = if fitContent then Enum.AutomaticSize.X else nil,
				Size = if fitContent then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1)
			}, t),
			LoadingImage = isDelayedInput and roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.5,
				Size = UDim2.new(p9, 0, 1, 0),
				Position = UDim2.new(1, 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Image = var27,
				ImageColor3 = Color3.new(0, 0, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = p8.props.SliceCenter
			}),
			HoverBackground = var32 and (roactModule.createElement(hoverButtonBackgroundModule, {
				sidePadding = if standardSize then UDim.new(0, var33) else nil,
				image = hoverImage,
				sliceCenter = p8.props.SliceCenter
			}) or nil),
			EventConnection = roactModule.createElement(eventConnection, {
				event = runService.RobloxGuiFocusedChanged,
				callback = p8.onRobloxGuiFocusedChanged
			})
		})
	end)
end

function genericButton.didUpdate(p11, p12, p13)
	if p11.props.enableInputDelayed ~= p12.enableInputDelayed then
		p11:setState({
			targetLoadingProgress = if p11.props.enableInputDelayed then 0 else 1
		})
	end
	if not p11.state.isButtonUnfocused and p13.isButtonUnfocused and (p11.state.targetLoadingProgress == 1 and p11.props.enableInputDelayed) then
		p11:setState({ targetLoadingProgress = 0 })
	end
end

return roactModule.forwardRef(function(p14, p15)
	-- upvalues: roactModule (ref), genericButton (ref), cryoModule (ref)
	return roactModule.createElement(genericButton, cryoModule.Dictionary.join(p14, { forwardedRef = p15 }))
end)