local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local constantsModule = require(foundation.Constants)
local buttonModule = require(foundation.Components.Button)
local buttonGroupModule = require(foundation.Components.ButtonGroup)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local flagsModule = require(foundation.Utility.Flags)
local inputSizeModule = require(foundation.Enums.InputSize)
local loggerModule = require(foundation.Utility.Logger)
local orientationModule = require(foundation.Enums.Orientation)
local popoverModule = require(foundation.Components.Popover)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local presentationContextModule = require(foundation.Providers.Style.PresentationContext)
local radiusModule = require(foundation.Enums.Radius)
local textModule = require(foundation.Components.Text)
local translatorModule = require(foundation.Utility.Localization.Translator)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useScaledValueModule = require(foundation.Utility.useScaledValue)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	isOpen = false,
	testId = "--foundation-coachmark",
	align = popoverAlignModule.Start,
	side = popoverSideModule.Right
}
local t_1 = { colorNamespace = colorNamespaceModule.Inverse }

local function _(p0, p1) --[[ line: 86 | named "stepsText" ]]
	-- upvalues: translatorModule (ref)
	return translatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = p0, total = p1 })
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 90 | named "Coachmark" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useScaledValueModule (ref), flagsModule (ref), constantsModule (ref), reactModule (ref), loggerModule (ref), inputSizeModule (ref), fillBehaviorModule (ref), dashModule (ref), buttonModule (ref), popoverModule (ref), withCommonPropsModule (ref), radiusModule (ref), presentationContextModule (ref), t_1 (ref), colorNamespaceModule (ref), viewModule (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), textModule (ref), translatorModule (ref), buttonGroupModule (ref), orientationModule (ref)
	local var28 = withDefaultsModule(p2, t)
	local var29 = useTokensModule()
	local var30 = useScaledValueModule(if flagsModule.FoundationEducationalTooltipRefresh then constantsModule.TOOLTIP_MAX_WIDTH else 320)
	local var31 = useScaledValueModule(240)
	local var32 = if var28.onClose then {
		MaxSize = Vector2.new(var30 - var29.Size.Size_1200, 1e999)
	} else nil
	local var33 = reactModule.useMemo(function() --[[ line: 104 ]]
		-- upvalues: var28 (ref), flagsModule (copy), loggerModule (copy), inputSizeModule (copy), fillBehaviorModule (copy), dashModule (copy), reactModule (copy), buttonModule (copy)
		local t = {}
		
		if not var28.actions then
			return t
		end
		for i, v in var28.actions do
			if flagsModule.FoundationEducationalTooltipRefresh or i <= 2 then
				if flagsModule.FoundationEducationalTooltipRefresh then
					t[i] = v
				else
					t["CoachmarkButton" .. i] = reactModule.createElement(buttonModule, dashModule.union(v, {
						LayoutOrder = i,
						size = inputSizeModule.Medium,
						fillBehavior = fillBehaviorModule.Fill,
						testId = `{var28.testId}--action-{i}`
					}))
				end
			end
			loggerModule:warning(`Coachmark only supports up to {2} actions`)
			
			return t
		end
		return t
	end, { var28.actions, var28.testId })
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var28.isOpen, testId = var28.testId }, {
		Anchor = reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(var28, { anchorRef = var28.anchorRef }), var28.children),
		Content = reactModule.createElement(popoverModule.Content, {
			hasArrow = true,
			DO_NOT_USE_hasContentInputSink = true,
			align = var28.align,
			onPressedOutside = if flagsModule.FoundationCoachmarkPressedOutside then var28.onPressedOutside else nil,
			side = { position = var28.side, offset = var29.Size.Size_200 },
			radius = radiusModule.Medium,
			backgroundStyle = var29.Inverse.Surface.Surface_0,
			selection = var28.selection,
			selectionGroup = var28.selectionGroup,
			ref = p3
		}, reactModule.createElement(presentationContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then t_1 else { colorNamespace = colorNamespaceModule.Inverse }
		}, reactModule.createElement(viewModule, {
			tag = if flagsModule.FoundationEducationalTooltipRefresh then "col auto-xy" else "col gap-medium auto-xy padding-bottom-medium",
			sizeConstraint = {
				MaxSize = Vector2.new(var30, 1e999),
				MinSize = if flagsModule.FoundationEducationalTooltipRefresh then Vector2.new(var31, 0) else nil
			}
		}, {
			CloseAffordanceContainer = if var28.onClose then reactModule.createElement("Folder", {}, {
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					ZIndex = 2,
					onActivated = var28.onClose,
					size = inputSizeModule.Small,
					variant = closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var29.Padding.Small, 0, var29.Padding.Small),
					AnchorPoint = Vector2.new(1, 0),
					testId = `{var28.testId}--close-affordance`
				})
			}) else nil,
			Media = if var28.media then reactModule.createElement(viewModule, { LayoutOrder = 1, tag = "size-full-0 auto-y" }, var28.media) else nil,
			ContentSection = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = if flagsModule.FoundationEducationalTooltipRefresh then "col auto-xy padding-medium" else "col gap-xsmall auto-xy padding-x-medium padding-bottom-xsmall padding-top-medium"
			}, {
				StepIndicator = if var28.steps then reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = translatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = var28.steps.current, total = var28.steps.total }),
					tag = if flagsModule.FoundationEducationalTooltipRefresh then "auto-xy text-caption-medium text-align-x-left text-truncate-end content-inverse-default" else "auto-xy text-label-small text-align-x-left text-truncate-end content-inverse-default",
					sizeConstraint = var32,
					testId = `{var28.testId}--step-indicator`
				}) else nil,
				Header = if var28.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-large text-align-x-left text-truncate-split content-inverse-emphasis",
					Text = var28.title,
					sizeConstraint = var32,
					testId = `{var28.testId}--header`
				}),
				Text = if var28.text and var28.text ~= "" then reactModule.createElement(textModule, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-inverse-default",
					Text = var28.text,
					padding = if flagsModule.FoundationEducationalTooltipRefresh then { top = UDim.new(0, var29.Size.Size_100) } else nil,
					testId = `{var28.testId}--text`
				}) else nil
			}),
			Actions = if var28.actions and #var28.actions > 0 then reactModule.createElement(viewModule, {
				LayoutOrder = 3,
				tag = if flagsModule.FoundationEducationalTooltipRefresh then "row align-x-right size-full-0 auto-y padding-x-medium padding-bottom-medium" else "row gap-small size-full-0 auto-y padding-x-medium"
			}, if flagsModule.FoundationEducationalTooltipRefresh then {
				ButtonGroup = reactModule.createElement(buttonGroupModule, {
					maxButtonCount = 2,
					buttons = var33,
					orientation = orientationModule.Horizontal,
					size = inputSizeModule.Small,
					testId = `{var28.testId}--actions`
				})
			} else var33) else nil
		})))
	})
end))