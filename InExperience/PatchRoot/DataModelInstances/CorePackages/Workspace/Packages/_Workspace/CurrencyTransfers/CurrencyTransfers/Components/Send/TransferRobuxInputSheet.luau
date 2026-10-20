local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local Parent = CurrencyTransfers.Parent
local LocalizationService = game:GetService("LocalizationService")
local UserInputService = game:GetService("UserInputService")
local TransferLocalizationKeysModule = require(CurrencyTransfers.Localization.TransferLocalizationKeys)
local TransferLocaleFormatModule = require(CurrencyTransfers.Localization.transferLocaleFormat)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Sheet = FoundationModule.Sheet
local Button = FoundationModule.Button
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local RobuxTextModule = require(CurrencyTransfers.Components.Generic.RobuxText)
local TransferRobuxHeaderModule = require(CurrencyTransfers.Components.Generic.TransferRobuxHeader)
local TransferAmountOptionChipsModule = require(CurrencyTransfers.Components.Generic.TransferAmountOptionChips)
local TransferProfileThumbnailModule = require(CurrencyTransfers.Components.Generic.TransferProfileThumbnail)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local UseTextBoxOnChangeRefModule = require(CurrencyTransfers.Hooks.useTextBoxOnChangeRef)
local UseAutoFocusTextBoxOnMountModule = require(CurrencyTransfers.Hooks.useAutoFocusTextBoxOnMount)
local ProceedToConfirmModule = require(CurrencyTransfers.Actions.Send.proceedToConfirm)
local SetTransferPromptStateModule = require(CurrencyTransfers.Actions.Send.setTransferPromptState)
local PromptStateModule = require(CurrencyTransfers.Enums.PromptState)
local GetFIntCurrencyTransferMinAmountModule = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferMinAmount)
local GetFIntCurrencyTransferMaxAmountModule = require(CurrencyTransfers.Flags.GetFIntCurrencyTransferMaxAmount)
local GetFFlagCurrencyTransferFixTextBoxInputModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFixTextBoxInput)
local GetFFlagCurrencyTransferFlowUIImprovementFixModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)
local GetFFlagCurrencyTransferFixDesktopInputModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFixDesktopInput)
local GetFFlagCurrencyTransferFocusNavigationModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferFocusNavigation)
local UseTransferSheetFocusModule = require(CurrencyTransfers.Hooks.useTransferSheetFocus)
local GetFFlagCurrencyTransferUseBackendTransferLimitsModule = require(CurrencyTransfers.Flags.GetFFlagCurrencyTransferUseBackendTransferLimits)
local CurrencyTransferTelemetryModule = require(CurrencyTransfers.Events.CurrencyTransferTelemetry)
local RobuxTransferFlowEventNameModule = require(CurrencyTransfers.Enums.RobuxTransferFlowEventName)
local LogCurrencyTransferCounterModule = require(CurrencyTransfers.Utils.logCurrencyTransferCounter)
local LogRobuxTransferFlowEventModule = require(CurrencyTransfers.Utils.logRobuxTransferFlowEvent)
local FormatNumberModule = require(CurrencyTransfers.Utils.formatNumber)

return function(_)
	-- upvalues: UseLocalizationFunction (copy), TransferLocalizationKeysModule (copy), UseTokensFunction (copy), GetFFlagCurrencyTransferFixDesktopInputModule (copy), UserInputService (copy), UseTransferStoreModule (copy), ReactModule (copy), LogCurrencyTransferCounterModule (copy), CurrencyTransferTelemetryModule (copy), SharedFlagsModule (copy), LogRobuxTransferFlowEventModule (copy), RobuxTransferFlowEventNameModule (copy), SignalsReactModule (copy), GetFFlagCurrencyTransferUseBackendTransferLimitsModule (copy), GetFIntCurrencyTransferMinAmountModule (copy), GetFIntCurrencyTransferMaxAmountModule (copy), SetTransferPromptStateModule (copy), PromptStateModule (copy), ProceedToConfirmModule (copy), UseTextBoxOnChangeRefModule (copy), GetFFlagCurrencyTransferFocusNavigationModule (copy), UseTransferSheetFocusModule (copy), UseAutoFocusTextBoxOnMountModule (copy), GetFFlagCurrencyTransferFlowUIImprovementFixModule (copy), FormatNumberModule (copy), LocalizationService (copy), TransferLocaleFormatModule (copy), UseScaledValueFunction (copy), Sheet (copy), TransferRobuxHeaderModule (copy), View (copy), GetFFlagCurrencyTransferFixTextBoxInputModule (copy), TransferProfileThumbnailModule (copy), RobuxTextModule (copy), Icon (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), Text (copy), TransferAmountOptionChipsModule (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseLocalizationResult = UseLocalizationFunction(TransferLocalizationKeysModule.Presets.TransferRobuxInputSheet)
	local UseTokensResult = UseTokensFunction()
	local NoTouchEnabled: boolean = GetFFlagCurrencyTransferFixDesktopInputModule() and not UserInputService.TouchEnabled
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	ReactModule.useEffect(function()
		-- upvalues: LogCurrencyTransferCounterModule (upval), UseTransferStoreModuleResult (copy), CurrencyTransferTelemetryModule (upval), SharedFlagsModule (upval), LogRobuxTransferFlowEventModule (upval), RobuxTransferFlowEventNameModule (upval)
		LogCurrencyTransferCounterModule(UseTransferStoreModuleResult, CurrencyTransferTelemetryModule.CurrencyTransferInputSheetShownCounter)
		
		if SharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			LogRobuxTransferFlowEventModule(UseTransferStoreModuleResult, RobuxTransferFlowEventNameModule.input_shown)
		end
		return nil
	end, { UseTransferStoreModuleResult })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getSelectedAmount) or 0
	local SetSelectedAmountFunction = UseTransferStoreModuleResult.setSelectedAmount
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getRobuxBalanceAmount) or 0
	local Recipient = UseTransferStoreModuleResult.getRecipient(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getMinimumTransferAmount)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(UseTransferStoreModuleResult.getMaximumTransferAmount)
	local UseSignalStateResult4 = if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() and UseSignalStateResult2 then UseSignalStateResult2 else GetFIntCurrencyTransferMinAmountModule()
	local UseSignalStateResult5 = if GetFFlagCurrencyTransferUseBackendTransferLimitsModule() and UseSignalStateResult3 then UseSignalStateResult3 else GetFIntCurrencyTransferMaxAmountModule()
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult4 (copy), UseSignalStateResult5 (copy), UseStateResult2 (copy)
		if UseSignalStateResult == 0 or UseSignalStateResult4 <= UseSignalStateResult and UseSignalStateResult <= UseSignalStateResult5 then
			UseStateResult2(false)
		end
	end, {
		UseSignalStateResult,
		UseSignalStateResult4,
		UseSignalStateResult5
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult4 (copy), UseSignalStateResult5 (copy), UseStateResult2 (copy), UseSignalStateResult1 (copy), SetTransferPromptStateModule (upval), UseTransferStoreModuleResult (copy), PromptStateModule (upval), ProceedToConfirmModule (upval)
		if UseSignalStateResult and (UseSignalStateResult < UseSignalStateResult4 or UseSignalStateResult5 < UseSignalStateResult) then
			UseStateResult2(true)
			
			return
		end
		if UseSignalStateResult and UseSignalStateResult1 < UseSignalStateResult then
			SetTransferPromptStateModule(UseTransferStoreModuleResult, PromptStateModule.TransferInsufficientBalance)
			
			return
		else
			ProceedToConfirmModule(UseTransferStoreModuleResult, UseSignalStateResult or 0)
		end
	end, {
		UseTransferStoreModuleResult,
		UseSignalStateResult,
		UseSignalStateResult1,
		UseSignalStateResult4,
		UseSignalStateResult5
	})
	local TriggerOnClose = UseTransferStoreModuleResult.triggerOnClose
	local UseAutoFocusTextBoxOnMountModuleResult = UseAutoFocusTextBoxOnMountModule(UseTextBoxOnChangeRefModule(ReactModule.useCallback(function(p1)
		-- upvalues: SetSelectedAmountFunction (copy)
		SetSelectedAmountFunction(p1 or 0)
	end, { SetSelectedAmountFunction }), (ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult4 (copy), UseSignalStateResult5 (copy), UseStateResult2 (copy), UseResult (copy)
		if not p1 and p2 then
			if UseSignalStateResult and UseSignalStateResult > 0 and (UseSignalStateResult < UseSignalStateResult4 or UseSignalStateResult5 < UseSignalStateResult) then
				UseStateResult2(true)
				
				return
			end
			UseResult()
		end
	end, {
		UseResult,
		UseSignalStateResult,
		UseSignalStateResult4,
		UseSignalStateResult5
	}))), 0.05)
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseAutoFocusTextBoxOnMountModuleResult (copy)
		if Current then
			UseRefResult.current = Current
			UseAutoFocusTextBoxOnMountModuleResult(Current)
		end
	end, { UseAutoFocusTextBoxOnMountModuleResult })
	local UseMemoResult = ReactModule.useMemo(function()
		return {
			{ amount = 25, text = "25" },
			{ amount = 50, text = "50" },
			{ amount = 100, text = "100" },
			{ amount = 200, text = "200" }
		}
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: SetSelectedAmountFunction (copy), GetFFlagCurrencyTransferFlowUIImprovementFixModule (upval), UseRefResult (copy)
		SetSelectedAmountFunction(p1)
		
		if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then
			local Current = UseRefResult.current
			
			if Current then
				Current:ReleaseFocus()
			end
		end
	end, { SetSelectedAmountFunction })
	local IsUseSignalStateResultBelow: boolean = UseStateResult and (UseSignalStateResult > 0 and (UseSignalStateResult < UseSignalStateResult4 or UseSignalStateResult5 < UseSignalStateResult))
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: IsUseSignalStateResultBelow (copy), UseSignalStateResult (copy), UseSignalStateResult4 (copy), FormatNumberModule (upval), LocalizationService (upval), TransferLocaleFormatModule (upval), UseLocalizationResult (copy), UseSignalStateResult5 (copy)
		return if IsUseSignalStateResultBelow and UseSignalStateResult and UseSignalStateResult > 0 then if UseSignalStateResult < UseSignalStateResult4 then TransferLocaleFormatModule.substituteAmount(UseLocalizationResult.LowerThanMinAmount or "", (tostring((FormatNumberModule(LocalizationService.RobloxLocaleId, UseSignalStateResult4))))) elseif UseSignalStateResult5 < UseSignalStateResult then TransferLocaleFormatModule.substituteAmount(UseLocalizationResult.GreaterThanMaxAmount or "", (tostring((FormatNumberModule(LocalizationService.RobloxLocaleId, UseSignalStateResult5))))) else nil else nil
	end, {
		IsUseSignalStateResultBelow, UseSignalStateResult, UseSignalStateResult4,
		UseSignalStateResult5, UseLocalizationResult.LowerThanMinAmount,
		UseLocalizationResult.GreaterThanMaxAmount
	})
	local UseMemoResult2 = ReactModule.useMemo(function(): boolean
		-- upvalues: UseSignalStateResult (copy)
		return not UseSignalStateResult or UseSignalStateResult <= 0
	end, { UseSignalStateResult })
	local UseScaledValueResult = UseScaledValueFunction(500)
	
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		snapPoints = ReactModule.useMemo(function()
			-- upvalues: UseScaledValueResult (copy)
			return { UseScaledValueResult, 0.62 }
		end, { UseScaledValueResult }),
		onClose = TriggerOnClose,
		ref = if GetFFlagCurrencyTransferFocusNavigationModule() then UseTransferSheetFocusModule(TriggerOnClose) else nil
	}, {
		Header = ReactModule.createElement(Sheet.Header, {}, {
			TransferRobuxHeader = ReactModule.createElement(TransferRobuxHeaderModule, {
				titleText = UseLocalizationResult.SendRobux,
				robuxBalanceAmount = UseSignalStateResult1
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = ReactModule.createElement(View, {
				tag = "col align-x-center items-center gap-large size-full-0 auto-y padding-x-large padding-top-xxlarge"
			}, {
				RobuxInputWrapper = if NoTouchEnabled then nil else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					LayoutOrder = 0,
					Size = UDim2.new(0, 0, 0, 0)
				}, {
					RobuxInput = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 80, 0, 40),
						Position = UDim2.new(0, -10000, 0, 0)
					}, {
						TextBox = ReactModule.createElement("TextBox", {
							PlaceholderText = "",
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 1, 0),
							Text = if UseSignalStateResult and UseSignalStateResult > 0 then tostring(UseSignalStateResult) elseif GetFFlagCurrencyTransferFixTextBoxInputModule() then "" else "0",
							TextInputType = Enum.TextInputType.Number,
							ClearTextOnFocus = not GetFFlagCurrencyTransferFlowUIImprovementFixModule(),
							ref = UseResult1
						})
					})
				}),
				ThumbnailAndAmountArea = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Content = ReactModule.createElement(View, {
						tag = "col align-x-center items-center gap-xlarge size-full-0 auto-y padding-top-xlarge"
					}, {
						RecipientProfile = if Recipient and Recipient.targetId then ReactModule.createElement(TransferProfileThumbnailModule, {
							showUsername = true,
							layoutOrder = 1,
							userId = tostring(Recipient.targetId),
							username = if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then nil else Recipient.targetName,
							displayName = if GetFFlagCurrencyTransferFlowUIImprovementFixModule() then Recipient.targetDisplayName else nil,
							size = UDim2.fromOffset(60, 60),
							thumbnailSize = Enum.ThumbnailSize.Size48x48
						}) else nil,
						AmountContainer = ReactModule.createElement(View, {
							tag = "col align-x-center gap-large size-full-1600",
							LayoutOrder = 2
						}, {
							ThumbnailAmountGap = ReactModule.createElement(View, {
								tag = "size-full-0",
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 0, 20)
							}),
							AmountRow = ReactModule.createElement(View, {
								tag = "row align-x-center align-y-center",
								LayoutOrder = 2
							}, {
								AmountWrapper = ReactModule.createElement("Frame", {
									BackgroundTransparency = 1,
									LayoutOrder = 1,
									AutomaticSize = Enum.AutomaticSize.XY
								}, {
									SelectedAmountDisplay = if NoTouchEnabled then nil else ReactModule.createElement(RobuxTextModule, { layoutOrder = 1, amount = UseSignalStateResult }),
									DesktopInputRow = if NoTouchEnabled then ReactModule.createElement("Frame", {
										BackgroundTransparency = 1,
										LayoutOrder = 1,
										AutomaticSize = Enum.AutomaticSize.XY
									}, {
										Layout = ReactModule.createElement("UIListLayout", {
											FillDirection = Enum.FillDirection.Horizontal,
											VerticalAlignment = Enum.VerticalAlignment.Center,
											SortOrder = Enum.SortOrder.LayoutOrder,
											Padding = UDim.new(0, 4)
										}),
										RobuxIconWrapper = ReactModule.createElement("Frame", {
											BackgroundTransparency = 1,
											LayoutOrder = 1,
											Size = UDim2.fromOffset(math.round(UseTokensResult.Typography.HeadingLarge.FontSize), (math.round(UseTokensResult.Typography.DisplaySmall.FontSize)))
										}, {
											RobuxIcon = ReactModule.createElement(Icon, {
												name = "robux",
												size = UseTokensResult.Typography.HeadingLarge.FontSize,
												style = UseTokensResult.Color.Content.Emphasis,
												AnchorPoint = Vector2.new(0.5, 0.5),
												Position = UDim2.new(0.5, 0, 0.5, 4)
											})
										}),
										DesktopTextBox = ReactModule.createElement("TextBox", {
											PlaceholderText = "0",
											BackgroundTransparency = 1,
											ClearTextOnFocus = false,
											LayoutOrder = 2,
											Text = if UseSignalStateResult and UseSignalStateResult > 0 then tostring(UseSignalStateResult) else "",
											TextInputType = Enum.TextInputType.Number,
											Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.DisplaySmall.Font,
											FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.DisplaySmall.Font) else nil,
											TextSize = UseTokensResult.Typography.DisplaySmall.FontSize,
											TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
											PlaceholderColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
											AutomaticSize = Enum.AutomaticSize.X,
											Size = UDim2.fromOffset(0, (math.round(UseTokensResult.Typography.DisplaySmall.FontSize))),
											ref = UseResult1
										})
									}) else nil,
									AmountTapTarget = if NoTouchEnabled then nil else ReactModule.createElement("TextButton", {
										Size = UDim2.new(1, 0, 1, 0),
										Position = UDim2.new(0, 0, 0, 0),
										Text = "",
										BackgroundTransparency = 1,
										ZIndex = 2,
										[ReactModule.Event.Activated] = function()
											-- upvalues: UseRefResult (copy)
											if UseRefResult.current then
												UseRefResult.current:CaptureFocus()
											end
										end
									})
								})
							}),
							ErrorSlot = ReactModule.createElement(View, {
								tag = "col align-x-center align-y-center size-full-0 padding-top-medium",
								LayoutOrder = 3,
								Size = UDim2.new(1, 0, 0, 40)
							}, {
								ValidationErrorText = if UseMemoResult1 then ReactModule.createElement(Text, {
									tag = "auto-xy text-caption-small text-align-x-center content-system-alert",
									LayoutOrder = 1,
									Text = UseMemoResult1
								}) else nil
							})
						})
					}),
					TapToFocusOverlay = if NoTouchEnabled then nil else ReactModule.createElement("TextButton", {
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, 0),
						Text = "",
						BackgroundTransparency = 1,
						ZIndex = 2,
						[ReactModule.Event.Activated] = function()
							-- upvalues: UseRefResult (copy)
							if UseRefResult.current then
								UseRefResult.current:CaptureFocus()
							end
						end
					})
				}),
				AmountChips = ReactModule.createElement(View, {
					tag = "col align-x-center size-full-1600 auto-y",
					LayoutOrder = 2,
					ZIndex = 3
				}, {
					Chips = ReactModule.createElement(TransferAmountOptionChipsModule, {
						layoutOrder = 1,
						chips = UseMemoResult,
						onChipSelected = UseResult2,
						selectedAmount = UseSignalStateResult
					})
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 3 }, {
			ReactModule.createElement(View, {
				tag = "col align-x-center align-y-center gap-medium size-full-1000"
			}, {
				ReactModule.createElement(View, {
					tag = "row gap-small size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					ReactModule.createElement(Button, {
						text = UseLocalizationResult.Next,
						onActivated = UseResult,
						variant = ButtonVariant.Emphasis,
						fillBehavior = FillBehavior.Fill,
						isDisabled = UseMemoResult2
					})
				}),
				Disclaimer = ReactModule.createElement(Text, {
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-center",
					LayoutOrder = 2,
					Text = UseLocalizationResult.Disclaimer
				})
			})
		})
	})
end