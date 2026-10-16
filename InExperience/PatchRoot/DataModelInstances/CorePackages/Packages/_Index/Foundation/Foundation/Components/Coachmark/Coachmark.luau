local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Foundation.Constants)
local ButtonModule = require(Foundation.Components.Button)
local ButtonGroupModule = require(Foundation.Components.ButtonGroup)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local FlagsModule = require(Foundation.Utility.Flags)
local InputSizeModule = require(Foundation.Enums.InputSize)
local LoggerModule = require(Foundation.Utility.Logger)
local OrientationModule = require(Foundation.Enums.Orientation)
local PopoverModule = require(Foundation.Components.Popover)
local PresentationContextModule = require(Foundation.Providers.Style.PresentationContext)
local RadiusModule = require(Foundation.Enums.Radius)
local TextModule = require(Foundation.Components.Text)
local TranslatorModule = require(Foundation.Utility.Localization.Translator)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseScaledValueModule = require(Foundation.Utility.useScaledValue)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	isOpen = false,
	hasArrow = true,
	testId = "--foundation-coachmark",
	align = require(Foundation.Enums.PopoverAlign).Start,
	side = require(Foundation.Enums.PopoverSide).Right
}
local config1 = {
	colorNamespace = require(Foundation.Enums.ColorNamespace).Inverse
}

local function _(Current, Total) --[[ Line: 89 | Named "stepsText" ]]
	-- upvalues: TranslatorModule (copy)
	return TranslatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = Current, total = Total })
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 93 | Named "Coachmark" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseScaledValueModule (copy), FlagsModule (copy), ConstantsModule (copy), ReactModule (copy), LoggerModule (copy), InputSizeModule (copy), FillBehaviorModule (copy), DashModule (copy), ButtonModule (copy), PopoverModule (copy), WithCommonPropsModule (copy), RadiusModule (copy), PresentationContextModule (copy), config1 (copy), ViewModule (copy), CloseAffordanceModule (copy), CloseAffordanceVariantModule (copy), TextModule (copy), TranslatorModule (copy), ButtonGroupModule (copy), OrientationModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseScaledValueModuleResult = UseScaledValueModule(if FlagsModule.FoundationEducationalTooltipRefresh then ConstantsModule.TOOLTIP_MAX_WIDTH else 320)
	local UseScaledValueModuleResult1 = UseScaledValueModule(240)
	local UseScaledValueModuleResult2 = if FlagsModule.FoundationEducationalTooltipMinMediaWidth then if WithDefaultsModuleResult.media then UseScaledValueModuleResult1 else UseTokensModuleResult.Size.Size_3000 else UseScaledValueModuleResult1
	local Config = if FlagsModule.FoundationEducationalTooltipMinMediaWidth then nil elseif WithDefaultsModuleResult.onClose then {
		MaxSize = Vector2.new(UseScaledValueModuleResult - UseTokensModuleResult.Size.Size_1200, 1e999)
	} else nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 112 ]]
		-- upvalues: WithDefaultsModuleResult (copy), FlagsModule (upval), LoggerModule (upval), InputSizeModule (upval), FillBehaviorModule (upval), DashModule (upval), ReactModule (upval), ButtonModule (upval)
		local Elements = {}
		
		if not WithDefaultsModuleResult.actions then
			return Elements
		end
		for LayoutOrder, action in WithDefaultsModuleResult.actions do
			if not FlagsModule.FoundationEducationalTooltipRefresh and LayoutOrder > 2 then
				LoggerModule:warning(`Coachmark only supports up to {2} actions`)
				
				return Elements
			end
			if FlagsModule.FoundationEducationalTooltipRefresh then
				Elements[LayoutOrder] = action
			else
				Elements["CoachmarkButton" .. LayoutOrder] = ReactModule.createElement(ButtonModule, (DashModule.union(action, {
					LayoutOrder = LayoutOrder,
					size = InputSizeModule.Medium,
					fillBehavior = FillBehaviorModule.Fill,
					testId = `{WithDefaultsModuleResult.testId}--action-{LayoutOrder}`
				})))
			end
		end
		return Elements
	end, {
		WithDefaultsModuleResult.actions,
		WithDefaultsModuleResult.testId
	})
	local NoMedia = if FlagsModule.FoundationEducationalTooltipMinMediaWidth then WithDefaultsModuleResult.onClose and not WithDefaultsModuleResult.media else nil
	local NoActions: boolean = if FlagsModule.FoundationEducationalTooltipBodyOnlyContentLayout and WithDefaultsModuleResult.title == "" then WithDefaultsModuleResult.text ~= nil and (WithDefaultsModuleResult.text ~= "" and (WithDefaultsModuleResult.media == nil and WithDefaultsModuleResult.steps == nil and (WithDefaultsModuleResult.actions == nil or #WithDefaultsModuleResult.actions == 0))) else false
	
	return ReactModule.createElement(PopoverModule.Root, {
		isOpen = WithDefaultsModuleResult.isOpen,
		testId = WithDefaultsModuleResult.testId
	}, {
		Anchor = ReactModule.createElement(PopoverModule.Anchor, WithCommonPropsModule(WithDefaultsModuleResult, { anchorRef = WithDefaultsModuleResult.anchorRef }), WithDefaultsModuleResult.children),
		Content = ReactModule.createElement(PopoverModule.Content, {
			DO_NOT_USE_hasContentInputSink = true,
			hasArrow = WithDefaultsModuleResult.hasArrow,
			align = WithDefaultsModuleResult.align,
			onPressedOutside = WithDefaultsModuleResult.onPressedOutside,
			side = {
				position = WithDefaultsModuleResult.side,
				offset = UseTokensModuleResult.Size.Size_200
			},
			radius = RadiusModule.Medium,
			backgroundStyle = UseTokensModuleResult.Inverse.Surface.Surface_0,
			selection = WithDefaultsModuleResult.selection,
			selectionGroup = WithDefaultsModuleResult.selectionGroup,
			ref = Ref
		}, ReactModule.createElement(PresentationContextModule.Provider, { value = config1 }, ReactModule.createElement(ViewModule, {
			testId = WithDefaultsModuleResult.testId,
			tag = if FlagsModule.FoundationEducationalTooltipRefresh then "col auto-xy" else "col gap-medium auto-xy padding-bottom-medium",
			sizeConstraint = {
				MaxSize = Vector2.new(UseScaledValueModuleResult, 1e999),
				MinSize = if FlagsModule.FoundationEducationalTooltipRefresh then Vector2.new(UseScaledValueModuleResult2, 0) else nil
			}
		}, {
			CloseAffordanceContainer = if WithDefaultsModuleResult.onClose then ReactModule.createElement("Folder", {}, {
				CloseAffordance = ReactModule.createElement(CloseAffordanceModule, {
					ZIndex = 2,
					onActivated = WithDefaultsModuleResult.onClose,
					size = InputSizeModule.Small,
					variant = CloseAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -UseTokensModuleResult.Padding.Small, 0, UseTokensModuleResult.Padding.Small),
					AnchorPoint = Vector2.new(1, 0),
					testId = `{WithDefaultsModuleResult.testId}--close-affordance`
				})
			}) else nil,
			Media = if WithDefaultsModuleResult.media then ReactModule.createElement(ViewModule, { LayoutOrder = 1, tag = "size-full-0 auto-y" }, WithDefaultsModuleResult.media) else nil,
			ContentSection = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = if FlagsModule.FoundationEducationalTooltipMinMediaWidth then {
					[if FlagsModule.FoundationEducationalTooltipRefresh then "col auto-xy" else "col gap-xsmall auto-xy"] = not FlagsModule.FoundationEducationalTooltipBodyOnlyContentLayout or not NoActions,
					["col align-y-center auto-xy"] = if FlagsModule.FoundationEducationalTooltipBodyOnlyContentLayout then NoActions else false,
					[if FlagsModule.FoundationEducationalTooltipRefresh then "padding-medium" else "padding-x-medium padding-bottom-xsmall padding-top-medium"] = not NoMedia and not NoActions
				} elseif FlagsModule.FoundationEducationalTooltipRefresh then "col auto-xy padding-medium" else "col gap-xsmall auto-xy padding-x-medium padding-bottom-xsmall padding-top-medium",
				padding = if NoActions then {
					top = UDim.new(0, UseTokensModuleResult.Padding.Small),
					bottom = UDim.new(0, UseTokensModuleResult.Padding.Small),
					left = UDim.new(0, UseTokensModuleResult.Padding.Medium),
					right = UDim.new(0, if NoMedia then UseTokensModuleResult.Size.Size_1200 else UseTokensModuleResult.Padding.Medium)
				} elseif FlagsModule.FoundationEducationalTooltipMinMediaWidth and NoMedia then {
					top = UDim.new(0, UseTokensModuleResult.Padding.Medium),
					bottom = UDim.new(0, if FlagsModule.FoundationEducationalTooltipRefresh then UseTokensModuleResult.Padding.Medium else UseTokensModuleResult.Padding.XSmall),
					left = UDim.new(0, UseTokensModuleResult.Padding.Medium),
					right = UDim.new(0, UseTokensModuleResult.Size.Size_1200)
				} else nil,
				sizeConstraint = if NoActions then {
					MinSize = Vector2.new(0, UseTokensModuleResult.Size.Size_800)
				} else nil
			}, {
				StepIndicator = if WithDefaultsModuleResult.steps then ReactModule.createElement(TextModule, {
					LayoutOrder = 1,
					Text = TranslatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", {
						current = WithDefaultsModuleResult.steps.current,
						total = WithDefaultsModuleResult.steps.total
					}),
					tag = if FlagsModule.FoundationEducationalTooltipRefresh then "auto-xy text-caption-medium text-align-x-left text-truncate-end content-inverse-default" else "auto-xy text-label-small text-align-x-left text-truncate-end content-inverse-default",
					sizeConstraint = if FlagsModule.FoundationEducationalTooltipMinMediaWidth then nil else Config,
					testId = `{WithDefaultsModuleResult.testId}--step-indicator`
				}) else nil,
				Header = if WithDefaultsModuleResult.title == "" then nil else ReactModule.createElement(TextModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-large text-align-x-left text-truncate-split content-inverse-emphasis",
					Text = WithDefaultsModuleResult.title,
					sizeConstraint = if FlagsModule.FoundationEducationalTooltipMinMediaWidth then nil else Config,
					testId = `{WithDefaultsModuleResult.testId}--header`
				}),
				Text = if WithDefaultsModuleResult.text and WithDefaultsModuleResult.text ~= "" then ReactModule.createElement(TextModule, {
					LayoutOrder = 3,
					Text = WithDefaultsModuleResult.text,
					tag = if FlagsModule.FoundationEducationalTooltipMinMediaWidth then "auto-xy text-body-medium text-wrap text-align-x-left content-inverse-default" else "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-inverse-default",
					padding = if FlagsModule.FoundationEducationalTooltipRefresh then if FlagsModule.FoundationEducationalTooltipMinMediaWidth then if WithDefaultsModuleResult.title == "" then nil else { top = UDim.new(0, UseTokensModuleResult.Size.Size_100) } else { top = UDim.new(0, UseTokensModuleResult.Size.Size_100) } else nil,
					testId = `{WithDefaultsModuleResult.testId}--text`
				}) else nil
			}),
			Actions = if WithDefaultsModuleResult.actions and #WithDefaultsModuleResult.actions > 0 then ReactModule.createElement(ViewModule, {
				LayoutOrder = 3,
				tag = if FlagsModule.FoundationEducationalTooltipRefresh then "row align-x-right size-full-0 auto-y padding-x-medium padding-bottom-medium" else "row gap-small size-full-0 auto-y padding-x-medium"
			}, if FlagsModule.FoundationEducationalTooltipRefresh then {
				ButtonGroup = ReactModule.createElement(ButtonGroupModule, {
					maxButtonCount = 2,
					buttons = UseMemoResult,
					orientation = OrientationModule.Horizontal,
					size = InputSizeModule.Small,
					testId = `{WithDefaultsModuleResult.testId}--actions`
				})
			} else UseMemoResult) else nil
		})))
	})
end))