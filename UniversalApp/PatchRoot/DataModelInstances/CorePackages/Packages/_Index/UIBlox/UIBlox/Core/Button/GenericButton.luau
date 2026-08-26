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

function genericButton.init(p1)
	-- upvalues: controlStateModule (ref), runService (ref), roactModule (ref)
	p1:setState({
		targetLoadingProgress = 1,
		controlState = controlStateModule.Initialize,
		absoluteSize = Vector2.new(100, 100),
		isButtonUnfocused = runService:GetRobloxGuiFocused()
	})
	
	function p0.onStateChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p3 })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, p3)
		end
	end
	
	function p0.onAbsoluteSizeChanged(p2)
		-- upvalues: p1 (ref), roactModule (copy)
		p1:setState({ absoluteSize = p2.AbsoluteSize })
		
		if p1.props[roactModule.Change.AbsoluteSize] then
			p1.props[roactModule.Change.AbsoluteSize](p2)
		end
	end
	
	function p0.onRobloxGuiFocusedChanged(p2)
		-- upvalues: p1 (ref)
		if p2 then
			p1:setState({ targetLoadingProgress = 1, isButtonUnfocused = true })
			
			return
		end
		p1:setState({ isButtonUnfocused = false })
	end
end

local var1 = tModule.interface({ [controlStateModule.Default] = tModule.string })
genericButton.validateProps = tModule.interface({
	icon = tModule.optional(validateImageModule),
	text = tModule.optional(tModule.string),
	inputIcon = tModule.optional(validateImageModule),
	buttonImage = validateImageModule,
	fontStyle = tModule.optional(tModule.union(tModule.string, validateFontInfoModule, validateTypographyInfoModule)),
	delayedInputImage = tModule.optional(validateImageModule),
	buttonStateColorMap = var1,
	contentStateColorMap = tModule.optional(var1),
	textStateColorMap = tModule.optional(var1),
	iconStateColorMap = tModule.optional(var1),
	inputIconStateColorMap = tModule.optional(var1),
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

function genericButton.didMount(p1)
	p1:setState({
		targetLoadingProgress = if p1.state.isButtonUnfocused or not p1.props.enableInputDelayed then 1 else 0
	})
end

function genericButton.render(p1)
	-- upvalues: withAnimationModule (ref)
	return if p1.props.isDelayedInput and not p1.state.isButtonUnfocused then withAnimationModule({ loadingProgress = p1.state.targetLoadingProgress }, function(p2)
		-- upvalues: p1 (ref)
		return p1:renderButton(math.clamp(p2.loadingProgress, 0, 1))
	end, {
		dampingRatio = 0.8,
		frequency = 1 / p1.props.delayInputSeconds
	}) elseif p1.state.isButtonUnfocused then p1:renderButton(1) else p1:renderButton()
end

function genericButton.renderButton(p1, p2)
	-- upvalues: withStyleModule (ref), tModule (ref), var1 (ref), getContentStyleModule (ref), controlStateModule (ref), standardButtonSizeModule (ref), roactModule (ref), skeleton (ref), getClosestRadiusModule (ref), UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), imageSetComponentModule (ref), genericTextLabelModule (ref), cryoModule (ref), interactableModule (ref), hoverButtonBackgroundModule (ref), eventConnection (ref), runService (ref)
	return withStyleModule(function(p3)
		-- upvalues: tModule (copy), p1 (ref), var1 (copy), p2 (ref), getContentStyleModule (copy), controlStateModule (copy), standardButtonSizeModule (copy), roactModule (copy), skeleton (copy), getClosestRadiusModule (copy), UIBloxConfigModule (copy), getIconSizeModule (copy), iconSizeModule (copy), imageSetComponentModule (copy), genericTextLabelModule (copy), cryoModule (copy), interactableModule (copy), hoverButtonBackgroundModule (copy), eventConnection (copy), runService (copy)
		assert(tModule.table(p3), "Style provider is missing.")
		local controlState = p1.state.controlState
		local text = p1.props.text
		local icon = p1.props.icon
		local inputIcon = p1.props.inputIcon
		local isLoading = p1.props.isLoading
		local isDisabled = p1.props.isDisabled
		local isDelayedInput = p1.props.isDelayedInput
		local userInteractionEnabled = p1.props.userInteractionEnabled
		local buttonImage = p1.props.buttonImage
		local fontStyle = p1.props.fontStyle
		local delayedInputImage = p1.props.delayedInputImage
		local buttonStateColorMap = p1.props.buttonStateColorMap
		local contentStateColorMap = p1.props.contentStateColorMap
		local textStateColorMap = p1.props.textStateColorMap or contentStateColorMap
		local iconStateColorMap = p1.props.iconStateColorMap or contentStateColorMap
		local inputIconStateColorMap = p1.props.inputIconStateColorMap or contentStateColorMap
		local size = p1.props.Size
		local standardSize = p1.props.standardSize
		local maxWidth = p1.props.maxWidth or 640
		local fitContent = p1.props.fitContent
		
		if text then
			assert(var1(textStateColorMap), "textStateColorMap is missing or invalid.")
		end
		if icon then
			assert(var1(iconStateColorMap), "iconStateColorMap is missing or invalid.")
		end
		if inputIcon then
			assert(var1(inputIconStateColorMap), "inputIconStateColorMap is missing or invalid.")
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
			fontStyle = p3.Font[fontStyle]
		end
		local var2 = if p2 == 1 then buttonImage else delayedInputImage
		
		if isDelayedInput and p2 ~= 0 then
			userInteractionEnabled = false
		end
		local var3 = getContentStyleModule(buttonStateColorMap, controlState, p3)
		local var4 = text and getContentStyleModule(textStateColorMap, controlState, p3)
		local var5 = icon and getContentStyleModule(iconStateColorMap, controlState, p3)
		local var6 = inputIcon and getContentStyleModule(inputIconStateColorMap, controlState, p3)
		local var7 = controlState == controlStateModule.Hover and p1.props.isHoverBackgroundEnabled == true
		local hoverImage = p1.props.hoverImage
		local var8 = 5
		
		if standardSize then
			local var9 = nil
			local var10 = nil
			
			if standardSize == standardButtonSizeModule.Regular then
				var9 = 48
				var8 = 12
				fontStyle = p3.Font.Header2
				var10 = false
			elseif standardSize == standardButtonSizeModule.Small then
				var9 = 36
				var8 = 8
				fontStyle = p3.Font.Header2
				var10 = false
			elseif standardSize == standardButtonSizeModule.XSmall then
				var9 = 28
				var8 = 8
				fontStyle = p3.Font.CaptionHeader
				var10 = true
			end
			if fitContent == nil then
				fitContent = var10
			end
			size = UDim2.new(if fitContent then 0 else 1, 0, 0, var9)
		end
		local t
		local _ = nil
		
		if isLoading then
			t = {
				isLoadingShimmer = roactModule.createElement(skeleton, {
					Size = if standardSize then UDim2.new(1, var8 * 2, 1, 0) else UDim2.new(1, 0, 1, 0),
					Position = if standardSize then UDim2.new(0, -var8, 0, 0) else nil,
					radius = getClosestRadiusModule(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then {
						None = p3.Tokens.Radius.None,
						Small = p3.Tokens.Radius.Small,
						Medium = p3.Tokens.Radius.Medium,
						Large = p3.Tokens.Size.Size_300,
						XLarge = p3.Tokens.Radius.Large,
						Circle = p3.Tokens.Radius.Circle
					} else p3.Tokens.Semantic.Radius, UDim.new(0, 8))
				})
			}
		else
			local var11 = p1.state.absoluteSize.Y - 10
			local var12 = (if standardSize and fitContent then maxWidth else p1.state.absoluteSize.X) - var8 * 2
			
			if icon then
				var12 -= 5 + getIconSizeModule(iconSizeModule.Medium)
			end
			local vector2 = Vector2.new(var12, var11)
			local children = p1.props[roactModule.Children]
			
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
						ImageColor3 = var5.Color,
						ImageTransparency = var5.Transparency
					}) or nil
				}
				
				if text then
					createElement = roactModule.createElement
					createElement = createElement(genericTextLabelModule, cryoModule.Dictionary.join({
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Text = text,
						fontStyle = fontStyle,
						colorStyle = var4,
						maxSize = vector2,
						TextWrapped = if standardSize then false else nil,
						TextTruncate = if standardSize then Enum.TextTruncate.AtEnd else nil,
						TextXAlignment = if standardSize and icon then Enum.TextXAlignment.Left else nil
					}, p1.props.buttonTextOverride or {})) or nil
				end
				children.Text = createElement
			end
			children = p1.props[roactModule.Children]
			
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
						ImageColor3 = var6.Color,
						ImageTransparency = var6.Transparency
					}) or nil
				}
			end
			t = children
		end
		return roactModule.createElement(interactableModule, cryoModule.Dictionary.join(p1.props, {
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
			[roactModule.Ref] = p1.props.forwardedRef,
			isDisabled = isDisabled,
			onStateChanged = p1.onStateChanged,
			userInteractionEnabled = userInteractionEnabled,
			Image = buttonImage,
			ScaleType = Enum.ScaleType.Slice,
			ImageColor3 = var3.Color,
			ImageTransparency = var3.Transparency,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			[roactModule.Event.Activated] = p1.props.onActivated,
			[roactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
		}), {
			UISizeConstraint = if standardSize and maxWidth then roactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(maxWidth, 1e999) }) else nil,
			UIPadding = if standardSize then roactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var8),
				PaddingRight = UDim.new(0, var8)
			}) else nil,
			ButtonContent = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = if fitContent then Enum.AutomaticSize.X else nil,
				Size = if fitContent then UDim2.fromScale(0, 1) else UDim2.fromScale(1, 1)
			}, t),
			LoadingImage = isDelayedInput and roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				ImageTransparency = 0.5,
				Size = UDim2.new(p2, 0, 1, 0),
				Position = UDim2.new(1, 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				Image = var2,
				ImageColor3 = Color3.new(0, 0, 0),
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = p1.props.SliceCenter
			}),
			HoverBackground = var7 and (roactModule.createElement(hoverButtonBackgroundModule, {
				sidePadding = if standardSize then UDim.new(0, var8) else nil,
				image = hoverImage,
				sliceCenter = p1.props.SliceCenter
			}) or nil),
			EventConnection = roactModule.createElement(eventConnection, {
				event = runService.RobloxGuiFocusedChanged,
				callback = p1.onRobloxGuiFocusedChanged
			})
		})
	end)
end

function genericButton.didUpdate(p1, p2, p3)
	if p1.props.enableInputDelayed ~= p2.enableInputDelayed then
		p1:setState({
			targetLoadingProgress = if p1.props.enableInputDelayed then 0 else 1
		})
	end
	if not p1.state.isButtonUnfocused and p3.isButtonUnfocused and (p1.state.targetLoadingProgress == 1 and p1.props.enableInputDelayed) then
		p1:setState({ targetLoadingProgress = 0 })
	end
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), genericButton (ref), cryoModule (ref)
	return roactModule.createElement(genericButton, cryoModule.Dictionary.join(p1, { forwardedRef = p2 }))
end)