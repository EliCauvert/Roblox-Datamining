local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local UseInExpFocusNavigationRefsModule = require(GenericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useInExpFocusNavigationRefs)
local UseScrollNavigationBindingsModule = require(GenericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useScrollNavigationBindings)
local AnimatePresence = require(Parent.Motion).AnimatePresence
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local AbuseReportTooltipModule = require(GenericAbuseReporting.BeduiV2.Components.AbuseReportTooltip)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local FeedbackModule = require(GenericAbuseReporting.BeduiV2.Components.Feedback)
local SlideTransitionModule = require(GenericAbuseReporting.BeduiV2.Components.SlideTransition)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local INLINELANDSCAPEWIDTH = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).INLINE_LANDSCAPE_WIDTH

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseArTranslationFunction (copy), ReactModule (copy), AnimatePresence (copy), FeedbackModule (copy), INLINELANDSCAPEWIDTH (copy), SlideTransitionModule (copy), View (copy), UseScrollNavigationBindingsModule (copy), UseInExpFocusNavigationRefsModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), Icon (copy), IconName (copy), InputSize (copy), AbuseReportTooltipModule (copy)
	local UseTokensResult = UseTokensFunction()
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local AbuseReportFlow = p1.abuseReportFlow
	local Config = AbuseReportFlow.config
	local PendingInlineAlert = AbuseReportFlow.pendingInlineAlert
	local Element = ReactModule.createElement(SlideTransitionModule, {
		nodeContent = ReactModule.createElement(View, { tag = "col align-x-center size-full" }, {
			FeedbackAlertElement = ReactModule.createElement(AnimatePresence, nil, if PendingInlineAlert then {
				Alert = ReactModule.createElement(FeedbackModule, {
					layoutOrder = 1,
					severity = PendingInlineAlert.type,
					title = TranslateIntoStringFunction(PendingInlineAlert.title),
					subtitle = if PendingInlineAlert.subtitle then TranslateIntoStringFunction(PendingInlineAlert.subtitle) else nil,
					onClose = AbuseReportFlow.dismissInlineAlert,
					bottomMargin = if p1.shouldUseOverlaidControls then nil else UseTokensResult.Padding.Medium,
					maxWidth = if p1.shouldUseOverlaidControls then INLINELANDSCAPEWIDTH * UseTokensResult.Config.UI.Scale else nil
				})
			} else nil),
			PageContent = ReactModule.createElement(View, { tag = "col fill size-full-0", LayoutOrder = 2 }, AbuseReportFlow.currentPageElement)
		}),
		nodeId = AbuseReportFlow.currentNodeId,
		nodeType = AbuseReportFlow.currentNodeType,
		direction = AbuseReportFlow.navigationDirection
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(Config.display.titleDisclosure and Config.display.titleDisclosure.openByDefault or false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p2): boolean
			return not p2
		end)
	end, {})
	local UseScrollNavigationBindingsModuleResult = UseScrollNavigationBindingsModule()
	local UseInExpFocusNavigationRefsModuleResult = UseInExpFocusNavigationRefsModule(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {}), UseStateResult, UseStateResult)
	
	return ReactModule.createElement(View, {
		tag = {
			["size-full"] = p1.shouldUseOverlaidControls,
			["col size-full"] = not p1.shouldUseOverlaidControls
		},
		ref = UseScrollNavigationBindingsModuleResult
	}, {
		TopControlsContainer = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["size-full"] = p1.shouldUseOverlaidControls,
				["row flex-between size-full-0 auto-y"] = not p1.shouldUseOverlaidControls
			}
		}, {
			BackButtonContainer = ReactModule.useMemo(function()
				-- upvalues: ReactModule (upval), View (upval), p1 (copy), AbuseReportFlow (copy), Icon (upval), IconName (upval), InputSize (upval)
				return ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = {
						["align-x-center auto-xy padding-y-small"] = true,
						["position-top-left anchor-top-left"] = p1.shouldUseOverlaidControls
					}
				}, ReactModule.createElement(View, {
					tag = "auto-xy padding-small radius-circle",
					isDisabled = not AbuseReportFlow.canGoBack,
					selection = { Selectable = AbuseReportFlow.canGoBack },
					onActivated = AbuseReportFlow.goBack
				}, ReactModule.createElement(Icon, {
					name = IconName.ChevronLargeLeft,
					size = InputSize.Medium,
					style = {
						Transparency = if AbuseReportFlow.canGoBack then 0 else 1
					}
				})))
			end, {
				AbuseReportFlow.canGoBack,
				AbuseReportFlow.goBack,
				p1.shouldUseOverlaidControls
			}),
			AbuseReportTooltipContainer = ReactModule.useMemo(function()
				-- upvalues: Config (copy), ReactModule (upval), View (upval), p1 (copy), UseResult (copy), AbuseReportTooltipModule (upval), UseStateResult (copy), UseInExpFocusNavigationRefsModuleResult (copy), Icon (upval), IconName (upval), InputSize (upval)
				return if Config.display.titleDisclosure then ReactModule.createElement(View, {
					LayoutOrder = 3,
					ZIndex = 2,
					tag = {
						["align-x-center auto-xy padding-y-small"] = true,
						["position-top-right anchor-top-right"] = p1.shouldUseOverlaidControls
					}
				}, ReactModule.createElement(View, {
					tag = "auto-xy padding-small radius-circle",
					onActivated = UseResult
				}, ReactModule.createElement(AbuseReportTooltipModule, {
					tooltipTitle = Config.display.titleDisclosure.tooltipTitle,
					tooltipText = Config.display.titleDisclosure.tooltipText,
					buttonLabel = Config.display.titleDisclosure.buttonLabel,
					isOpen = UseStateResult,
					onClose = UseResult,
					ref = UseInExpFocusNavigationRefsModuleResult
				}, ReactModule.createElement(Icon, { name = IconName.CircleI, size = InputSize.Medium })))) else nil
			end, {
				Config.display.titleDisclosure,
				UseInExpFocusNavigationRefsModuleResult,
				UseResult,
				UseStateResult,
				p1.shouldUseOverlaidControls
			})
		}),
		Content = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["col gap-xlarge size-full"] = p1.shouldUseOverlaidControls,
				["col fill size-full-0 margin-bottom-medium"] = not p1.shouldUseOverlaidControls
			}
		}, Element)
	})
end)