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

local function getErrorMessageAndButton(p1, p2, p3, p4, p5, p6)
	-- upvalues: getFFlagEnableLimitHit2SVUpsellModule (ref), failureReasonModule (ref), getFFlagCurrencyTransferReceiveLimitExceededErrorModule (ref), transferLocaleFormatModule (ref)
	if not p1 then
		return p2.GenericError, p2.TryAgain
	end
	local dailyLimitTwoStepVerificationUpsell
	local OK = p2.OK
	local _ = nil
	
	if getFFlagEnableLimitHit2SVUpsellModule() then
		if p1 == failureReasonModule.TransferDailyLimitExceeded then
			if p6 then
				dailyLimitTwoStepVerificationUpsell = p2.DailyLimitTwoStepVerificationUpsell
				OK = p2.TurnOnTwoStepVerification
			else
				dailyLimitTwoStepVerificationUpsell = p2.DailyLimitExceeded
			end
		elseif p1 == failureReasonModule.TransferMonthlyLimitExceeded then
			if p6 then
				dailyLimitTwoStepVerificationUpsell = p2.MonthlyLimitTwoStepVerificationUpsell
				OK = p2.TurnOnTwoStepVerification
			else
				dailyLimitTwoStepVerificationUpsell = p2.MonthlyLimitExceeded
			end
		elseif p1 == failureReasonModule.TransferDisabledForUser then
			dailyLimitTwoStepVerificationUpsell = p2.AccountDisabled
		elseif getFFlagCurrencyTransferReceiveLimitExceededErrorModule() and p1 == failureReasonModule.ReceiveLimitExceeded then
			dailyLimitTwoStepVerificationUpsell = p2.ReceiveLimitExceeded
		elseif p1 == failureReasonModule.ReceiverNotAllowed then
			dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteUsername(p2.ReceiverNotAllowed, p3 or "")
		elseif p1 == failureReasonModule.TransferAmountBelowMinimum then
			dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMinAmount(p2.TransferAmountBelowMinimum, tostring(p4))
			OK = p2.TryAgain
		elseif p1 == failureReasonModule.TransferAmountExceedsMaximum then
			dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMaxAmount(p2.TransferAmountExceedsMaximum, tostring(p5))
			OK = p2.TryAgain
		elseif p1 == failureReasonModule.TransferAmountExceedsNonSecuredMaximum then
			dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMaxAmount(p2.TransferAmountExceedsMaximum, tostring(p5))
			OK = p2.TryAgain
		else
			dailyLimitTwoStepVerificationUpsell = p2.GenericError
			OK = p2.TryAgain
		end
	elseif p1 == failureReasonModule.TransferDailyLimitExceeded then
		dailyLimitTwoStepVerificationUpsell = p2.DailyLimitExceeded
	elseif p1 == failureReasonModule.TransferMonthlyLimitExceeded then
		dailyLimitTwoStepVerificationUpsell = p2.MonthlyLimitExceeded
	elseif p1 == failureReasonModule.TransferDisabledForUser then
		dailyLimitTwoStepVerificationUpsell = p2.AccountDisabled
	elseif getFFlagCurrencyTransferReceiveLimitExceededErrorModule() and p1 == failureReasonModule.ReceiveLimitExceeded then
		dailyLimitTwoStepVerificationUpsell = p2.ReceiveLimitExceeded
	elseif p1 == failureReasonModule.ReceiverNotAllowed then
		dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteUsername(p2.ReceiverNotAllowed, p3 or "")
	elseif p1 == failureReasonModule.TransferAmountBelowMinimum then
		dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMinAmount(p2.TransferAmountBelowMinimum, tostring(p4))
		OK = p2.TryAgain
	elseif p1 == failureReasonModule.TransferAmountExceedsMaximum then
		dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMaxAmount(p2.TransferAmountExceedsMaximum, tostring(p5))
		OK = p2.TryAgain
	elseif p1 == failureReasonModule.TransferAmountExceedsNonSecuredMaximum then
		dailyLimitTwoStepVerificationUpsell = transferLocaleFormatModule.substituteMaxAmount(p2.TransferAmountExceedsMaximum, tostring(p5))
		OK = p2.TryAgain
	else
		dailyLimitTwoStepVerificationUpsell = p2.GenericError
		OK = p2.TryAgain
	end
	return dailyLimitTwoStepVerificationUpsell, OK
end

local getFFlagCurrencyTransferFocusNavigationModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFocusNavigation)
local useTransferSheetFocusModule = require(currencyTransfers.Hooks.useTransferSheetFocus)

return function(_)
	-- upvalues: useTransferStoreModule (ref), useTokens (ref), signalsReactModule (ref), getFFlagCurrencyTransferFocusNavigationModule (ref), useTransferSheetFocusModule (ref), getFFlagEnableLimitHit2SVUpsellModule (ref), useDispatch (ref), failureReasonModule (ref), useUserNameFromUserIdModule (ref), enums (ref), transferOriginationModule (ref), contentProviderService (ref), webViewServiceWrapperModule (ref), navigateDown (ref), appPage (ref), urlBuilder (ref), reactModule (ref), getBalanceRequestModule (ref), useLocalization (ref), transferLocalizationKeysModule (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (ref), getFIntCurrencyTransferMinAmountModule (ref), getFIntCurrencyTransferMaxAmountModule (ref), getErrorMessageAndButton (ref), sheet (ref), useScaledValue (ref), transferRobuxHeaderModule (ref), view (ref), icon (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1, var2
	local var3 = useTransferStoreModule()
	local var4 = useTokens()
	local getRobuxBalanceAmount = signalsReactModule.useSignalState(var3.getRobuxBalanceAmount) or 0
	local balanceReceivedFromApi = var3.getBalanceReceivedFromApi(false)
	local errorTransferModel = var3.getErrorTransferModel(false)
	local recipient = var3.getRecipient(false)
	local recipientUserId = var3.getRecipientUserId(false)
	local triggerOnClose = var3.triggerOnClose
	local var5 = nil
	local var6 = nil
	
	if getFFlagCurrencyTransferFocusNavigationModule() then
		local var7, var8 = useTransferSheetFocusModule(triggerOnClose)
		var5 = var7
		var6 = var8
	end
	if getFFlagEnableLimitHit2SVUpsellModule() then
		local var9
		local var10 = useDispatch()
		local var11 = if errorTransferModel then errorTransferModel.failureReason else nil
		var1 = var11 == failureReasonModule.ReceiverNotAllowed and (not recipient and (recipientUserId and recipientUserId ~= 0))
		var2 = useUserNameFromUserIdModule(if var1 and recipientUserId and recipientUserId ~= 0 then recipientUserId else nil)
		local var12 = if errorTransferModel then errorTransferModel.isEligibleForElevatedLimitUpsell else false
		
		if var11 ~= failureReasonModule.TransferDailyLimitExceeded then
			var9 = var11 == failureReasonModule.TransferMonthlyLimitExceeded and var12
		end
		local var13 = if var9 then enums.IconName.CircleArrowUp else enums.IconName.TriangleExclamation
		
		local function handleButtonActivated()
			-- upvalues: triggerOnClose (ref), var9 (ref), var3 (ref), transferOriginationModule (copy), contentProviderService (copy), webViewServiceWrapperModule (copy), var10 (ref), navigateDown (copy), appPage (copy), urlBuilder (copy)
			triggerOnClose()
			
			if var9 then
				if var3.getTransferOrigination(false) == transferOriginationModule.InExperience then
					webViewServiceWrapperModule.new({
						title = "Robux",
						url = string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:") .. "my/account#!/robux"
					}):open()
					
					return
				end
				var10(navigateDown({
					name = appPage.SettingsSubPage,
					detail = urlBuilder.static.settings.robux(),
					extraProps = { titleKey = "Feature.AccountSettings.Heading.Tab.Robux" }
				}))
			end
		end
		
		reactModule.useEffect(function()
			-- upvalues: balanceReceivedFromApi (ref), getBalanceRequestModule (copy), var3 (ref)
			if balanceReceivedFromApi then
				return
			end
			getBalanceRequestModule(nil, var3.getNetworkImpl()):andThen(function(p1)
				-- upvalues: var3 (copy)
				var3.setRobuxBalanceAmount(p1)
				var3.setBalanceReceivedFromApi(true)
			end):catch(function() end)
		end, { balanceReceivedFromApi })
		local var14 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxErrorSheet)
		local var15 = signalsReactModule.useSignalState(var3.getMinimumTransferAmount)
		local var16 = signalsReactModule.useSignalState(var3.getMaximumTransferAmount)
		local var17, var18 = getErrorMessageAndButton(var11, var14, (if recipient and (recipient.targetName or recipient.targetDisplayName) then recipient.targetName or recipient.targetDisplayName elseif var1 and var2 and var2 ~= "" then var2 else nil) or "", if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var15 then var15 else getFIntCurrencyTransferMinAmountModule(), if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var16 then var16 else getFIntCurrencyTransferMaxAmountModule(), var12)
		
		return reactModule.createElement(sheet.Root, {
			preferCenterSheet = true,
			snapPoints = { useScaledValue(300), 0.5 },
			onClose = triggerOnClose,
			ref = var5
		}, {
			Header = reactModule.createElement(sheet.Header, {}, {
				TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
					titleText = var14.SendRobux or "",
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
							name = var13,
							size = var4.Size.Size_1200
						})
					}),
					ErrorMessage = reactModule.createElement(text, {
						tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
						LayoutOrder = 2,
						Text = var17,
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
							ref = var6,
							text = var18,
							onActivated = handleButtonActivated,
							variant = buttonVariant.Emphasis,
							fillBehavior = fillBehavior.Fill
						})
					})
				})
			})
		})
	else
		local var19 = if errorTransferModel then errorTransferModel.failureReason else nil
		local var20 = var19 == failureReasonModule.ReceiverNotAllowed and (not recipient and (recipientUserId and recipientUserId ~= 0))
		var2 = if var20 and recipientUserId and recipientUserId ~= 0 then recipientUserId else nil
		var1 = useUserNameFromUserIdModule(var2)
		reactModule.useEffect(function()
			-- upvalues: balanceReceivedFromApi (ref), getBalanceRequestModule (copy), var3 (ref)
			if balanceReceivedFromApi then
				return
			end
			getBalanceRequestModule(nil, var3.getNetworkImpl()):andThen(function(p1)
				-- upvalues: var3 (copy)
				var3.setRobuxBalanceAmount(p1)
				var3.setBalanceReceivedFromApi(true)
			end):catch(function() end)
		end, { balanceReceivedFromApi })
		var2 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxErrorSheet)
		local var21 = signalsReactModule.useSignalState(var3.getMinimumTransferAmount)
		local var22 = signalsReactModule.useSignalState(var3.getMaximumTransferAmount)
		local var23, var24 = getErrorMessageAndButton(var19, var2, (if recipient and (recipient.targetName or recipient.targetDisplayName) then recipient.targetName or recipient.targetDisplayName elseif var20 and var1 and var1 ~= "" then var1 else nil) or "", if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var21 then var21 else getFIntCurrencyTransferMinAmountModule(), if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var22 then var22 else getFIntCurrencyTransferMaxAmountModule(), false)
		
		return reactModule.createElement(sheet.Root, {
			preferCenterSheet = true,
			snapPoints = { useScaledValue(300), 0.5 },
			onClose = triggerOnClose,
			ref = var5
		}, {
			Header = reactModule.createElement(sheet.Header, {}, {
				TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
					titleText = var2.SendRobux or "",
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
							size = var4.Size.Size_1200
						})
					}),
					ErrorMessage = reactModule.createElement(text, {
						tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
						LayoutOrder = 2,
						Text = var23,
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
							ref = var6,
							text = var24,
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