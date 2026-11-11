local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalizationService = game:GetService("LocalizationService")
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local TransferLocaleFormatModule = require(CurrencyTransfers.Localization.transferLocaleFormat)
local FoundationModule = require(Parent.Foundation)
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Enums = FoundationModule.Enums
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local HandleTransferCompleteModule = require(CurrencyTransfers.Actions.Send.handleTransferComplete)
local TransferRobuxHeaderModule = require(CurrencyTransfers.Components.Generic.TransferRobuxHeader)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local UseUpdatedRobuxBalanceModule = require(CurrencyTransfers.Hooks.useUpdatedRobuxBalance)
local FormatNumberModule = require(CurrencyTransfers.Utils.formatNumber)

return function(_)
	-- upvalues: UseTransferStoreModule (copy), UseTokensFunction (copy), UseUpdatedRobuxBalanceModule (copy), SignalsReactModule (copy), UseScaledValueFunction (copy), UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), FormatNumberModule (copy), LocalizationService (copy), ReactModule (copy), TransferLocaleFormatModule (copy), HandleTransferCompleteModule (copy), Sheet (copy), TransferRobuxHeaderModule (copy), View (copy), Icon (copy), Enums (copy), Text (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local UseTokensResult = UseTokensFunction()
	local UseUpdatedRobuxBalanceModuleResult = UseUpdatedRobuxBalanceModule(UseTransferStoreModuleResult)
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getSelectedAmount)
	local UseScaledValueResult = UseScaledValueFunction(300)
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.TransferRobuxSuccessModal)
	local FormatNumberModuleResult = if UseSignalStateResult then FormatNumberModule(LocalizationService.RobloxLocaleId, UseSignalStateResult) else "0"
	
	local function onComplete()
		-- upvalues: HandleTransferCompleteModule (upval), UseTransferStoreModuleResult (copy)
		HandleTransferCompleteModule(UseTransferStoreModuleResult)
	end
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { UseScaledValueResult, 0.5 },
		onClose = onComplete
	}, {
		Header = ReactModule.createElement(Sheet.Header, {}, {
			TransferRobuxHeader = ReactModule.createElement(TransferRobuxHeaderModule, {
				titleText = UseLocalizationResult.SendRobux or "",
				robuxBalanceAmount = UseUpdatedRobuxBalanceModuleResult
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = ReactModule.createElement(View, {
				tag = "col align-x-center align-y-center gap-xlarge size-full-0 auto-y padding-top-xlarge"
			}, {
				SuccessIcon = ReactModule.createElement(Icon, {
					tag = "auto-xy",
					LayoutOrder = 1,
					name = Enums.IconName.CircleCheck,
					size = UseTokensResult.Size.Size_1200
				}),
				SuccessMessage = ReactModule.createElement(Text, {
					tag = "auto-y text-body-large text-wrap text-align-x-center content-emphasis",
					LayoutOrder = 2,
					Text = ReactModule.useMemo(function()
						-- upvalues: TransferLocaleFormatModule (upval), UseLocalizationResult (copy), FormatNumberModuleResult (copy)
						return TransferLocaleFormatModule.substituteAmount(UseLocalizationResult.SuccessNotification, (tostring(FormatNumberModuleResult)))
					end, {
						FormatNumberModuleResult,
						UseLocalizationResult.SuccessNotification
					}),
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
			ReactModule.createElement(View, {
				tag = "col align-x-center align-y-center gap-small size-full-0 auto-y"
			}, {
				ReactModule.createElement(View, { tag = "row gap-small size-full-0 auto-y" }, {
					ReactModule.createElement(Button, {
						text = UseLocalizationResult.OK,
						onActivated = onComplete,
						variant = ButtonVariant.Emphasis,
						fillBehavior = FillBehavior.Fill
					})
				})
			})
		})
	})
end