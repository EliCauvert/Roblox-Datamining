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
local t_1 = { colorNamespace = colorNamespaceModule.Inverse }

local function _(p0, p1)
	-- upvalues: translatorModule (ref)
	return translatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = p0, total = p1 })
end

return reactModule.memo(reactModule.forwardRef(function(p2, p3)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useScaledValueModule (ref), reactModule (ref), loggerModule (ref), inputSizeModule (ref), fillBehaviorModule (ref), dashModule (ref), buttonModule (ref), popoverModule (ref), withCommonPropsModule (ref), flagsModule (ref), radiusModule (ref), presentationContextModule (ref), t_1 (ref), colorNamespaceModule (ref), viewModule (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), textModule (ref), translatorModule (ref)
	local var25 = withDefaultsModule(p2, t)
	local var26 = useTokensModule()
	local var27 = useScaledValueModule(320)
	local var28 = if var25.onClose then {
		MaxSize = Vector2.new(var27 - var26.Size.Size_1200, 1e999)
	} else nil
	
	return reactModule.createElement(popoverModule.Root, { isOpen = var25.isOpen, testId = var25.testId }, {
		Anchor = reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(var25, { anchorRef = var25.anchorRef }), var25.children),
		Content = reactModule.createElement(popoverModule.Content, {
			hasArrow = true,
			DO_NOT_USE_hasContentInputSink = true,
			align = var25.align,
			onPressedOutside = if flagsModule.FoundationCoachmarkPressedOutside then var25.onPressedOutside else nil,
			side = { position = var25.side, offset = var26.Size.Size_200 },
			radius = radiusModule.Medium,
			backgroundStyle = var26.Inverse.Surface.Surface_0,
			selection = var25.selection,
			selectionGroup = var25.selectionGroup,
			ref = p3
		}, reactModule.createElement(presentationContextModule.Provider, {
			value = if flagsModule.FoundationStableContextValues then t_1 else { colorNamespace = colorNamespaceModule.Inverse }
		}, reactModule.createElement(viewModule, {
			tag = "col gap-medium auto-xy padding-bottom-medium",
			sizeConstraint = { MaxSize = Vector2.new(var27, 1e999) }
		}, {
			CloseAffordanceContainer = if var25.onClose then reactModule.createElement("Folder", {}, {
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					ZIndex = 2,
					onActivated = var25.onClose,
					size = inputSizeModule.Small,
					variant = closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var26.Padding.Small, 0, var26.Padding.Small),
					AnchorPoint = Vector2.new(1, 0),
					testId = `{var25.testId}--close-affordance`
				})
			}) else nil,
			Media = if var25.media then reactModule.createElement(viewModule, { LayoutOrder = 1, tag = "size-full-0 auto-y" }, var25.media) else nil,
			ContentSection = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = "col gap-xsmall auto-xy padding-x-medium padding-bottom-xsmall padding-top-medium"
			}, {
				StepIndicator = if var25.steps then reactModule.createElement(textModule, {
					LayoutOrder = 1,
					tag = "auto-xy text-label-small text-align-x-left text-truncate-end content-inverse-default",
					Text = translatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = var25.steps.current, total = var25.steps.total }),
					sizeConstraint = var28,
					testId = `{var25.testId}--step-indicator`
				}) else nil,
				Header = if var25.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-large text-align-x-left text-truncate-split content-inverse-emphasis",
					Text = var25.title,
					sizeConstraint = var28,
					testId = `{var25.testId}--header`
				}),
				Text = if var25.text and var25.text ~= "" then reactModule.createElement(textModule, {
					LayoutOrder = 3,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-inverse-default",
					Text = var25.text,
					testId = `{var25.testId}--text`
				}) else nil
			}),
			Actions = if var25.actions and #var25.actions > 0 then reactModule.createElement(viewModule, {
				LayoutOrder = 3,
				tag = "row gap-small size-full-0 auto-y padding-x-medium"
			}, reactModule.useMemo(function()
				-- upvalues: var25 (ref), loggerModule (copy), inputSizeModule (copy), fillBehaviorModule (copy), dashModule (copy), reactModule (copy), buttonModule (copy)
				local t = {}
				
				if not var25.actions then
					return t
				end
				for i, v in var25.actions do
					if i <= 2 then
						t["CoachmarkButton" .. i] = reactModule.createElement(buttonModule, dashModule.union(v, {
							LayoutOrder = i,
							size = inputSizeModule.Medium,
							fillBehavior = fillBehaviorModule.Fill,
							testId = `{var25.testId}--action-{i}`
						}))
						continue
					end
					loggerModule:warning(`Coachmark only supports up to {2} actions`)
					
					return t
				end
				return t
			end, { var25.actions, var25.testId })) else nil
		})))
	})
end))