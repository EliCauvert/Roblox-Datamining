local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local VRService = game:GetService("VRService")
local reactModule = require(parent.React)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local constantsModule = require(interventionShared.Utils.Constants)
local cryoModule = require(parent.Cryo)
local evidenceFieldModule = require(interventionShared.Components.genericComponents.EvidenceField)
local interventionAnalyticsModule = require(interventionShared.InterventionAnalytics)
local linkingProtocol = require(parent.LinkingProtocol).LinkingProtocol
local postDismissInterventionModule = require(interventionShared.Http.PostDismissIntervention)
local responsiveModule = require(parent.Responsive)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local foundationModule = require(parent.Foundation)
local badge = foundationModule.Badge
local badgeVariant = foundationModule.Enums.BadgeVariant
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local buttonSize = foundationModule.Enums.ButtonSize
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local divider = foundationModule.Divider
local iconName = foundationModule.Enums.IconName
local iconPosition = foundationModule.Enums.IconPosition
local iconVariant = foundationModule.Enums.IconVariant
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local images = require(parent.FoundationImages).Images
local useInterventionFocusRootModule = require(interventionShared.Hooks.useInterventionFocusRoot)
local useInterventionPlacementModule = require(interventionShared.Hooks.useInterventionPlacement)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local usePreferredInput = responsiveModule.usePreferredInput
local useTokens = foundationModule.Hooks.useTokens
local useWebViewModule = require(interventionShared.Hooks.useWebView)
local fFlagFeatureRestrictionMiscFixesModule = require(interventionShared.Flags.FFlagFeatureRestrictionMiscFixes)
local fFlagNavigateToSafetyDashboardForAppeals = require(parent.SharedFlags).FFlagNavigateToSafetyDashboardForAppeals
local fFlagUniversalFeatureRestrictionReceivers = require(parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local accept = images["icons/actions/accept"]

return reactModule.memo(function(p0) --[[ line: 89 | named "GenericInterventionDialog" ]]
	-- upvalues: useTokens (ref), useRef (ref), useInterventionPlacementModule (ref), useLocalization (ref), constantsModule (ref), usePreferredInput (ref), responsiveModule (ref), fFlagNavigateToSafetyDashboardForAppeals (ref), urlBuilder (ref), useWebViewModule (ref), linkingProtocol (ref), fFlagFeatureRestrictionMiscFixesModule (ref), useInterventionFocusRootModule (ref), focusNavigableSurfaceIdentifierEnum (ref), useEffect (ref), interventionAnalyticsModule (ref), useCallback (ref), postDismissInterventionModule (ref), fFlagUniversalFeatureRestrictionReceivers (ref), notificationModalsManagerModule (ref), accept (ref), VRService (ref), reactModule (ref), text (ref), view (ref), divider (ref), evidenceFieldModule (ref), badge (ref), badgeVariant (ref), iconName (ref), iconPosition (ref), iconVariant (ref), cryoModule (ref), button (ref), buttonVariant (ref), buttonSize (ref), dialog (ref), dialogSize (ref), skeleton (ref), radius (ref), focusRoot (ref)
	local var16 = useTokens()
	local var17 = useRef(DateTime.now().UnixTimestampMillis)
	local var18 = useInterventionPlacementModule()
	local var19 = useLocalization(constantsModule.localizationKeys)
	local var20 = usePreferredInput() == responsiveModule.Input.Directional
	local var21 = if fFlagNavigateToSafetyDashboardForAppeals then urlBuilder.static.safetyDashboard.main() else urlBuilder.static.appealsPortal.main()
	local var22 = useWebViewModule(var21, if fFlagNavigateToSafetyDashboardForAppeals then var19.AccountStatusTitleText else var19.AppealsPortalTitleText)
	local default = linkingProtocol.default
	local var23 = if fFlagFeatureRestrictionMiscFixesModule then useInterventionFocusRootModule({
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ModerationOverlay
	}) else nil
	useEffect(function() --[[ line: 115 ]]
		-- upvalues: interventionAnalyticsModule (copy), p0 (ref), var18 (ref), var17 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogRendered, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.ModalAppeared,
			interventionType = p0.interventionTypeForAnalytics,
			placement = var18,
			renderedTimestamp = var17.current,
			eventId = p0.eventId,
			evidence = p0.evidence,
			duration = p0.durationForAnalytics,
			acknowledgeable = p0.acknowledgeable,
			abuseVector = p0.abuseVectorForAnalytics
		})
	end, { var17 })
	local var24 = useCallback(function() --[[ line: 130 ]]
		-- upvalues: p0 (ref), postDismissInterventionModule (copy), interventionAnalyticsModule (copy), var18 (ref), var17 (ref)
		if p0.acknowledgeable and p0.interventionId then
			postDismissInterventionModule(p0.interventionId):andThen(function(_) --[[ line: 132 ]]
				-- upvalues: interventionAnalyticsModule (copy), p0 (copy), var18 (copy), var17 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissSuccess, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissSuccess,
					interventionType = p0.interventionTypeForAnalytics,
					placement = var18,
					renderedTimestamp = var17.current,
					eventId = p0.eventId,
					acknowledgeable = p0.acknowledgeable,
					abuseVector = p0.abuseVectorForAnalytics
				})
			end):catch(function(p1) --[[ line: 145 ]]
				-- upvalues: interventionAnalyticsModule (copy), p0 (copy), var18 (copy), var17 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissFailed, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissFailed,
					interventionType = p0.interventionTypeForAnalytics,
					placement = var18,
					renderedTimestamp = var17.current,
					eventId = p0.eventId,
					error = p1.error,
					acknowledgeable = p0.acknowledgeable,
					abuseVector = p0.abuseVectorForAnalytics
				})
			end)
		end
	end, {
		p0.acknowledgeable, p0.interventionId, p0.interventionTypeForAnalytics, var18,
		var17.current, p0.eventId, p0.abuseVectorForAnalytics
	})
	local var25 = useCallback(function() --[[ line: 176 ]]
		-- upvalues: interventionAnalyticsModule (copy), p0 (ref), var18 (ref), var17 (ref), fFlagUniversalFeatureRestrictionReceivers (copy), var24 (ref), postDismissInterventionModule (copy)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogCtaClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.CtaClicked,
			interventionType = p0.interventionTypeForAnalytics,
			placement = var18,
			renderedTimestamp = var17.current,
			eventId = p0.eventId,
			acknowledgeable = p0.acknowledgeable,
			abuseVector = p0.abuseVectorForAnalytics
		})
		
		if fFlagUniversalFeatureRestrictionReceivers then
			var24()
		elseif p0.acknowledgeable and p0.interventionId then
			postDismissInterventionModule(p0.interventionId):andThen(function(_) --[[ line: 191 ]]
				-- upvalues: interventionAnalyticsModule (copy), p0 (copy), var18 (copy), var17 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissSuccess, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissSuccess,
					interventionType = p0.interventionTypeForAnalytics,
					placement = var18,
					renderedTimestamp = var17.current,
					eventId = p0.eventId,
					acknowledgeable = p0.acknowledgeable,
					abuseVector = p0.abuseVectorForAnalytics
				})
			end):catch(function(p2) --[[ line: 204 ]]
				-- upvalues: interventionAnalyticsModule (copy), p0 (copy), var18 (copy), var17 (copy)
				interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissFailed, {
					eventType = interventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissFailed,
					interventionType = p0.interventionTypeForAnalytics,
					placement = var18,
					renderedTimestamp = var17.current,
					eventId = p0.eventId,
					error = p2.error,
					acknowledgeable = p0.acknowledgeable,
					abuseVector = p0.abuseVectorForAnalytics
				})
			end)
		end
		p0.onDismiss()
	end, {
		p0.onDismiss, p0.interventionTypeForAnalytics, var18, var17.current,
		p0.eventId, p0.abuseVectorForAnalytics, p0.acknowledgeable, p0.interventionId,
		var24
	})
	local var26 = useCallback(function() --[[ line: 240 ]]
		-- upvalues: interventionAnalyticsModule (copy), p0 (ref), var18 (ref), var17 (ref), fFlagUniversalFeatureRestrictionReceivers (copy), var24 (ref), notificationModalsManagerModule (copy), accept (copy), var19 (ref), var16 (ref), VRService (copy), var20 (ref), default (ref), var21 (ref), var22 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogAppealClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.AppealClicked,
			interventionType = p0.interventionTypeForAnalytics,
			placement = var18,
			renderedTimestamp = var17.current,
			eventId = p0.eventId,
			acknowledgeable = p0.acknowledgeable,
			abuseVector = p0.abuseVectorForAnalytics
		})
		
		if fFlagUniversalFeatureRestrictionReceivers and p0.useDetailedLayout and p0.onAppeal then
			p0.onAppeal()
			
			if not p0.shouldOpenAppealsPortal then
				var24()
				p0.onDismiss()
				notificationModalsManagerModule.SetUIBloxToast({
					iconImage = accept,
					toastTitle = var19.TakeALookText,
					toastSubtitle = var19.FeedbackHelpsText,
					sequenceNumber = DateTime.now().UnixTimestamp,
					iconColorStyle = {
						Transparency = 0,
						Color = var16.Color.System.Success.Color3
					}
				})
				
				return
			elseif VRService.VREnabled or var20 then
				default:openURL(var21)
				
				return
			end
			var22()
		end
	end, {
		var22, default, VRService.VREnabled, var20, p0.interventionTypeForAnalytics,
		var18, var17.current, var21, p0.abuseVectorForAnalytics, p0.acknowledgeable,
		p0.interventionId, p0.eventId, var19.FeedbackHelpsText, var19.TakeALookText,
		p0.onAppeal, p0.shouldOpenAppealsPortal, p0.onDismiss, p0.useDetailedLayout,
		var16.Color.System.Success.Color3, var24
	})
	local t = {}
	local useDetailedLayout = fFlagUniversalFeatureRestrictionReceivers and p0.useDetailedLayout
	
	if p0.bodyText and p0.bodyText ~= "" then
		t.BodyText = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-default text-align-x-left text-wrap",
			testId = "dialog-body-text",
			LayoutOrder = 1,
			Text = p0.bodyText
		})
	end
	if useDetailedLayout then
		local t_1 = {}
		
		if p0.evidence and p0.evidence ~= "" then
			t_1.EvidenceItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-evidence-item",
				LayoutOrder = 1
			}, {
				EvidenceText = reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					Text = p0.evidence
				})
			})
		end
		if p0.violationReason and p0.violationReason ~= "" then
			if p0.evidence and p0.evidence ~= "" then
				t_1.DividerAfterEvidence = reactModule.createElement(divider, { LayoutOrder = 2 })
			end
			t_1.ReasonItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-reason-item",
				LayoutOrder = 3
			}, {
				ReasonField = reactModule.createElement(evidenceFieldModule, {
					fieldLabel = var19.ReasonText,
					fieldValue = p0.violationReason
				})
			})
		end
		if p0.userNote and p0.userNote ~= "" then
			t_1.NoteItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-note-item",
				LayoutOrder = 4
			}, {
				NoteText = reactModule.createElement(evidenceFieldModule, {
					fieldLabel = var19.ModeratorNoteLabel,
					fieldValue = p0.userNote
				})
			})
		end
		if p0.formattedEndDate and p0.formattedEndDate ~= "" then
			t_1.EndingOnItem = reactModule.createElement(view, {
				tag = "size-full-0 auto-y row padding-x-medium align-y-center",
				testId = "dialog-ending-on-item",
				LayoutOrder = 5
			}, {
				EndingOnInfo = reactModule.createElement(view, { tag = "auto-y col fill", LayoutOrder = 1 }, {
					EvidenceField = reactModule.createElement(evidenceFieldModule, {
						hasColon = false,
						fieldLabel = var19.EndsOnText,
						fieldValue = p0.formattedEndDate
					})
				}),
				CountdownBadge = reactModule.createElement(badge, {
					LayoutOrder = 2,
					text = p0.countdownText or var19.CompleteText,
					variant = badgeVariant.Neutral,
					icon = if p0.countdownText then {
						name = iconName.Clock,
						position = iconPosition.Left,
						variant = iconVariant.Filled
					} else nil
				})
			})
		end
		if not cryoModule.isEmpty(t_1) then
			t.DetailedList = reactModule.createElement(view, {
				tag = "size-full-0 auto-y padding-top-xxsmall padding-x-xxsmall padding-bottom-medium",
				testId = "dialog-detailed-list",
				LayoutOrder = 2
			}, reactModule.createElement(view, {
				tag = "size-full-0 auto-y col padding-y-large gap-large radius-large bg-shift-100 stroke-standard stroke-default"
			}, t_1))
		end
	elseif p0.evidence and p0.evidence ~= "" or p0.violationReason and p0.violationReason ~= "" or p0.isAppealable then
		t.Evidence = reactModule.createElement(view, {
			tag = "size-full-0 auto-y padding-xxsmall",
			LayoutOrder = 2
		}, {
			reactModule.createElement(view, {
				tag = "size-full-0 auto-y col gap-small padding-medium radius-medium bg-surface-200 stroke-standard stroke-default"
			}, {
				EvidenceText = p0.evidence and (p0.evidence ~= "" and reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 1,
					Text = p0.evidence
				})),
				Reason = p0.violationReason and (p0.violationReason ~= "" and reactModule.createElement(text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 2,
					Text = `<b>{var19.ReasonText}:</b>\n{p0.violationReason}`
				})),
				AppealButton = p0.isAppealable and reactModule.createElement(button, {
					LayoutOrder = 3,
					text = var19.ReportMistakeText,
					variant = buttonVariant.Standard,
					size = buttonSize.XSmall,
					width = UDim.new(1, 0),
					onActivated = var26
				})
			})
		})
	end
	if p0.dsaMessage and p0.dsaMessage ~= "" and not useDetailedLayout then
		t.DsaMessage = reactModule.createElement(text, {
			tag = "auto-xy text-caption-small content-default text-align-x-left text-wrap",
			LayoutOrder = 3,
			Text = p0.dsaMessage
		})
	end
	local list = nil
	
	if useDetailedLayout then
		list = {
			{
				variant = buttonVariant.Emphasis,
				size = buttonSize.Medium,
				text = var19.OkText,
				onActivated = var25,
				width = UDim.new(1, 0)
			}
		}
		
		if p0.isAppealable then
			table.insert(list, {
				variant = buttonVariant.Standard,
				size = buttonSize.Medium,
				text = var19.ReportMistakeText,
				onActivated = var26,
				width = UDim.new(1, 0)
			})
		end
	end
	if not fFlagFeatureRestrictionMiscFixesModule then
		return reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
		}, {
			reactModule.createElement(dialog.Root, { hasCloseButton = false, size = dialogSize.Medium }, {
				DialogTitle = not p0.isLoading and reactModule.createElement(dialog.Title, { text = p0.titleText }),
				DialogContent = reactModule.createElement(dialog.Content, nil, if p0.isLoading then reactModule.createElement(view, {
					tag = "size-full-0 auto-y col gap-medium margin-top-small"
				}, {
					Heading = reactModule.createElement(skeleton, {
						LayoutOrder = 1,
						Size = UDim2.new(0.6, 0, 0, var16.Size.Size_1100),
						radius = radius.Medium
					}),
					Body = reactModule.createElement(skeleton, {
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, var16.Size.Size_2000),
						radius = radius.Medium
					}),
					Actions = reactModule.createElement(skeleton, {
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, var16.Size.Size_800),
						radius = radius.Medium
					})
				}) else reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-medium" }, t)),
				DialogActions = not p0.isLoading and reactModule.createElement(dialog.Actions, {
					actions = {
						{
							variant = buttonVariant.Emphasis,
							size = buttonSize.Small,
							text = var19.OkText,
							onActivated = var25
						}
					}
				})
			})
		})
	end
	local createElement = reactModule.createElement
	local root = dialog.Root
	local t_1 = {
		hasCloseButton = false,
		size = dialogSize.Medium,
		ref = var23,
		hasBackdrop = not VRService.VREnabled,
		disablePortal = var18 ~= constantsModule.InterventionPlacementType.InExperience
	}
	local t_2 = {
		DialogTitle = not p0.isLoading and reactModule.createElement(dialog.Title, { text = p0.titleText }),
		DialogContent = reactModule.createElement(dialog.Content, nil, if p0.isLoading then reactModule.createElement(view, {
			tag = "size-full-0 auto-y col gap-medium margin-top-small"
		}, {
			Heading = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.6, 0, 0, var16.Size.Size_1100),
				radius = radius.Medium
			}),
			Body = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, var16.Size.Size_2000),
				radius = radius.Medium
			}),
			Actions = reactModule.createElement(skeleton, {
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, var16.Size.Size_800),
				radius = radius.Medium
			})
		}) else reactModule.createElement(view, { tag = "size-full-0 auto-y col gap-medium" }, t))
	}
	local var33 = not p0.isLoading
	
	if var33 then
		var33 = reactModule.createElement
		var33 = var33(dialog.Actions, {
			actions = if useDetailedLayout then list else {
				{
					variant = buttonVariant.Emphasis,
					size = buttonSize.Small,
					text = var19.OkText,
					onActivated = var25
				}
			},
			label = if useDetailedLayout and p0.useDetailedLayout and (p0.dsaMessage and p0.dsaMessage ~= "") then p0.dsaMessage else nil
		})
	end
	t_2.DialogActions = var33
	
	return createElement(root, t_1, t_2)
end)