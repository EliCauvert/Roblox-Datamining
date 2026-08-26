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
local var1 = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)

function ChatTimeoutCustomDialog(p1)
	-- upvalues: useLayerCollector (ref), reactModule (ref), useTokens (ref), useStyle (ref), useLocalization (ref), constants (ref), useProperty (ref), inExperienceInterventionAnalyticsModule (ref), partialPageModal (ref), scrollView (ref), scrollBarVisibility (ref), reactFocusNavigationModule (ref), var1 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), view (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref), interventionContestFeedbackFooterModule (ref)
	local var2 = useLayerCollector()
	local var3 = reactModule.useRef(DateTime.now().UnixTimestampMillis)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(0)
	local var7 = useTokens()
	local var8 = useStyle()
	local var9 = useLocalization(constants.localizationKeys)
	local var10 = useProperty(var4, "AbsoluteSize")
	local var11 = reactModule.useCallback(function()
		-- upvalues: inExperienceInterventionAnalyticsModule (copy), var3 (ref), p1 (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.CtaClicked, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, var3.current, p1.eventId, p1.violatingChatLine, p1.duration)
		p1.onDismiss()
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: inExperienceInterventionAnalyticsModule (copy), var3 (ref), p1 (ref)
		inExperienceInterventionAnalyticsModule.sendAnalyticsEvent(inExperienceInterventionAnalyticsModule.Constants.EventTypes.ModalAppeared, inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout, var3.current, p1.eventId, p1.violatingChatLine, p1.duration)
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var2 (ref), constants (copy), var6 (ref)
		var6(math.min(var2.absoluteSize.Y - constants.UNIBAR_HEIGHT - constants.DIALOG_HEADER_HEIGHT, if var10 then var10.Y else 0))
	end, { var2.absoluteSize.Y, var10 })
	
	return reactModule.createElement(partialPageModal, {
		title = var9.TextChatSuspensionText,
		screenSize = var2.absoluteSize
	}, {
		ScrollView = reactModule.createElement(scrollView, {
			Size = UDim2.new(1, 0, 0, var5),
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 1, 0),
				scrollBarVisibility = scrollBarVisibility.Always,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			FocusNavigationCoreScriptsProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, {
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
						ref = var4,
						Size = UDim2.new(1, -constants.SCROLL_BAR_WIDTH, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						ChatDisabledText = reactModule.createElement(text, {
							LayoutOrder = 1,
							TextWrapped = true,
							Text = if p1.duration <= 60 then var9.CannotSend1MinText else useLocalization({
								value = {
									constants.localizationKeys.CannotSendText,
									number = math.ceil(p1.duration / 60)
								}
							}).value,
							textStyle = var8.Theme.TextEmphasis,
							fontStyle = var7.Typography.LabelLarge,
							Size = UDim2.new(1, 0, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Center,
							TextYAlignment = Enum.TextYAlignment.Center,
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						WarningTextLabel = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "padding-small size-full-800 text-wrap",
							TextWrapped = true,
							Text = var9.MayLoseAccessText,
							AutomaticSize = Enum.AutomaticSize.Y
						}),
						UnderstandButtonFrame = reactModule.createElement(view, {
							LayoutOrder = 3,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							UnderstandButton = reactModule.createElement(button, {
								text = var9.IUnderstandText,
								variant = buttonVariant.Standard,
								onActivated = var11,
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
								onDismiss = p1.onDismiss,
								renderTimestamp = var3.current,
								interventionType = inExperienceInterventionAnalyticsModule.Constants.InterventionTypes.Timeout,
								eventId = p1.eventId,
								violatingChatLine = p1.violatingChatLine,
								duration = p1.duration
							})
						})
					})
				})
			})
		})
	})
end

return ChatTimeoutCustomDialog