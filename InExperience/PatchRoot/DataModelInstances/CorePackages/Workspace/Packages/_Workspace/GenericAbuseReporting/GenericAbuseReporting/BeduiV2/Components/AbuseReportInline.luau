local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local reactModule = require(parent.React)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useInExpFocusNavigationRefsModule = require(genericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useInExpFocusNavigationRefs)
local useScrollNavigationBindingsModule = require(genericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useScrollNavigationBindings)
local fFlagAbuseReportV2ScrollNavigationModule = require(genericAbuseReporting.Flags.FFlagAbuseReportV2ScrollNavigation)
local fFlagAbuseReportInlineTitleDisclosureFocus = require(parent.SharedFlags).FFlagAbuseReportInlineTitleDisclosureFocus
local animatePresence = motionModule.AnimatePresence
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local abuseReportTooltipModule = require(genericAbuseReporting.BeduiV2.Components.AbuseReportTooltip)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local feedbackModule = require(genericAbuseReporting.BeduiV2.Components.Feedback)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local slideTransitionModule = require(genericAbuseReporting.BeduiV2.Components.SlideTransition)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local INLINE_LANDSCAPE_WIDTH = layoutSlotsModule.INLINE_LANDSCAPE_WIDTH

return reactModule.memo(function(p0) --[[ line: 46 | named "AbuseReportInline" ]]
	-- upvalues: useTokens (ref), useArTranslation (ref), reactModule (ref), animatePresence (ref), feedbackModule (ref), INLINE_LANDSCAPE_WIDTH (ref), slideTransitionModule (ref), view (ref), fFlagAbuseReportV2ScrollNavigationModule (ref), useScrollNavigationBindingsModule (ref), fFlagAbuseReportInlineTitleDisclosureFocus (ref), useInExpFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), icon (ref), iconName (ref), inputSize (ref), abuseReportTooltipModule (ref)
	local var12 = useTokens()
	local translateIntoString = useArTranslation().translateIntoString
	local abuseReportFlow = p0.abuseReportFlow
	local config = abuseReportFlow.config
	local pendingInlineAlert = abuseReportFlow.pendingInlineAlert
	local var13 = reactModule.createElement(slideTransitionModule, {
		nodeContent = reactModule.createElement(view, { tag = "col align-x-center size-full" }, {
			FeedbackAlertElement = reactModule.createElement(animatePresence, nil, if pendingInlineAlert then {
				Alert = reactModule.createElement(feedbackModule, {
					layoutOrder = 1,
					severity = pendingInlineAlert.type,
					title = translateIntoString(pendingInlineAlert.title),
					subtitle = if pendingInlineAlert.subtitle then translateIntoString(pendingInlineAlert.subtitle) else nil,
					onClose = abuseReportFlow.dismissInlineAlert,
					bottomMargin = if p0.shouldUseOverlaidControls then nil else var12.Padding.Medium,
					maxWidth = if p0.shouldUseOverlaidControls then INLINE_LANDSCAPE_WIDTH * var12.Config.UI.Scale else nil
				})
			} else nil),
			PageContent = reactModule.createElement(view, { tag = "col fill size-full-0", LayoutOrder = 2 }, abuseReportFlow.currentPageElement)
		}),
		nodeId = abuseReportFlow.currentNodeId,
		nodeType = abuseReportFlow.currentNodeType,
		direction = abuseReportFlow.navigationDirection
	})
	local var14, var15 = reactModule.useState(if config.display.titleDisclosure then config.display.titleDisclosure.openByDefault else false)
	local var16 = reactModule.useCallback(function() --[[ line: 106 ]]
		-- upvalues: var15 (ref)
		var15(function(p1) --[[ line: 107 ]]
			return not p1
		end)
	end, {})
	local var17 = if fFlagAbuseReportInlineTitleDisclosureFocus then useInExpFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, reactModule.useCallback(function() --[[ line: 119 ]]
		-- upvalues: var15 (ref)
		var15(false)
	end, {}), var14, var14) else nil
	
	return reactModule.createElement(view, {
		tag = {
			["size-full"] = p0.shouldUseOverlaidControls,
			["col size-full"] = not p0.shouldUseOverlaidControls
		},
		ref = if fFlagAbuseReportV2ScrollNavigationModule then if fFlagAbuseReportV2ScrollNavigationModule then useScrollNavigationBindingsModule() else nil else nil
	}, {
		TopControlsContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["size-full"] = p0.shouldUseOverlaidControls,
				["row flex-between size-full-0 auto-y"] = not p0.shouldUseOverlaidControls
			}
		}, {
			BackButtonContainer = reactModule.useMemo(function() --[[ line: 136 ]]
				-- upvalues: reactModule (copy), view (copy), p0 (ref), abuseReportFlow (ref), icon (copy), iconName (copy), inputSize (copy)
				return reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = {
						["align-x-center auto-xy padding-y-small"] = true,
						["position-top-left anchor-top-left"] = p0.shouldUseOverlaidControls
					}
				}, reactModule.createElement(view, {
					tag = "auto-xy padding-small radius-circle",
					isDisabled = not abuseReportFlow.canGoBack,
					selection = { Selectable = abuseReportFlow.canGoBack },
					onActivated = abuseReportFlow.goBack
				}, reactModule.createElement(icon, {
					name = iconName.ChevronLargeLeft,
					size = inputSize.Medium,
					style = {
						Transparency = if abuseReportFlow.canGoBack then 0 else 1
					}
				})))
			end, {
				abuseReportFlow.canGoBack,
				abuseReportFlow.goBack,
				p0.shouldUseOverlaidControls
			}),
			AbuseReportTooltipContainer = reactModule.useMemo(function() --[[ line: 168 ]]
				-- upvalues: config (ref), reactModule (copy), view (copy), p0 (ref), var16 (ref), abuseReportTooltipModule (copy), var14 (ref), fFlagAbuseReportInlineTitleDisclosureFocus (copy), var17 (write), icon (copy), iconName (copy), inputSize (copy)
				return if config.display.titleDisclosure then reactModule.createElement(view, {
					LayoutOrder = 3,
					ZIndex = 2,
					tag = {
						["align-x-center auto-xy padding-y-small"] = true,
						["position-top-right anchor-top-right"] = p0.shouldUseOverlaidControls
					}
				}, reactModule.createElement(view, {
					tag = "auto-xy padding-small radius-circle",
					onActivated = var16
				}, reactModule.createElement(abuseReportTooltipModule, {
					tooltipTitle = config.display.titleDisclosure.tooltipTitle,
					tooltipText = config.display.titleDisclosure.tooltipText,
					buttonLabel = config.display.titleDisclosure.buttonLabel,
					isOpen = var14,
					onClose = var16,
					ref = if fFlagAbuseReportInlineTitleDisclosureFocus then var17 else nil
				}, reactModule.createElement(icon, { name = iconName.CircleI, size = inputSize.Medium })))) else nil
			end, {
				config.display.titleDisclosure,
				if fFlagAbuseReportInlineTitleDisclosureFocus then var17 else nil,
				var16,
				var14,
				p0.shouldUseOverlaidControls
			})
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["col gap-xlarge size-full"] = p0.shouldUseOverlaidControls,
				["col fill size-full-0 margin-bottom-medium"] = not p0.shouldUseOverlaidControls
			}
		}, var13)
	})
end)