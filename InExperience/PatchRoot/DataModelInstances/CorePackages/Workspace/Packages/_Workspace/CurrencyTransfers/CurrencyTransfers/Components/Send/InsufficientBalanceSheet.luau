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
local getBalanceRequestModule = require(currencyTransfers.NetworkRequests.getBalanceRequest)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local setTransferPromptStateModule = require(currencyTransfers.Actions.Send.setTransferPromptState)
local getFFlagCurrencyTransferFixBalanceReRenderModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFixBalanceReRender)
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

return function(_) --[[ line: 46 | named "InsufficientBalanceSheet" ]]
	-- upvalues: useTransferStoreModule (ref), useTokens (ref), useLocalization (ref), transferLocalizationKeysModule (ref), getFFlagCurrencyTransferFixBalanceReRenderModule (ref), signalsReactModule (ref), reactModule (ref), formatNumberModule (ref), localizationService (ref), transferLocaleFormatModule (ref), purchaseRobuxConstantsModule (ref), webViewServiceWrapperModule (ref), transferOriginationModule (ref), setTransferPromptStateModule (ref), promptStateModule (ref), getBalanceAfterPurchaseWebviewModule (ref), getBalanceRequestModule (ref), sheet (ref), useScaledValue (ref), transferRobuxHeaderModule (ref), view (ref), icon (ref), enums (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var18 = useTransferStoreModule()
	local var19 = useTokens()
	local var20 = useLocalization(transferLocalizationKeysModule.Presets.InsufficientBalanceSheet)
	local var21 = if getFFlagCurrencyTransferFixBalanceReRenderModule() then signalsReactModule.useSignalState(var18.getRobuxBalanceAmount) or 0 else var18.getRobuxBalanceAmount(false)
	local var22 = reactModule.useRef(0)
	local var23 = formatNumberModule(localizationService.RobloxLocaleId, math.max(0, ((if getFFlagCurrencyTransferFixBalanceReRenderModule() then signalsReactModule.useSignalState(var18.getSelectedAmount) or 0 else var18.getSelectedAmount(false) or 0) or 0) - var21))
	
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { useScaledValue(300), 0.5 },
		onClose = function() --[[ line: 112 ]]
			-- upvalues: var18 (ref), transferOriginationModule (copy), setTransferPromptStateModule (copy), promptStateModule (copy)
			if var18.getTransferOrigination(false) == transferOriginationModule.InExperience then
				var18.triggerOnClose()
				
				return
			end
			setTransferPromptStateModule(var18, promptStateModule.TransferInput)
		end
	}, {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, { titleText = var20.SendRobux, robuxBalanceAmount = var21 })
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
						size = var19.Size.Size_1200
					})
				}),
				ErrorMessage = reactModule.createElement(text, {
					tag = "text-body-large content-emphasis text-align-x-center auto-y text-wrap",
					LayoutOrder = 2,
					Text = reactModule.useMemo(function() --[[ line: 59 ]]
						-- upvalues: transferLocaleFormatModule (copy), var20 (ref), var23 (ref)
						return transferLocaleFormatModule.substituteAmount(var20.InsufficientBalance or "", tostring(var23))
					end, { var23, var20.InsufficientBalance }),
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
						text = var20.BuyRobux or "Buy",
						onActivated = function() --[[ line: 63 ]]
							-- upvalues: var18 (ref), purchaseRobuxConstantsModule (copy), webViewServiceWrapperModule (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), promptStateModule (copy), getFFlagCurrencyTransferFixBalanceReRenderModule (copy), var22 (ref), getBalanceAfterPurchaseWebviewModule (copy), getBalanceRequestModule (copy)
							local transferOrigination = var18.getTransferOrigination(false)
							webViewServiceWrapperModule.new({
								url = purchaseRobuxConstantsModule.getPurchaseRobuxUrl(),
								title = purchaseRobuxConstantsModule.PURCHASE_ROBUX_WEBVIEW_TITLE,
								closeCallback = function() --[[ line: 70 ]]
									-- upvalues: transferOrigination (ref), transferOriginationModule (copy), setTransferPromptStateModule (copy), var18 (copy), promptStateModule (copy), getFFlagCurrencyTransferFixBalanceReRenderModule (copy), var22 (copy), getBalanceAfterPurchaseWebviewModule (copy), getBalanceRequestModule (copy)
									local function _() --[[ line: 71 | named "applyPromptAfterBalance" ]]
										-- upvalues: transferOrigination (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), var18 (copy), promptStateModule (copy)
										if transferOrigination == transferOriginationModule.InExperience then
											setTransferPromptStateModule(var18, promptStateModule.TransferConfirm)
											
											return
										end
										setTransferPromptStateModule(var18, promptStateModule.TransferInput)
									end
									
									if getFFlagCurrencyTransferFixBalanceReRenderModule() then
										var22.current += 1
										local current = var22.current
										getBalanceAfterPurchaseWebviewModule(nil, var18.getNetworkImpl()):andThen(function(p0) --[[ line: 82 ]]
											-- upvalues: var22 (copy), current (ref), var18 (copy), transferOrigination (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), promptStateModule (copy)
											if var22.current ~= current then return end
											var18.setRobuxBalanceAmount(p0)
											var18.setBalanceReceivedFromApi(true)
											
											if transferOrigination == transferOriginationModule.InExperience then
												setTransferPromptStateModule(var18, promptStateModule.TransferConfirm)
												
												return
											end
											setTransferPromptStateModule(var18, promptStateModule.TransferInput)
										end):catch(function(_) --[[ line: 90 ]]
											-- upvalues: var22 (copy), current (ref), transferOrigination (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), var18 (copy), promptStateModule (copy)
											if var22.current ~= current then return end
											if transferOrigination == transferOriginationModule.InExperience then
												setTransferPromptStateModule(var18, promptStateModule.TransferConfirm)
												
												return
											end
											setTransferPromptStateModule(var18, promptStateModule.TransferInput)
										end)
										
										return
									end
									getBalanceRequestModule(nil, var18.getNetworkImpl()):andThen(function(p1) --[[ line: 98 ]]
										-- upvalues: var18 (copy), transferOrigination (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), promptStateModule (copy)
										var18.setRobuxBalanceAmount(p1)
										var18.setBalanceReceivedFromApi(true)
										
										if transferOrigination == transferOriginationModule.InExperience then
											setTransferPromptStateModule(var18, promptStateModule.TransferConfirm)
											
											return
										end
										setTransferPromptStateModule(var18, promptStateModule.TransferInput)
									end):catch(function(_) --[[ line: 103 ]]
										-- upvalues: transferOrigination (copy), transferOriginationModule (copy), setTransferPromptStateModule (copy), var18 (copy), promptStateModule (copy)
										if transferOrigination == transferOriginationModule.InExperience then
											setTransferPromptStateModule(var18, promptStateModule.TransferConfirm)
											
											return
										end
										setTransferPromptStateModule(var18, promptStateModule.TransferInput)
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