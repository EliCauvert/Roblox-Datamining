local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local TransferLocaleFormatModule = require(CurrencyTransfers.Localization.transferLocaleFormat)
local LocalizationService = game:GetService("LocalizationService")
local WebViewServiceWrapperModule = require(CurrencyTransfers.Utils.WebViewServiceWrapper)
local PurchaseRobuxConstantsModule = require(CurrencyTransfers.Constants.PurchaseRobuxConstants)
local TransferOriginationModule = require(CurrencyTransfers.Enums.TransferOrigination)
local GetBalanceAfterPurchaseWebviewModule = require(CurrencyTransfers.NetworkRequests.getBalanceAfterPurchaseWebview)
local GetBalanceRequestModule = require(CurrencyTransfers.NetworkRequests.getBalanceRequest)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local SetTransferPromptStateModule = require(CurrencyTransfers.Actions.Send.setTransferPromptState)
local GetFFlagCurrencyTransferFixBalanceReRenderModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFixBalanceReRender)
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
local TransferRobuxHeaderModule = require(CurrencyTransfers.Components.Generic.TransferRobuxHeader)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local FormatNumberModule = require(CurrencyTransfers.Utils.formatNumber)

return function(_)
	-- upvalues: UseTransferStoreModule (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), GetFFlagCurrencyTransferFixBalanceReRenderModule (copy), SignalsReactModule (copy), ReactModule (copy), FormatNumberModule (copy), LocalizationService (copy), TransferLocaleFormatModule (copy), PurchaseRobuxConstantsModule (copy), WebViewServiceWrapperModule (copy), TransferOriginationModule (copy), SetTransferPromptStateModule (copy), PromptStateModule (copy), GetBalanceAfterPurchaseWebviewModule (copy), GetBalanceRequestModule (copy), Sheet (copy), UseScaledValueFunction (copy), TransferRobuxHeaderModule (copy), View (copy), Icon (copy), Enums (copy), Text (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.InsufficientBalanceSheet)
	local UseSignalStateResult = if GetFFlagCurrencyTransferFixBalanceReRenderModule() then SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getRobuxBalanceAmount) or 0 else UseTransferStoreModuleResult.getRobuxBalanceAmount(false)
	local UseRefResult = ReactModule.useRef(0)
	local FormatNumberModuleResult = FormatNumberModule(LocalizationService.RobloxLocaleId, (math.max(0, ((if GetFFlagCurrencyTransferFixBalanceReRenderModule() then SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getSelectedAmount) else UseTransferStoreModuleResult.getSelectedAmount(false)) or 0 or 0) - UseSignalStateResult)))
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		snapPoints = { UseScaledValueFunction(300), 0.5 },
		onClose = function()
			-- upvalues: UseTransferStoreModuleResult (copy), TransferOriginationModule (upval), SetTransferPromptStateModule (upval), PromptStateModule (upval)
			if UseTransferStoreModuleResult.getTransferOrigination(false) == TransferOriginationModule.InExperience then
				UseTransferStoreModuleResult.triggerOnClose()
				
				return
			else
				SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferInput)
			end
		end
	}, {
		Header = ReactModule.createElement(Sheet.Header, {}, {
			TransferRobuxHeader = ReactModule.createElement(TransferRobuxHeaderModule, {
				titleText = UseLocalizationResult.SendRobux,
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
					Text = ReactModule.useMemo(function()
						-- upvalues: TransferLocaleFormatModule (upval), UseLocalizationResult (copy), FormatNumberModuleResult (copy)
						return TransferLocaleFormatModule.substituteAmount(UseLocalizationResult.InsufficientBalance or "", (tostring(FormatNumberModuleResult)))
					end, {
						FormatNumberModuleResult,
						UseLocalizationResult.InsufficientBalance
					}),
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
						text = UseLocalizationResult.BuyRobux or "Buy",
						onActivated = function()
							-- upvalues: UseTransferStoreModuleResult (copy), PurchaseRobuxConstantsModule (upval), WebViewServiceWrapperModule (upval), TransferOriginationModule (upval), SetTransferPromptStateModule (upval), PromptStateModule (upval), GetFFlagCurrencyTransferFixBalanceReRenderModule (upval), UseRefResult (copy), GetBalanceAfterPurchaseWebviewModule (upval), GetBalanceRequestModule (upval)
							local TransferOrigination = UseTransferStoreModuleResult.getTransferOrigination(false)
							WebViewServiceWrapperModule.new({
								url = PurchaseRobuxConstantsModule.getPurchaseRobuxUrl(),
								title = PurchaseRobuxConstantsModule.PURCHASE_ROBUX_WEBVIEW_TITLE,
								closeCallback = function()
									-- upvalues: TransferOrigination (copy), TransferOriginationModule (upval), SetTransferPromptStateModule (upval), UseTransferStoreModuleResult (upval), PromptStateModule (upval), GetFFlagCurrencyTransferFixBalanceReRenderModule (upval), UseRefResult (upval), GetBalanceAfterPurchaseWebviewModule (upval), GetBalanceRequestModule (upval)
									local function _()
										-- upvalues: TransferOrigination (upval), TransferOriginationModule (upval), SetTransferPromptStateModule (upval), UseTransferStoreModuleResult (upval), PromptStateModule (upval)
										if TransferOrigination == TransferOriginationModule.InExperience then
											SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferConfirm)
											
											return
										else
											SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferInput)
										end
									end
									
									if GetFFlagCurrencyTransferFixBalanceReRenderModule() then
										UseRefResult.current += 1
										local Current = UseRefResult.current
										GetBalanceAfterPurchaseWebviewModule():andThen(function(Result)
											-- upvalues: UseRefResult (upval), Current (copy), UseTransferStoreModuleResult (upval), TransferOrigination (upval), TransferOriginationModule (upval), SetTransferPromptStateModule (upval), PromptStateModule (upval)
											if UseRefResult.current ~= Current then return end
											UseTransferStoreModuleResult.setRobuxBalanceAmount(Result)
											UseTransferStoreModuleResult.setBalanceReceivedFromApi(true)
											
											if TransferOrigination == TransferOriginationModule.InExperience then
												SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferConfirm)
												
												return
											else
												SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferInput)
											end
										end):catch(function(_)
											-- upvalues: UseRefResult (upval), Current (copy), TransferOrigination (upval), TransferOriginationModule (upval), SetTransferPromptStateModule (upval), UseTransferStoreModuleResult (upval), PromptStateModule (upval)
											if UseRefResult.current ~= Current then return end
											if TransferOrigination == TransferOriginationModule.InExperience then
												SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferConfirm)
												
												return
											else
												SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferInput)
											end
										end)
										
										return
									else
										GetBalanceRequestModule():andThen(function(Result)
											-- upvalues: UseTransferStoreModuleResult (upval), TransferOrigination (upval), TransferOriginationModule (upval), SetTransferPromptStateModule (upval), PromptStateModule (upval)
											UseTransferStoreModuleResult.setRobuxBalanceAmount(Result)
											UseTransferStoreModuleResult.setBalanceReceivedFromApi(true)
											
											if TransferOrigination == TransferOriginationModule.InExperience then
												SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferConfirm)
												
												return
											else
												SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferInput)
											end
										end):catch(function(_)
											-- upvalues: TransferOrigination (upval), TransferOriginationModule (upval), SetTransferPromptStateModule (upval), UseTransferStoreModuleResult (upval), PromptStateModule (upval)
											if TransferOrigination == TransferOriginationModule.InExperience then
												SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferConfirm)
												
												return
											else
												SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferInput)
											end
										end)
									end
								end
							}):open()
						end,
						variant = ButtonVariant.Emphasis,
						fillBehavior = FillBehavior.Fill
					})
				})
			})
		})
	})
end