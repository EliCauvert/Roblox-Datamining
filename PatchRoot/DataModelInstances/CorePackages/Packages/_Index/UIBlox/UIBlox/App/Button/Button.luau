-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:51 2026 Pacific Standard Time.

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

function button.render(p0) --[[ line: 173 ]]
	-- upvalues: withSelectionCursorProviderModule (ref), reactModule (ref), roactGamepadModule (ref), genericButtonModule (ref), cursorKindModule (ref), t_4 (ref), t_2 (ref), t_3 (ref), t (ref), t_1 (ref)
	return withSelectionCursorProviderModule(function(p1) --[[ line: 174 ]]
		-- upvalues: p0 (ref), reactModule (copy), roactGamepadModule (copy), genericButtonModule (copy), cursorKindModule (copy), t_4 (copy), t_2 (copy), t_3 (copy), t (copy), t_1 (copy)
		return reactModule.createElement(if p0.props.isRoactGamepadEnabled then roactGamepadModule.Focusable[genericButtonModule] else genericButtonModule, {
			[reactModule.Tag] = p0.props[reactModule.Tag],
			Size = p0.props.size,
			standardSize = p0.props.standardSize,
			maxWidth = p0.props.maxWidth,
			fitContent = p0.props.fitContent,
			AnchorPoint = p0.props.anchorPoint,
			Position = p0.props.position,
			LayoutOrder = p0.props.layoutOrder,
			SelectionImageObject = if p0.props.cursor then p0.props.cursor else p1(cursorKindModule.RoundedRectNoInset),
			icon = p0.props.icon,
			text = p0.props.text,
			inputIcon = p0.props.inputIcon,
			fontStyle = p0.props.fontStyle,
			isDisabled = p0.props.isDisabled,
			isLoading = p0.props.isLoading,
			isHoverBackgroundEnabled = t_4[p0.props.buttonType],
			isDelayedInput = p0.props.isDelayedInput,
			enableInputDelayed = p0.props.enableInputDelayed,
			delayInputSeconds = p0.props.delayInputSeconds,
			onActivated = p0.props.onActivated,
			onStateChanged = p0.props.onStateChanged,
			userInteractionEnabled = p0.props.userInteractionEnabled,
			buttonImage = t_2[p0.props.buttonType],
			delayedInputImage = t_3[p0.props.buttonType],
			buttonStateColorMap = t[p0.props.buttonType],
			contentStateColorMap = t_1[p0.props.buttonType],
			buttonTextOverride = p0.props.buttonTextOverride,
			Selectable = p0.props.Selectable,
			NextSelectionUp = p0.props.NextSelectionUp,
			NextSelectionDown = p0.props.NextSelectionDown,
			NextSelectionLeft = p0.props.NextSelectionLeft,
			NextSelectionRight = p0.props.NextSelectionRight,
			ref = p0.props.buttonRef,
			feedbackType = p0.props.feedbackType,
			[reactModule.Change.AbsoluteSize] = p0.props[reactModule.Change.AbsoluteSize],
			[reactModule.Change.AbsolutePosition] = p0.props[reactModule.Change.AbsolutePosition]
		})
	end)
end

local var26 = function(p2) --[[ line: 227 ]]
	-- upvalues: useCursorModule (ref), uDim (ref), cryoModule (ref), reactModule (ref), button (ref)
	return reactModule.createElement(button, cryoModule.Dictionary.join({ cursor = useCursorModule(uDim) }, p2))
end

local var27 = reactModule.forwardRef(function(p3, p4) --[[ line: 235 ]]
	-- upvalues: UIBloxConfigModule (ref), foundationModule (ref), cryoModule (ref), button (ref), foundationButtonUtilsModule (ref), reactModule (ref), roactGamepadModule (ref), var26 (ref)
	if not UIBloxConfigModule.useFoundationButton or p3.DO_NOT_USE_useUIBloxButton then
		return reactModule.createElement(var26, cryoModule.Dictionary.join(p3, { buttonRef = p3.buttonRef or p4 }))
	end
	local var28 = foundationModule.Hooks.useTokens()
	local var29 = cryoModule.Dictionary.join(button.defaultProps, p3)
	local isRoactGamepadEnabled = var29.isRoactGamepadEnabled
	local maxWidth = foundationButtonUtilsModule.getMaxWidth(var29.standardSize, var29.maxWidth)
	local buttonRef = p3.buttonRef or (p4 or reactModule.useRef(nil))
	reactModule.useLayoutEffect(function() --[[ line: 246 ]]
		-- upvalues: maxWidth (ref), buttonRef (ref)
		local UISizeConstraint = nil
		
		if maxWidth and buttonRef and (typeof(buttonRef) == "table" and buttonRef.current) then
			UISizeConstraint = Instance.new("UISizeConstraint")
			UISizeConstraint.MaxSize = Vector2.new(maxWidth, 1e999)
			UISizeConstraint.Parent = buttonRef.current
		end
		return function() --[[ line: 254 ]]
			-- upvalues: UISizeConstraint (write)
			if UISizeConstraint then
				UISizeConstraint.Parent = nil
				UISizeConstraint:Destroy()
			end
		end
	end, { maxWidth, buttonRef })
	
	return reactModule.createElement(if isRoactGamepadEnabled then roactGamepadModule.Focusable[foundationModule.Button] else foundationModule.Button, {
		variant = foundationButtonUtilsModule.buttonMapping[var29.buttonType],
		size = foundationButtonUtilsModule.getSizeMapping(var29.standardSize, var29.size, var28),
		width = foundationButtonUtilsModule.getWidth(var29.standardSize, var29.size, var29.fitContent),
		icon = foundationButtonUtilsModule.findIcon(var29.icon),
		text = var29.text,
		isLoading = var29.isLoading,
		isDisabled = var29.isDisabled or (if var29.userInteractionEnabled ~= false then var29.isDelayedInput and not var29.enableInputDelayed else true),
		inputDelay = if var29.isDelayedInput and var29.enableInputDelayed then var29.delayInputSeconds or 3 else nil,
		onActivated = var29.onActivated,
		testId = foundationButtonUtilsModule.getTestId(var29[reactModule.Tag]),
		ref = buttonRef,
		AnchorPoint = var29.anchorPoint,
		Position = var29.position,
		LayoutOrder = var29.layoutOrder,
		Selectable = var29.Selectable,
		NextSelectionUp = var29.NextSelectionUp,
		NextSelectionDown = var29.NextSelectionDown,
		NextSelectionLeft = var29.NextSelectionLeft,
		NextSelectionRight = var29.NextSelectionRight
	})
end)
var27.validateProps = button.validateProps

return var27