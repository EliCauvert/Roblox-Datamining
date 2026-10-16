local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Sheet = FoundationModule.Sheet
local Button = FoundationModule.Button
local View = FoundationModule.View
local Text = FoundationModule.Text
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local Enums = FoundationModule.Enums
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local ProcessTransferModule = require(CurrencyTransfers.Actions.Send.processTransfer)
local AcceptTransferModule = require(CurrencyTransfers.Actions.Receive.acceptTransfer)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local TransferDirectionModule = require(CurrencyTransfers.Enums.TransferDirection)
local AmpUpsellModule = require(Parent.AmpUpsell)
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local InExpAmpWizardController = AmpUpsellModule.InExpAmpWizardController
local OpenAmpWizardContainerFunction = AmpUpsellModule.OpenAmpWizardContainer
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local GetFFlagCurrencyTransferUseAmpWizardContainerForInAppModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferUseAmpWizardContainerForInApp)
local AmpWizardTransferConstantsModule = require(CurrencyTransfers.Constants.AmpWizardTransferConstants)
local GetCounterUserIdModule = require(CurrencyTransfers.Utils.getCounterUserId)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)
local GetFFlagCurrencyTransferFocusNavigationModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFocusNavigation)
local UseTransferSheetFocusModule = require(CurrencyTransfers.Hooks.useTransferSheetFocus)

return function(p1) --[[ Line: 63 | Named "TransferFAEBlockSheet" ]]
	-- upvalues: UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), UseTransferStoreModule (copy), UseDispatchFunction (copy), GetFFlagCurrencyTransferUseAmpWizardContainerForInAppModule (copy), TransferOriginationModule (copy), UseScaledValueFunction (copy), ReactModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), SharedFlagsModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), TransferDirectionModule (copy), GetFFlagCurrencyTransferFocusNavigationModule (copy), UseTransferSheetFocusModule (copy), Sheet (copy), View (copy), Text (copy), GetIconRichTextFunction (copy), Enums (copy), Button (copy), PromptStateModule (copy), GetCounterUserIdModule (copy), AccessResponseEnum (copy), AcceptTransferModule (copy), ProcessTransferModule (copy), InExpAmpWizardController (copy), AmpWizardTransferConstantsModule (copy), OpenAmpWizardContainerFunction (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.TransferFAEBlockSheet)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local UseDispatchResult = UseDispatchFunction()
	local Direction = p1.direction
	local TriggerOnCloseFunction = UseTransferStoreModuleResult.triggerOnClose
	local SelectedAmount = UseTransferStoreModuleResult.getSelectedAmount(false)
	local IsInExperienceMatch = (if GetFFlagCurrencyTransferUseAmpWizardContainerForInAppModule() then UseTransferStoreModuleResult.getTransferOrigination(false) else nil) == TransferOriginationModule.InExperience
	local UseScaledValueResult = UseScaledValueFunction(420)
	ReactModule.useEffect(function() --[[ Line: 77 ]]
		-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval)
		LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferFAEBlockSheetShownCounter, { recourseSurface = "fae" })
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.fae_block_shown)
		end
		return nil
	end, { UseTransferStoreModuleResult })
	local RequireSenderFAE = if Direction == TransferDirectionModule.Send then UseLocalizationResult.RequireSenderFAE else UseLocalizationResult.RequireReceiverFAE
	local RequireFAE = UseLocalizationResult.RequireFAE
	local Ref = nil
	local Ref1 = nil
	
	if GetFFlagCurrencyTransferFocusNavigationModule() then
		Ref, Ref1 = UseTransferSheetFocusModule(TriggerOnCloseFunction)
	end
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { UseScaledValueResult, 0.5 },
		onClose = TriggerOnCloseFunction,
		ref = Ref
	}, {
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 1 }, {
			SheetContentContainer = ReactModule.createElement(View, {
				tag = "col gap-small auto-y size-full-0 align-x-center padding-top-xlarge padding-x-large"
			}, {
				IconsContainer = ReactModule.createElement(View, {
					tag = "auto-xy position-relative padding-bottom-large",
					LayoutOrder = 1,
					Size = UDim2.fromOffset(300, 140)
				}, {
					ShieldIconContainer = ReactModule.createElement(View, {
						tag = "radius-medium stroke-default bg-surface-100 align-x-center align-y-center position-absolute",
						Rotation = -15,
						ZIndex = 2,
						Size = UDim2.fromOffset(100, 100),
						Position = UDim2.new(0.5, -40, 0.5, 10),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, {
						ShieldIcon = ReactModule.createElement(Text, {
							tag = "content-emphasis text-align-x-center text-display-medium",
							RichText = true,
							Text = GetIconRichTextFunction(Enums.IconName.ShieldCheck),
							Size = UDim2.fromOffset(72, 72),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0.5, 0.5)
						})
					}),
					RobuxIconContainer = ReactModule.createElement(View, {
						tag = "radius-medium stroke-default bg-surface-100 align-x-center align-y-center position-absolute",
						Rotation = 15,
						ZIndex = 1,
						Size = UDim2.fromOffset(100, 100),
						Position = UDim2.new(0.5, 55, 0.5, -10),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}, {
						RobuxIcon = ReactModule.createElement(Text, {
							tag = "content-emphasis text-align-x-center text-display-medium",
							RichText = true,
							Text = GetIconRichTextFunction("robux"),
							Size = UDim2.fromOffset(72, 72),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0.5, 0.5)
						})
					})
				}),
				TitleText = ReactModule.createElement(Text, {
					tag = "text-heading-medium content-emphasis text-align-x-left text-wrap padding-top-xlarge",
					LayoutOrder = 2,
					Text = RequireSenderFAE,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				BodyText = ReactModule.createElement(Text, {
					tag = "text-body-medium content-default text-align-x-left text-wrap",
					LayoutOrder = 3,
					Text = RequireFAE,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 2 }, {
			ReactModule.createElement(View, {
				tag = "col auto-y align-y-center align-x-center size-full-0 gap-small padding-x-medium padding-bottom-large"
			}, {
				ReactModule.createElement(View, { tag = "row auto-y size-full-0 gap-small" }, {
					ReactModule.createElement(Button, {
						ref = Ref1,
						text = UseLocalizationResult.Continue,
						onActivated = function() --[[ Line: 178 ]]
							-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), p1 (copy), PromptStateModule (upval), GetCounterUserIdModule (upval), Direction (copy), AccessResponseEnum (upval), TransferDirectionModule (upval), AcceptTransferModule (upval), ProcessTransferModule (upval), SelectedAmount (copy), TriggerOnCloseFunction (copy), IsInExperienceMatch (copy), GetFFlagCurrencyTransferUseAmpWizardContainerForInAppModule (upval), InExpAmpWizardController (upval), AmpWizardTransferConstantsModule (upval), UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval)
							LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferFAEBlockContinueClickedCounter, { recourseSurface = "fae" })
							
							if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
								LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.fae_continue_clicked)
							end
							if not p1.ampFeatureCheck then
								print("No ampFeatureCheck available")
								TriggerOnCloseFunction()
								
								return
							end
							UseTransferStoreModuleResult.setPreviousPromptState((UseTransferStoreModuleResult.getPromptState(false)))
							UseTransferStoreModuleResult.setPromptState(PromptStateModule.Hidden)
							local CounterUserIdModule = GetCounterUserIdModule(UseTransferStoreModuleResult, Direction)
							local List = if CounterUserIdModule then {
								{
									name = "targetUser",
									type = "UserId",
									value = tostring(CounterUserIdModule)
								}
							} else nil
							
							local function v44(Granted, _) --[[ Line: 203 ]]
								-- upvalues: UseTransferStoreModuleResult (upval), AccessResponseEnum (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval), Direction (upval), TransferDirectionModule (upval), AcceptTransferModule (upval), ProcessTransferModule (upval), SelectedAmount (upval), TriggerOnCloseFunction (upval)
								local PreviousPromptState = UseTransferStoreModuleResult.getPreviousPromptState(false)
								
								if PreviousPromptState then
									UseTransferStoreModuleResult.setPromptState(PreviousPromptState)
								end
								if Granted == AccessResponseEnum.Granted then
									if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
										LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.age_verification_completed)
									end
									if Direction == TransferDirectionModule.Receive then
										AcceptTransferModule(UseTransferStoreModuleResult)
										
										return
									end
									if Direction == TransferDirectionModule.Send then
										ProcessTransferModule(UseTransferStoreModuleResult, SelectedAmount or 0)
										
										return
									end
								else
									TriggerOnCloseFunction()
								end
							end
							
							if IsInExperienceMatch or not GetFFlagCurrencyTransferUseAmpWizardContainerForInAppModule() then
								InExpAmpWizardController.OpenAmpWizardContainerInExp(p1.ampFeatureCheck, v44, nil, AmpWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, List, AmpWizardTransferConstantsModule.NAMESPACE_NAME)
								
								return
							else
								UseDispatchResult(OpenAmpWizardContainerFunction(p1.ampFeatureCheck, v44, nil, AmpWizardTransferConstantsModule.ENTRY_POINT_EVENT_CTX, List, AmpWizardTransferConstantsModule.NAMESPACE_NAME))
							end
						end,
						variant = ButtonVariant.Emphasis,
						fillBehavior = FillBehavior.Fill
					})
				})
			})
		})
	})
end