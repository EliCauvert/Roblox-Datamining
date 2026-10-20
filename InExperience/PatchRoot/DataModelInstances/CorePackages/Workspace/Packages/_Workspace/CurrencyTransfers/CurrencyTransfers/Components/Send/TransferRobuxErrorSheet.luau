local ContentProvider = game:GetService("ContentProvider")
local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetBalanceRequestModule = require(CurrencyTransfers.NetworkRequests.getBalanceRequest)
local UseUserNameFromUserIdModule = require(CurrencyTransfers.Hooks.useUserNameFromUserId)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local TransferLocaleFormatModule = require(CurrencyTransfers.Localization.transferLocaleFormat)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local WebViewServiceWrapperModule = require(CurrencyTransfers.Utils.WebViewServiceWrapper)
local FoundationModule = require(Parent.Foundation)
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local Icon = FoundationModule.Icon
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Enums = FoundationModule.Enums
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FailureReasonModule = require(CurrencyTransfers.Enums.FailureReason)
local GetFIntCurrencyTransferMinAmountModule = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferMinAmount)
local GetFIntCurrencyTransferMaxAmountModule = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferMaxAmount)
local GetFFlagCurrencyTransferUseBackendTransferLimitsModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferUseBackendTransferLimits)
local GetFFlagCurrencyTransferReceiveLimitExceededErrorModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferReceiveLimitExceededError)
local GetFFlagEnableLimitHit2SVUpsellModule = require(CurrencyTransfers.Flags.GetFFlagEnableLimitHit2SVUpsell)
local TransferRobuxHeaderModule = require(CurrencyTransfers.Components.Generic.TransferRobuxHeader)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)

local function getErrorMessageAndButton(FailureReason, p1, TargetName, p2, p3, IsEligibleForElevatedLimitUpsell)
	-- upvalues: GetFFlagEnableLimitHit2SVUpsellModule (copy), FailureReasonModule (copy), GetFFlagCurrencyTransferReceiveLimitExceededErrorModule (copy), TransferLocaleFormatModule (copy)
	if not FailureReason then
		return p1.GenericError, p1.TryAgain
	end
	local OK = p1.OK
	local DailyLimitTwoStepVerificationUpsell = nil
	
	if GetFFlagEnableLimitHit2SVUpsellModule() then
		if FailureReason == FailureReasonModule.TransferDailyLimitExceeded then
			if IsEligibleForElevatedLimitUpsell then
				DailyLimitTwoStepVerificationUpsell = p1.DailyLimitTwoStepVerificationUpsell
				OK = p1.TurnOnTwoStepVerification
			else
				DailyLimitTwoStepVerificationUpsell = p1.DailyLimitExceeded
			end
		elseif FailureReason == FailureReasonModule.TransferMonthlyLimitExceeded then
			if IsEligibleForElevatedLimitUpsell then
				DailyLimitTwoStepVerificationUpsell = p1.MonthlyLimitTwoStepVerificationUpsell
				OK = p1.TurnOnTwoStepVerification
			else
				DailyLimitTwoStepVerificationUpsell = p1.MonthlyLimitExceeded
			end
		elseif FailureReason == FailureReasonModule.TransferDisabledForUser then
			DailyLimitTwoStepVerificationUpsell = p1.AccountDisabled
		elseif GetFFlagCurrencyTransferReceiveLimitExceededErrorModule() and FailureReason == FailureReasonModule.ReceiveLimitExceeded then
			DailyLimitTwoStepVerificationUpsell = p1.ReceiveLimitExceeded
		elseif FailureReason == FailureReasonModule.ReceiverNotAllowed then
			DailyLimitTwoStepVerificationUpsell = TransferLocaleFormatModule.substituteUsername(p1.ReceiverNotAllowed, TargetName or "")
		elseif FailureReason == FailureReasonModule.TransferAmountBelowMinimum then
			DailyLimitTwoStepVerificationUpsell = TransferLocaleFormatModule.substituteMinAmount(p1.TransferAmountBelowMinimum, (tostring(p2)))
			OK = p1.TryAgain
		elseif FailureReason == FailureReasonModule.TransferAmountExceedsMaximum then
			DailyLimitTwoStepVerificationUpsell = TransferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, (tostring(p3)))
			OK = p1.TryAgain
		elseif FailureReason == FailureReasonModule.TransferAmountExceedsNonSecuredMaximum then
			DailyLimitTwoStepVerificationUpsell = TransferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, (tostring(p3)))
			OK = p1.TryAgain
		else
			DailyLimitTwoStepVerificationUpsell = p1.GenericError
			OK = p1.TryAgain
		end
	elseif FailureReason == FailureReasonModule.TransferDailyLimitExceeded then
		DailyLimitTwoStepVerificationUpsell = p1.DailyLimitExceeded
	elseif FailureReason == FailureReasonModule.TransferMonthlyLimitExceeded then
		DailyLimitTwoStepVerificationUpsell = p1.MonthlyLimitExceeded
	elseif FailureReason == FailureReasonModule.TransferDisabledForUser then
		DailyLimitTwoStepVerificationUpsell = p1.AccountDisabled
	elseif GetFFlagCurrencyTransferReceiveLimitExceededErrorModule() and FailureReason == FailureReasonModule.ReceiveLimitExceeded then
		DailyLimitTwoStepVerificationUpsell = p1.ReceiveLimitExceeded
	elseif FailureReason == FailureReasonModule.ReceiverNotAllowed then
		DailyLimitTwoStepVerificationUpsell = TransferLocaleFormatModule.substituteUsername(p1.ReceiverNotAllowed, TargetName or "")
	elseif FailureReason == FailureReasonModule.TransferAmountBelowMinimum then
		DailyLimitTwoStepVerificationUpsell = TransferLocaleFormatModule.substituteMinAmount(p1.TransferAmountBelowMinimum, (tostring(p2)))
		OK = p1.TryAgain
	elseif FailureReason == FailureReasonModule.TransferAmountExceedsMaximum then
		DailyLimitTwoStepVerificationUpsell = TransferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, (tostring(p3)))
		OK = p1.TryAgain
	elseif FailureReason == FailureReasonModule.TransferAmountExceedsNonSecuredMaximum then
		DailyLimitTwoStepVerificationUpsell = TransferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, (tostring(p3)))
		OK = p1.TryAgain
	else
		DailyLimitTwoStepVerificationUpsell = p1.GenericError
		OK = p1.TryAgain
	end
	return DailyLimitTwoStepVerificationUpsell, OK
end

local GetFFlagCurrencyTransferFocusNavigationModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFocusNavigation)
local UseTransferSheetFocusModule = require(CurrencyTransfers.Hooks.useTransferSheetFocus)

return function(_)
	-- upvalues: UseTransferStoreModule (copy), UseTokensFunction (copy), SignalsReactModule (copy), GetFFlagCurrencyTransferFocusNavigationModule (copy), UseTransferSheetFocusModule (copy), GetFFlagEnableLimitHit2SVUpsellModule (copy), UseDispatchFunction (copy), FailureReasonModule (copy), UseUserNameFromUserIdModule (copy), Enums (copy), TransferOriginationModule (copy), ContentProvider (copy), WebViewServiceWrapperModule (copy), NavigateDownFunction (copy), AppPage (copy), UrlBuilder (copy), ReactModule (copy), GetBalanceRequestModule (copy), UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), GetFFlagCurrencyTransferUseBackendTransferLimitsModule (copy), GetFIntCurrencyTransferMinAmountModule (copy), GetFIntCurrencyTransferMaxAmountModule (copy), getErrorMessageAndButton (copy), Sheet (copy), UseScaledValueFunction (copy), TransferRobuxHeaderModule (copy), View (copy), Icon (copy), Text (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getRobuxBalanceAmount) or 0
	local BalanceReceivedFromApi = UseTransferStoreModuleResult.getBalanceReceivedFromApi(false)
	local ErrorTransferModel = UseTransferStoreModuleResult.getErrorTransferModel(false)
	local Recipient = UseTransferStoreModuleResult.getRecipient(false)
	local RecipientUserId = UseTransferStoreModuleResult.getRecipientUserId(false)
	local TriggerOnCloseFunction = UseTransferStoreModuleResult.triggerOnClose
	local Ref = nil
	local Ref1 = nil
	
	if GetFFlagCurrencyTransferFocusNavigationModule() then
		Ref, Ref1 = UseTransferSheetFocusModule(TriggerOnCloseFunction)
	end
	if GetFFlagEnableLimitHit2SVUpsellModule() then
		local UseDispatchResult = UseDispatchFunction()
		local FailureReason = if ErrorTransferModel then ErrorTransferModel.failureReason else nil
		local IsNotRecipientUserIdMatch: boolean = FailureReason == FailureReasonModule.ReceiverNotAllowed and (not Recipient and (RecipientUserId and RecipientUserId ~= 0))
		local UseUserNameFromUserIdModuleResult = UseUserNameFromUserIdModule(if IsNotRecipientUserIdMatch and RecipientUserId and RecipientUserId ~= 0 then RecipientUserId else nil)
		local IsEligibleForElevatedLimitUpsell = if ErrorTransferModel then ErrorTransferModel.isEligibleForElevatedLimitUpsell else false
		local IsEligibleForElevatedLimitUpsell1 = if FailureReason == FailureReasonModule.TransferDailyLimitExceeded then IsEligibleForElevatedLimitUpsell else FailureReason == FailureReasonModule.TransferMonthlyLimitExceeded and IsEligibleForElevatedLimitUpsell
		local CircleArrowUp = if IsEligibleForElevatedLimitUpsell1 then Enums.IconName.CircleArrowUp else Enums.IconName.TriangleExclamation
		
		local function handleButtonActivated()
			-- upvalues: TriggerOnCloseFunction (copy), IsEligibleForElevatedLimitUpsell1 (copy), UseTransferStoreModuleResult (copy), TransferOriginationModule (upval), ContentProvider (upval), WebViewServiceWrapperModule (upval), UseDispatchResult (copy), NavigateDownFunction (upval), AppPage (upval), UrlBuilder (upval)
			TriggerOnCloseFunction()
			
			if IsEligibleForElevatedLimitUpsell1 then
				if UseTransferStoreModuleResult.getTransferOrigination(false) == TransferOriginationModule.InExperience then
					WebViewServiceWrapperModule.new({
						title = "Robux",
						url = string.gsub(string.gsub(ContentProvider.BaseUrl:lower(), "/m.", "/www."), "http:", "https:") .. "my/account#!/robux"
					}):open()
					
					return
				end
				UseDispatchResult(NavigateDownFunction({
					name = AppPage.SettingsSubPage,
					detail = UrlBuilder.static.settings.robux(),
					extraProps = { titleKey = "Feature.AccountSettings.Heading.Tab.Robux" }
				}))
			end
		end
		
		ReactModule.useEffect(function()
			-- upvalues: BalanceReceivedFromApi (copy), GetBalanceRequestModule (upval), UseTransferStoreModuleResult (copy)
			if not BalanceReceivedFromApi then
				GetBalanceRequestModule(nil, UseTransferStoreModuleResult.getNetworkImpl()):andThen(function(Result)
					-- upvalues: UseTransferStoreModuleResult (upval)
					UseTransferStoreModuleResult.setRobuxBalanceAmount(Result)
					UseTransferStoreModuleResult.setBalanceReceivedFromApi(true)
				end):catch(function() end)
				
				return
			end
		end, { BalanceReceivedFromApi })
		local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.TransferRobuxErrorSheet)
		local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getMinimumTransferAmount)
		local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getMaximumTransferAmount)
		local ErrorMessageAndButton, ErrorMessageAndButton2 = getErrorMessageAndButton(FailureReason, UseLocalizationResult, (if Recipient and (Recipient.targetName or Recipient.targetDisplayName) then Recipient.targetName or Recipient.targetDisplayName elseif IsNotRecipientUserIdMatch and UseUserNameFromUserIdModuleResult and UseUserNameFromUserIdModuleResult ~= "" then UseUserNameFromUserIdModuleResult else nil) or "", if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() and UseSignalStateResult1 then UseSignalStateResult1 else GetFIntCurrencyTransferMinAmountModule(), if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() and UseSignalStateResult2 then UseSignalStateResult2 else GetFIntCurrencyTransferMaxAmountModule(), IsEligibleForElevatedLimitUpsell)
		
		return ReactModule.createElement(Sheet.Root, {
			preferCenterSheet = true,
			snapPoints = { UseScaledValueFunction(300), 0.5 },
			onClose = TriggerOnCloseFunction,
			ref = Ref
		}, {
			Header = ReactModule.createElement(Sheet.Header, {}, {
				TransferRobuxHeader = ReactModule.createElement(TransferRobuxHeaderModule, {
					titleText = UseLocalizationResult.SendRobux or "",
					robuxBalanceAmount = UseSignalStateResult
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
				SheetContentContainer = ReactModule.createElement(View, {
					tag = "col gap-xlarge auto-y size-full-0 align-x-center align-y-center padding-top-xlarge"
				}, {
					ErrorIconContainer = ReactModule.createElement(View, {
						tag = "size-1200-1200 radius-circle align-x-center align-y-center bg-inverse-emphasis",
						LayoutOrder = 1
					}, {
						ErrorIcon = ReactModule.createElement(Icon, {
							tag = "content-inverse-emphasis",
							name = CircleArrowUp,
							size = UseTokensResult.Size.Size_1200
						})
					}),
					ErrorMessage = ReactModule.createElement(Text, {
						tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
						LayoutOrder = 2,
						Text = ErrorMessageAndButton,
						Size = UDim2.new(1, 0, 0, 0)
					})
				})
			}),
			Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
				ReactModule.createElement(View, {
					tag = "col auto-y align-y-center align-x-center size-full-0 gap-small"
				}, {
					ReactModule.createElement(View, { tag = "row auto-y size-full-0 gap-small" }, {
						ReactModule.createElement(Button, {
							ref = Ref1,
							text = ErrorMessageAndButton2,
							onActivated = handleButtonActivated,
							variant = ButtonVariant.Emphasis,
							fillBehavior = FillBehavior.Fill
						})
					})
				})
			})
		})
	else
		local FailureReason = if ErrorTransferModel then ErrorTransferModel.failureReason else nil
		local IsNotRecipientUserIdMatch: boolean = FailureReason == FailureReasonModule.ReceiverNotAllowed and (not Recipient and (RecipientUserId and RecipientUserId ~= 0))
		local UseUserNameFromUserIdModuleResult = UseUserNameFromUserIdModule(if IsNotRecipientUserIdMatch and RecipientUserId and RecipientUserId ~= 0 then RecipientUserId else nil)
		ReactModule.useEffect(function()
			-- upvalues: BalanceReceivedFromApi (copy), GetBalanceRequestModule (upval), UseTransferStoreModuleResult (copy)
			if not BalanceReceivedFromApi then
				GetBalanceRequestModule(nil, UseTransferStoreModuleResult.getNetworkImpl()):andThen(function(Result)
					-- upvalues: UseTransferStoreModuleResult (upval)
					UseTransferStoreModuleResult.setRobuxBalanceAmount(Result)
					UseTransferStoreModuleResult.setBalanceReceivedFromApi(true)
				end):catch(function() end)
				
				return
			end
		end, { BalanceReceivedFromApi })
		local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.TransferRobuxErrorSheet)
		local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getMinimumTransferAmount)
		local UseSignalStateResult4 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getMaximumTransferAmount)
		local ErrorMessageAndButton1, ErrorMessageAndButton2_1 = getErrorMessageAndButton(FailureReason, UseLocalizationResult, (if Recipient and (Recipient.targetName or Recipient.targetDisplayName) then Recipient.targetName or Recipient.targetDisplayName elseif IsNotRecipientUserIdMatch and UseUserNameFromUserIdModuleResult and UseUserNameFromUserIdModuleResult ~= "" then UseUserNameFromUserIdModuleResult else nil) or "", if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() and UseSignalStateResult3 then UseSignalStateResult3 else GetFIntCurrencyTransferMinAmountModule(), if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() and UseSignalStateResult4 then UseSignalStateResult4 else GetFIntCurrencyTransferMaxAmountModule(), false)
		
		return ReactModule.createElement(Sheet.Root, {
			preferCenterSheet = true,
			snapPoints = { UseScaledValueFunction(300), 0.5 },
			onClose = TriggerOnCloseFunction,
			ref = Ref
		}, {
			Header = ReactModule.createElement(Sheet.Header, {}, {
				TransferRobuxHeader = ReactModule.createElement(TransferRobuxHeaderModule, {
					titleText = UseLocalizationResult.SendRobux or "",
					robuxBalanceAmount = UseSignalStateResult
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
				SheetContentContainer = ReactModule.createElement(View, {
					tag = "col gap-xlarge auto-y size-full-0 align-x-center align-y-center padding-top-xlarge"
				}, {
					ErrorIconContainer = ReactModule.createElement(View, {
						tag = "size-1200-1200 radius-circle align-x-center align-y-center bg-inverse-emphasis",
						LayoutOrder = 1
					}, {
						ErrorIcon = ReactModule.createElement(Icon, {
							tag = "content-inverse-emphasis",
							name = Enums.IconName.TriangleExclamation,
							size = UseTokensResult.Size.Size_1200
						})
					}),
					ErrorMessage = ReactModule.createElement(Text, {
						tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
						LayoutOrder = 2,
						Text = ErrorMessageAndButton1,
						Size = UDim2.new(1, 0, 0, 0)
					})
				})
			}),
			Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
				ReactModule.createElement(View, {
					tag = "col auto-y align-y-center align-x-center size-full-0 gap-small"
				}, {
					ReactModule.createElement(View, { tag = "row auto-y size-full-0 gap-small" }, {
						ReactModule.createElement(Button, {
							ref = Ref1,
							text = ErrorMessageAndButton2_1,
							onActivated = TriggerOnCloseFunction,
							variant = ButtonVariant.Emphasis,
							fillBehavior = FillBehavior.Fill
						})
					})
				})
			})
		})
	end
end