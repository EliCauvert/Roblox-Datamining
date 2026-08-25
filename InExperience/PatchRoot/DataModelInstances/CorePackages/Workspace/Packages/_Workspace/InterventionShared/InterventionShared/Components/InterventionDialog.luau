local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local modalWindow = UIBloxModule.App.Dialog.Modal.ModalWindow
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useStyle = UIBloxModule.Core.Style.useStyle
local constantsModule = require(interventionShared.Utils.Constants)
local interventionAnalyticsModule = require(interventionShared.InterventionAnalytics)
local icon = foundationModule.Icon
local view = foundationModule.View
local scrollView = foundationModule.ScrollView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local useTokens = foundationModule.Hooks.useTokens
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local accept = UIBloxModule.App.ImageSet.Images["icons/actions/accept"]
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useScrollFrameHeightCalculationModule = require(interventionShared.Hooks.useScrollFrameHeightCalculation)
local useCursor = UIBloxModule.App.SelectionCursor.useCursor
local useInterventionPlacementModule = require(interventionShared.Hooks.useInterventionPlacement)
local fFlagExpChatEnableFriendsTab = require(parent.SharedFlags).FFlagExpChatEnableFriendsTab
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot

function InterventionDialog(p0)
	-- upvalues: useLayerCollector (ref), reactModule (ref), useTokens (ref), useStyle (ref), useInterventionPlacementModule (ref), useLocalization (ref), constantsModule (ref), interventionAnalyticsModule (ref), notificationModalsManagerModule (ref), accept (ref), useScrollFrameHeightCalculationModule (ref), useCursor (ref), modalWindow (ref), view (ref), scrollView (ref), scrollBarVisibility (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), icon (ref), text (ref), fFlagExpChatEnableFriendsTab (ref), buttonStack (ref), buttonType (ref)
	local absoluteSize = useLayerCollector().absoluteSize
	local var10 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	local var11 = useTokens()
	local var12 = useStyle()
	local var13 = useInterventionPlacementModule()
	local var14 = useLocalization(constantsModule.localizationKeys)
	local var15 = reactModule.useCallback(function()
		-- upvalues: interventionAnalyticsModule (copy), p0 (ref), var13 (ref), var10 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogCtaClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.CtaClicked,
			counterNamespace = p0.namespaceForAnalytics,
			interventionType = p0.interventionTypeForAnalytics,
			placement = var13,
			renderedTimestamp = var10.current,
			eventId = p0.eventId,
			evidence = p0.evidence,
			duration = p0.durationForAnalytics
		})
		p0.onDismiss()
	end, {
		var10, p0.interventionTypeForAnalytics, p0.eventId, p0.evidence,
		p0.durationForAnalytics, p0.onDismiss
	})
	local var16 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), notificationModalsManagerModule (copy), accept (copy), var14 (ref), var12 (ref), interventionAnalyticsModule (copy), var13 (ref), var10 (ref)
		p0.onDismiss()
		notificationModalsManagerModule.SetUIBloxToast({
			iconImage = accept,
			toastTitle = var14.TakeALookText,
			toastSubtitle = var14.FeedbackHelpsText,
			sequenceNumber = DateTime.now().UnixTimestamp,
			iconColorStyle = {
				Transparency = 0,
				Color = var12.Tokens.Color.System.Success.Color3
			}
		})
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogAppealClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.AppealClicked,
			counterNamespace = p0.namespaceForAnalytics,
			interventionType = p0.interventionTypeForAnalytics,
			placement = var13,
			renderedTimestamp = var10.current,
			eventId = p0.eventId,
			evidence = p0.evidence,
			duration = p0.durationForAnalytics
		})
	end, {
		p0.onDismiss,
		p0.interventionTypeForAnalytics,
		p0.eventId,
		p0.evidence,
		p0.durationForAnalytics
	})
	reactModule.useEffect(function()
		-- upvalues: interventionAnalyticsModule (copy), p0 (ref), var13 (ref), var10 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogRendered, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.ModalAppeared,
			counterNamespace = p0.namespaceForAnalytics,
			interventionType = p0.interventionTypeForAnalytics,
			placement = var13,
			renderedTimestamp = var10.current,
			eventId = p0.eventId,
			evidence = p0.evidence,
			duration = p0.durationForAnalytics
		})
	end, { var10, p0.eventId })
	local var17 = useScrollFrameHeightCalculationModule({})
	local var18 = if absoluteSize.X > 540 then "gap-xlarge" else "gap-medium"
	local var19 = useCursor(UDim.new(0, var12.Tokens.Radius.Medium), var12.Tokens.Size.Size_100, var12.Tokens.Size.Size_50)
	
	return reactModule.createElement(modalWindow, { isFullHeight = false, screenSize = absoluteSize }, {
		ContentContainer = reactModule.createElement(view, {
			tag = "padding-x-xlarge padding-y-large",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ScrollView = reactModule.createElement(scrollView, {
				Size = UDim2.new(1, 0, 0, var17.scrollFrameContainerHeight),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 1, 0),
					scrollBarVisibility = scrollBarVisibility.Always,
					ScrollingDirection = Enum.ScrollingDirection.Y
				}
			}, {
				FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
					isIsolated = true,
					surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
					isAutoFocusRoot = var13 ~= constantsModule.InterventionPlacementType.InApp,
					frameProps = {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}
				}, {
					InnerContent = reactModule.createElement(view, {
						Size = UDim2.new(1, if var17.shouldShowScrollBar then -constantsModule.SCROLL_BAR_WIDTH else 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						tag = `col {var18} align-x-center align-y-center` .. (if var17.shouldShowScrollBar then " padding-right-xsmall" else ""),
						onAbsoluteSizeChanged = var17.onInnerContentSizeChanged
					}, {
						IconAndText = reactModule.createElement(view, {
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							tag = if absoluteSize.X > 540 then `col {var18} align-x-center` else `row {var18} align-x-center align-y-center`
						}, {
							Icon = if p0.iconName then reactModule.createElement(icon, {
								LayoutOrder = 1,
								size = p0.iconSize,
								name = p0.iconName,
								style = p0.iconStyle
							}) else nil,
							TextContent = reactModule.createElement(view, {
								LayoutOrder = 2,
								tag = "col fill",
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y
							}, {
								TitleText = if p0.titleText then reactModule.createElement(text, {
									LayoutOrder = 1,
									TextWrapped = true,
									Text = p0.titleText,
									textStyle = var11.Color.Content.Emphasis,
									fontStyle = var11.Typography.TitleLarge,
									TextXAlignment = if absoluteSize.X > 540 then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left,
									TextYAlignment = Enum.TextYAlignment.Center,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = Enum.AutomaticSize.Y
								}) else nil,
								BodyText = if p0.bodyText then reactModule.createElement(text, {
									LayoutOrder = 2,
									TextWrapped = true,
									Text = p0.bodyText,
									textStyle = var11.Color.Content.Default,
									fontStyle = var11.Typography.BodyMedium,
									TextXAlignment = if absoluteSize.X > 540 then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left,
									TextYAlignment = Enum.TextYAlignment.Center,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = Enum.AutomaticSize.Y
								}) else nil
							})
						}),
						ButtonContainer = reactModule.createElement(view, {
							LayoutOrder = 2,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							tag = if fFlagExpChatEnableFriendsTab then "padding-x-xxsmall" else nil
						}, {
							ButtonStack = reactModule.createElement(buttonStack, {
								buttons = {
									{
										buttonType = buttonType.PrimarySystem,
										props = {
											layoutOrder = 1,
											cursor = var19,
											text = var14.IUnderstandText,
											onActivated = var15
										}
									},
									{
										buttonType = buttonType.Secondary,
										props = {
											layoutOrder = 2,
											cursor = var19,
											text = var14.MistakeText,
											onActivated = var16
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

return reactModule.memo(InterventionDialog)