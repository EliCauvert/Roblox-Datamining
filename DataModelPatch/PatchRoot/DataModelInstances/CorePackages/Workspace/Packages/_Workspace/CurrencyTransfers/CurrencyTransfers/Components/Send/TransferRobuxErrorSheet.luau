local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetBalanceRequestModule = require(CurrencyTransfers.NetworkRequests.getBalanceRequest)
local UseUserNameFromUserIdModule = require(CurrencyTransfers.Hooks.useUserNameFromUserId)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local TransferLocaleFormatModule = require(CurrencyTransfers.Localization.transferLocaleFormat)
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
local TransferRobuxHeaderModule = require(CurrencyTransfers.Components.Generic.TransferRobuxHeader)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)

local function getErrorMessageAndButton(FailureReason, p1, TargetName, p2, p3)
	-- upvalues: FailureReasonModule (copy), GetFFlagCurrencyTransferReceiveLimitExceededErrorModule (copy), TransferLocaleFormatModule (copy)
	if not FailureReason then
		return p1.GenericError, p1.TryAgain
	end
	local OK = p1.OK
	local DailyLimitExceeded = nil
	
	if FailureReason == FailureReasonModule.TransferDailyLimitExceeded then
		DailyLimitExceeded = p1.DailyLimitExceeded
	elseif FailureReason == FailureReasonModule.TransferMonthlyLimitExceeded then
		DailyLimitExceeded = p1.MonthlyLimitExceeded
	elseif FailureReason == FailureReasonModule.TransferDisabledForUser then
		DailyLimitExceeded = p1.AccountDisabled
	elseif GetFFlagCurrencyTransferReceiveLimitExceededErrorModule() and FailureReason == FailureReasonModule.ReceiveLimitExceeded then
		DailyLimitExceeded = p1.ReceiveLimitExceeded
	elseif FailureReason == FailureReasonModule.ReceiverNotAllowed then
		DailyLimitExceeded = TransferLocaleFormatModule.substituteUsername(p1.ReceiverNotAllowed, TargetName or "")
	elseif FailureReason == FailureReasonModule.TransferAmountBelowMinimum then
		DailyLimitExceeded = TransferLocaleFormatModule.substituteMinAmount(p1.TransferAmountBelowMinimum, (tostring(p2)))
		OK = p1.TryAgain
	elseif FailureReason == FailureReasonModule.TransferAmountExceedsMaximum then
		DailyLimitExceeded = TransferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, (tostring(p3)))
		OK = p1.TryAgain
	elseif FailureReason == FailureReasonModule.TransferAmountExceedsNonSecuredMaximum then
		DailyLimitExceeded = TransferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, (tostring(p3)))
		OK = p1.TryAgain
	else
		DailyLimitExceeded = p1.GenericError
		OK = p1.TryAgain
	end
	return DailyLimitExceeded, OK
end

return function(_)
	-- upvalues: UseTransferStoreModule (copy), UseTokensFunction (copy), SignalsReactModule (copy), FailureReasonModule (copy), UseUserNameFromUserIdModule (copy), ReactModule (copy), GetBalanceRequestModule (copy), UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), GetFFlagCurrencyTransferUseBackendTransferLimitsModule (copy), GetFIntCurrencyTransferMinAmountModule (copy), GetFIntCurrencyTransferMaxAmountModule (copy), getErrorMessageAndButton (copy), Sheet (copy), UseScaledValueFunction (copy), TransferRobuxHeaderModule (copy), View (copy), Icon (copy), Enums (copy), Text (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getRobuxBalanceAmount) or 0
	local BalanceReceivedFromApi = UseTransferStoreModuleResult.getBalanceReceivedFromApi(false)
	local ErrorTransferModel = UseTransferStoreModuleResult.getErrorTransferModel(false)
	local Recipient = UseTransferStoreModuleResult.getRecipient(false)
	local RecipientUserId = UseTransferStoreModuleResult.getRecipientUserId(false)
	local TriggerOnClose = UseTransferStoreModuleResult.triggerOnClose
	local FailureReason = if ErrorTransferModel then ErrorTransferModel.failureReason else nil
	local IsNotRecipientUserIdMatch: boolean = FailureReason == FailureReasonModule.ReceiverNotAllowed and (not Recipient and (RecipientUserId and RecipientUserId ~= 0))
	local UseUserNameFromUserIdModuleResult = UseUserNameFromUserIdModule(if IsNotRecipientUserIdMatch and RecipientUserId and RecipientUserId ~= 0 then RecipientUserId else nil)
	ReactModule.useEffect(function()
		-- upvalues: BalanceReceivedFromApi (copy), GetBalanceRequestModule (upval), UseTransferStoreModuleResult (copy)
		if not BalanceReceivedFromApi then
			GetBalanceRequestModule():andThen(function(Result)
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
	local ErrorMessageAndButton, ErrorMessageAndButton2 = getErrorMessageAndButton(FailureReason, UseLocalizationResult, (if Recipient and (Recipient.targetName or Recipient.targetDisplayName) then Recipient.targetName or Recipient.targetDisplayName elseif IsNotRecipientUserIdMatch and UseUserNameFromUserIdModuleResult and UseUserNameFromUserIdModuleResult ~= "" then UseUserNameFromUserIdModuleResult else nil) or "", if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() and UseSignalStateResult1 then UseSignalStateResult1 else GetFIntCurrencyTransferMinAmountModule(), if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() and UseSignalStateResult2 then UseSignalStateResult2 else GetFIntCurrencyTransferMaxAmountModule())
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { UseScaledValueFunction(300), 0.5 },
		onClose = TriggerOnClose
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
						text = ErrorMessageAndButton2,
						onActivated = TriggerOnClose,
						variant = ButtonVariant.Emphasis,
						fillBehavior = FillBehavior.Fill
					})
				})
			})
		})
	})
end