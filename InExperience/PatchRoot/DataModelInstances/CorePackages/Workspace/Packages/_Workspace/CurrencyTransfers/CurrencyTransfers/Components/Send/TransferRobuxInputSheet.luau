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
	local var1 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxInputSheet)
	local var2 = useTokens()
	local var3 = getFFlagCurrencyTransferFixDesktopInputModule() and not userInputService.TouchEnabled
	local var4 = useTransferStoreModule()
	reactModule.useEffect(function()
		-- upvalues: logCurrencyTransferCounterModule (copy), var4 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var4, currencyTransferTelemetryModule.CurrencyTransferInputSheetShownCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var4, robuxTransferFlowEventNameModule.input_shown)
		end
		return nil
	end, { var4 })
	local getSelectedAmount = signalsReactModule.useSignalState(var4.getSelectedAmount) or 0
	local setSelectedAmount = var4.setSelectedAmount
	local var5, var6 = reactModule.useState(false)
	local getRobuxBalanceAmount = signalsReactModule.useSignalState(var4.getRobuxBalanceAmount) or 0
	local recipient = var4.getRecipient(false)
	local var7 = reactModule.useRef(nil)
	local var8 = signalsReactModule.useSignalState(var4.getMinimumTransferAmount)
	local var9 = signalsReactModule.useSignalState(var4.getMaximumTransferAmount)
	local var10 = if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var8 then var8 else getFIntCurrencyTransferMinAmountModule()
	local var11 = if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var9 then var9 else getFIntCurrencyTransferMaxAmountModule()
	reactModule.useEffect(function()
		-- upvalues: getSelectedAmount (ref), var10 (ref), var11 (ref), var6 (ref)
		if getSelectedAmount == 0 or var10 <= getSelectedAmount and getSelectedAmount <= var11 then
			var6(false)
		end
	end, { getSelectedAmount, var10, var11 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: getSelectedAmount (ref), var10 (ref), var11 (ref), var6 (ref), getRobuxBalanceAmount (ref), setTransferPromptStateModule (copy), var4 (ref), promptStateModule (copy), proceedToConfirmModule (copy)
		if getSelectedAmount and (getSelectedAmount < var10 or var11 < getSelectedAmount) then
			var6(true)
			
			return
		elseif getSelectedAmount and getRobuxBalanceAmount < getSelectedAmount then
			setTransferPromptStateModule(var4, promptStateModule.TransferInsufficientBalance)
			
			return
		end
		proceedToConfirmModule(var4, getSelectedAmount or 0)
	end, {
		var4,
		getSelectedAmount,
		getRobuxBalanceAmount,
		var10,
		var11
	})
	local triggerOnClose = var4.triggerOnClose
	local var13 = useAutoFocusTextBoxOnMountModule(useTextBoxOnChangeRefModule(reactModule.useCallback(function(p1)
		-- upvalues: setSelectedAmount (ref)
		setSelectedAmount(p1 or 0)
	end, { setSelectedAmount }), reactModule.useCallback(function(p1, p2)
		-- upvalues: getSelectedAmount (ref), var10 (ref), var11 (ref), var6 (ref), var12 (ref)
		if not p1 and p2 then
			if getSelectedAmount and getSelectedAmount > 0 and (getSelectedAmount < var10 or var11 < getSelectedAmount) then
				var6(true)
				
				return
			end
			var12()
		end
	end, { var12, getSelectedAmount, var10, var11 })), 0.05)
	local var14 = reactModule.useCallback(function(p1)
		-- upvalues: var7 (ref), var13 (ref)
		if p1 then
			var7.current = p1
			var13(p1)
		end
	end, { var13 })
	local var15 = reactModule.useMemo(function()
		return {
			{ amount = 25, text = "25" },
			{ amount = 50, text = "50" },
			{ amount = 100, text = "100" },
			{ amount = 200, text = "200" }
		}
	end, {})
	local var16 = reactModule.useCallback(function(p1)
		-- upvalues: setSelectedAmount (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var7 (ref)
		setSelectedAmount(p1)
		
		if getFFlagCurrencyTransferFlowUIImprovementFixModule() then
			local current = var7.current
			
			if current then
				current:ReleaseFocus()
			end
		end
	end, { setSelectedAmount })
	local var17 = var5 and (getSelectedAmount > 0 and (if getSelectedAmount >= var10 then var11 < getSelectedAmount else true))
	local var18 = reactModule.useMemo(function()
		-- upvalues: var17 (ref), getSelectedAmount (ref), var10 (ref), formatNumberModule (copy), localizationService (copy), transferLocaleFormatModule (copy), var1 (ref), var11 (ref)
		return if not (not var17 or not getSelectedAmount or getSelectedAmount <= 0) then if getSelectedAmount < var10 then transferLocaleFormatModule.substituteAmount(var1.LowerThanMinAmount or "", tostring(formatNumberModule(localizationService.RobloxLocaleId, var10))) elseif var11 < getSelectedAmount then transferLocaleFormatModule.substituteAmount(var1.GreaterThanMaxAmount or "", tostring(formatNumberModule(localizationService.RobloxLocaleId, var11))) else nil else nil
	end, {
		var17, getSelectedAmount, var10, var11, var1.LowerThanMinAmount,
		var1.GreaterThanMaxAmount
	})
	local var19 = reactModule.useMemo(function()
		-- upvalues: getSelectedAmount (ref)
		return not getSelectedAmount or getSelectedAmount <= 0
	end, { getSelectedAmount })
	local var20 = useScaledValue(500)
	local var21 = reactModule.useMemo(function()
		-- upvalues: var20 (ref)
		return { var20, 0.62 }
	end, { var20 })
	local createElement = reactModule.createElement
	local root = sheet.Root
	local t = {
		preferCenterSheet = true,
		snapPoints = var21,
		onClose = triggerOnClose
	}
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
				titleText = var1.SendRobux,
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
	
	if var3 then
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
					ref = var14
				})
			})
		})
	end
	local var22
	t_5.RobuxInputWrapper = createElement_3
	local createElement_4 = reactModule.createElement
	local var23 = "Frame"
	local t_6 = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_7 = {}
	local createElement_5 = reactModule.createElement
	local var24 = view
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
	local var25 = view
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
	local var26 = "Frame"
	local t_14 = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}
	local t_15 = {
		SelectedAmountDisplay = if not var3 then reactModule.createElement(robuxTextModule, { layoutOrder = 1, amount = getSelectedAmount }) else nil
	}
	
	if var3 then
		var22 = reactModule.createElement
		var22 = var22("Frame", {
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
				Size = UDim2.fromOffset(math.round(var2.Typography.HeadingLarge.FontSize), math.round(var2.Typography.DisplaySmall.FontSize))
			}, {
				RobuxIcon = reactModule.createElement(icon, {
					name = "robux",
					size = var2.Typography.HeadingLarge.FontSize,
					style = var2.Color.Content.Emphasis,
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
				Font = var2.Typography.DisplaySmall.Font,
				TextSize = var2.Typography.DisplaySmall.FontSize,
				TextColor3 = var2.Color.Content.Emphasis.Color3,
				PlaceholderColor3 = var2.Color.Content.Emphasis.Color3,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.fromOffset(0, math.round(var2.Typography.DisplaySmall.FontSize)),
				ref = var14
			})
		})
	else
		var22 = nil
	end
	t_15.DesktopInputRow = var22
	t_15.AmountTapTarget = if not var3 then reactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Text = "",
		BackgroundTransparency = 1,
		ZIndex = 2,
		[reactModule.Event.Activated] = function()
			-- upvalues: var7 (ref)
			if var7.current then
				var7.current:CaptureFocus()
			end
		end
	}) else nil
	t_13.AmountWrapper = createElement_8(var26, t_14, t_15)
	t_11.AmountRow = createElement_7(view, t_12, t_13)
	t_11.ErrorSlot = reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full-0 padding-top-medium",
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 40)
	}, {
		ValidationErrorText = if var18 then reactModule.createElement(text, {
			tag = "auto-xy text-caption-small text-align-x-center content-system-alert",
			LayoutOrder = 1,
			Text = var18
		}) else nil
	})
	t_9.AmountContainer = createElement_6(var25, t_10, t_11)
	t_7.Content = createElement_5(var24, t_8, t_9)
	t_7.TapToFocusOverlay = if not var3 then reactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Text = "",
		BackgroundTransparency = 1,
		ZIndex = 2,
		[reactModule.Event.Activated] = function()
			-- upvalues: var7 (ref)
			if var7.current then
				var7.current:CaptureFocus()
			end
		end
	}) else nil
	t_5.ThumbnailAndAmountArea = createElement_4(var23, t_6, t_7)
	t_5.AmountChips = reactModule.createElement(view, {
		tag = "col align-x-center size-full-1600 auto-y",
		LayoutOrder = 2,
		ZIndex = 3
	}, {
		Chips = reactModule.createElement(transferAmountOptionChipsModule, {
			layoutOrder = 1,
			chips = var15,
			onChipSelected = var16,
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
					text = var1.Next,
					onActivated = var12,
					variant = buttonVariant.Emphasis,
					fillBehavior = fillBehavior.Fill,
					isDisabled = var19
				})
			}),
			Disclaimer = reactModule.createElement(text, {
				tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-center",
				LayoutOrder = 2,
				Text = var1.Disclaimer
			})
		})
	})
	
	return createElement(root, t, t_1)
end