local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local sheet = foundationModule.Sheet
local button = foundationModule.Button
local view = foundationModule.View
local text = foundationModule.Text
local fillBehavior = foundationModule.Enums.FillBehavior
local useScaledValue = foundationModule.Hooks.useScaledValue
local enums = foundationModule.Enums
local getIconRichText = foundationModule.Utility.getIconRichText
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local processTransferModule = require(currencyTransfers.Actions.Send.processTransfer)
local acceptTransferModule = require(currencyTransfers.Actions.Receive.acceptTransfer)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferDirectionModule = require(currencyTransfers.Enums.TransferDirection)
local ampUpsellModule = require(parent.AmpUpsell)
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local inExpAmpWizardController = ampUpsellModule.InExpAmpWizardController
local openAmpWizardContainer = ampUpsellModule.OpenAmpWizardContainer
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local getFFlagCurrencyTransferUseAmpWizardContainerForInAppModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferUseAmpWizardContainerForInApp)
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)
local getCounterUserIdModule = require(currencyTransfers.Utils.getCounterUserId)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)

return function(p1)
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), useDispatch (ref), getFFlagCurrencyTransferUseAmpWizardContainerForInAppModule (ref), transferOriginationModule (ref), useScaledValue (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), transferDirectionModule (ref), sheet (ref), view (ref), text (ref), getIconRichText (ref), enums (ref), button (ref), promptStateModule (ref), getCounterUserIdModule (ref), accessResponseEnum (ref), acceptTransferModule (ref), processTransferModule (ref), inExpAmpWizardController (ref), ampWizardTransferConstantsModule (ref), openAmpWizardContainer (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = useLocalization(transferLocalizationKeysModule.Presets.TransferFAEBlockSheet)
	local var2 = useTransferStoreModule()
	local var3 = useDispatch()
	local direction = p1.direction
	local triggerOnClose = var2.triggerOnClose
	local selectedAmount = var2.getSelectedAmount(false)
	local var4 = (if getFFlagCurrencyTransferUseAmpWizardContainerForInAppModule() then var2.getTransferOrigination(false) else nil) == transferOriginationModule.InExperience
	local var5 = useScaledValue(420)
	reactModule.useEffect(function()
		-- upvalues: logCurrencyTransferCounterModule (copy), var2 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var2, currencyTransferTelemetryModule.CurrencyTransferFAEBlockSheetShownCounter, { recourseSurface = "fae" })
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.fae_block_shown)
		end
		return nil
	end, { var2 })
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { var5, 0.5 },
		onClose = triggerOnClose
	}, {
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 1 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = "col gap-small auto-y size-full-0 align-x-center padding-top-xlarge padding-x-large"
			}, {
				IconsContainer = reactModule.createElement(view, {
					tag = "auto-xy position-relative padding-bottom-large",
					LayoutOrder = 1,
					Size = UDim2.fromOffset(300, 140)
				}, {
					ShieldIconContainer = reactModule.createElement(view, {
						tag = "radius-medium stroke-default bg-surface-100 align-x-center align-y-center position-absolute",
						Rotation = -15,
						ZIndex = 2,
						Size = UDim2.fromOffset(100, 100),
						Position = UDim2.new(0.5, -40, 0.5, 10),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, {
						ShieldIcon = reactModule.createElement(text, {
							tag = "content-emphasis text-align-x-center text-display-medium",
							RichText = true,
							Text = getIconRichText(enums.IconName.ShieldCheck),
							Size = UDim2.fromOffset(72, 72),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0.5, 0.5)
						})
					}),
					RobuxIconContainer = reactModule.createElement(view, {
						tag = "radius-medium stroke-default bg-surface-100 align-x-center align-y-center position-absolute",
						Rotation = 15,
						ZIndex = 1,
						Size = UDim2.fromOffset(100, 100),
						Position = UDim2.new(0.5, 55, 0.5, -10),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, {
						RobuxIcon = reactModule.createElement(text, {
							tag = "content-emphasis text-align-x-center text-display-medium",
							RichText = true,
							Text = getIconRichText("robux"),
							Size = UDim2.fromOffset(72, 72),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0.5, 0.5)
						})
					})
				}),
				TitleText = reactModule.createElement(text, {
					tag = "text-heading-medium content-emphasis text-align-x-left text-wrap padding-top-xlarge",
					LayoutOrder = 2,
					Text = if direction == transferDirectionModule.Send then var1.RequireSenderFAE else var1.RequireReceiverFAE,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				BodyText = reactModule.createElement(text, {
					tag = "text-body-medium content-default text-align-x-left text-wrap",
					LayoutOrder = 3,
					Text = var1.RequireFAE,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 2 }, {
			reactModule.createElement(view, {
				tag = "col auto-y align-y-center align-x-center size-full-0 gap-small padding-x-medium padding-bottom-large"
			}, {
				reactModule.createElement(view, { tag = "row auto-y size-full-0 gap-small" }, {
					reactModule.createElement(button, {
						text = var1.Continue,
						onActivated = function()
							-- upvalues: logCurrencyTransferCounterModule (copy), var2 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), p1 (ref), promptStateModule (copy), getCounterUserIdModule (copy), direction (ref), accessResponseEnum (copy), transferDirectionModule (copy), acceptTransferModule (copy), processTransferModule (copy), selectedAmount (ref), triggerOnClose (ref), var4 (ref), getFFlagCurrencyTransferUseAmpWizardContainerForInAppModule (copy), inExpAmpWizardController (copy), ampWizardTransferConstantsModule (copy), var3 (ref), openAmpWizardContainer (copy)
							logCurrencyTransferCounterModule(var2, currencyTransferTelemetryModule.CurrencyTransferFAEBlockContinueClickedCounter, { recourseSurface = "fae" })
							
							if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
								logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.fae_continue_clicked)
							end
							if not p1.ampFeatureCheck then
								print("No ampFeatureCheck available")
								triggerOnClose()
								
								return
							end
							var2.setPreviousPromptState(var2.getPromptState(false))
							var2.setPromptState(promptStateModule.Hidden)
							local var6 = getCounterUserIdModule(var2, direction)
							local var7 = if var6 then {
								{
									name = "targetUser",
									type = "UserId",
									value = tostring(var6)
								}
							} else nil
							
							local var8 = function(p2, _)
								-- upvalues: var2 (copy), accessResponseEnum (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy), direction (copy), transferDirectionModule (copy), acceptTransferModule (copy), processTransferModule (copy), selectedAmount (copy), triggerOnClose (copy)
								local previousPromptState = var2.getPreviousPromptState(false)
								
								if previousPromptState then
									var2.setPromptState(previousPromptState)
								end
								if p2 == accessResponseEnum.Granted then
									if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
										logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.age_verification_completed)
									end
									if direction == transferDirectionModule.Receive then
										acceptTransferModule(var2)
										
										return
									elseif direction == transferDirectionModule.Send then
										processTransferModule(var2, selectedAmount or 0)
										
										return
									end
								else
									triggerOnClose()
								end
							end
							
							if var4 or not getFFlagCurrencyTransferUseAmpWizardContainerForInAppModule() then
								inExpAmpWizardController.OpenAmpWizardContainerInExp(p1.ampFeatureCheck, var8, nil, ampWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, var7, ampWizardTransferConstantsModule.NAMESPACE_NAME)
								
								return
							end
							var3(openAmpWizardContainer(p1.ampFeatureCheck, var8, nil, ampWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, var7, ampWizardTransferConstantsModule.NAMESPACE_NAME))
						end,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill
					})
				})
			})
		})
	})
end