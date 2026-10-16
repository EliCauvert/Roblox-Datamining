local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local ModalWindow = UIBloxModule.App.Dialog.Modal.ModalWindow
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ConstantsModule = require(InterventionShared.Utils.Constants)
local InterventionAnalyticsModule = require(InterventionShared.InterventionAnalytics)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local ScrollView = FoundationModule.ScrollView
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local IconsActionsAccept = UIBloxModule.App.ImageSet.Images["icons/actions/accept"]
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseScrollFrameHeightCalculationModule = require(InterventionShared.Hooks.useScrollFrameHeightCalculation)
local UseCursorFunction = UIBloxModule.App.SelectionCursor.useCursor
local UseInterventionPlacementModule = require(InterventionShared.Hooks.useInterventionPlacement)
local FFlagExpChatEnableFriendsTab = require(Parent.SharedFlags).FFlagExpChatEnableFriendsTab
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot

function InterventionDialog(p1) --[[ Line: 50 ]]
	-- upvalues: UseLayerCollectorFunction (copy), ReactModule (copy), UseTokensFunction (copy), UseStyleFunction (copy), UseInterventionPlacementModule (copy), UseLocalizationFunction (copy), ConstantsModule (copy), InterventionAnalyticsModule (copy), NotificationModalsManagerModule (copy), IconsActionsAccept (copy), UseScrollFrameHeightCalculationModule (copy), UseCursorFunction (copy), ModalWindow (copy), View (copy), ScrollView (copy), ScrollBarVisibility (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), Icon (copy), Text (copy), FFlagExpChatEnableFriendsTab (copy), ButtonStack (copy), ButtonType (copy)
	local AbsoluteSize = UseLayerCollectorFunction().absoluteSize
	local UseRefResult = ReactModule.useRef(DateTime.now().UnixTimestampMillis)
	local UseTokensResult = UseTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local UseInterventionPlacementModuleResult = UseInterventionPlacementModule()
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.localizationKeys)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 61 ]]
		-- upvalues: InterventionAnalyticsModule (upval), p1 (copy), UseInterventionPlacementModuleResult (copy), UseRefResult (copy)
		InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogCtaClicked, {
			eventType = InterventionAnalyticsModule.Constants.EventTypes.CtaClicked,
			counterNamespace = p1.namespaceForAnalytics,
			interventionType = p1.interventionTypeForAnalytics,
			placement = UseInterventionPlacementModuleResult,
			renderedTimestamp = UseRefResult.current,
			eventId = p1.eventId,
			evidence = p1.evidence,
			duration = p1.durationForAnalytics
		})
		p1.onDismiss()
	end, {
		UseRefResult, p1.interventionTypeForAnalytics, p1.eventId, p1.evidence,
		p1.durationForAnalytics, p1.onDismiss
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 85 ]]
		-- upvalues: p1 (copy), NotificationModalsManagerModule (upval), IconsActionsAccept (upval), UseLocalizationResult (copy), UseStyleResult (copy), InterventionAnalyticsModule (upval), UseInterventionPlacementModuleResult (copy), UseRefResult (copy)
		p1.onDismiss()
		NotificationModalsManagerModule.SetUIBloxToast({
			iconImage = IconsActionsAccept,
			toastTitle = UseLocalizationResult.TakeALookText,
			toastSubtitle = UseLocalizationResult.FeedbackHelpsText,
			sequenceNumber = DateTime.now().UnixTimestamp,
			iconColorStyle = {
				Transparency = 0,
				Color = UseStyleResult.Tokens.Color.System.Success.Color3
			}
		})
		InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogAppealClicked, {
			eventType = InterventionAnalyticsModule.Constants.EventTypes.AppealClicked,
			counterNamespace = p1.namespaceForAnalytics,
			interventionType = p1.interventionTypeForAnalytics,
			placement = UseInterventionPlacementModuleResult,
			renderedTimestamp = UseRefResult.current,
			eventId = p1.eventId,
			evidence = p1.evidence,
			duration = p1.durationForAnalytics
		})
	end, {
		p1.onDismiss,
		p1.interventionTypeForAnalytics,
		p1.eventId,
		p1.evidence,
		p1.durationForAnalytics
	})
	ReactModule.useEffect(function() --[[ Line: 120 ]]
		-- upvalues: InterventionAnalyticsModule (upval), p1 (copy), UseInterventionPlacementModuleResult (copy), UseRefResult (copy)
		InterventionAnalyticsModule.sendAnalyticsEvent(InterventionAnalyticsModule.TelemetryConfigs.DialogRendered, {
			eventType = InterventionAnalyticsModule.Constants.EventTypes.ModalAppeared,
			counterNamespace = p1.namespaceForAnalytics,
			interventionType = p1.interventionTypeForAnalytics,
			placement = UseInterventionPlacementModuleResult,
			renderedTimestamp = UseRefResult.current,
			eventId = p1.eventId,
			evidence = p1.evidence,
			duration = p1.durationForAnalytics
		})
	end, { UseRefResult, p1.eventId })
	local UseScrollFrameHeightCalculationModuleResult = UseScrollFrameHeightCalculationModule({})
	local GapXlarge: string = if AbsoluteSize.X > 540 then "gap-xlarge" else "gap-medium"
	local UseCursorResult = UseCursorFunction(UDim.new(0, UseStyleResult.Tokens.Radius.Medium), UseStyleResult.Tokens.Size.Size_100, UseStyleResult.Tokens.Size.Size_50)
	
	return ReactModule.createElement(ModalWindow, { isFullHeight = false, screenSize = AbsoluteSize }, {
		ContentContainer = ReactModule.createElement(View, {
			tag = "padding-x-xlarge padding-y-large",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ScrollView = ReactModule.createElement(ScrollView, {
				Size = UDim2.new(1, 0, 0, UseScrollFrameHeightCalculationModuleResult.scrollFrameContainerHeight),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 1, 0),
					scrollBarVisibility = ScrollBarVisibility.Always,
					ScrollingDirection = Enum.ScrollingDirection.Y
				}
			}, {
				FocusNavigationCoreScriptsWrapper = ReactModule.createElement(FocusRoot, {
					isIsolated = true,
					surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
					isAutoFocusRoot = UseInterventionPlacementModuleResult ~= ConstantsModule.InterventionPlacementType.InApp,
					frameProps = {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}
				}, {
					InnerContent = ReactModule.createElement(View, {
						Size = UDim2.new(1, if UseScrollFrameHeightCalculationModuleResult.shouldShowScrollBar then -ConstantsModule.SCROLL_BAR_WIDTH else 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						tag = `col {GapXlarge} align-x-center align-y-center` .. (if UseScrollFrameHeightCalculationModuleResult.shouldShowScrollBar then " padding-right-xsmall" else ""),
						onAbsoluteSizeChanged = UseScrollFrameHeightCalculationModuleResult.onInnerContentSizeChanged
					}, {
						IconAndText = ReactModule.createElement(View, {
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							tag = if AbsoluteSize.X > 540 then `col {GapXlarge} align-x-center` else `row {GapXlarge} align-x-center align-y-center`
						}, {
							Icon = if p1.iconName then ReactModule.createElement(Icon, {
								LayoutOrder = 1,
								size = p1.iconSize,
								name = p1.iconName,
								style = p1.iconStyle
							}) else nil,
							TextContent = ReactModule.createElement(View, {
								LayoutOrder = 2,
								tag = "col fill",
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y
							}, {
								TitleText = if p1.titleText then ReactModule.createElement(Text, {
									LayoutOrder = 1,
									TextWrapped = true,
									Text = p1.titleText,
									textStyle = UseTokensResult.Color.Content.Emphasis,
									fontStyle = UseTokensResult.Typography.TitleLarge,
									TextXAlignment = if AbsoluteSize.X > 540 then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left,
									TextYAlignment = Enum.TextYAlignment.Center,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = Enum.AutomaticSize.Y
								}) else nil,
								BodyText = if p1.bodyText then ReactModule.createElement(Text, {
									LayoutOrder = 2,
									TextWrapped = true,
									Text = p1.bodyText,
									textStyle = UseTokensResult.Color.Content.Default,
									fontStyle = UseTokensResult.Typography.BodyMedium,
									TextXAlignment = if AbsoluteSize.X > 540 then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left,
									TextYAlignment = Enum.TextYAlignment.Center,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = Enum.AutomaticSize.Y
								}) else nil
							})
						}),
						ButtonContainer = ReactModule.createElement(View, {
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							tag = if FFlagExpChatEnableFriendsTab then "padding-x-xxsmall" else nil
						}, {
							ButtonStack = ReactModule.createElement(ButtonStack, {
								buttons = {
									{
										buttonType = ButtonType.PrimarySystem,
										props = {
											layoutOrder = 1,
											cursor = UseCursorResult,
											text = UseLocalizationResult.IUnderstandText,
											onActivated = UseResult
										}
									},
									{
										buttonType = ButtonType.Secondary,
										props = {
											layoutOrder = 2,
											cursor = UseCursorResult,
											text = UseLocalizationResult.MistakeText,
											onActivated = UseResult1
										}
									}
								}
							})
						})
					})
				})
			})
		})
	})
end

return ReactModule.memo(InterventionDialog)