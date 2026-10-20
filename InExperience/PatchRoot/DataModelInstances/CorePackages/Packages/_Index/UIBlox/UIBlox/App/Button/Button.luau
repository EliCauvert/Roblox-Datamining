local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local Core = Parent2.Core
local ReactModule = require(Parent3.React)
local CryoModule = require(Parent3.Cryo)
local RoactGamepadModule = require(Parent3.RoactGamepad)
local TModule = require(Parent3.t)
local FoundationModule = require(Parent3.Foundation)
local FoundationButtonUtilsModule = require(Parent.FoundationButtonUtils)
local ValidateImageModule = require(Core.ImageSet.Validator.validateImage)
local ButtonTypeModule = require(Parent.Enum.ButtonType)
local GenericButtonModule = require(Core.Button.GenericButton)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local ImagesModule = require(Parent1.ImageSet.Images)
local CursorKindModule = require(Parent1.SelectionImage.CursorKind)
local WithSelectionCursorProviderModule = require(Parent1.SelectionImage.withSelectionCursorProvider)
local UseCursorModule = require(Parent2.App.SelectionCursor.useCursor)
local UIBloxConfigModule = require(Parent2.UIBloxConfig)
local Button = ReactModule.PureComponent:extend("Button")
local config = {
	[ButtonTypeModule.Alert] = { [ControlStateModule.Default] = "Alert" },
	[ButtonTypeModule.PrimaryContextual] = {
		[ControlStateModule.Default] = "ContextualPrimaryDefault",
		[ControlStateModule.Hover] = "ContextualPrimaryOnHover"
	},
	[ButtonTypeModule.PrimarySystem] = {
		[ControlStateModule.Default] = "SystemPrimaryDefault",
		[ControlStateModule.Hover] = "SystemPrimaryOnHover"
	},
	[ButtonTypeModule.Secondary] = {
		[ControlStateModule.Default] = "SecondaryDefault",
		[ControlStateModule.Hover] = "SecondaryOnHover"
	}
}
local config1 = {
	[ButtonTypeModule.Alert] = { [ControlStateModule.Default] = "Alert" },
	[ButtonTypeModule.PrimaryContextual] = {
		[ControlStateModule.Default] = "ContextualPrimaryContent"
	},
	[ButtonTypeModule.PrimarySystem] = { [ControlStateModule.Default] = "SystemPrimaryContent" },
	[ButtonTypeModule.Secondary] = {
		[ControlStateModule.Default] = "SecondaryContent",
		[ControlStateModule.Hover] = "SecondaryOnHover"
	}
}
local config2 = {
	[ButtonTypeModule.Alert] = ImagesModule["component_assets/circle_17_stroke_1"],
	[ButtonTypeModule.PrimaryContextual] = ImagesModule["component_assets/circle_17"],
	[ButtonTypeModule.PrimarySystem] = ImagesModule["component_assets/circle_17"],
	[ButtonTypeModule.Secondary] = ImagesModule["component_assets/circle_17_stroke_1"]
}
local config3 = {
	[ButtonTypeModule.PrimaryContextual] = ImagesModule["component_assets/bulletRight_17"],
	[ButtonTypeModule.PrimarySystem] = ImagesModule["component_assets/bulletRight_17"]
}
local config4 = {
	[ButtonTypeModule.Alert] = false,
	[ButtonTypeModule.PrimaryContextual] = true,
	[ButtonTypeModule.PrimarySystem] = false,
	[ButtonTypeModule.Secondary] = false
}
local _UDim = UDim.new(0, 8)
Button.validateProps = TModule.strictInterface({
	[ReactModule.Tag] = require(Parent2.Utility.isReactTagProp),
	buttonType = TModule.optional(ButtonTypeModule.isEnumValue),
	automaticSize = TModule.optional(TModule.EnumItem),
	size = TModule.optional(TModule.UDim2),
	standardSize = TModule.optional(require(Core.Button.Enum.StandardButtonSize).isEnumValue),
	maxWidth = TModule.optional(TModule.numberPositive),
	fitContent = TModule.optional(TModule.boolean),
	anchorPoint = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	layoutOrder = TModule.optional(TModule.number),
	icon = TModule.optional(ValidateImageModule),
	text = TModule.optional(TModule.string),
	inputIcon = TModule.optional(ValidateImageModule),
	fontStyle = TModule.optional(TModule.union(TModule.string, require(Core.Style.Validator.validateFontInfo), (require(Parent2.Core.Style.Validator.validateTypographyInfo)))),
	buttonTextOverride = TModule.optional(TModule.table),
	isDisabled = TModule.optional(TModule.boolean),
	isLoading = TModule.optional(TModule.boolean),
	isHoverBackgroundEnabled = TModule.optional(TModule.boolean),
	isDelayedInput = TModule.optional(TModule.boolean),
	enableInputDelayed = TModule.optional(TModule.boolean),
	delayInputSeconds = TModule.optional(TModule.numberPositive),
	onActivated = TModule.callback,
	onStateChanged = TModule.optional(TModule.callback),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	feedbackType = TModule.optional(TModule.string),
	Selectable = TModule.optional(TModule.boolean),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	buttonRef = TModule.optional(TModule.union(TModule.table, TModule.callback)),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean),
	cursor = TModule.optional(TModule.any),
	DO_NOT_USE_useUIBloxButton = TModule.optional(TModule.boolean),
	[ReactModule.Change.AbsoluteSize] = TModule.optional(TModule.callback),
	[ReactModule.Change.AbsolutePosition] = TModule.optional(TModule.callback)
})
Button.defaultProps = {
	isDisabled = false,
	isLoading = false,
	isRoactGamepadEnabled = true,
	buttonType = ButtonTypeModule.PrimarySystem
}

function Button.render(p1)
	-- upvalues: WithSelectionCursorProviderModule (copy), ReactModule (copy), RoactGamepadModule (copy), GenericButtonModule (copy), CursorKindModule (copy), config4 (copy), config2 (copy), config3 (copy), config (copy), config1 (copy)
	return WithSelectionCursorProviderModule(function(Callback)
		-- upvalues: p1 (copy), ReactModule (upval), RoactGamepadModule (upval), GenericButtonModule (upval), CursorKindModule (upval), config4 (upval), config2 (upval), config3 (upval), config (upval), config1 (upval)
		return ReactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable[GenericButtonModule] else GenericButtonModule, {
			[ReactModule.Tag] = p1.props[ReactModule.Tag],
			Size = p1.props.size,
			standardSize = p1.props.standardSize,
			maxWidth = p1.props.maxWidth,
			fitContent = p1.props.fitContent,
			AnchorPoint = p1.props.anchorPoint,
			Position = p1.props.position,
			LayoutOrder = p1.props.layoutOrder,
			SelectionImageObject = if p1.props.cursor then p1.props.cursor else Callback(CursorKindModule.RoundedRectNoInset),
			icon = p1.props.icon,
			text = p1.props.text,
			inputIcon = p1.props.inputIcon,
			fontStyle = p1.props.fontStyle,
			isDisabled = p1.props.isDisabled,
			isLoading = p1.props.isLoading,
			isHoverBackgroundEnabled = config4[p1.props.buttonType],
			isDelayedInput = p1.props.isDelayedInput,
			enableInputDelayed = p1.props.enableInputDelayed,
			delayInputSeconds = p1.props.delayInputSeconds,
			onActivated = p1.props.onActivated,
			onStateChanged = p1.props.onStateChanged,
			userInteractionEnabled = p1.props.userInteractionEnabled,
			buttonImage = config2[p1.props.buttonType],
			delayedInputImage = config3[p1.props.buttonType],
			buttonStateColorMap = config[p1.props.buttonType],
			contentStateColorMap = config1[p1.props.buttonType],
			buttonTextOverride = p1.props.buttonTextOverride,
			Selectable = p1.props.Selectable,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			ref = p1.props.buttonRef,
			feedbackType = p1.props.feedbackType,
			[ReactModule.Change.AbsoluteSize] = p1.props[ReactModule.Change.AbsoluteSize],
			[ReactModule.Change.AbsolutePosition] = p1.props[ReactModule.Change.AbsolutePosition]
		})
	end)
end

local function v27(p1)
	-- upvalues: UseCursorModule (copy), _UDim (copy), CryoModule (copy), ReactModule (copy), Button (copy)
	return ReactModule.createElement(Button, (CryoModule.Dictionary.join({ cursor = UseCursorModule(_UDim) }, p1)))
end

local ForwardRefResult = ReactModule.forwardRef(function(p1, p2)
	-- upvalues: UIBloxConfigModule (copy), FoundationModule (copy), CryoModule (copy), Button (copy), FoundationButtonUtilsModule (copy), ReactModule (copy), RoactGamepadModule (copy), v27 (copy)
	if UIBloxConfigModule.useFoundationButton and not p1.DO_NOT_USE_useUIBloxButton then
		local UseTokensResult = FoundationModule.Hooks.useTokens()
		local JoinResult = CryoModule.Dictionary.join(Button.defaultProps, p1)
		local IsRoactGamepadEnabled = JoinResult.isRoactGamepadEnabled
		local MaxWidth = FoundationButtonUtilsModule.getMaxWidth(JoinResult.standardSize, JoinResult.maxWidth)
		local UseRefResult = ReactModule.useRef(nil)
		local ButtonRef = p1.buttonRef or (p2 or UseRefResult)
		ReactModule.useLayoutEffect(function()
			-- upvalues: MaxWidth (copy), ButtonRef (copy)
			local UISizeConstraint = nil
			
			if MaxWidth and ButtonRef and typeof(ButtonRef) == "table" and ButtonRef.current then
				UISizeConstraint = Instance.new("UISizeConstraint")
				UISizeConstraint.MaxSize = Vector2.new(MaxWidth, 1e999)
				UISizeConstraint.Parent = ButtonRef.current
			end
			return function()
				-- upvalues: UISizeConstraint (ref)
				if UISizeConstraint then
					UISizeConstraint.Parent = nil
					UISizeConstraint:Destroy()
				end
			end
		end, { MaxWidth, ButtonRef })
		
		return ReactModule.createElement(if IsRoactGamepadEnabled then RoactGamepadModule.Focusable[FoundationModule.Button] else FoundationModule.Button, {
			variant = FoundationButtonUtilsModule.buttonMapping[JoinResult.buttonType],
			size = FoundationButtonUtilsModule.getSizeMapping(JoinResult.standardSize, JoinResult.size, UseTokensResult),
			width = FoundationButtonUtilsModule.getWidth(JoinResult.standardSize, JoinResult.size, JoinResult.fitContent),
			icon = FoundationButtonUtilsModule.findIcon(JoinResult.icon),
			text = JoinResult.text,
			isLoading = JoinResult.isLoading,
			isDisabled = JoinResult.isDisabled or (JoinResult.userInteractionEnabled == false or JoinResult.isDelayedInput and not JoinResult.enableInputDelayed),
			inputDelay = if JoinResult.isDelayedInput and JoinResult.enableInputDelayed then JoinResult.delayInputSeconds or 3 else nil,
			onActivated = JoinResult.onActivated,
			testId = FoundationButtonUtilsModule.getTestId(JoinResult[ReactModule.Tag]),
			ref = ButtonRef,
			AnchorPoint = JoinResult.anchorPoint,
			Position = JoinResult.position,
			LayoutOrder = JoinResult.layoutOrder,
			onAbsoluteSizeChanged = JoinResult[ReactModule.Change.AbsoluteSize],
			onAbsolutePositionChanged = JoinResult[ReactModule.Change.AbsolutePosition],
			Selectable = JoinResult.Selectable,
			NextSelectionUp = JoinResult.NextSelectionUp,
			NextSelectionDown = JoinResult.NextSelectionDown,
			NextSelectionLeft = JoinResult.NextSelectionLeft,
			NextSelectionRight = JoinResult.NextSelectionRight
		})
	else
		return ReactModule.createElement(v27, CryoModule.Dictionary.join(p1, { buttonRef = p1.buttonRef or p2 }))
	end
end)
ForwardRefResult.validateProps = Button.validateProps

return ForwardRefResult