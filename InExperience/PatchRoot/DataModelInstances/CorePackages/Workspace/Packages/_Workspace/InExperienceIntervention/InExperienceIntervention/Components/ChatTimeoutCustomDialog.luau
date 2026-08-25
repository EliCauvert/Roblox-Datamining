local inExperienceIntervention = script:FindFirstAncestor("InExperienceIntervention")
local parent = inExperienceIntervention.Parent
local reactModule = require(parent.React)
local interventionContestFeedbackFooterModule = require(inExperienceIntervention.Components.InterventionContestFeedbackFooter)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useStyle = UIBloxModule.Core.Style.useStyle
local constants = require(parent.InterventionShared).Utils.Constants
local inExperienceInterventionAnalyticsModule = require(inExperienceIntervention.InExperienceInterventionAnalytics)
local view = foundationModule.View
local button = foundationModule.Button
local scrollView = foundationModule.ScrollView
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local useTokens = foundationModule.Hooks.useTokens
local useProperty = require(parent.GuiObjectUtils).useProperty
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local var8 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)

function ChatTimeoutCustomDialog(p0)
	-- upvalues: useLayerCollector (ref), reactModule (ref), useTokens (ref), useStyle (ref), useLocalization (ref), constants (ref), useProperty (ref), inExperienceInterventionAnalyticsModule (ref), partialPageModal (ref), scrollView (ref), scrollBarVisibility (ref), reactFocusNavigationModule (ref), var8 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), view (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref), interventionContestFeedbackFooterModule (ref)
	local var9 = useLayerCollector()
	local var10 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	local var11 = reactModule.useRef(nil)
	local var12, var13 = reactModule.useState(0)
	local var14 = useTokens()
	local var15 = useStyle()
	local var16 = useLocalization(constants.localizationKeys)
	local var17 = useProperty(var11, "AbsoluteSize")
	local var18 = reactModule.useCallback(function()
		-- upvalues: inExperienceInterventionAnalyticsModule (copy), var10 (ref), p0 (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.CtaClicked, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, var10.current, p0.eventId, p0.violatingChatLine, p0.duration)
		p0.onDismiss()
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: inExperienceInterventionAnalyticsModule (copy), var10 (ref), p0 (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalAppeared, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, var10.current, p0.eventId, p0.violatingChatLine, p0.duration)
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), var9 (ref), constants (copy), var13 (ref)
		var13(math.min(var9.absoluteSize.Y - constants.UNIBAR_HEIGHT - constants.DIALOG_HEADER_HEIGHT, if var17 then var17.Y else 0))
	end, { var9.absoluteSize.Y, var17 })
	
	return reactModule.createElement(partialPageModal, {
		title = var16.TextChatSuspensionText,
		screenSize = var9.absoluteSize
	}, {
		ScrollView = reactModule.createElement(scrollView, {
			Size = UDim2.new(1, 0, 0, var12),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 1, 0),
				scrollBarVisibility = scrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			FocusNavigationCoreScriptsProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var8 }, {
				FocusNavigationCoreScriptsWrapper = reactModule.createElement(focusRoot, {
					isIsolated = true,
					isAutoFocusRoot = true,
					surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
					frameProps = {
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}
				}, {
					InnerContent = reactModule.createElement(view, {
						tag = "col gap-large align-x-center align-y-center padding-x-small padding-top-large",
						ref = var11,
						Size = UDim2.new(1, -constants.SCROLL_BAR_WIDTH, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						ChatDisabledText = reactModule.createElement(text, {
							LayoutOrder = 1,
							TextWrapped = true,
							Text = if p0.duration <= 60 then var16.CannotSend1MinText else useLocalization({
								value = {
									constants.localizationKeys.CannotSendText,
									number = math.ceil(p0.duration / 60)
								}
							}).value,
							textStyle = var15.Theme.TextEmphasis,
							fontStyle = var14.Typography.LabelLarge,
							Size = UDim2.new(1, 0, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						WarningTextLabel = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "padding-small size-full-800 text-wrap",
							TextWrapped = true,
							Text = var16.MayLoseAccessText,
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						UnderstandButtonFrame = reactModule.createElement(view, {
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							UnderstandButton = reactModule.createElement(button, {
								text = var16.IUnderstandText,
								variant = buttonVariant.Standard,
								onActivated = var18,
								fillBehavior = fillBehavior.Fill,
								FillDirection = Enum.FillDirection.Horizontal
							})
						}),
						FeedbackFrame = reactModule.createElement(view, {
							LayoutOrder = 4,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							FeedbackFooter = reactModule.createElement(interventionContestFeedbackFooterModule, {
								onDismiss = p0.onDismiss,
								renderTimestamp = var10.current,
								interventionType = inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout,
								eventId = p0.eventId,
								violatingChatLine = p0.violatingChatLine,
								duration = p0.duration
							})
						})
					})
				})
			})
		})
	})
end

return ChatTimeoutCustomDialog