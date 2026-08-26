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

function InterventionDialog(p1)
	-- upvalues: useLayerCollector (ref), reactModule (ref), useTokens (ref), useStyle (ref), useInterventionPlacementModule (ref), useLocalization (ref), constantsModule (ref), interventionAnalyticsModule (ref), notificationModalsManagerModule (ref), accept (ref), useScrollFrameHeightCalculationModule (ref), useCursor (ref), modalWindow (ref), view (ref), scrollView (ref), scrollBarVisibility (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), icon (ref), text (ref), fFlagExpChatEnableFriendsTab (ref), buttonStack (ref), buttonType (ref)
	local absoluteSize = useLayerCollector().absoluteSize
	local var1 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	local var2 = useTokens()
	local var3 = useStyle()
	local var4 = useInterventionPlacementModule()
	local var5 = useLocalization(constantsModule.localizationKeys)
	local var6 = reactModule.useCallback(function()
		-- upvalues: interventionAnalyticsModule (copy), p1 (ref), var4 (ref), var1 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogCtaClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.CtaClicked,
			counterNamespace = p1.namespaceForAnalytics,
			interventionType = p1.interventionTypeForAnalytics,
			placement = var4,
			renderedTimestamp = var1.current,
			eventId = p1.eventId,
			evidence = p1.evidence,
			duration = p1.durationForAnalytics
		})
		p1.onDismiss()
	end, {
		var1, p1.interventionTypeForAnalytics, p1.eventId, p1.evidence,
		p1.durationForAnalytics, p1.onDismiss
	})
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), notificationModalsManagerModule (copy), accept (copy), var5 (ref), var3 (ref), interventionAnalyticsModule (copy), var4 (ref), var1 (ref)
		p1.onDismiss()
		notificationModalsManagerModule.SetUIBloxToast({
			iconImage = accept,
			toastTitle = var5.TakeALookText,
			toastSubtitle = var5.FeedbackHelpsText,
			sequenceNumber = DateTime.now().UnixTimestamp,
			iconColorStyle = {
				Transparency = 0,
				Color = var3.Tokens.Color.System.Success.Color3
			}
		})
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogAppealClicked, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.AppealClicked,
			counterNamespace = p1.namespaceForAnalytics,
			interventionType = p1.interventionTypeForAnalytics,
			placement = var4,
			renderedTimestamp = var1.current,
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
	reactModule.useEffect(function()
		-- upvalues: interventionAnalyticsModule (copy), p1 (ref), var4 (ref), var1 (ref)
		interventionAnalyticsModule.sendAnalyticsEvent(interventionAnalyticsModule.TelemetryConfigs.DialogRendered, {
			eventType = interventionAnalyticsModule.Constants.EventTypes.ModalAppeared,
			counterNamespace = p1.namespaceForAnalytics,
			interventionType = p1.interventionTypeForAnalytics,
			placement = var4,
			renderedTimestamp = var1.current,
			eventId = p1.eventId,
			evidence = p1.evidence,
			duration = p1.durationForAnalytics
		})
	end, { var1, p1.eventId })
	local var8 = useScrollFrameHeightCalculationModule({})
	local var9 = if absoluteSize.X > 540 then "gap-xlarge" else "gap-medium"
	local var10 = useCursor(UDim.new(0, var3.Tokens.Radius.Medium), var3.Tokens.Size.Size_100, var3.Tokens.Size.Size_50)
	
	return reactModule.createElement(modalWindow, { isFullHeight = false, screenSize = absoluteSize }, {
		ContentContainer = reactModule.createElement(view, {
			tag = "padding-x-xlarge padding-y-large",
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ScrollView = reactModule.createElement(scrollView, {
				Size = UDim2.new(1, 0, 0, var8.scrollFrameContainerHeight),
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
					isAutoFocusRoot = var4 ~= constantsModule.InterventionPlacementType.InApp,
					frameProps = {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}
				}, {
					InnerContent = reactModule.createElement(view, {
						Size = UDim2.new(1, if var8.shouldShowScrollBar then -constantsModule.SCROLL_BAR_WIDTH else 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						tag = `col {var9} align-x-center align-y-center` .. (if var8.shouldShowScrollBar then " padding-right-xsmall" else ""),
						onAbsoluteSizeChanged = var8.onInnerContentSizeChanged
					}, {
						IconAndText = reactModule.createElement(view, {
							LayoutOrder = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y,
							tag = if absoluteSize.X > 540 then `col {var9} align-x-center` else `row {var9} align-x-center align-y-center`
						}, {
							Icon = if p1.iconName then reactModule.createElement(icon, {
								LayoutOrder = 1,
								size = p1.iconSize,
								name = p1.iconName,
								style = p1.iconStyle
							}) else nil,
							TextContent = reactModule.createElement(view, {
								LayoutOrder = 2,
								tag = "col fill",
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y
							}, {
								TitleText = if p1.titleText then reactModule.createElement(text, {
									LayoutOrder = 1,
									TextWrapped = true,
									Text = p1.titleText,
									textStyle = var2.Color.Content.Emphasis,
									fontStyle = var2.Typography.TitleLarge,
									TextXAlignment = if absoluteSize.X > 540 then Enum.TextXAlignment.Center else Enum.TextXAlignment.Left,
									TextYAlignment = Enum.TextYAlignment.Center,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = Enum.AutomaticSize.Y
								}) else nil,
								BodyText = if p1.bodyText then reactModule.createElement(text, {
									LayoutOrder = 2,
									TextWrapped = true,
									Text = p1.bodyText,
									textStyle = var2.Color.Content.Default,
									fontStyle = var2.Typography.BodyMedium,
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
											cursor = var10,
											text = var5.IUnderstandText,
											onActivated = var6
										}
									},
									{
										buttonType = buttonType.Secondary,
										props = {
											layoutOrder = 2,
											cursor = var10,
											text = var5.MistakeText,
											onActivated = var7
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