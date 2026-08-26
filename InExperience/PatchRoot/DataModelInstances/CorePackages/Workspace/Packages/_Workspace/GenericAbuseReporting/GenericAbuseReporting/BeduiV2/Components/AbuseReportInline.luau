local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local reactModule = require(parent.React)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useInExpFocusNavigationRefsModule = require(genericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useInExpFocusNavigationRefs)
local useScrollNavigationBindingsModule = require(genericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useScrollNavigationBindings)
local fFlagAbuseReportSlideOutgoingInputSinkModule = require(genericAbuseReporting.Flags.FFlagAbuseReportSlideOutgoingInputSink)
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
local slideTransitionLegacyModule = require(genericAbuseReporting.BeduiV2.Components.SlideTransitionLegacy)
local var1 = if fFlagAbuseReportSlideOutgoingInputSinkModule then require(genericAbuseReporting.BeduiV2.Components.SlideTransition) else nil
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local INLINE_LANDSCAPE_WIDTH = layoutSlotsModule.INLINE_LANDSCAPE_WIDTH

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useArTranslation (ref), reactModule (ref), animatePresence (ref), feedbackModule (ref), INLINE_LANDSCAPE_WIDTH (ref), fFlagAbuseReportSlideOutgoingInputSinkModule (ref), var1 (write), slideTransitionLegacyModule (ref), view (ref), useScrollNavigationBindingsModule (ref), useInExpFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), icon (ref), iconName (ref), inputSize (ref), abuseReportTooltipModule (ref)
	local var2 = useTokens()
	local translateIntoString = useArTranslation().translateIntoString
	local abuseReportFlow = p1.abuseReportFlow
	local config = abuseReportFlow.config
	local pendingInlineAlert = abuseReportFlow.pendingInlineAlert
	local var3 = reactModule.createElement(if fFlagAbuseReportSlideOutgoingInputSinkModule then var2 else slideTransitionLegacyModule, {
		nodeContent = reactModule.createElement(view, { tag = "col align-x-center size-full" }, {
			FeedbackAlertElement = reactModule.createElement(animatePresence, nil, if pendingInlineAlert then {
				Alert = reactModule.createElement(feedbackModule, {
					layoutOrder = 1,
					severity = pendingInlineAlert.type,
					title = translateIntoString(pendingInlineAlert.title),
					subtitle = if pendingInlineAlert.subtitle then translateIntoString(pendingInlineAlert.subtitle) else nil,
					onClose = abuseReportFlow.dismissInlineAlert,
					bottomMargin = if p1.shouldUseOverlaidControls then nil else var2.Padding.Medium,
					maxWidth = if p1.shouldUseOverlaidControls then INLINE_LANDSCAPE_WIDTH * var2.Config.UI.Scale else nil
				})
			} else nil),
			PageContent = reactModule.createElement(view, { tag = "col fill size-full-0", LayoutOrder = 2 }, abuseReportFlow.currentPageElement)
		}),
		nodeId = abuseReportFlow.currentNodeId,
		nodeType = abuseReportFlow.currentNodeType,
		direction = abuseReportFlow.navigationDirection
	})
	local var4, var5 = reactModule.useState(if config.display.titleDisclosure then config.display.titleDisclosure.openByDefault else false)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(function(p2)
			return not p2
		end)
	end, {})
	local var7 = useInExpFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, {}), var4, var4)
	
	return reactModule.createElement(view, {
		tag = {
			["size-full"] = p1.shouldUseOverlaidControls,
			["col size-full"] = not p1.shouldUseOverlaidControls
		},
		ref = useScrollNavigationBindingsModule()
	}, {
		TopControlsContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["size-full"] = p1.shouldUseOverlaidControls,
				["row flex-between size-full-0 auto-y"] = not p1.shouldUseOverlaidControls
			}
		}, {
			BackButtonContainer = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), view (copy), p1 (ref), abuseReportFlow (ref), icon (copy), iconName (copy), inputSize (copy)
				return reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = {
						["align-x-center auto-xy padding-y-small"] = true,
						["position-top-left anchor-top-left"] = p1.shouldUseOverlaidControls
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
				p1.shouldUseOverlaidControls
			}),
			AbuseReportTooltipContainer = reactModule.useMemo(function()
				-- upvalues: config (ref), reactModule (copy), view (copy), p1 (ref), var6 (ref), abuseReportTooltipModule (copy), var4 (ref), var7 (ref), icon (copy), iconName (copy), inputSize (copy)
				return if config.display.titleDisclosure then reactModule.createElement(view, {
					LayoutOrder = 3,
					ZIndex = 2,
					tag = {
						["align-x-center auto-xy padding-y-small"] = true,
						["position-top-right anchor-top-right"] = p1.shouldUseOverlaidControls
					}
				}, reactModule.createElement(view, {
					tag = "auto-xy padding-small radius-circle",
					onActivated = var6
				}, reactModule.createElement(abuseReportTooltipModule, {
					tooltipTitle = config.display.titleDisclosure.tooltipTitle,
					tooltipText = config.display.titleDisclosure.tooltipText,
					buttonLabel = config.display.titleDisclosure.buttonLabel,
					isOpen = var4,
					onClose = var6,
					ref = var7
				}, reactModule.createElement(icon, { name = iconName.CircleI, size = inputSize.Medium })))) else nil
			end, {
				config.display.titleDisclosure,
				var7,
				var6,
				var4,
				p1.shouldUseOverlaidControls
			})
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["col gap-xlarge size-full"] = p1.shouldUseOverlaidControls,
				["col fill size-full-0 margin-bottom-medium"] = not p1.shouldUseOverlaidControls
			}
		}, var3)
	})
end)