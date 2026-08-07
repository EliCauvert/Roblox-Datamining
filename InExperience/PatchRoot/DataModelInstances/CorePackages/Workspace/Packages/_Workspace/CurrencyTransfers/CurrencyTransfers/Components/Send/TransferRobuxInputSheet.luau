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
local getFFlagCurrencyTransferFixBalanceReRenderModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFixBalanceReRender)
local getFFlagCurrencyTransferFlowUIImprovementFixModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)
local getFFlagCurrencyTransferFixDesktopInputModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFixDesktopInput)
local getFFlagCurrencyTransferUseBackendTransferLimitsModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferUseBackendTransferLimits)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)
local formatNumberModule = require(currencyTransfers.Utils.formatNumber)

return function(_) --[[ line: 69 | named "TransferRobuxInputSheet" ]]
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTokens (ref), getFFlagCurrencyTransferFixDesktopInputModule (ref), userInputService (ref), useTransferStoreModule (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), signalsReactModule (ref), getFFlagCurrencyTransferFixBalanceReRenderModule (ref), getFFlagCurrencyTransferUseBackendTransferLimitsModule (ref), getFIntCurrencyTransferMinAmountModule (ref), getFIntCurrencyTransferMaxAmountModule (ref), setTransferPromptStateModule (ref), promptStateModule (ref), proceedToConfirmModule (ref), useTextBoxOnChangeRefModule (ref), useAutoFocusTextBoxOnMountModule (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (ref), formatNumberModule (ref), localizationService (ref), transferLocaleFormatModule (ref), useScaledValue (ref), sheet (ref), transferRobuxHeaderModule (ref), view (ref), getFFlagCurrencyTransferFixTextBoxInputModule (ref), transferProfileThumbnailModule (ref), robuxTextModule (ref), icon (ref), text (ref), transferAmountOptionChipsModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local createElement_3
	local var31 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxInputSheet)
	local var32 = useTokens()
	local var33 = getFFlagCurrencyTransferFixDesktopInputModule() and not userInputService.TouchEnabled
	local var34 = useTransferStoreModule()
	reactModule.useEffect(function() --[[ line: 77 ]]
		-- upvalues: logCurrencyTransferCounterModule (copy), var34 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var34, currencyTransferTelemetryModule.CurrencyTransferInputSheetShownCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var34, robuxTransferFlowEventNameModule.input_shown)
		end
		return nil
	end, { var34 })
	local getSelectedAmount = signalsReactModule.useSignalState(var34.getSelectedAmount) or 0
	local setSelectedAmount = var34.setSelectedAmount
	local var36, var37 = reactModule.useState(false)
	local var38 = if getFFlagCurrencyTransferFixBalanceReRenderModule() then signalsReactModule.useSignalState(var34.getRobuxBalanceAmount) or 0 else var34.getRobuxBalanceAmount(false)
	local recipient = var34.getRecipient(false)
	local var40 = reactModule.useRef(nil)
	local var41 = signalsReactModule.useSignalState(var34.getMinimumTransferAmount)
	local var42 = signalsReactModule.useSignalState(var34.getMaximumTransferAmount)
	local var43 = if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var41 then var41 else getFIntCurrencyTransferMinAmountModule()
	local var44 = if getFFlagCurrencyTransferUseBackendTransferLimitsModule() and var42 then var42 else getFIntCurrencyTransferMaxAmountModule()
	reactModule.useEffect(function() --[[ line: 102 ]]
		-- upvalues: getSelectedAmount (ref), var43 (ref), var44 (ref), var37 (ref)
		if getSelectedAmount == 0 or var43 <= getSelectedAmount and getSelectedAmount <= var44 then
			var37(false)
		end
	end, { getSelectedAmount, var43, var44 })
	local var45 = reactModule.useCallback(function() --[[ line: 108 ]]
		-- upvalues: getSelectedAmount (ref), var43 (ref), var44 (ref), var37 (ref), var38 (ref), setTransferPromptStateModule (copy), var34 (ref), promptStateModule (copy), proceedToConfirmModule (copy)
		if getSelectedAmount and (getSelectedAmount < var43 or var44 < getSelectedAmount) then
			var37(true)
			
			return
		elseif getSelectedAmount and var38 < getSelectedAmount then
			setTransferPromptStateModule(var34, promptStateModule.TransferInsufficientBalance)
			
			return
		end
		proceedToConfirmModule(var34, getSelectedAmount or 0)
	end, {
		var34,
		getSelectedAmount,
		var38,
		var43,
		var44
	})
	local triggerOnClose = var34.triggerOnClose
	local var46 = useAutoFocusTextBoxOnMountModule(useTextBoxOnChangeRefModule(reactModule.useCallback(function(p0) --[[ line: 122 ]]
		-- upvalues: setSelectedAmount (ref)
		setSelectedAmount(p0 or 0)
	end, { setSelectedAmount }), reactModule.useCallback(function(p1, p2) --[[ line: 126 ]]
		-- upvalues: getSelectedAmount (ref), var43 (ref), var44 (ref), var37 (ref), var45 (ref)
		if not p1 and p2 then
			if getSelectedAmount and getSelectedAmount > 0 and (getSelectedAmount < var43 or var44 < getSelectedAmount) then
				var37(true)
				
				return
			end
			var45()
		end
	end, { var45, getSelectedAmount, var43, var44 })), 0.05)
	local var47 = reactModule.useCallback(function(p3) --[[ line: 145 ]]
		-- upvalues: var40 (ref), var46 (ref)
		if p3 then
			var40.current = p3
			var46(p3)
		end
	end, { var46 })
	local var48 = reactModule.useMemo(function() --[[ line: 152 ]]
		return {
			{ amount = 25, text = "25" },
			{ amount = 50, text = "50" },
			{ amount = 100, text = "100" },
			{ amount = 200, text = "200" }
		}
	end, {})
	local var49 = reactModule.useCallback(function(p4) --[[ line: 161 ]]
		-- upvalues: setSelectedAmount (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var40 (ref)
		setSelectedAmount(p4)
		
		if getFFlagCurrencyTransferFlowUIImprovementFixModule() then
			local current = var40.current
			
			if current then
				current:ReleaseFocus()
			end
		end
	end, { setSelectedAmount })
	local var50 = var36 and (getSelectedAmount > 0 and (if getSelectedAmount >= var43 then var44 < getSelectedAmount else true))
	local var51 = reactModule.useMemo(function() --[[ line: 177 ]]
		-- upvalues: var50 (ref), getSelectedAmount (ref), var43 (ref), formatNumberModule (copy), localizationService (copy), transferLocaleFormatModule (copy), var31 (ref), var44 (ref)
		return if not (not var50 or not getSelectedAmount or getSelectedAmount <= 0) then if getSelectedAmount < var43 then transferLocaleFormatModule.substituteAmount(var31.LowerThanMinAmount or "", tostring(formatNumberModule(localizationService.RobloxLocaleId, var43))) elseif var44 < getSelectedAmount then transferLocaleFormatModule.substituteAmount(var31.GreaterThanMaxAmount or "", tostring(formatNumberModule(localizationService.RobloxLocaleId, var44))) else nil else nil
	end, {
		var50, getSelectedAmount, var43, var44, var31.LowerThanMinAmount,
		var31.GreaterThanMaxAmount
	})
	local var52 = reactModule.useMemo(function() --[[ line: 200 ]]
		-- upvalues: getSelectedAmount (ref)
		return not getSelectedAmount or getSelectedAmount <= 0
	end, { getSelectedAmount })
	local var53 = useScaledValue(500)
	local var54 = reactModule.useMemo(function() --[[ line: 210 ]]
		-- upvalues: var53 (ref)
		return { var53, 0.62 }
	end, { var53 })
	local createElement = reactModule.createElement
	local root = sheet.Root
	local t = {
		preferCenterSheet = true,
		snapPoints = var54,
		onClose = triggerOnClose
	}
	local t_1 = {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, { titleText = var31.SendRobux, robuxBalanceAmount = var38 })
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
	
	if var33 then
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
					ref = var47
				})
			})
		})
	end
	local var75
	t_5.RobuxInputWrapper = createElement_3
	local createElement_4 = reactModule.createElement
	local var61 = "Frame"
	local t_6 = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}
	local t_7 = {}
	local createElement_5 = reactModule.createElement
	local var64 = view
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
	local var67 = view
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
	local var72 = "Frame"
	local t_14 = {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		AutomaticSize = Enum.AutomaticSize.XY
	}
	local t_15 = {
		SelectedAmountDisplay = if not var33 then reactModule.createElement(robuxTextModule, { layoutOrder = 1, amount = getSelectedAmount }) else nil
	}
	
	if var33 then
		var75 = reactModule.createElement
		var75 = var75("Frame", {
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
				Size = UDim2.fromOffset(math.round(var32.Typography.HeadingLarge.FontSize), math.round(var32.Typography.DisplaySmall.FontSize))
			}, {
				RobuxIcon = reactModule.createElement(icon, {
					name = "robux",
					size = var32.Typography.HeadingLarge.FontSize,
					style = var32.Color.Content.Emphasis,
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
				Font = var32.Typography.DisplaySmall.Font,
				TextSize = var32.Typography.DisplaySmall.FontSize,
				TextColor3 = var32.Color.Content.Emphasis.Color3,
				PlaceholderColor3 = var32.Color.Content.Emphasis.Color3,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.fromOffset(0, math.round(var32.Typography.DisplaySmall.FontSize)),
				ref = var47
			})
		})
	else
		var75 = nil
	end
	t_15.DesktopInputRow = var75
	t_15.AmountTapTarget = if not var33 then reactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Text = "",
		BackgroundTransparency = 1,
		ZIndex = 2,
		[reactModule.Event.Activated] = function() --[[ line: 374 ]]
			-- upvalues: var40 (ref)
			if var40.current then
				var40.current:CaptureFocus()
			end
		end
	}) else nil
	t_13.AmountWrapper = createElement_8(var72, t_14, t_15)
	t_11.AmountRow = createElement_7(view, t_12, t_13)
	t_11.ErrorSlot = reactModule.createElement(view, {
		tag = "col align-x-center align-y-center size-full-0 padding-top-medium",
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 40)
	}, {
		ValidationErrorText = if var51 then reactModule.createElement(text, {
			tag = "auto-xy text-caption-small text-align-x-center content-system-alert",
			LayoutOrder = 1,
			Text = var51
		}) else nil
	})
	t_9.AmountContainer = createElement_6(var67, t_10, t_11)
	t_7.Content = createElement_5(var64, t_8, t_9)
	t_7.TapToFocusOverlay = if not var33 then reactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		Text = "",
		BackgroundTransparency = 1,
		ZIndex = 2,
		[reactModule.Event.Activated] = function() --[[ line: 407 ]]
			-- upvalues: var40 (ref)
			if var40.current then
				var40.current:CaptureFocus()
			end
		end
	}) else nil
	t_5.ThumbnailAndAmountArea = createElement_4(var61, t_6, t_7)
	t_5.AmountChips = reactModule.createElement(view, {
		tag = "col align-x-center size-full-1600 auto-y",
		LayoutOrder = 2,
		ZIndex = 3
	}, {
		Chips = reactModule.createElement(transferAmountOptionChipsModule, {
			layoutOrder = 1,
			chips = var48,
			onChipSelected = var49,
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
					text = var31.Next,
					onActivated = var45,
					variant = buttonVariant.Emphasis,
					fillBehavior = fillBehavior.Fill,
					isDisabled = var52
				})
			}),
			Disclaimer = reactModule.createElement(text, {
				tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-center",
				LayoutOrder = 2,
				Text = var31.Disclaimer
			})
		})
	})
	
	return createElement(root, t, t_1)
end