local contentProviderService = game:GetService("ContentProvider")
local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getBalanceRequestModule = require(currencyTransfers.NetworkRequests.getBalanceRequest)
local useUserNameFromUserIdModule = require(currencyTransfers.Hooks.useUserNameFromUserId)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local transferLocaleFormatModule = require(currencyTransfers.Localization.transferLocaleFormat)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local appPage = require(parent.RobloxAppEnums).AppPage
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local webViewServiceWrapperModule = require(currencyTransfers.Utils.WebViewServiceWrapper)
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
local getFFlagEnableLimitHit2SVUpsellModule = require(currencyTransfers.Flags.GetFFlagEnableLimitHit2SVUpsell)
local transferRobuxHeaderModule = require(currencyTransfers.Components.Generic.TransferRobuxHeader)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)

local function getErrorMessageAndButton(p0, p1, p2, p3, p4, p5) --[[ line: 58 ]]
	-- upvalues: getFFlagEnableLimitHit2SVUpsellModule (ref), failureReasonModule (ref), getFFlagCurrencyTransferReceiveLimitExceededErrorModule (ref), transferLocaleFormatModule (ref)
	if not p0 then
		return p1.GenericError, p1.TryAgain
	end
	local dailyLimitTwoStepVerificationUpsell
	local OK = p1.OK
	local _ = nil
	
	if getFFlagEnableLimitHit2SVUpsellModule() then
		if p0 == failureReasonModule.TransferDailyLimitExceeded then
			if p5 then
				dailyLimitTwoStepVerificationUpsell = p1.DailyLimitTwoStepVerificationUpsell
				OK = p1.TurnOnTwoStepVerification
			else
				dailyLimitTwoStepVerificationUpsell = p1.DailyLimitExceeded
			end
		elseif p0 == failureReasonModule.TransferMonthlyLimitExceeded then
			if p5 then
				dailyLimitTwoStepVerificationUpsell = p1.MonthlyLimitTwoStepVerificationUpsell
				OK = p1.TurnOnTwoStepVerification
			else
				dailyLimitTwoStepVerificationUpsell = p1.MonthlyLimitExceeded
			end
		elseif p0 == failureReasonModule.TransferDisabledForUser then
			dailyLimitTwoStepVerificationUpsell = p1.AccountDisabled
		elseif getFFlagCurrencyTransferReceiveLimitExceededErrorModule() and p0 == failureReasonModule.ReceiveLimitExceeded then
			dailyLimitTwoStepVerificationUpsell = p1.ReceiveLimitExceeded
		elseif p0 == failureReasonModule.ReceiverNotAllowed then
			dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteUsername(p1.ReceiverNotAllowed, p2 or "")
		elseif p0 == failureReasonModule.TransferAmountBelowMinimum then
			dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMinAmount(p1.TransferAmountBelowMinimum, tostring(p3))
			OK = p1.TryAgain
		elseif p0 == failureReasonModule.TransferAmountExceedsMaximum then
			dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, tostring(p4))
			OK = p1.TryAgain
		elseif p0 == failureReasonModule.TransferAmountExceedsNonSecuredMaximum then
			dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, tostring(p4))
			OK = p1.TryAgain
		else
			dailyLimitTwoStepVerificationUpsell = p1.GenericError
			OK = p1.TryAgain
		end
	elseif p0 == failureReasonModule.TransferDailyLimitExceeded then
		dailyLimitTwoStepVerificationUpsell = p1.DailyLimitExceeded
	elseif p0 == failureReasonModule.TransferMonthlyLimitExceeded then
		dailyLimitTwoStepVerificationUpsell = p1.MonthlyLimitExceeded
	elseif p0 == failureReasonModule.TransferDisabledForUser then
		dailyLimitTwoStepVerificationUpsell = p1.AccountDisabled
	elseif getFFlagCurrencyTransferReceiveLimitExceededErrorModule() and p0 == failureReasonModule.ReceiveLimitExceeded then
		dailyLimitTwoStepVerificationUpsell = p1.ReceiveLimitExceeded
	elseif p0 == failureReasonModule.ReceiverNotAllowed then
		dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteUsername(p1.ReceiverNotAllowed, p2 or "")
	elseif p0 == failureReasonModule.TransferAmountBelowMinimum then
		dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMinAmount(p1.TransferAmountBelowMinimum, tostring(p3))
		OK = p1.TryAgain
	elseif p0 == failureReasonModule.TransferAmountExceedsMaximum then
		dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, tostring(p4))
		OK = p1.TryAgain
	elseif p0 == failureReasonModule.TransferAmountExceedsNonSecuredMaximum then
		dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMaxAmount(p1.TransferAmountExceedsMaximum, tostring(p4))
		OK = p1.TryAgain
	else
		dailyLimitTwoStepVerificationUpsell = p1.GenericError
		OK = p1.TryAgain
	end
	return dailyLimitTwoStepVerificationUpsell, OK
end

return function(_) --[[ line: 163 | named "TransferRobuxErrorSheet" ]]
	-- upvalues: useTransferStoreModule (ref), useTokens (ref), signalsReactModule (ref), getFFlagEnableLimitHit2SVUpsellModule (ref), useDispatch (ref), failureReasonModule (ref), useUserNameFromUserIdModule (ref), enums (ref), transferOriginationModule (ref), contentProviderService (ref), webViewServiceWrapperModule (ref), navigateDown (ref), appPage (ref), urlBuilder (ref), reactModule (ref), getBalanceRequestModule (ref), useLocalization (ref), transferLocalizationKeysModule (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (ref), getFIntCurrencyTransferMinAmountModule (ref), getFIntCurrencyTransferMaxAmountModule (ref), getErrorMessageAndButton (ref), sheet (ref), useScaledValue (ref), transferRobuxHeaderModule (ref), view (ref), icon (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var29, var30
	local var20 = useTransferStoreModule()
	local var21 = useTokens()
	local getRobuxBalanceAmount = signalsReactModule.useSignalState(var20.getRobuxBalanceAmount) or 0
	local balanceReceivedFromApi = var20.getBalanceReceivedFromApi(false)
	local errorTransferModel = var20.getErrorTransferModel(false)
	local recipient = var20.getRecipient(false)
	local recipientUserId = var20.getRecipientUserId(false)
	local triggerOnClose = var20.triggerOnClose
	
	if getFFlagEnableLimitHit2SVUpsellModule() then
		local var32
		local var27 = useDispatch()
		local var28 = if errorTransferModel then errorTransferModel.failureReason else nil
		var29 = var28 == failureReasonModule.ReceiverNotAllowed and (not recipient and (recipientUserId and recipientUserId ~= 0))
		var30 = useUserNameFromUserIdModule(if var29 and recipientUserId and recipientUserId ~= 0 then recipientUserId else nil)
		local var31 = if errorTransferModel then errorTransferModel.isEligibleForElevatedLimitUpsell else false
		
		if var28 ~= failureReasonModule.TransferDailyLimitExceeded then
			var32 = var28 == failureReasonModule.TransferMonthlyLimitExceeded and var31
		end
		local var33 = if var32 then enums.IconName.CircleArrowUp else enums.IconName.TriangleExclamation
		
		local function handleButtonActivated() --[[ line: 195 ]]
			-- upvalues: triggerOnClose (ref), var32 (ref), var20 (ref), transferOriginationModule (copy), contentProviderService (copy), webViewServiceWrapperModule (copy), var27 (ref), navigateDown (copy), appPage (copy), urlBuilder (copy)
			triggerOnClose()
			
			if var32 then
				if var20.getTransferOrigination(false) == transferOriginationModule.InExperience then
					webViewServiceWrapperModule.new({
						title = "Robux",
						url = string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:") .. "my/account#!/robux"
					}):open()
					
					return
				end
				var27(navigateDown({
					name = appPage.SettingsSubPage,
					detail = urlBuilder.static.settings.robux(),
					extraProps = { titleKey = "Feature.AccountSettings.Heading.Tab.Robux" }
				}))
			end
		end
		
		reactModule.useEffect(function() --[[ line: 224 ]]
			-- upvalues: balanceReceivedFromApi (ref), getBalanceRequestModule (copy), var20 (ref)
			if balanceReceivedFromApi then
				return
			end
			getBalanceRequestModule(nil, var20.getNetworkImpl()):andThen(function(p6) --[[ line: 229 ]]
				-- upvalues: var20 (copy)
				var20.setRobuxBalanceAmount(p6)
				var20.setBalanceReceivedFromApi(true)
			end):catch(function() --[[ line: 233 ]] end)
		end, { balanceReceivedFromApi })
		local var35 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxErrorSheet)
		local var36 = signalsReactModule.useSignalState(var20.getMinimumTransferAmount)
		local var37 = signalsReactModule.useSignalState(var20.getMaximumTransferAmount)
		local var38, var39 = getErrorMessageAndButton(var28, var35, (if recipient and (recipient.targetName or recipient.targetDisplayName) then recipient.targetName or recipient.targetDisplayName elseif var29 and var30 and var30 ~= "" then var30 else nil) or "", if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var36 then var36 else getFIntCurrencyTransferMinAmountModule(), if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var37 then var37 else getFIntCurrencyTransferMaxAmountModule(), var31)
		
		return reactModule.createElement(sheet.Root, {
			preferCenterSheet = true,
			snapPoints = { useScaledValue(300), 0.5 },
			onClose = triggerOnClose
		}, {
			Header = reactModule.createElement(sheet.Header, {}, {
				TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
					titleText = var35.SendRobux or "",
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
							name = var33,
							size = var21.Size.Size_1200
						})
					}),
					ErrorMessage = reactModule.createElement(text, {
						tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
						LayoutOrder = 2,
						Text = var38,
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
							text = var39,
							onActivated = handleButtonActivated,
							variant = buttonVariant.Emphasis,
							fillBehavior = fillBehavior.Fill
						})
					})
				})
			})
		})
	else
		local var40 = if errorTransferModel then errorTransferModel.failureReason else nil
		local var41 = var40 == failureReasonModule.ReceiverNotAllowed and (not recipient and (recipientUserId and recipientUserId ~= 0))
		var30 = if var41 and recipientUserId and recipientUserId ~= 0 then recipientUserId else nil
		var29 = useUserNameFromUserIdModule(var30)
		reactModule.useEffect(function() --[[ line: 340 ]]
			-- upvalues: balanceReceivedFromApi (ref), getBalanceRequestModule (copy), var20 (ref)
			if balanceReceivedFromApi then
				return
			end
			getBalanceRequestModule(nil, var20.getNetworkImpl()):andThen(function(p7) --[[ line: 345 ]]
				-- upvalues: var20 (copy)
				var20.setRobuxBalanceAmount(p7)
				var20.setBalanceReceivedFromApi(true)
			end):catch(function() --[[ line: 349 ]] end)
		end, { balanceReceivedFromApi })
		var30 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxErrorSheet)
		local var42 = signalsReactModule.useSignalState(var20.getMinimumTransferAmount)
		local var43 = signalsReactModule.useSignalState(var20.getMaximumTransferAmount)
		local var44, var45 = getErrorMessageAndButton(var40, var30, (if recipient and (recipient.targetName or recipient.targetDisplayName) then recipient.targetName or recipient.targetDisplayName elseif var41 and var29 and var29 ~= "" then var29 else nil) or "", if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var42 then var42 else getFIntCurrencyTransferMinAmountModule(), if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var43 then var43 else getFIntCurrencyTransferMaxAmountModule(), false)
		
		return reactModule.createElement(sheet.Root, {
			preferCenterSheet = true,
			snapPoints = { useScaledValue(300), 0.5 },
			onClose = triggerOnClose
		}, {
			Header = reactModule.createElement(sheet.Header, {}, {
				TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
					titleText = var30.SendRobux or "",
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
							size = var21.Size.Size_1200
						})
					}),
					ErrorMessage = reactModule.createElement(text, {
						tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
						LayoutOrder = 2,
						Text = var44,
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
							text = var45,
							onActivated = triggerOnClose,
							variant = buttonVariant.Emphasis,
							fillBehavior = fillBehavior.Fill
						})
					})
				})
			})
		})
	end
end