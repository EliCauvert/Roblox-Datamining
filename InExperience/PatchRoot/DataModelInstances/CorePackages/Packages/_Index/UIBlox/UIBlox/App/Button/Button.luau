local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local core = parent_2.Core
local reactModule = require(parent_3.React)
local cryoModule = require(parent_3.Cryo)
local roactGamepadModule = require(parent_3.RoactGamepad)
local tModule = require(parent_3.t)
local foundationModule = require(parent_3.Foundation)
local foundationButtonUtilsModule = require(parent.FoundationButtonUtils)
local validateImageModule = require(core.ImageSet.Validator.validateImage)
local validateFontInfoModule = require(core.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(parent_2.Core.Style.Validator.validateTypographyInfo)
local buttonTypeModule = require(parent.Enum.ButtonType)
local standardButtonSizeModule = require(core.Button.Enum.StandardButtonSize)
local genericButtonModule = require(core.Button.GenericButton)
local controlStateModule = require(core.Control.Enum.ControlState)
local isReactTagPropModule = require(parent_2.Utility.isReactTagProp)
local imagesModule = require(parent_1.ImageSet.Images)
local cursorKindModule = require(parent_1.SelectionImage.CursorKind)
local withSelectionCursorProviderModule = require(parent_1.SelectionImage.withSelectionCursorProvider)
local useCursorModule = require(parent_2.App.SelectionCursor.useCursor)
local UIBloxConfigModule = require(parent_2.UIBloxConfig)
local button = reactModule.PureComponent:extend("Button")
local t = {
	[buttonTypeModule.Alert] = { [controlStateModule.Default] = "Alert" },
	[buttonTypeModule.PrimaryContextual] = {
		[controlStateModule.Default] = "ContextualPrimaryDefault",
		[controlStateModule.Hover] = "ContextualPrimaryOnHover"
	},
	[buttonTypeModule.PrimarySystem] = {
		[controlStateModule.Default] = "SystemPrimaryDefault",
		[controlStateModule.Hover] = "SystemPrimaryOnHover"
	},
	[buttonTypeModule.Secondary] = {
		[controlStateModule.Default] = "SecondaryDefault",
		[controlStateModule.Hover] = "SecondaryOnHover"
	}
}
local t_1 = {
	[buttonTypeModule.Alert] = { [controlStateModule.Default] = "Alert" },
	[buttonTypeModule.PrimaryContextual] = {
		[controlStateModule.Default] = "ContextualPrimaryContent"
	},
	[buttonTypeModule.PrimarySystem] = { [controlStateModule.Default] = "SystemPrimaryContent" },
	[buttonTypeModule.Secondary] = {
		[controlStateModule.Default] = "SecondaryContent",
		[controlStateModule.Hover] = "SecondaryOnHover"
	}
}
local t_2 = {
	[buttonTypeModule.Alert] = imagesModule["component_assets/circle_17_stroke_1"],
	[buttonTypeModule.PrimaryContextual] = imagesModule["component_assets/circle_17"],
	[buttonTypeModule.PrimarySystem] = imagesModule["component_assets/circle_17"],
	[buttonTypeModule.Secondary] = imagesModule["component_assets/circle_17_stroke_1"]
}
local t_3 = {
	[buttonTypeModule.PrimaryContextual] = imagesModule["component_assets/bulletRight_17"],
	[buttonTypeModule.PrimarySystem] = imagesModule["component_assets/bulletRight_17"]
}
local t_4 = {
	[buttonTypeModule.Alert] = false,
	[buttonTypeModule.PrimaryContextual] = true,
	[buttonTypeModule.PrimarySystem] = false,
	[buttonTypeModule.Secondary] = false
}
local uDim = UDim.new(0, 8)
button.validateProps = tModule.strictInterface({
	[reactModule.Tag] = isReactTagPropModule,
	buttonType = tModule.optional(buttonTypeModule.isEnumValue),
	automaticSize = tModule.optional(tModule.EnumItem),
	size = tModule.optional(tModule.UDim2),
	standardSize = tModule.optional(standardButtonSizeModule.isEnumValue),
	maxWidth = tModule.optional(tModule.numberPositive),
	fitContent = tModule.optional(tModule.boolean),
	anchorPoint = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	layoutOrder = tModule.optional(tModule.number),
	icon = tModule.optional(validateImageModule),
	text = tModule.optional(tModule.string),
	inputIcon = tModule.optional(validateImageModule),
	fontStyle = tModule.optional(tModule.union(tModule.string, validateFontInfoModule, validateTypographyInfoModule)),
	buttonTextOverride = tModule.optional(tModule.table),
	isDisabled = tModule.optional(tModule.boolean),
	isLoading = tModule.optional(tModule.boolean),
	isHoverBackgroundEnabled = tModule.optional(tModule.boolean),
	isDelayedInput = tModule.optional(tModule.boolean),
	enableInputDelayed = tModule.optional(tModule.boolean),
	delayInputSeconds = tModule.optional(tModule.numberPositive),
	onActivated = tModule.callback,
	onStateChanged = tModule.optional(tModule.callback),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	feedbackType = tModule.optional(tModule.string),
	Selectable = tModule.optional(tModule.boolean),
	NextSelectionDown = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	buttonRef = tModule.optional(tModule.union(tModule.table, tModule.callback)),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean),
	cursor = tModule.optional(tModule.any),
	DO_NOT_USE_useUIBloxButton = tModule.optional(tModule.boolean),
	[reactModule.Change.AbsoluteSize] = tModule.optional(tModule.callback),
	[reactModule.Change.AbsolutePosition] = tModule.optional(tModule.callback)
})
button.defaultProps = {
	isDisabled = false,
	isLoading = false,
	isRoactGamepadEnabled = true,
	buttonType = buttonTypeModule.PrimarySystem
}

function button.render(p1)
	-- upvalues: withSelectionCursorProviderModule (ref), reactModule (ref), roactGamepadModule (ref), genericButtonModule (ref), cursorKindModule (ref), t_4 (ref), t_2 (ref), t_3 (ref), t (ref), t_1 (ref)
	return withSelectionCursorProviderModule(function(p2)
		-- upvalues: p1 (ref), reactModule (copy), roactGamepadModule (copy), genericButtonModule (copy), cursorKindModule (copy), t_4 (copy), t_2 (copy), t_3 (copy), t (copy), t_1 (copy)
		return reactModule.createElement(if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable[genericButtonModule] else genericButtonModule, {
			[reactModule.Tag] = p1.props[reactModule.Tag],
			Size = p1.props.size,
			standardSize = p1.props.standardSize,
			maxWidth = p1.props.maxWidth,
			fitContent = p1.props.fitContent,
			AnchorPoint = p1.props.anchorPoint,
			Position = p1.props.position,
			LayoutOrder = p1.props.layoutOrder,
			SelectionImageObject = if p1.props.cursor then p1.props.cursor else p2(cursorKindModule.RoundedRectNoInset),
			icon = p1.props.icon,
			text = p1.props.text,
			inputIcon = p1.props.inputIcon,
			fontStyle = p1.props.fontStyle,
			isDisabled = p1.props.isDisabled,
			isLoading = p1.props.isLoading,
			isHoverBackgroundEnabled = t_4[p1.props.buttonType],
			isDelayedInput = p1.props.isDelayedInput,
			enableInputDelayed = p1.props.enableInputDelayed,
			delayInputSeconds = p1.props.delayInputSeconds,
			onActivated = p1.props.onActivated,
			onStateChanged = p1.props.onStateChanged,
			userInteractionEnabled = p1.props.userInteractionEnabled,
			buttonImage = t_2[p1.props.buttonType],
			delayedInputImage = t_3[p1.props.buttonType],
			buttonStateColorMap = t[p1.props.buttonType],
			contentStateColorMap = t_1[p1.props.buttonType],
			buttonTextOverride = p1.props.buttonTextOverride,
			Selectable = p1.props.Selectable,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			ref = p1.props.buttonRef,
			feedbackType = p1.props.feedbackType,
			[reactModule.Change.AbsoluteSize] = p1.props[reactModule.Change.AbsoluteSize],
			[reactModule.Change.AbsolutePosition] = p1.props[reactModule.Change.AbsolutePosition]
		})
	end)
end

local var1 = function(p1)
	-- upvalues: useCursorModule (ref), uDim (ref), cryoModule (ref), reactModule (ref), button (ref)
	return reactModule.createElement(button, cryoModule.Dictionary.join({ cursor = useCursorModule(uDim) }, p1))
end

local var2 = reactModule.forwardRef(function(p1, p2)
	-- upvalues: UIBloxConfigModule (ref), foundationModule (ref), cryoModule (ref), button (ref), foundationButtonUtilsModule (ref), reactModule (ref), roactGamepadModule (ref), var1 (ref)
	if not UIBloxConfigModule.useFoundationButton or p1.DO_NOT_USE_useUIBloxButton then
		return reactModule.createElement(var1, cryoModule.Dictionary.join(p1, { buttonRef = p1.buttonRef or p2 }))
	end
	local var3 = foundationModule.Hooks.useTokens()
	local var4 = cryoModule.Dictionary.join(button.defaultProps, p1)
	local isRoactGamepadEnabled = var4.isRoactGamepadEnabled
	local maxWidth = foundationButtonUtilsModule.getMaxWidth(var4.standardSize, var4.maxWidth)
	local buttonRef = p1.buttonRef or (p2 or reactModule.useRef(nil))
	reactModule.useLayoutEffect(function()
		-- upvalues: maxWidth (ref), buttonRef (ref)
		local UISizeConstraint = nil
		
		if maxWidth and buttonRef and (typeof(buttonRef) == "table" and buttonRef.current) then
			UISizeConstraint = Instance.new("UISizeConstraint")
			UISizeConstraint.MaxSize = Vector2.new(maxWidth, 1e999)
			UISizeConstraint.Parent = buttonRef.current
		end
		return function()
			-- upvalues: UISizeConstraint (write)
			if UISizeConstraint then
				UISizeConstraint.Parent = nil
				UISizeConstraint:Destroy()
			end
		end
	end, { maxWidth, buttonRef })
	
	return reactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[foundationModule.Button] else foundationModule.Button, {
		variant = foundationButtonUtilsModule.buttonMapping[var4.buttonType],
		size = foundationButtonUtilsModule.getSizeMapping(var4.standardSize, var4.size, var3),
		width = foundationButtonUtilsModule.getWidth(var4.standardSize, var4.size, var4.fitContent),
		icon = foundationButtonUtilsModule.findIcon(var4.icon),
		text = var4.text,
		isLoading = var4.isLoading,
		isDisabled = var4.isDisabled or (if var4.userInteractionEnabled ~= false then var4.isDelayedInput and not var4.enableInputDelayed else true),
		inputDelay = if var4.isDelayedInput and var4.enableInputDelayed then var4.delayInputSeconds or 3 else nil,
		onActivated = var4.onActivated,
		testId = foundationButtonUtilsModule.getTestId(var4[reactModule.Tag]),
		ref = buttonRef,
		AnchorPoint = var4.anchorPoint,
		Position = var4.position,
		LayoutOrder = var4.layoutOrder,
		Selectable = var4.Selectable,
		NextSelectionUp = var4.NextSelectionUp,
		NextSelectionDown = var4.NextSelectionDown,
		NextSelectionLeft = var4.NextSelectionLeft,
		NextSelectionRight = var4.NextSelectionRight
	})
end)
var2.validateProps = button.validateProps

return var2