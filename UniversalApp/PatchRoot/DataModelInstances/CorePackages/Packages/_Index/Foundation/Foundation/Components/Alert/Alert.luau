local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local AlertConstantsModule = require(Foundation.Components.AlertActions.AlertConstants)
local AlertSeverityModule = require(Foundation.Enums.AlertSeverity)
local AlertVariantModule = require(Foundation.Enums.AlertVariant)
local ButtonGroupModule = require(Foundation.Components.ButtonGroup)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local FlagsModule = require(Foundation.Utility.Flags)
local IconModule = require(Foundation.Components.Icon)
local IconSizeModule = require(Foundation.Enums.IconSize)
local InputSizeModule = require(Foundation.Enums.InputSize)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local EscapeRichTextModule = require(Foundation.Utility.escapeRichText)
local IsBuilderIconModule = require(Foundation.Utility.isBuilderIcon)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local UseAlertVariantsModule = require(script.Parent.useAlertVariants)
local IconVariant = require(Parent.BuilderIcons).IconVariant
local config = {
	testId = "--foundation-alert",
	variant = AlertVariantModule.Feedback,
	severity = AlertSeverityModule.Info
}
local config1 = {
	[AlertVariantModule.Standard] = AlertVariantModule.Feedback,
	[AlertVariantModule.Emphasis] = AlertVariantModule.Feedback
}
local Width = require(Foundation.Utility.Responsive.BreakpointConfig).widths[require(Foundation.Enums.Breakpoint).XSmall]

local function _(p1, p2) --[[ Line: 102 | Named "getTrailingLabels" ]]
	return if p1 then p1.text elseif p2 then `{p2.primary.text}|{if p2.secondary then p2.secondary.text else ""}` else ""
end

local function WrappingRichText(Frame) --[[ Line: 114 ]]
	-- upvalues: ReactModule (copy), TextModule (copy), ViewModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local AlertWidth = Frame.alertWidth
	
	return ReactModule.createElement(ViewModule, {
		tag = Frame.slot.tag,
		LayoutOrder = Frame.LayoutOrder,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 125 ]]
			-- upvalues: AlertWidth (copy), UseStateResult2 (copy)
			local X = Frame.AbsoluteSize.X
			
			if AlertWidth <= 0 or X <= AlertWidth then
				UseStateResult2(X)
			end
		end, { AlertWidth })
	}, {
		[`Label-{math.floor(UseStateResult)}`] = ReactModule.createElement(TextModule, {
			RichText = true,
			Text = Frame.text,
			tag = { ["size-full-0"] = true, [Frame.slot.tag] = true },
			padding = Frame.slot.padding,
			sizeConstraint = if UseStateResult > 0 then { MaxSize = Vector2.new(UseStateResult, 1e999) } else nil,
			stateLayer = Frame.stateLayer,
			onActivated = Frame.onActivated,
			testId = Frame.testId
		})
	})
end

return ReactModule.memo(ReactModule.forwardRef(function(p3, Ref) --[[ Line: 162 | Named "Alert" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), config1 (copy), ReactModule (copy), Width (copy), FlagsModule (copy), UseAlertVariantsModule (copy), ButtonVariantModule (copy), AlertConstantsModule (copy), IconVariant (copy), AlertSeverityModule (copy), IsBuilderIconModule (copy), IconModule (copy), IconSizeModule (copy), ViewModule (copy), WrappingRichText (copy), TextModule (copy), EscapeRichTextModule (copy), StateLayerAffordanceModule (copy), ButtonGroupModule (copy), InputSizeModule (copy), CloseAffordanceModule (copy), CloseAffordanceVariantModule (copy), WithCommonPropsModule (copy), AlertVariantModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p3, config)
	local UseTokensModuleResult = UseTokensModule()
	local Entry = config1[WithDefaultsModuleResult.variant] or WithDefaultsModuleResult.variant
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 169 ]]
		-- upvalues: UseStateResult2 (copy), WithDefaultsModuleResult (copy)
		UseStateResult2(Frame.AbsoluteSize)
		
		if WithDefaultsModuleResult.onAbsoluteSizeChanged then
			WithDefaultsModuleResult.onAbsoluteSizeChanged(Frame)
		end
	end, { WithDefaultsModuleResult.onAbsoluteSizeChanged })
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 177 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize.X)
	end, {})
	local Link = WithDefaultsModuleResult.link
	local Actions = WithDefaultsModuleResult.actions
	local Text = if Link then Link.text elseif Actions then `{Actions.primary.text}|{if Actions.secondary then Actions.secondary.text else ""}` else ""
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 184 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		if UseRefResult.current then
			UseStateResult2_1(0)
		end
		UseRefResult.current = true
	end, { Text })
	local IsXBelow: boolean = UseStateResult.X > 0 and UseStateResult.X <= Width
	local ScaledX = UseStateResult.X * (if FlagsModule.FoundationAlertStackTrailingOnOverflow then 0.3 else 0.4)
	local IsXBelow1: boolean = if FlagsModule.FoundationAlertStackTrailingOnOverflow then IsXBelow or ScaledX > 0 and ScaledX < UseStateResult1 else IsXBelow or WithDefaultsModuleResult.actions ~= nil and (ScaledX > 0 and ScaledX < UseStateResult1)
	local UseAlertVariantsModuleResult = UseAlertVariantsModule(UseTokensModuleResult, WithDefaultsModuleResult.severity, Entry, IsXBelow1)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 203 ]]
		-- upvalues: WithDefaultsModuleResult (copy), ButtonVariantModule (upval)
		if not WithDefaultsModuleResult.actions then
			return nil
		end
		local List = {
			{
				text = WithDefaultsModuleResult.actions.primary.text,
				onActivated = WithDefaultsModuleResult.actions.primary.onActivated,
				variant = ButtonVariantModule.Standard
			}
		}
		
		if WithDefaultsModuleResult.actions.secondary then
			table.insert(List, {
				text = WithDefaultsModuleResult.actions.secondary.text,
				onActivated = WithDefaultsModuleResult.actions.secondary.onActivated,
				variant = ButtonVariantModule.Utility
			})
		end
		return List
	end, { WithDefaultsModuleResult.actions })
	local SEVERITYTOICONEntry = AlertConstantsModule.SEVERITY_TO_ICON[WithDefaultsModuleResult.severity]
	local Filled = IconVariant.Filled
	local IconBackplate = UseAlertVariantsModuleResult.iconBackplate
	local Icon = WithDefaultsModuleResult.icon
	
	if Icon ~= nil and WithDefaultsModuleResult.severity == AlertSeverityModule.Info then
		local Icon1 = if typeof(Icon) == "string" then Icon else Icon.name
		
		if IsBuilderIconModule(Icon1) then
			SEVERITYTOICONEntry = Icon1
			Filled = if typeof(Icon) == "table" and Icon.variant then Icon.variant else IconVariant.Filled
			IconBackplate = nil
		end
	end
	local Element = ReactModule.createElement(IconModule, {
		LayoutOrder = 2,
		ZIndex = 2,
		name = SEVERITYTOICONEntry,
		size = IconSizeModule.Medium,
		variant = Filled,
		style = UseAlertVariantsModuleResult.icon.style,
		testId = `{WithDefaultsModuleResult.testId}--icon`
	})
	local Element1 = ReactModule.createElement(ViewModule, {
		tag = "align-y-center size-0-800 auto-x",
		LayoutOrder = 1
	}, {
		Content = if IconBackplate then ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			Size = UseAlertVariantsModuleResult.iconFrame.Size
		}, {
			Backplate = ReactModule.createElement(ViewModule, {
				LayoutOrder = 1,
				ZIndex = 1,
				Size = IconBackplate.Size,
				Position = IconBackplate.Position,
				tag = IconBackplate.tag,
				backgroundStyle = IconBackplate.backgroundStyle,
				testId = `{WithDefaultsModuleResult.testId}--icon-backplate`
			}),
			Icon = Element
		}) else Element
	})
	local Element2 = if WithDefaultsModuleResult.richText then ReactModule.createElement(WrappingRichText, {
		LayoutOrder = 2,
		slot = UseAlertVariantsModuleResult.message,
		text = WithDefaultsModuleResult.text,
		testId = `{WithDefaultsModuleResult.testId}--message`,
		alertWidth = UseStateResult.X
	}) else ReactModule.createElement(TextModule, {
		LayoutOrder = 2,
		Text = WithDefaultsModuleResult.text,
		tag = UseAlertVariantsModuleResult.message.tag,
		padding = UseAlertVariantsModuleResult.message.padding,
		testId = `{WithDefaultsModuleResult.testId}--message`
	})
	local UseResult2 = if IsXBelow1 then nil else UseResult1
	local Element21 = if WithDefaultsModuleResult.link then if IsXBelow1 and FlagsModule.FoundationAlertLinkWrap then ReactModule.createElement(WrappingRichText, {
		LayoutOrder = 3,
		slot = UseAlertVariantsModuleResult.link,
		text = `<u>{EscapeRichTextModule(WithDefaultsModuleResult.link.text)}</u>`,
		testId = `{WithDefaultsModuleResult.testId}--link`,
		alertWidth = UseStateResult.X,
		onActivated = WithDefaultsModuleResult.link.onActivated,
		stateLayer = { affordance = StateLayerAffordanceModule.None }
	}) else ReactModule.createElement(TextModule, {
		RichText = true,
		LayoutOrder = 3,
		Text = `<u>{EscapeRichTextModule(WithDefaultsModuleResult.link.text)}</u>`,
		tag = UseAlertVariantsModuleResult.link.tag,
		padding = UseAlertVariantsModuleResult.link.padding,
		sizeConstraint = if FlagsModule.FoundationAlertStackTrailingOnOverflow then nil elseif IsXBelow1 or ScaledX <= 0 then nil else { MaxSize = Vector2.new(ScaledX, 1e999) },
		stateLayer = { affordance = StateLayerAffordanceModule.None },
		onActivated = WithDefaultsModuleResult.link.onActivated,
		testId = `{WithDefaultsModuleResult.testId}--link`,
		onAbsoluteSizeChanged = UseResult2
	}) elseif UseMemoResult then ReactModule.createElement(ButtonGroupModule, {
		LayoutOrder = 3,
		buttons = UseMemoResult,
		size = InputSizeModule.Small,
		testId = `{WithDefaultsModuleResult.testId}--actions`,
		onAbsoluteSizeChanged = UseResult2
	}) else nil
	local Element3 = if WithDefaultsModuleResult.onClose then ReactModule.createElement(CloseAffordanceModule, {
		LayoutOrder = 4,
		onActivated = WithDefaultsModuleResult.onClose,
		size = InputSizeModule.Small,
		variant = CloseAffordanceVariantModule.Utility,
		testId = `{WithDefaultsModuleResult.testId}--close`
	}) else nil
	local Config = if IsXBelow1 then {
		Icon = Element1,
		Stack = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = UseAlertVariantsModuleResult.stack.tag,
			testId = `{WithDefaultsModuleResult.testId}--stack`
		}, { Message = Element2, Trailing = Element21 }),
		Close = Element3
	} else {
		Icon = Element1,
		Message = Element2,
		Trailing = Element21,
		Close = Element3
	}
	local WithCommonPropsModuleResult = WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = UseAlertVariantsModuleResult.container.tag,
		backgroundStyle = UseAlertVariantsModuleResult.container.backgroundStyle,
		ref = Ref
	})
	WithCommonPropsModuleResult.onAbsoluteSizeChanged = UseResult
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModuleResult, if Entry == AlertVariantModule.System then {
		TopBorder = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			Size = UseAlertVariantsModuleResult.border.Size,
			backgroundStyle = UseAlertVariantsModuleResult.border.backgroundStyle,
			testId = `{WithDefaultsModuleResult.testId}--top-border`
		}),
		Main = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = UseAlertVariantsModuleResult.main.tag
		}, Config),
		BottomBorder = ReactModule.createElement(ViewModule, {
			LayoutOrder = 3,
			Size = UseAlertVariantsModuleResult.border.Size,
			backgroundStyle = UseAlertVariantsModuleResult.border.backgroundStyle,
			testId = `{WithDefaultsModuleResult.testId}--bottom-border`
		})
	} else Config)
end))