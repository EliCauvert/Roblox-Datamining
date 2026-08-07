local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local buttonModule = require(foundation.Components.Button)
local closeAffordanceModule = require(foundation.Components.CloseAffordance)
local closeAffordanceVariantModule = require(foundation.Enums.CloseAffordanceVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local fillBehaviorModule = require(foundation.Enums.FillBehavior)
local flagsModule = require(foundation.Utility.Flags)
local inputSizeModule = require(foundation.Enums.InputSize)
local loggerModule = require(foundation.Utility.Logger)
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
local popoverModule = require(foundation.Components.Popover)
local t = {
	isOpen = false,
	testId = "--foundation-coachmark",
	align = popoverAlignModule.Start,
	side = popoverSideModule.Right
}

local function _(p0, p1) --[[ line: 75 | named "stepsText" ]]
	-- upvalues: translatorModule (ref)
	return translatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = p0, total = p1 })
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3) --[[ line: 79 | named "Coachmark" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useScaledValueModule (ref), reactModule (ref), loggerModule (ref), inputSizeModule (ref), fillBehaviorModule (ref), dashModule (ref), buttonModule (ref), popoverModule (ref), withCommonPropsModule (ref), flagsModule (ref), radiusModule (ref), presentationContextModule (ref), colorNamespaceModule (ref), viewModule (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), textModule (ref), translatorModule (ref)
	local var24 = withDefaultsModule(p2, t)
	local var25 = useTokensModule()
	local var26 = useScaledValueModule(320)
	local var27 = if var24.onClose then {
		MaxSize = Vector2.new(var26 - var25.Size.Size_1200, 1e999)
	} else nil
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var24.isOpen, testId = var24.testId }, {
		Anchor = reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(var24, { anchorRef = var24.anchorRef }), var24.children),
		Content = reactModule.createElement(popoverModule.Content, {
			hasArrow = true,
			align = var24.align,
			DO_NOT_USE_hasContentInputSink = flagsModule.FoundationCoachmarkInteractionFixes,
			side = { position = var24.side, offset = var25.Size.Size_200 },
			radius = radiusModule.Medium,
			backgroundStyle = var25.Inverse.Surface.Surface_0,
			selection = var24.selection,
			selectionGroup = var24.selectionGroup,
			ref = p3
		}, reactModule.createElement(presentationContextModule.Provider, {
			value = { colorNamespace = colorNamespaceModule.Inverse }
		}, reactModule.createElement(viewModule, {
			tag = "col gap-medium auto-xy padding-bottom-medium",
			sizeConstraint = { MaxSize = Vector2.new(var26, 1e999) }
		}, {
			CloseAffordanceContainer = if var24.onClose then reactModule.createElement("Folder", {}, {
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					onActivated = var24.onClose,
					size = inputSizeModule.Small,
					variant = closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var25.Padding.Small, 0, var25.Padding.Small),
					AnchorPoint = Vector2.new(1, 0),
					ZIndex = if flagsModule.FoundationCoachmarkInteractionFixes then 2 else nil,
					testId = `{var24.testId}--close-affordance`
				})
			}) else nil,
			Media = if var24.media then reactModule.createElement(viewModule, { LayoutOrder = 1, tag = "size-full-0 auto-y" }, var24.media) else nil,
			ContentSection = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = "col gap-xsmall auto-xy padding-x-medium padding-bottom-xsmall padding-top-medium"
			}, {
				StepIndicator = if var24.steps then reactModule.createElement(textModule, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-small text-align-x-left text-truncate-end content-inverse-default",
					Text = translatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = var24.steps.current, total = var24.steps.total }),
					sizeConstraint = var27,
					testId = `{var24.testId}--step-indicator`
				}) else nil,
				Header = if var24.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-large text-align-x-left text-truncate-split content-inverse-emphasis",
					Text = var24.title,
					sizeConstraint = var27,
					testId = `{var24.testId}--header`
				}),
				Text = if var24.text and var24.text ~= "" then reactModule.createElement(textModule, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-inverse-default",
					Text = var24.text,
					testId = `{var24.testId}--text`
				}) else nil
			}),
			Actions = if var24.actions and #var24.actions > 0 then reactModule.createElement(viewModule, {
				LayoutOrder = 3,
				tag = "row gap-small size-full-0 auto-y padding-x-medium"
			}, reactModule.useMemo(function() --[[ line: 90 ]]
				-- upvalues: var24 (ref), loggerModule (copy), inputSizeModule (copy), fillBehaviorModule (copy), dashModule (copy), reactModule (copy), buttonModule (copy)
				local t = {}
				
				if not var24.actions then
					return t
				end
				for i, v in var24.actions do
					if i <= 2 then
						t["CoachmarkButton" .. i] = reactModule.createElement(buttonModule, dashModule.union(v, {
							LayoutOrder = i,
							size = inputSizeModule.Medium,
							fillBehavior = fillBehaviorModule.Fill,
							testId = `{var24.testId}--action-{i}`
						}))
						continue
					end
					loggerModule:warning(`Coachmark only supports up to {2} actions`)
					
					return t
				end
				return t
			end, { var24.actions, var24.testId })) else nil
		})))
	})
end))