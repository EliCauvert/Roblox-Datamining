local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local VRService = game:GetService("VRService")
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local ConstantsModule = require(InterventionShared.Utils.Constants)
local CryoModule = require(Parent.Cryo)
local EvidenceFieldModule = require(InterventionShared.Components.genericComponents.EvidenceField)
local InterventionAnalyticsModule = require(InterventionShared.InterventionAnalytics)
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local PostDismissInterventionModule = require(InterventionShared.Http.PostDismissIntervention)
local ResponsiveModule = require(Parent.Responsive)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local FoundationModule = require(Parent.Foundation)
local Badge = FoundationModule.Badge
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local Divider = FoundationModule.Divider
local IconName = FoundationModule.Enums.IconName
local IconPosition = FoundationModule.Enums.IconPosition
local IconVariant = FoundationModule.Enums.IconVariant
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseInterventionFocusRootModule = require(InterventionShared.Hooks.useInterventionFocusRoot)
local UseInterventionPlacementModule = require(InterventionShared.Hooks.useInterventionPlacement)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseWebViewModule = require(InterventionShared.Hooks.useWebView)
local FFlagNavigateToSafetyDashboardForAppeals = require(Parent.SharedFlags).FFlagNavigateToSafetyDashboardForAppeals
local FFlagUniversalFeatureRestrictionReceivers = require(Parent.SharedFlags).FFlagUniversalFeatureRestrictionReceivers
local IconsActionsAccept = require(Parent.FoundationImages).Images["icons/actions/accept"]

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseRefFunction (copy), UseInterventionPlacementModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagNavigateToSafetyDashboardForAppeals (copy), UrlBuilder (copy), UseWebViewModule (copy), LinkingProtocol (copy), UseInterventionFocusRootModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseEffectFunction (copy), InterventionAnalyticsModule (copy), UseCallbackFunction (copy), PostDismissInterventionModule (copy), FFlagUniversalFeatureRestrictionReceivers (copy), NotificationModalsManagerModule (copy), IconsActionsAccept (copy), VRService (copy), ReactModule (copy), Text (copy), View (copy), Divider (copy), EvidenceFieldModule (copy), Badge (copy), BadgeVariant (copy), IconName (copy), IconPosition (copy), IconVariant (copy), CryoModule (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), Dialog (copy), DialogSize (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = UseRefFunction(DateTime.now().UnixTimestampMillis)
	local UseInterventionPlacementModuleResult = UseInterventionPlacementModule()
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.localizationKeys)
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Directional
	local MainResult = if FFlagNavigateToSafetyDashboardForAppeals then UrlBuilder.static.safetyDashboard.main() else UrlBuilder.static.appealsPortal.main()
	local UseWebViewModuleResult = UseWebViewModule(MainResult, if FFlagNavigateToSafetyDashboardForAppeals then UseLocalizationResult.AccountStatusTitleText else UseLocalizationResult.AppealsPortalTitleText)
	local Default = LinkingProtocol.default
	local UseInterventionFocusRootModuleResult = UseInterventionFocusRootModule({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ModerationOverlay
	})
	UseEffectFunction(function()
		-- upvalues: InterventionAnalyticsModule (upval), p1 (copy), UseInterventionPlacementModuleResult (copy), UseRefResult (copy)
		InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogRendered, {
			eventType = InterventionAnalyticsModule.Constants.EventTypes.ModalAppeared,
			interventionType = p1.interventionTypeForAnalytics,
			placement = UseInterventionPlacementModuleResult,
			renderedTimestamp = UseRefResult.current,
			eventId = p1.eventId,
			evidence = p1.evidence,
			duration = p1.durationForAnalytics,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
	end, { UseRefResult })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: p1 (copy), PostDismissInterventionModule (upval), InterventionAnalyticsModule (upval), UseInterventionPlacementModuleResult (copy), UseRefResult (copy)
		if p1.acknowledgeable and p1.interventionId then
			PostDismissInterventionModule(p1.interventionId):andThen(function(_)
				-- upvalues: InterventionAnalyticsModule (upval), p1 (upval), UseInterventionPlacementModuleResult (upval), UseRefResult (upval)
				InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissSuccess, {
					eventType = InterventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissSuccess,
					interventionType = p1.interventionTypeForAnalytics,
					placement = UseInterventionPlacementModuleResult,
					renderedTimestamp = UseRefResult.current,
					eventId = p1.eventId,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end):catch(function(Err)
				-- upvalues: InterventionAnalyticsModule (upval), p1 (upval), UseInterventionPlacementModuleResult (upval), UseRefResult (upval)
				InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissFailed, {
					eventType = InterventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissFailed,
					interventionType = p1.interventionTypeForAnalytics,
					placement = UseInterventionPlacementModuleResult,
					renderedTimestamp = UseRefResult.current,
					eventId = p1.eventId,
					error = Err.error,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end)
		end
	end, {
		p1.acknowledgeable, p1.interventionId, p1.interventionTypeForAnalytics,
		UseInterventionPlacementModuleResult, UseRefResult.current, p1.eventId,
		p1.abuseVectorForAnalytics
	})
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: InterventionAnalyticsModule (upval), p1 (copy), UseInterventionPlacementModuleResult (copy), UseRefResult (copy), FFlagUniversalFeatureRestrictionReceivers (upval), UseCallbackResult (copy), PostDismissInterventionModule (upval)
		InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogCtaClicked, {
			eventType = InterventionAnalyticsModule.Constants.EventTypes.CtaClicked,
			interventionType = p1.interventionTypeForAnalytics,
			placement = UseInterventionPlacementModuleResult,
			renderedTimestamp = UseRefResult.current,
			eventId = p1.eventId,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
		
		if FFlagUniversalFeatureRestrictionReceivers then
			UseCallbackResult()
		elseif p1.acknowledgeable and p1.interventionId then
			PostDismissInterventionModule(p1.interventionId):andThen(function(_)
				-- upvalues: InterventionAnalyticsModule (upval), p1 (upval), UseInterventionPlacementModuleResult (upval), UseRefResult (upval)
				InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissSuccess, {
					eventType = InterventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissSuccess,
					interventionType = p1.interventionTypeForAnalytics,
					placement = UseInterventionPlacementModuleResult,
					renderedTimestamp = UseRefResult.current,
					eventId = p1.eventId,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end):catch(function(Err)
				-- upvalues: InterventionAnalyticsModule (upval), p1 (upval), UseInterventionPlacementModuleResult (upval), UseRefResult (upval)
				InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogInterventionDismissFailed, {
					eventType = InterventionAnalyticsModule.Constants.EventTypes.DialogInterventionDismissFailed,
					interventionType = p1.interventionTypeForAnalytics,
					placement = UseInterventionPlacementModuleResult,
					renderedTimestamp = UseRefResult.current,
					eventId = p1.eventId,
					error = Err.error,
					acknowledgeable = p1.acknowledgeable,
					abuseVector = p1.abuseVectorForAnalytics
				})
			end)
		end
		p1.onDismiss()
	end, {
		p1.onDismiss, p1.interventionTypeForAnalytics,
		UseInterventionPlacementModuleResult, UseRefResult.current, p1.eventId,
		p1.abuseVectorForAnalytics, p1.acknowledgeable, p1.interventionId,
		UseCallbackResult
	})
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: InterventionAnalyticsModule (upval), p1 (copy), UseInterventionPlacementModuleResult (copy), UseRefResult (copy), FFlagUniversalFeatureRestrictionReceivers (upval), UseCallbackResult (copy), NotificationModalsManagerModule (upval), IconsActionsAccept (upval), UseLocalizationResult (copy), UseTokensResult (copy), VRService (upval), IsUsePreferredInputResultMatch (copy), Default (copy), MainResult (copy), UseWebViewModuleResult (copy)
		InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogAppealClicked, {
			eventType = InterventionAnalyticsModule.Constants.EventTypes.AppealClicked,
			interventionType = p1.interventionTypeForAnalytics,
			placement = UseInterventionPlacementModuleResult,
			renderedTimestamp = UseRefResult.current,
			eventId = p1.eventId,
			acknowledgeable = p1.acknowledgeable,
			abuseVector = p1.abuseVectorForAnalytics
		})
		
		if FFlagUniversalFeatureRestrictionReceivers and p1.useDetailedLayout and p1.onAppeal then
			p1.onAppeal()
			
			if not p1.shouldOpenAppealsPortal then
				UseCallbackResult()
				p1.onDismiss()
				NotificationModalsManagerModule.SetUIBloxToast({
					iconImage = IconsActionsAccept,
					toastTitle = UseLocalizationResult.TakeALookText,
					toastSubtitle = UseLocalizationResult.FeedbackHelpsText,
					sequenceNumber = DateTime.now().UnixTimestamp,
					iconColorStyle = {
						Transparency = 0,
						Color = UseTokensResult.Color.System.Success.Color3
					}
				})
				
				return
			end
		end
		if VRService.VREnabled or IsUsePreferredInputResultMatch then
			Default:openURL(MainResult)
			
			return
		else
			UseWebViewModuleResult()
		end
	end, {
		UseWebViewModuleResult, Default, VRService.VREnabled,
		IsUsePreferredInputResultMatch, p1.interventionTypeForAnalytics,
		UseInterventionPlacementModuleResult, UseRefResult.current, MainResult,
		p1.abuseVectorForAnalytics, p1.acknowledgeable, p1.interventionId, p1.eventId,
		UseLocalizationResult.FeedbackHelpsText, UseLocalizationResult.TakeALookText,
		p1.onAppeal, p1.shouldOpenAppealsPortal, p1.onDismiss, p1.useDetailedLayout,
		UseTokensResult.Color.System.Success.Color3, UseCallbackResult
	})
	local t = {}
	local UseDetailedLayout = FFlagUniversalFeatureRestrictionReceivers and p1.useDetailedLayout
	
	if p1.bodyText and p1.bodyText ~= "" then
		t.BodyText = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-default text-align-x-left text-wrap",
			testId = "dialog-body-text",
			LayoutOrder = 1,
			Text = p1.bodyText
		})
	end
	if UseDetailedLayout then
		local t1 = {}
		
		if p1.evidence and p1.evidence ~= "" then
			t1.EvidenceItem = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-evidence-item",
				LayoutOrder = 1
			}, {
				EvidenceText = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					Text = p1.evidence
				})
			})
		end
		if p1.violationReason and p1.violationReason ~= "" then
			if p1.evidence and p1.evidence ~= "" then
				t1.DividerAfterEvidence = ReactModule.createElement(Divider, { LayoutOrder = 2 })
			end
			t1.ReasonItem = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-reason-item",
				LayoutOrder = 3
			}, {
				ReasonField = ReactModule.createElement(EvidenceFieldModule, {
					fieldLabel = UseLocalizationResult.ReasonText,
					fieldValue = p1.violationReason
				})
			})
		end
		if p1.userNote and p1.userNote ~= "" then
			t1.NoteItem = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-x-medium",
				testId = "dialog-note-item",
				LayoutOrder = 4
			}, {
				NoteText = ReactModule.createElement(EvidenceFieldModule, {
					fieldLabel = UseLocalizationResult.ModeratorNoteLabel,
					fieldValue = p1.userNote
				})
			})
		end
		if p1.formattedEndDate and p1.formattedEndDate ~= "" then
			t1.EndingOnItem = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y row padding-x-medium align-y-center",
				testId = "dialog-ending-on-item",
				LayoutOrder = 5
			}, {
				EndingOnInfo = ReactModule.createElement(View, { tag = "auto-y col fill", LayoutOrder = 1 }, {
					EvidenceField = ReactModule.createElement(EvidenceFieldModule, {
						hasColon = false,
						fieldLabel = UseLocalizationResult.EndsOnText,
						fieldValue = p1.formattedEndDate
					})
				}),
				CountdownBadge = ReactModule.createElement(Badge, {
					LayoutOrder = 2,
					text = p1.countdownText or UseLocalizationResult.CompleteText,
					variant = BadgeVariant.Neutral,
					icon = if p1.countdownText then {
						name = IconName.Clock,
						position = IconPosition.Left,
						variant = IconVariant.Filled
					} else nil
				})
			})
		end
		if not CryoModule.isEmpty(t1) then
			t.DetailedList = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y padding-top-xxsmall padding-x-xxsmall padding-bottom-medium",
				testId = "dialog-detailed-list",
				LayoutOrder = 2
			}, ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col padding-y-large gap-large radius-large bg-shift-100 stroke-standard stroke-default"
			}, t1))
		end
	elseif p1.evidence and p1.evidence ~= "" or p1.violationReason and p1.violationReason ~= "" or p1.isAppealable then
		t.Evidence = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y padding-xxsmall",
			LayoutOrder = 2
		}, {
			ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col gap-small padding-medium radius-medium bg-surface-200 stroke-standard stroke-default"
			}, {
				EvidenceText = p1.evidence and (p1.evidence ~= "" and ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 1,
					Text = p1.evidence
				})),
				Reason = p1.violationReason and (p1.violationReason ~= "" and ReactModule.createElement(Text, {
					tag = "auto-xy text-body-medium text-align-x-left text-wrap",
					RichText = true,
					LayoutOrder = 2,
					Text = `<b>{UseLocalizationResult.ReasonText}:</b>\n{p1.violationReason}`
				})),
				AppealButton = p1.isAppealable and ReactModule.createElement(Button, {
					LayoutOrder = 3,
					text = UseLocalizationResult.ReportMistakeText,
					variant = ButtonVariant.Standard,
					size = ButtonSize.XSmall,
					width = UDim.new(1, 0),
					onActivated = UseCallbackResult2
				})
			})
		})
	end
	if p1.dsaMessage and p1.dsaMessage ~= "" and not UseDetailedLayout then
		t.DsaMessage = ReactModule.createElement(Text, {
			tag = "auto-xy text-caption-small content-default text-align-x-left text-wrap",
			LayoutOrder = 3,
			Text = p1.dsaMessage
		})
	end
	local List = nil
	
	if UseDetailedLayout then
		List = {
			{
				variant = ButtonVariant.Emphasis,
				size = ButtonSize.Medium,
				text = UseLocalizationResult.OkText,
				onActivated = UseCallbackResult1,
				width = UDim.new(1, 0)
			}
		}
		
		if p1.isAppealable then
			table.insert(List, {
				variant = ButtonVariant.Standard,
				size = ButtonSize.Medium,
				text = UseLocalizationResult.ReportMistakeText,
				onActivated = UseCallbackResult2,
				width = UDim.new(1, 0)
			})
		end
	end
	return ReactModule.createElement(Dialog.Root, {
		hasCloseButton = false,
		size = DialogSize.Medium,
		ref = UseInterventionFocusRootModuleResult,
		hasBackdrop = not VRService.VREnabled,
		disablePortal = UseInterventionPlacementModuleResult ~= ConstantsModule.InterventionPlacementType.InExperience
	}, {
		DialogTitle = not p1.isLoading and ReactModule.createElement(Dialog.Title, { text = p1.titleText }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, if p1.isLoading then ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-medium margin-top-small"
		}, {
			Heading = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.6, 0, 0, UseTokensResult.Size.Size_1100),
				radius = Radius.Medium
			}),
			Body = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_2000),
				radius = Radius.Medium
			}),
			Actions = ReactModule.createElement(Skeleton, {
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_800),
				radius = Radius.Medium
			})
		}) else ReactModule.createElement(View, { tag = "size-full-0 auto-y col gap-medium" }, t)),
		DialogActions = not p1.isLoading and ReactModule.createElement(Dialog.Actions, {
			actions = if UseDetailedLayout then List else {
				{
					variant = ButtonVariant.Emphasis,
					size = ButtonSize.Small,
					text = UseLocalizationResult.OkText,
					onActivated = UseCallbackResult1
				}
			},
			label = if UseDetailedLayout and p1.useDetailedLayout and p1.dsaMessage and p1.dsaMessage ~= "" then p1.dsaMessage else nil
		})
	})
end)