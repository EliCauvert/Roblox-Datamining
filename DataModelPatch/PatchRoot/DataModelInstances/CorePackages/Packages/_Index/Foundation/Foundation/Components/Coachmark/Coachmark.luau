local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local ButtonModule = require(Foundation.Components.Button)
local CloseAffordanceModule = require(Foundation.Components.CloseAffordance)
local CloseAffordanceVariantModule = require(Foundation.Enums.CloseAffordanceVariant)
local ColorModeModule = require(Foundation.Enums.ColorMode)
local FillBehaviorModule = require(Foundation.Enums.FillBehavior)
local FlagsModule = require(Foundation.Utility.Flags)
local InputSizeModule = require(Foundation.Enums.InputSize)
local LoggerModule = require(Foundation.Utility.Logger)
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
local PopoverModule = require(Foundation.Components.Popover)
local config = {
	isOpen = false,
	testId = "--foundation-coachmark",
	align = require(Foundation.Enums.PopoverAlign).Start,
	side = require(Foundation.Enums.PopoverSide).Right
}

local function _(Current, Total)
	-- upvalues: TranslatorModule (copy)
	return TranslatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = Current, total = Total })
end

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), UseScaledValueModule (copy), ReactModule (copy), LoggerModule (copy), InputSizeModule (copy), FillBehaviorModule (copy), DashModule (copy), ButtonModule (copy), PopoverModule (copy), WithCommonPropsModule (copy), FlagsModule (copy), RadiusModule (copy), PresentationContextModule (copy), ColorModeModule (copy), ViewModule (copy), CloseAffordanceModule (copy), CloseAffordanceVariantModule (copy), TextModule (copy), TranslatorModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseScaledValueModuleResult = UseScaledValueModule(320)
	local Config = if WithDefaultsModuleResult.onClose then {
		MaxSize = Vector2.new(UseScaledValueModuleResult - UseTokensModuleResult.Size.Size_1200, 1e999)
	} else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: WithDefaultsModuleResult (copy), LoggerModule (upval), InputSizeModule (upval), FillBehaviorModule (upval), DashModule (upval), ReactModule (upval), ButtonModule (upval)
		local Elements = {}
		
		if not WithDefaultsModuleResult.actions then
			return Elements
		end
		for LayoutOrder, action in WithDefaultsModuleResult.actions do
			if LayoutOrder > 2 then
				LoggerModule:warning(`Coachmark only supports up to {2} actions`)
				
				return Elements
			end
			Elements["CoachmarkButton" .. LayoutOrder] = ReactModule.createElement(ButtonModule, (DashModule.union(action, {
				LayoutOrder = LayoutOrder,
				size = InputSizeModule.Medium,
				fillBehavior = FillBehaviorModule.Fill,
				testId = `{WithDefaultsModuleResult.testId}--action-{LayoutOrder}`
			})))
		end
		return Elements
	end, {
		WithDefaultsModuleResult.actions,
		WithDefaultsModuleResult.testId
	})
	
	return ReactModule.createElement(PopoverModule.Root, {
		isOpen = WithDefaultsModuleResult.isOpen,
		testId = WithDefaultsModuleResult.testId
	}, {
		Anchor = ReactModule.createElement(PopoverModule.Anchor, WithCommonPropsModule(WithDefaultsModuleResult, { anchorRef = WithDefaultsModuleResult.anchorRef }), WithDefaultsModuleResult.children),
		Content = ReactModule.createElement(PopoverModule.Content, {
			hasArrow = true,
			align = WithDefaultsModuleResult.align,
			DO_NOT_USE_hasContentInputSink = FlagsModule.FoundationCoachmarkInteractionFixes,
			side = {
				position = WithDefaultsModuleResult.side,
				offset = UseTokensModuleResult.Size.Size_200
			},
			radius = RadiusModule.Medium,
			backgroundStyle = UseTokensModuleResult.Inverse.Surface.Surface_0,
			selection = WithDefaultsModuleResult.selection,
			selectionGroup = WithDefaultsModuleResult.selectionGroup,
			ref = Ref
		}, ReactModule.createElement(PresentationContextModule.Provider, { value = { colorMode = ColorModeModule.Inverse } }, ReactModule.createElement(ViewModule, {
			tag = "col gap-medium auto-xy padding-bottom-medium",
			sizeConstraint = { MaxSize = Vector2.new(UseScaledValueModuleResult, 1e999) }
		}, {
			CloseAffordanceContainer = if WithDefaultsModuleResult.onClose then ReactModule.createElement("Folder", {}, {
				CloseAffordance = ReactModule.createElement(CloseAffordanceModule, {
					onActivated = WithDefaultsModuleResult.onClose,
					size = InputSizeModule.Small,
					variant = CloseAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -UseTokensModuleResult.Padding.Small, 0, UseTokensModuleResult.Padding.Small),
					AnchorPoint = Vector2.new(1, 0),
					ZIndex = if FlagsModule.FoundationCoachmarkInteractionFixes then 2 else nil,
					testId = `{WithDefaultsModuleResult.testId}--close-affordance`
				})
			}) else nil,
			Media = if WithDefaultsModuleResult.media then ReactModule.createElement(ViewModule, { LayoutOrder = 1, tag = "size-full-0 auto-y" }, WithDefaultsModuleResult.media) else nil,
			ContentSection = ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = "col gap-xsmall auto-xy padding-x-medium padding-bottom-xsmall padding-top-medium"
			}, {
				StepIndicator = if WithDefaultsModuleResult.steps then ReactModule.createElement(TextModule, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-small text-align-x-left text-truncate-end content-inverse-default",
					Text = TranslatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", {
						current = WithDefaultsModuleResult.steps.current,
						total = WithDefaultsModuleResult.steps.total
					}),
					sizeConstraint = Config,
					testId = `{WithDefaultsModuleResult.testId}--step-indicator`
				}) else nil,
				Header = if WithDefaultsModuleResult.title == "" then nil else ReactModule.createElement(TextModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-large text-align-x-left text-truncate-split content-inverse-emphasis",
					Text = WithDefaultsModuleResult.title,
					sizeConstraint = Config,
					testId = `{WithDefaultsModuleResult.testId}--header`
				}),
				Text = if WithDefaultsModuleResult.text and WithDefaultsModuleResult.text ~= "" then ReactModule.createElement(TextModule, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-inverse-default",
					Text = WithDefaultsModuleResult.text,
					testId = `{WithDefaultsModuleResult.testId}--text`
				}) else nil
			}),
			Actions = if WithDefaultsModuleResult.actions and #WithDefaultsModuleResult.actions > 0 then ReactModule.createElement(ViewModule, {
				LayoutOrder = 3,
				tag = "row gap-small size-full-0 auto-y padding-x-medium"
			}, UseMemoResult) else nil
		})))
	})
end))