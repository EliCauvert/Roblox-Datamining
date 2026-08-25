local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local localizationService = game:GetService("LocalizationService")
local userInputService = game:GetService("UserInputService")
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local transferLocaleFormatModule = require(currencyTransfers.Localization.transferLocaleFormat)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local sheet = foundationModule.Sheet
local button = foundationModule.Button
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local fillBehavior = foundationModule.Enums.FillBehavior
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local robuxTextModule = require(currencyTransfers.Components.Generic.RobuxText)
local transferRobuxHeaderModule = require(currencyTransfers.Components.Generic.TransferRobuxHeader)
local transferAmountOptionChipsModule = require(currencyTransfers.Components.Generic.TransferAmountOptionChips)
local transferProfileThumbnailModule = require(currencyTransfers.Components.Generic.TransferProfileThumbnail)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local useTextBoxOnChangeRefModule = require(currencyTransfers.Hooks.useTextBoxOnChangeRef)
local useAutoFocusTextBoxOnMountModule = require(currencyTransfers.Hooks.useAutoFocusTextBoxOnMount)
local proceedToConfirmModule = require(currencyTransfers.Actions.Send.proceedToConfirm)
local setTransferPromptStateModule = require(currencyTransfers.Actions.Send.setTransferPromptState)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local getFIntCurrencyTransferMinAmountModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferMinAmount)
local getFIntCurrencyTransferMaxAmountModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferMaxAmount)
local getFFlagCurrencyTransferFixTextBoxInputModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFixTextBoxInput)
local getFFlagCurrencyTransferFlowUIImprovementFixModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)
local getFFlagCurrencyTransferFixDesktopInputModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFixDesktopInput)
local getFFlagCurrencyTransferUseBackendTransferLimitsModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferUseBackendTransferLimits)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)
local formatNumberModule = require(currencyTransfers.Utils.formatNumber)

return function(_)
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTokens (ref), getFFlagCurrencyTransferFixDesktopInputModule (ref), userInputService (ref), useTransferStoreModule (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), signalsReactModule (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (ref), getFIntCurrencyTransferMinAmountModule (ref), getFIntCurrencyTransferMaxAmountModule (ref), setTransferPromptStateModule (ref), promptStateModule (ref), proceedToConfirmModule (ref), useTextBoxOnChangeRefModule (ref), useAutoFocusTextBoxOnMountModule (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (ref), formatNumberModule (ref), localizationService (ref), transferLocaleFormatModule (ref), useScaledValue (ref), sheet (ref), transferRobuxHeaderModule (ref), view (ref), getFFlagCurrencyTransferFixTextBoxInputModule (ref), transferProfileThumbnailModule (ref), robuxTextModule (ref), icon (ref), text (ref), transferAmountOptionChipsModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local createElement_3
	local var30 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxInputSheet)
	local var31 = useTokens()
	local var32 = getFFlagCurrencyTransferFixDesktopInputModule() and not userInputService.TouchEnabled
	local var33 = useTransferStoreModule()
	reactModule.useEffect(function()
		-- upvalues: logCurrencyTransferCounterModule (copy), var33 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var33, currencyTransferTelemetryModule.CurrencyTransferInputSheetShownCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var33, robuxTransferFlowEventNameModule.input_shown)
		end
		return nil
	end, { var33 })
	local getSelectedAmount = signalsReactModule.useSignalState(var33.getSelectedAmount) or 0
	local setSelectedAmount = var33.setSelectedAmount
	local var35, var36 = reactModule.useState(false)
	local getRobuxBalanceAmount = signalsReactModule.useSignalState(var33.getRobuxBalanceAmount) or 0
	local recipient = var33.getRecipient(false)
	local var39 = reactModule.useRef(nil)
	local var40 = signalsReactModule.useSignalState(var33.getMinimumTransferAmount)
	local var41 = signalsReactModule.useSignalState(var33.getMaximumTransferAmount)
	local var42 = if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var40 then var40 else getFIntCurrencyTransferMinAmountModule()
	local var43 = if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var41 then var41 else getFIntCurrencyTransferMaxAmountModule()
	reactModule.useEffect(function()
		-- upvalues: getSelectedAmount (ref), var42 (ref), var43 (ref), var36 (ref)
		if getSelectedAmount == 0 or var42 <= getSelectedAmount and getSelectedAmount <= var43 then
			var36(false)
		end
	end, { getSelectedAmount, var42, var43 })
	local var44 = reactModule.useCallback(function()
		-- upvalues: getSelectedAmount (ref), var42 (ref), var43 (ref), var36 (ref), getRobuxBalanceAmount (ref), setTransferPromptStateModule (copy), var33 (ref), promptStateModule (copy), proceedToConfirmModule (copy)
		if getSelectedAmount and (getSelectedAmount < var42 or var43 < getSelectedAmount) then
			var36(true)
			
			return
		elseif getSelectedAmount and getRobuxBalanceAmount < getSelectedAmount then
			setTransferPromptStateModule(var33, promptStateModule.TransferInsufficientBalance)
			
			return
		end
		proceedToConfirmModule(var33, getSelectedAmount or 0)
	end, {
		var33,
		getSelectedAmount,
		getRobuxBalanceAmount,
		var42,
		var43
	})
	local triggerOnClose = var33.triggerOnClose
	local var45 = useAutoFocusTextBoxOnMountModule(useTextBoxOnChangeRefModule(reactModule.useCallback(function(p0)
		-- upvalues: setSelectedAmount (ref)
		setSelectedAmount(p0 or 0)
	end, { setSelectedAmount }), reactModule.useCallback(function(p1, p2)
		-- upvalues: getSelectedAmount (ref), var42 (ref), var43 (ref), var36 (ref), var44 (ref)
		if not p1 and p2 then
			if getSelectedAmount and getSelectedAmount > 0 and (getSelectedAmount < var42 or var43 < getSelectedAmount) then
				var36(true)
				
				return
			end
			var44()
		end
	end, { var44, getSelectedAmount, var42, var43 })), 0.05)
	local var46 = reactModule.useCallback(function(p3)
		-- upvalues: var39 (ref), var45 (ref)
		if p3 then
			var39.current = p3
			var45(p3)
		end
	end, { var45 })
	local var47 = reactModule.useMemo(function()
		return {
			{ amount = 25, text = "25" },
			{ amount = 50, text = "50" },
			{ amount = 100, text = "100" },
			{ amount = 200, text = "200" }
		}
	end, {})
	local var48 = reactModule.useCallback(function(p4)
		-- upvalues: setSelectedAmount (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var39 (ref)
		setSelectedAmount(p4)
		
		if getFFlagCurrencyTransferFlowUIImprovementFixModule() then
			local current = var39.current
			
			if current then
				current:ReleaseFocus()
			end
		end
	end, { setSelectedAmount })
	local var49 = var35 and (getSelectedAmount > 0 and (if getSelectedAmount >= var42 then var43 < getSelectedAmount else true))
	local var50 = reactModule.useMemo(function()
		-- upvalues: var49 (ref), getSelectedAmount (ref), var42 (ref), formatNumberModule (copy), localizationService (copy), transferLocaleFormatModule (copy), var30 (ref), var43 (ref)
		return if not (not var49 or not getSelectedAmount or getSelectedAmount <= 0) then if getSelectedAmount < var42 then transferLocaleFormatModule.substituteAmount(var30.LowerThanMinAmount or "", tostring(formatNumberModule(localizationService.RobloxLocaleId, var42))) elseif var43 < getSelectedAmount then transferLocaleFormatModule.substituteAmount(var30.GreaterThanMaxAmount or "", tostring(formatNumberModule(localizationService.RobloxLocaleId, var43))) else nil else nil
	end, {
		var49, getSelectedAmount, var42, var43, var30.LowerThanMinAmount,
		var30.GreaterThanMaxAmount
	})
	local var51 = reactModule.useMemo(function()
		-- upvalues: getSelectedAmount (ref)
		return not getSelectedAmount or getSelectedAmount <= 0
	end, { getSelectedAmount })
	local var52 = useScaledValue(500)
	local var53 = reactModule.useMemo(function()
		-- upvalues: var52 (ref)
		return { var52, 0.62 }
	end, { var52 })
	local createElement = reactModule.createElement
	local root = sheet.Root
	local t = {
		preferCenterSheet = true,
		snapPoints = var53,
		onClose = triggerOnClose
	}
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
				titleText = var30.SendRobux,
				robuxBalanceAmount = getRobuxBalanceAmount
			})
		})
	}
	local createElement_1 = reactModule.createElement
	local content = sheet.Content
	local t_2 = { LayoutOrder = 2 }
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		tag = "col align-x-center items-center gap-large size-full-0 auto-y padding-x-large padding-top-xxlarge"
	}
	local t_5 = {}
	
	if var32 then
		createElement_3 = nil
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			LayoutOrder = 0,
			Size = UDim2.new(0, 0, 0, 0)
		}, {
			RobuxInput = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 80, 0, 40),
				Position = UDim2.new(0, -10000, 0, 0)
			}, {
				TextBox = reactModule.createElement("TextBox", {
					PlaceholderText = "",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Text = if getSelectedAmount and getSelectedAmount > 0 then tostring(getSelectedAmount) elseif getFFlagCurrencyTransferFixTextBoxInputModule() then "" else "0",
					TextInputType = Enum.TextInputType.Number,
					ClearTextOnFocus = not getFFlagCurrencyTransferFlowUIImprovementFixModule(),
					ref = var46
				})
			})
		})
	end
	local var74
	t_5.RobuxInputWrapper = createElement_3
	local createElement_4 = reactModule.createElement
	local var60 = "Frame"
	local t_6 = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_7 = {}
	local createElement_5 = reactModule.createElement
	local var63 = view
	local t_8 = {
		tag = "col align-x-center items-center gap-xlarge size-full-0 auto-y padding-top-xlarge"
	}
	local t_9 = {
		RecipientProfile = if recipient and recipient.targetId then reactModule.createElement(transferProfileThumbnailModule, {
			showUsername = true,
			layoutOrder = 1,
			userId = tostring(recipient.targetId),
			username = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then nil else recipient.targetName,
			displayName = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then recipient.targetDisplayName else nil,
			size = UDim2.fromOffset(60, 60),
			thumbnailSize = Enum.ThumbnailSize.Size48x48
		}) else nil
	}
	local createElement_6 = reactModule.createElement
	local var66 = view
	local t_10 = {
		tag = "col align-x-center gap-large size-full-1600",
		LayoutOrder = 2
	}
	local t_11 = {
		ThumbnailAmountGap = reactModule.createElement(view, {
			tag = "size-full-0",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 20)
		})
	}
	local createElement_7 = reactModule.createElement
	local t_12 = {
		tag = "row align-x-center align-y-center",
		LayoutOrder = 2
	}
	local t_13 = {}
	local createElement_8 = reactModule.createElement
	local var71 = "Frame"
	local t_14 = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}
	local t_15 = {
		SelectedAmountDisplay = if not var32 then reactModule.createElement(robuxTextModule, { layoutOrder = 1, amount = getSelectedAmount }) else nil
	}
	
	if var32 then
		var74 = reactModule.createElement
		var74 = var74("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 4)
			}),
			RobuxIconWrapper = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(math.round(var31.Typography.HeadingLarge.FontSize), math.round(var31.Typography.DisplaySmall.FontSize))
			}, {
				RobuxIcon = reactModule.createElement(icon, {
					name = "robux",
					size = var31.Typography.HeadingLarge.FontSize,
					style = var31.Color.Content.Emphasis,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 4)
				})
			}),
			DesktopTextBox = reactModule.createElement("TextBox", {
				PlaceholderText = "0",
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				LayoutOrder = 2,
				Text = if getSelectedAmount and getSelectedAmount > 0 then tostring(getSelectedAmount) else "",
				TextInputType = Enum.TextInputType.Number,
				Font = var31.Typography.DisplaySmall.Font,
				TextSize = var31.Typography.DisplaySmall.FontSize,
				TextColor3 = var31.Color.Content.Emphasis.Color3,
				PlaceholderColor3 = var31.Color.Content.Emphasis.Color3,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.fromOffset(0, math.round(var31.Typography.DisplaySmall.FontSize)),
				ref = var46
			})
		})
	else
		var74 = nil
	end
	t_15.DesktopInputRow = var74
	t_15.AmountTapTarget = if not var32 then reactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Text = "",
		BackgroundTransparency = 1,
		ZIndex = 2,
		[reactModule.Event.Activated] = function()
			-- upvalues: var39 (ref)
			if var39.current then
				var39.current:CaptureFocus()
			end
		end
	}) else nil
	t_13.AmountWrapper = createElement_8(var71, t_14, t_15)
	t_11.AmountRow = createElement_7(view, t_12, t_13)
	t_11.ErrorSlot = reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full-0 padding-top-medium",
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 40)
	}, {
		ValidationErrorText = if var50 then reactModule.createElement(text, {
			tag = "auto-xy text-caption-small text-align-x-center content-system-alert",
			LayoutOrder = 1,
			Text = var50
		}) else nil
	})
	t_9.AmountContainer = createElement_6(var66, t_10, t_11)
	t_7.Content = createElement_5(var63, t_8, t_9)
	t_7.TapToFocusOverlay = if not var32 then reactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Text = "",
		BackgroundTransparency = 1,
		ZIndex = 2,
		[reactModule.Event.Activated] = function()
			-- upvalues: var39 (ref)
			if var39.current then
				var39.current:CaptureFocus()
			end
		end
	}) else nil
	t_5.ThumbnailAndAmountArea = createElement_4(var60, t_6, t_7)
	t_5.AmountChips = reactModule.createElement(view, {
		tag = "col align-x-center size-full-1600 auto-y",
		LayoutOrder = 2,
		ZIndex = 3
	}, {
		Chips = reactModule.createElement(transferAmountOptionChipsModule, {
			layoutOrder = 1,
			chips = var47,
			onChipSelected = var48,
			selectedAmount = getSelectedAmount
		})
	})
	t_3.SheetContentContainer = createElement_2(view, t_4, t_5)
	t_1.Content = createElement_1(content, t_2, t_3)
	t_1.Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
		reactModule.createElement(view, {
			tag = "col align-x-center align-y-center gap-medium size-full-1000"
		}, {
			reactModule.createElement(view, {
				tag = "row gap-small size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				reactModule.createElement(button, {
					text = var30.Next,
					onActivated = var44,
					variant = buttonVariant.Emphasis,
					fillBehavior = fillBehavior.Fill,
					isDisabled = var51
				})
			}),
			Disclaimer = reactModule.createElement(text, {
				tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-center",
				LayoutOrder = 2,
				Text = var30.Disclaimer
			})
		})
	})
	
	return createElement(root, t, t_1)
end