local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local localizationService = game:GetService("LocalizationService")
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local transferLocaleFormatModule = require(currencyTransfers.Localization.transferLocaleFormat)
local foundationModule = require(parent.Foundation)
local sheet = foundationModule.Sheet
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local enums = foundationModule.Enums
local useLocalization = require(parent.Localization).Hooks.useLocalization
local handleTransferCompleteModule = require(currencyTransfers.Actions.Send.handleTransferComplete)
local transferRobuxHeaderModule = require(currencyTransfers.Components.Generic.TransferRobuxHeader)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local useUpdatedRobuxBalanceModule = require(currencyTransfers.Hooks.useUpdatedRobuxBalance)
local formatNumberModule = require(currencyTransfers.Utils.formatNumber)

return function(_)
	-- upvalues: useTransferStoreModule (ref), useTokens (ref), useUpdatedRobuxBalanceModule (ref), signalsReactModule (ref), useScaledValue (ref), useLocalization (ref), transferLocalizationKeysModule (ref), formatNumberModule (ref), localizationService (ref), reactModule (ref), transferLocaleFormatModule (ref), handleTransferCompleteModule (ref), sheet (ref), transferRobuxHeaderModule (ref), view (ref), icon (ref), enums (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = useTransferStoreModule()
	local var2 = useTokens()
	local var3 = useUpdatedRobuxBalanceModule(var1)
	local var4 = signalsReactModule.useSignalState(var1.getSelectedAmount)
	local var5 = useScaledValue(300)
	local var6 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxSuccessModal)
	local var7 = if var4 then formatNumberModule(localizationService.RobloxLocaleId, var4) else "0"
	
	local function onComplete()
		-- upvalues: handleTransferCompleteModule (copy), var1 (ref)
		handleTransferCompleteModule(var1)
	end
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { var5, 0.5 },
		onClose = onComplete
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
				titleText = var6.SendRobux or "",
				robuxBalanceAmount = var3
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, {
				tag = "col align-x-center align-y-center gap-xlarge size-full-0 auto-y padding-top-xlarge"
			}, {
				SuccessIcon = reactModule.createElement(icon, {
					tag = "auto-xy",
					LayoutOrder = 1,
					name = enums.IconName.CircleCheck,
					size = var2.Size.Size_1200
				}),
				SuccessMessage = reactModule.createElement(text, {
					tag = "auto-y text-body-large text-wrap text-align-x-center content-emphasis",
					LayoutOrder = 2,
					Text = reactModule.useMemo(function()
						-- upvalues: transferLocaleFormatModule (copy), var6 (ref), var7 (ref)
						return transferLocaleFormatModule.substituteAmount(var6.SuccessNotification, tostring(var7))
					end, { var7, var6.SuccessNotification }),
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				tag = "col align-x-center align-y-center gap-small size-full-0 auto-y"
			}, {
				reactModule.createElement(view, { tag = "row gap-small size-full-0 auto-y" }, {
					reactModule.createElement(button, {
						text = var6.OK,
						onActivated = onComplete,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill
					})
				})
			})
		})
	})
end