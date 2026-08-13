local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local transferLocaleFormatModule = require(currencyTransfers.Localization.transferLocaleFormat)
local localizationService = game:GetService("LocalizationService")
local webViewServiceWrapperModule = require(currencyTransfers.Utils.WebViewServiceWrapper)
local purchaseRobuxConstantsModule = require(currencyTransfers.Constants.PurchaseRobuxConstants)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local getBalanceAfterPurchaseWebviewModule = require(currencyTransfers.NetworkRequests.getBalanceAfterPurchaseWebview)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local setTransferPromptStateModule = require(currencyTransfers.Actions.Send.setTransferPromptState)
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
local transferRobuxHeaderModule = require(currencyTransfers.Components.Generic.TransferRobuxHeader)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local formatNumberModule = require(currencyTransfers.Utils.formatNumber)

return function(_) --[[ line: 43 | named "InsufficientBalanceSheet" ]]
	-- upvalues: useTransferStoreModule (ref), useTokens (ref), useLocalization (ref), transferLocalizationKeysModule (ref), signalsReactModule (ref), reactModule (ref), formatNumberModule (ref), localizationService (ref), transferLocaleFormatModule (ref), purchaseRobuxConstantsModule (ref), webViewServiceWrapperModule (ref), transferOriginationModule (ref), setTransferPromptStateModule (ref), promptStateModule (ref), getBalanceAfterPurchaseWebviewModule (ref), sheet (ref), useScaledValue (ref), transferRobuxHeaderModule (ref), view (ref), icon (ref), enums (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var16 = useTransferStoreModule()
	local var17 = useTokens()
	local var18 = useLocalization(transferLocalizationKeysModule.Presets.InsufficientBalanceSheet)
	local getRobuxBalanceAmount = signalsReactModule.useSignalState(var16.getRobuxBalanceAmount) or 0
	local var20 = reactModule.useRef(0)
	local var21 = formatNumberModule(localizationService.RobloxLocaleId, math.max(0, (signalsReactModule.useSignalState(var16.getSelectedAmount) or 0 or 0) - getRobuxBalanceAmount))
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { useScaledValue(300), 0.5 },
		onClose = function() --[[ line: 93 ]]
			-- upvalues: var16 (ref), transferOriginationModule (copy), setTransferPromptStateModule (copy), promptStateModule (copy)
			if var16.getTransferOrigination(false) == transferOriginationModule.InExperience then
				var16.triggerOnClose()
				
				return
			end
			setTransferPromptStateModule(var16, promptStateModule.TransferInput)
		end
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
				titleText = var18.SendRobux,
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
					Text = reactModule.useMemo(function() --[[ line: 52 ]]
						-- upvalues: transferLocaleFormatModule (copy), var18 (ref), var21 (ref)
						return transferLocaleFormatModule.substituteAmount(var18.InsufficientBalance or "", tostring(var21))
					end, { var21, var18.InsufficientBalance }),
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
						text = var18.BuyRobux or "Buy",
						onActivated = function() --[[ line: 56 ]]
							-- upvalues: var16 (ref), purchaseRobuxConstantsModule (copy), webViewServiceWrapperModule (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), promptStateModule (copy), var20 (ref), getBalanceAfterPurchaseWebviewModule (copy)
							local transferOrigination = var16.getTransferOrigination(false)
							webViewServiceWrapperModule.new({
								url = purchaseRobuxConstantsModule.getPurchaseRobuxUrl(),
								title = purchaseRobuxConstantsModule.PURCHASE_ROBUX_WEBVIEW_TITLE,
								closeCallback = function() --[[ line: 63 ]]
									-- upvalues: transferOrigination (ref), transferOriginationModule (copy), setTransferPromptStateModule (copy), var16 (copy), promptStateModule (copy), var20 (copy), getBalanceAfterPurchaseWebviewModule (copy)
									local function _() --[[ line: 64 | named "applyPromptAfterBalance" ]]
										-- upvalues: transferOrigination (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), var16 (copy), promptStateModule (copy)
										if transferOrigination == transferOriginationModule.InExperience then
											setTransferPromptStateModule(var16, promptStateModule.TransferConfirm)
											
											return
										end
										setTransferPromptStateModule(var16, promptStateModule.TransferInput)
									end
									
									var20.current += 1
									local current = var20.current
									getBalanceAfterPurchaseWebviewModule(nil, var16.getNetworkImpl()):andThen(function(p0) --[[ line: 74 ]]
										-- upvalues: var20 (copy), current (ref), var16 (copy), transferOrigination (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), promptStateModule (copy)
										if var20.current ~= current then return end
										var16.setRobuxBalanceAmount(p0)
										var16.setBalanceReceivedFromApi(true)
										
										if transferOrigination == transferOriginationModule.InExperience then
											setTransferPromptStateModule(var16, promptStateModule.TransferConfirm)
											
											return
										end
										setTransferPromptStateModule(var16, promptStateModule.TransferInput)
									end):catch(function(_) --[[ line: 82 ]]
										-- upvalues: var20 (copy), current (ref), transferOrigination (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), var16 (copy), promptStateModule (copy)
										if var20.current ~= current then return end
										if transferOrigination == transferOriginationModule.InExperience then
											setTransferPromptStateModule(var16, promptStateModule.TransferConfirm)
											
											return
										end
										setTransferPromptStateModule(var16, promptStateModule.TransferInput)
									end)
								end
							}):open()
						end,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill
					})
				})
			})
		})
	})
end