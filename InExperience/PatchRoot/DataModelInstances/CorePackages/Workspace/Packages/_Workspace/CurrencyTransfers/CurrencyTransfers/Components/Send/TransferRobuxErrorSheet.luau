local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getBalanceRequestModule = require(currencyTransfers.NetworkRequests.getBalanceRequest)
local useUserNameFromUserIdModule = require(currencyTransfers.Hooks.useUserNameFromUserId)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local transferLocaleFormatModule = require(currencyTransfers.Localization.transferLocaleFormat)
local foundationModule = require(parent.Foundation)
local sheet = foundationModule.Sheet
local view = foundationModule.View
local text = foundationModule.Text
local button = foundationModule.Button
local icon = foundationModule.Icon
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local enums = foundationModule.Enums
local useLocalization = require(parent.Localization).Hooks.useLocalization
local failureReasonModule = require(currencyTransfers.Enums.FailureReason)
local getFIntCurrencyTransferMinAmountModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferMinAmount)
local getFIntCurrencyTransferMaxAmountModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferMaxAmount)
local getFFlagCurrencyTransferUseBackendTransferLimitsModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferUseBackendTransferLimits)
local getFFlagCurrencyTransferReceiveLimitExceededErrorModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferReceiveLimitExceededError)
local transferRobuxHeaderModule = require(currencyTransfers.Components.Generic.TransferRobuxHeader)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)

local function getErrorMessageAndButton(p0, p1, p2, p3, p4) --[[ line: 48 ]]
	-- upvalues: failureReasonModule (ref), getFFlagCurrencyTransferReceiveLimitExceededErrorModule (ref), transferLocaleFormatModule (ref)
	if not p0 then
		return p1.GenericError, p1.TryAgain
	end
	local dailyLimitExceeded
	local OK = p1.OK
	local _ = nil
	
	if p0 == failureReasonModule.TransferDailyLimitExceeded then
		dailyLimitExceeded = p1.DailyLimitExceeded
	elseif p0 == failureReasonModule.TransferMonthlyLimitExceeded then
		dailyLimitExceeded = p1.MonthlyLimitExceeded
	elseif p0 == failureReasonModule.TransferDisabledForUser then
		dailyLimitExceeded = p1.AccountDisabled
	elseif getFFlagCurrencyTransferReceiveLimitExceededErrorModule() and p0 == failureReasonModule.ReceiveLimitExceeded then
		dailyLimitExceeded = p1.ReceiveLimitExceeded
	elseif p0 == failureReasonModule.ReceiverNotAllowed then
		dailyLimitExceeded = transferLocaleFormatModule.substituteUsername(p1.ReceiverNotAllowed, p2 or "")
	elseif p0 == failureReasonModule.TransferAmountBelowMinimum then
		dailyLimitExceeded = transferLocaleFormatModule.substituteMinAmount(p1.TransferAmountBelowMinimum, tostring(p3))
		OK = p1.TryAgain
	elseif p0 == failureReasonModule.TransferAmountExceedsMaximum then
		dailyLimitExceeded = transferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, tostring(p4))
		OK = p1.TryAgain
	elseif p0 == failureReasonModule.TransferAmountExceedsNonSecuredMaximum then
		dailyLimitExceeded = transferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, tostring(p4))
		OK = p1.TryAgain
	else
		dailyLimitExceeded = p1.GenericError
		OK = p1.TryAgain
	end
	return dailyLimitExceeded, OK
end

return function(_) --[[ line: 90 | named "TransferRobuxErrorSheet" ]]
	-- upvalues: useTransferStoreModule (ref), useTokens (ref), signalsReactModule (ref), failureReasonModule (ref), useUserNameFromUserIdModule (ref), reactModule (ref), getBalanceRequestModule (ref), useLocalization (ref), transferLocalizationKeysModule (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (ref), getFIntCurrencyTransferMinAmountModule (ref), getFIntCurrencyTransferMaxAmountModule (ref), getErrorMessageAndButton (ref), sheet (ref), useScaledValue (ref), transferRobuxHeaderModule (ref), view (ref), icon (ref), enums (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var16 = useTransferStoreModule()
	local var17 = useTokens()
	local getRobuxBalanceAmount = signalsReactModule.useSignalState(var16.getRobuxBalanceAmount) or 0
	local balanceReceivedFromApi = var16.getBalanceReceivedFromApi(false)
	local errorTransferModel = var16.getErrorTransferModel(false)
	local recipient = var16.getRecipient(false)
	local recipientUserId = var16.getRecipientUserId(false)
	local triggerOnClose = var16.triggerOnClose
	local var23 = if errorTransferModel then errorTransferModel.failureReason else nil
	local var24 = var23 == failureReasonModule.ReceiverNotAllowed and (not recipient and (recipientUserId and recipientUserId ~= 0))
	local var25 = useUserNameFromUserIdModule(if var24 and recipientUserId and recipientUserId ~= 0 then recipientUserId else nil)
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: balanceReceivedFromApi (ref), getBalanceRequestModule (copy), var16 (ref)
		if balanceReceivedFromApi then
			return
		end
		getBalanceRequestModule():andThen(function(p5) --[[ line: 115 ]]
			-- upvalues: var16 (copy)
			var16.setRobuxBalanceAmount(p5)
			var16.setBalanceReceivedFromApi(true)
		end):catch(function() --[[ line: 119 ]] end)
	end, { balanceReceivedFromApi })
	local var26 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxErrorSheet)
	local var27 = signalsReactModule.useSignalState(var16.getMinimumTransferAmount)
	local var28 = signalsReactModule.useSignalState(var16.getMaximumTransferAmount)
	local var29, var30 = getErrorMessageAndButton(var23, var26, (if recipient and (recipient.targetName or recipient.targetDisplayName) then recipient.targetName or recipient.targetDisplayName elseif var24 and var25 and var25 ~= "" then var25 else nil) or "", if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var27 then var27 else getFIntCurrencyTransferMinAmountModule(), if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var28 then var28 else getFIntCurrencyTransferMaxAmountModule())
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { useScaledValue(300), 0.5 },
		onClose = triggerOnClose
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
				titleText = var26.SendRobux or "",
				robuxBalanceAmount = getRobuxBalanceAmount
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = "col gap-xlarge auto-y size-full-0 align-x-center align-y-center padding-top-xlarge"
			}, {
				ErrorIconContainer = reactModule.createElement(view, {
					tag = "size-1200-1200 radius-circle align-x-center align-y-center bg-inverse-emphasis",
					LayoutOrder = 1
				}, {
					ErrorIcon = reactModule.createElement(icon, {
						tag = "content-inverse-emphasis",
						name = enums.IconName.TriangleExclamation,
						size = var17.Size.Size_1200
					})
				}),
				ErrorMessage = reactModule.createElement(text, {
					tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
					LayoutOrder = 2,
					Text = var29,
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				tag = "col auto-y align-y-center align-x-center size-full-0 gap-small"
			}, {
				reactModule.createElement(view, { tag = "row auto-y size-full-0 gap-small" }, {
					reactModule.createElement(button, {
						text = var30,
						onActivated = triggerOnClose,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill
					})
				})
			})
		})
	})
end