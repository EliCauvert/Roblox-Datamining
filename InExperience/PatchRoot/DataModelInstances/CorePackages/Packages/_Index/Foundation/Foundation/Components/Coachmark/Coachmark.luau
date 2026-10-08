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
	hasArrow = true,
	testId = "--foundation-coachmark",
	align = popoverAlignModule.Start,
	side = popoverSideModule.Right
}
local t_1 = { colorNamespace = colorNamespaceModule.Inverse }

local function _(p1, p2)
	-- upvalues: translatorModule (ref)
	return translatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = p1, total = p2 })
end

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), useScaledValueModule (ref), flagsModule (ref), constantsModule (ref), reactModule (ref), loggerModule (ref), inputSizeModule (ref), fillBehaviorModule (ref), dashModule (ref), buttonModule (ref), popoverModule (ref), withCommonPropsModule (ref), radiusModule (ref), presentationContextModule (ref), t_1 (ref), viewModule (ref), closeAffordanceModule (ref), closeAffordanceVariantModule (ref), textModule (ref), translatorModule (ref), buttonGroupModule (ref), orientationModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	local var3 = useTokensModule()
	local var4 = useScaledValueModule(if flagsModule.FoundationEducationalTooltipRefresh then constantsModule.TOOLTIP_MAX_WIDTH else 320)
	local var5 = useScaledValueModule(240)
	local var6 = if flagsModule.FoundationEducationalTooltipMinMediaWidth then if var2.media then var5 else var3.Size.Size_3000 else var5
	local var7 = if flagsModule.FoundationEducationalTooltipMinMediaWidth then nil elseif var2.onClose then {
		MaxSize = Vector2.new(var4 - var3.Size.Size_1200, 1e999)
	} else nil
	local var8 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), flagsModule (copy), loggerModule (copy), inputSizeModule (copy), fillBehaviorModule (copy), dashModule (copy), reactModule (copy), buttonModule (copy)
		local t = {}
		
		if not var2.actions then
			return t
		end
		for i, v in var2.actions do
			if flagsModule.FoundationEducationalTooltipRefresh or i <= 2 then
				if flagsModule.FoundationEducationalTooltipRefresh then
					t[i] = v
				else
					t["CoachmarkButton" .. i] = reactModule.createElement(buttonModule, dashModule.union(v, {
						LayoutOrder = i,
						size = inputSizeModule.Medium,
						fillBehavior = fillBehaviorModule.Fill,
						testId = `{var2.testId}--action-{i}`
					}))
				end
			end
			loggerModule:warning(`Coachmark only supports up to {2} actions`)
			
			return t
		end
		return t
	end, { var2.actions, var2.testId })
	local var9 = if flagsModule.FoundationEducationalTooltipMinMediaWidth then var2.onClose and not var2.media else nil
	
	if flagsModule.FoundationEducationalTooltipBodyOnlyContentLayout then
		var1 = false
		
		if var2.title == "" then
			var1 = false
			
			if var2.text ~= nil then
				var1 = false
				
				if var2.text ~= "" then
					var1 = false
					
					if var2.media == nil then
						var1 = false
						
						if var2.steps == nil then
							var1 = true
							
							if var2.actions ~= nil then
								local _ = #var2.actions == 0
							end
						end
					end
				end
			end
		end
	else
		var1 = false
	end
	return reactModule.createElement(popoverModule.Root, { isOpen = var2.isOpen, testId = var2.testId }, {
		Anchor = reactModule.createElement(popoverModule.Anchor, withCommonPropsModule(var2, { anchorRef = var2.anchorRef }), var2.children),
		Content = reactModule.createElement(popoverModule.Content, {
			DO_NOT_USE_hasContentInputSink = true,
			hasArrow = var2.hasArrow,
			align = var2.align,
			onPressedOutside = var2.onPressedOutside,
			side = { position = var2.side, offset = var3.Size.Size_200 },
			radius = radiusModule.Medium,
			backgroundStyle = var3.Inverse.Surface.Surface_0,
			selection = var2.selection,
			selectionGroup = var2.selectionGroup,
			ref = p2
		}, reactModule.createElement(presentationContextModule.Provider, { value = t_1 }, reactModule.createElement(viewModule, {
			testId = var2.testId,
			tag = if flagsModule.FoundationEducationalTooltipRefresh then "col auto-xy" else "col gap-medium auto-xy padding-bottom-medium",
			sizeConstraint = {
				MaxSize = Vector2.new(var4, 1e999),
				MinSize = if flagsModule.FoundationEducationalTooltipRefresh then Vector2.new(var6, 0) else nil
			}
		}, {
			CloseAffordanceContainer = if var2.onClose then reactModule.createElement("Folder", {}, {
				CloseAffordance = reactModule.createElement(closeAffordanceModule, {
					ZIndex = 2,
					onActivated = var2.onClose,
					size = inputSizeModule.Small,
					variant = closeAffordanceVariantModule.Utility,
					Position = UDim2.new(1, -var3.Padding.Small, 0, var3.Padding.Small),
					AnchorPoint = Vector2.new(1, 0),
					testId = `{var2.testId}--close-affordance`
				})
			}) else nil,
			Media = if var2.media then reactModule.createElement(viewModule, { LayoutOrder = 1, tag = "size-full-0 auto-y" }, var2.media) else nil,
			ContentSection = reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = if flagsModule.FoundationEducationalTooltipMinMediaWidth then {
					[if flagsModule.FoundationEducationalTooltipRefresh then "col auto-xy" else "col gap-xsmall auto-xy"] = if flagsModule.FoundationEducationalTooltipBodyOnlyContentLayout then not var1 else true,
					["col align-y-center auto-xy"] = if flagsModule.FoundationEducationalTooltipBodyOnlyContentLayout then var1 else false,
					[if flagsModule.FoundationEducationalTooltipRefresh then "padding-medium" else "padding-x-medium padding-bottom-xsmall padding-top-medium"] = not var9 and not var1
				} elseif flagsModule.FoundationEducationalTooltipRefresh then "col auto-xy padding-medium" else "col gap-xsmall auto-xy padding-x-medium padding-bottom-xsmall padding-top-medium",
				padding = if var1 then {
					top = UDim.new(0, var3.Padding.Small),
					bottom = UDim.new(0, var3.Padding.Small),
					left = UDim.new(0, var3.Padding.Medium),
					right = UDim.new(0, if var9 then var3.Size.Size_1200 else var3.Padding.Medium)
				} elseif flagsModule.FoundationEducationalTooltipMinMediaWidth and var9 then {
					top = UDim.new(0, var3.Padding.Medium),
					bottom = UDim.new(0, if flagsModule.FoundationEducationalTooltipRefresh then var3.Padding.Medium else var3.Padding.XSmall),
					left = UDim.new(0, var3.Padding.Medium),
					right = UDim.new(0, var3.Size.Size_1200)
				} else nil,
				sizeConstraint = if var1 then { MinSize = Vector2.new(0, var3.Size.Size_800) } else nil
			}, {
				StepIndicator = if var2.steps then reactModule.createElement(textModule, {
					LayoutOrder = 1,
					Text = translatorModule:FormatByKey("CommonUI.Controls.Label.PageCount", { current = var2.steps.current, total = var2.steps.total }),
					tag = if flagsModule.FoundationEducationalTooltipRefresh then "auto-xy text-caption-medium text-align-x-left text-truncate-end content-inverse-default" else "auto-xy text-label-small text-align-x-left text-truncate-end content-inverse-default",
					sizeConstraint = if flagsModule.FoundationEducationalTooltipMinMediaWidth then nil else var7,
					testId = `{var2.testId}--step-indicator`
				}) else nil,
				Header = if var2.title ~= "" then nil else reactModule.createElement(textModule, {
					LayoutOrder = 2,
					tag = "auto-xy text-title-large text-align-x-left text-truncate-split content-inverse-emphasis",
					Text = var2.title,
					sizeConstraint = if flagsModule.FoundationEducationalTooltipMinMediaWidth then nil else var7,
					testId = `{var2.testId}--header`
				}),
				Text = if var2.text and var2.text ~= "" then reactModule.createElement(textModule, {
					LayoutOrder = 3,
					Text = var2.text,
					tag = if flagsModule.FoundationEducationalTooltipMinMediaWidth then "auto-xy text-body-medium text-wrap text-align-x-left content-inverse-default" else "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-inverse-default",
					padding = if flagsModule.FoundationEducationalTooltipRefresh then if flagsModule.FoundationEducationalTooltipMinMediaWidth then if var2.title ~= "" then nil else { top = UDim.new(0, var3.Size.Size_100) } else { top = UDim.new(0, var3.Size.Size_100) } else nil,
					testId = `{var2.testId}--text`
				}) else nil
			}),
			Actions = if var2.actions and #var2.actions > 0 then reactModule.createElement(viewModule, {
				LayoutOrder = 3,
				tag = if flagsModule.FoundationEducationalTooltipRefresh then "row align-x-right size-full-0 auto-y padding-x-medium padding-bottom-medium" else "row gap-small size-full-0 auto-y padding-x-medium"
			}, if flagsModule.FoundationEducationalTooltipRefresh then {
				ButtonGroup = reactModule.createElement(buttonGroupModule, {
					maxButtonCount = 2,
					buttons = var8,
					orientation = orientationModule.Horizontal,
					size = inputSizeModule.Small,
					testId = `{var2.testId}--actions`
				})
			} else var8) else nil
		})))
	})
end))