local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local parent = currencyTransfers.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local sharedFlagsModule = require(parent.SharedFlags)
local transferLocalizationKeysModule = require(currencyTransfers.Localization.TransferLocalizationKeys)
local foundationModule = require(parent.Foundation)
local buttonVariant = foundationModule.Enums.ButtonVariant
local sheet = foundationModule.Sheet
local button = foundationModule.Button
local view = foundationModule.View
local text = foundationModule.Text
local fillBehavior = foundationModule.Enums.FillBehavior
local enums = foundationModule.Enums
local iconVariant = foundationModule.Enums.IconVariant
local getIconRichText = foundationModule.Utility.getIconRichText
local useLocalization = require(parent.Localization).Hooks.useLocalization
local transferRobuxHeaderModule = require(currencyTransfers.Components.Generic.TransferRobuxHeader)
local transferProfileThumbnailModule = require(currencyTransfers.Components.Generic.TransferProfileThumbnail)
local robuxTextModule = require(currencyTransfers.Components.Generic.RobuxText)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local setTransferPromptStateModule = require(currencyTransfers.Actions.Send.setTransferPromptState)
local processTransferModule = require(currencyTransfers.Actions.Send.processTransfer)
local promptStateModule = require(currencyTransfers.Enums.PromptState)
local transferOriginationModule = require(currencyTransfers.Enums.TransferOrigination)
local currencyTransferTelemetryModule = require(currencyTransfers.Events.CurrencyTransferTelemetry)
local robuxTransferFlowEventNameModule = require(currencyTransfers.Enums.RobuxTransferFlowEventName)
local logCurrencyTransferCounterModule = require(currencyTransfers.Utils.logCurrencyTransferCounter)
local logRobuxTransferFlowEventModule = require(currencyTransfers.Utils.logRobuxTransferFlowEvent)
local getFFlagCurrencyTransferFlowUIImprovementFixModule = require(currencyTransfers.Flags.GetFFlagCurrencyTransferFlowUIImprovementFix)
local getFIntCurrencyTransferDeveloperCommissionRateModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferDeveloperCommissionRate)
local getFIntCurrencyTransferPlatformFeeRateModule = require(currencyTransfers.Flags.GetFIntCurrencyTransferPlatformFeeRate)

return function(_)
	-- upvalues: useLocalization (ref), transferLocalizationKeysModule (ref), useTransferStoreModule (ref), reactModule (ref), logCurrencyTransferCounterModule (ref), currencyTransferTelemetryModule (ref), sharedFlagsModule (ref), logRobuxTransferFlowEventModule (ref), robuxTransferFlowEventNameModule (ref), signalsReactModule (ref), transferOriginationModule (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (ref), getFIntCurrencyTransferDeveloperCommissionRateModule (ref), getFIntCurrencyTransferPlatformFeeRateModule (ref), sheet (ref), transferRobuxHeaderModule (ref), view (ref), transferProfileThumbnailModule (ref), text (ref), getIconRichText (ref), enums (ref), iconVariant (ref), robuxTextModule (ref), button (ref), setTransferPromptStateModule (ref), promptStateModule (ref), processTransferModule (ref), buttonVariant (ref), fillBehavior (ref), foundationModule (ref)
	local var1 = useLocalization(transferLocalizationKeysModule.Presets.TransferRobuxConfirmSheet)
	local var2 = useTransferStoreModule()
	reactModule.useEffect(function()
		-- upvalues: logCurrencyTransferCounterModule (copy), var2 (ref), currencyTransferTelemetryModule (copy), sharedFlagsModule (copy), logRobuxTransferFlowEventModule (copy), robuxTransferFlowEventNameModule (copy)
		logCurrencyTransferCounterModule(var2, currencyTransferTelemetryModule.CurrencyTransferConfirmSheetShownCounter)
		
		if sharedFlagsModule.FFlagEnableRobuxTransferFlowEventIngest then
			logRobuxTransferFlowEventModule(var2, robuxTransferFlowEventNameModule.confirm_shown)
		end
		return nil
	end, { var2 })
	local getRobuxBalanceAmount = signalsReactModule.useSignalState(var2.getRobuxBalanceAmount) or 0
	local getSelectedAmount = signalsReactModule.useSignalState(var2.getSelectedAmount) or 0
	local userRelationshipDetail = var2.getUserRelationshipDetail(false)
	local recipient = var2.getRecipient(false)
	local var3 = var2.getTransferOrigination(false) == transferOriginationModule.InExperience
	local triggerOnClose = var2.triggerOnClose
	local year = os.date("*t").year
	local var4, var5 = reactModule.useState(userRelationshipDetail)
	local var6, var7 = reactModule.useState(recipient)
	reactModule.useEffect(function()
		-- upvalues: userRelationshipDetail (ref), var5 (ref)
		if userRelationshipDetail then
			var5(userRelationshipDetail)
		end
	end, { userRelationshipDetail })
	reactModule.useEffect(function()
		-- upvalues: recipient (ref), var7 (ref)
		if recipient then
			var7(recipient)
		end
	end, { recipient })
	local var8 = reactModule.useMemo(function()
		-- upvalues: getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var4 (ref), var1 (ref), year (ref)
		if getFFlagCurrencyTransferFlowUIImprovementFixModule() then
			if not var4 or not var4.friendSinceDate then
				return var1.NewConnection
			end
			local friendSinceDate = var4.friendSinceDate
			local timestamp = os.time()
			local floored = math.floor((timestamp - os.time({
				hour = 0,
				min = 0,
				sec = 0,
				year = friendSinceDate.year,
				month = friendSinceDate.month,
				day = friendSinceDate.day
			})) / 86400)
			
			if floored < 1 then
				return var1.NewConnection
			end
			local dateString = os.date("*t", timestamp)
			local var9 = (dateString.year - friendSinceDate.year) * 12 + (dateString.month - friendSinceDate.month)
			
			if dateString.day < friendSinceDate.day then
				var9 -= 1
			end
			return if var9 >= 12 then string.gsub(var1.ConnectedYear, "{year}", tostring(math.floor(var9 / 12))) elseif var9 >= 1 then if var9 <= 1 then string.gsub(var1.ConnectedMonthsSingular, "{amount}", tostring(var9)) else string.gsub(var1.ConnectedMonths, "{amount}", tostring(var9)) elseif floored <= 1 then string.gsub(var1.ConnectedDaysSingular, "{amount}", tostring(floored)) else string.gsub(var1.ConnectedDays, "{amount}", tostring(floored))
		elseif not var4 or not var4.friendSinceYear then
			return var1.NewConnection
		end
		local var10 = year - var4.friendSinceYear
		
		return if var10 == 0 then var1.NewConnection else string.gsub(var1.ConnectedYear, "{year}", tostring(var10))
	end, {
		year, var4, var1.ConnectedYear, var1.ConnectedMonths,
		var1.ConnectedMonthsSingular, var1.ConnectedDays,
		var1.ConnectedDaysSingular, var1.NewConnection
	})
	local var9 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var1 (ref)
		local mutualFriendsCount = var4.mutualFriendsCount
		
		return if getFFlagCurrencyTransferFlowUIImprovementFixModule() and var4.areFriends and mutualFriendsCount <= 1 then string.gsub(var1.MutualConnectionSingular, "{amount}", tostring(mutualFriendsCount)) else string.gsub(var1.MutualConnection, "{amount}", tostring(mutualFriendsCount))
	end, {
		var4.mutualFriendsCount,
		var4.areFriends,
		var1.MutualConnection,
		var1.MutualConnectionSingular
	})
	local var10 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), var4 (ref)
		return string.gsub(var1.JoinedInYear, "{year}", tostring(var4.userAccountSinceYear))
	end, { var4.userAccountSinceYear })
	local var11 = reactModule.useMemo(function()
		-- upvalues: getFFlagCurrencyTransferFlowUIImprovementFixModule (copy), var3 (ref), getSelectedAmount (ref), getFIntCurrencyTransferDeveloperCommissionRateModule (copy), getFIntCurrencyTransferPlatformFeeRateModule (copy), var1 (ref)
		return if getFFlagCurrencyTransferFlowUIImprovementFixModule() then if var3 and getSelectedAmount then string.gsub(string.gsub(var1.RecipientWillGetInGame, "{amount}", tostring(math.ceil(getSelectedAmount * (1 - (getFIntCurrencyTransferDeveloperCommissionRateModule() + getFIntCurrencyTransferPlatformFeeRateModule()) / 100)))), "{commissionPercentage}", tostring(getFIntCurrencyTransferDeveloperCommissionRateModule())) elseif getSelectedAmount then string.gsub(var1.RecipientWillGetInApp, "{amount}", tostring(getSelectedAmount)) else nil elseif var3 and getSelectedAmount then string.gsub(var1.RecipientWillGet, "{amount}", tostring(math.ceil(getSelectedAmount * (1 - (getFIntCurrencyTransferDeveloperCommissionRateModule() + getFIntCurrencyTransferPlatformFeeRateModule()) / 100)))) else nil
	end, {
		var3, getSelectedAmount, var1.RecipientWillGet, var1.RecipientWillGetInGame,
		var1.RecipientWillGetInApp,
		getFFlagCurrencyTransferFlowUIImprovementFixModule()
	})
	local var12 = getFFlagCurrencyTransferFlowUIImprovementFixModule() and not var4.areFriends
	
	return reactModule.createElement(sheet.Root, { preferCenterSheet = true, onClose = triggerOnClose }, {
		Header = reactModule.createElement(sheet.Header, {}, {
			TransferRobuxHeader = reactModule.createElement(transferRobuxHeaderModule, {
				titleText = var1.SendRobux,
				robuxBalanceAmount = getRobuxBalanceAmount
			})
		}),
		Content = reactModule.createElement(sheet.Content, { LayoutOrder = 2 }, {
			SheetContentContainer = reactModule.createElement(view, { tag = "col gap-large auto-y size-full-0 align-x-center" }, {
				ProfileCard = reactModule.createElement(view, {
					LayoutOrder = 1,
					Size = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then nil else UDim2.new(1, 0, 0, 250),
					tag = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then "col gap-xlarge align-x-center bg-shift-100 size-full-0 auto-y radius-medium padding-large" else "col gap-xlarge align-x-center bg-shift-100 align-y-center radius-medium padding-large"
				}, {
					RecipientProfile = if var6 and var6.targetId then reactModule.createElement(transferProfileThumbnailModule, {
						showUsername = true,
						layoutOrder = 1,
						userId = tostring(var6.targetId),
						username = var6.targetName,
						displayName = var6.targetDisplayName,
						size = UDim2.fromOffset(60, 60),
						thumbnailSize = Enum.ThumbnailSize.Size48x48
					}) else nil,
					InfoRow = reactModule.createElement(view, {
						tag = "col gap-medium align-x-center align-y-start auto-y size-full-0",
						LayoutOrder = 2
					}, {
						FirstRow = reactModule.createElement(view, {
							tag = "row align-x-center align-y-center auto-xy",
							LayoutOrder = 1
						}, {
							ConnectedDetail = if var4 and var4.areFriends then reactModule.createElement(text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 1,
								Text = `{getIconRichText(enums.IconName.Calendar, iconVariant.Filled)} {var8}`
							}) else nil,
							Spacer = if var4 and var4.areFriends then reactModule.createElement(view, {
								tag = "auto-xy",
								LayoutOrder = 2,
								Size = UDim2.new(0, 8, 0, 0)
							}) else nil,
							MutualDetail = reactModule.createElement(text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 3,
								Text = `{getIconRichText(enums.IconName.TwoPeople, iconVariant.Filled)} {var9}`
							}),
							Spacer2 = if var12 then reactModule.createElement(view, {
								tag = "auto-xy",
								LayoutOrder = 4,
								Size = UDim2.new(0, 8, 0, 0)
							}) else nil,
							InlineJoinedDetail = if var12 then reactModule.createElement(text, {
								tag = "auto-xy text-body-medium content-default text-no-wrap",
								RichText = true,
								LayoutOrder = 5,
								Text = `{getIconRichText(enums.IconName.CircleI, iconVariant.Filled)} {var10}`
							}) else nil
						}),
						JoinedDetail = if var12 then nil else reactModule.createElement(text, {
							tag = "auto-xy text-body-medium content-default text-no-wrap padding-y-xsmall",
							RichText = true,
							LayoutOrder = 2,
							Text = `{getIconRichText(enums.IconName.CircleI, iconVariant.Filled)} {var10}`
						})
					})
				}),
				AmountDisplay = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then "col align-x-center align-y-center size-full-0 auto-y radius-medium bg-shift-100 padding-large" else "col align-x-center align-y-center size-full-2000 radius-medium bg-shift-100"
				}, {
					Amount = reactModule.createElement(robuxTextModule, { layoutOrder = 1, amount = getSelectedAmount or 0 }),
					RecipientText = if var11 then reactModule.createElement(text, {
						LayoutOrder = 2,
						Text = var11,
						tag = if getFFlagCurrencyTransferFlowUIImprovementFixModule() then "size-full-0 auto-y text-body-small text-wrap text-align-x-center content-default" else "auto-xy text-caption-small text-align-x-center content-muted"
					}) else nil
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 3 }, {
			reactModule.createElement(view, {
				tag = "col align-x-center align-y-center gap-medium size-full-1000"
			}, {
				reactModule.createElement(view, {
					tag = "row gap-small size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					SendButton = reactModule.createElement(button, {
						LayoutOrder = 1,
						text = var1.Send,
						onActivated = function()
							-- upvalues: getSelectedAmount (ref), getRobuxBalanceAmount (ref), setTransferPromptStateModule (copy), var2 (ref), promptStateModule (copy), processTransferModule (copy)
							if getSelectedAmount and getRobuxBalanceAmount < getSelectedAmount then
								setTransferPromptStateModule(var2, promptStateModule.TransferInsufficientBalance)
								
								return
							end
							processTransferModule(var2, getSelectedAmount or 0)
						end,
						inputDelay = if var3 then 2.5 else nil,
						variant = buttonVariant.Emphasis,
						fillBehavior = fillBehavior.Fill
					}),
					EditButton = if not var3 then reactModule.createElement(button, {
						LayoutOrder = 2,
						text = var1.Edit,
						onActivated = function()
							-- upvalues: setTransferPromptStateModule (copy), var2 (ref), promptStateModule (copy)
							setTransferPromptStateModule(var2, promptStateModule.TransferInput)
						end,
						variant = buttonVariant.Standard,
						fillBehavior = fillBehavior.Fill
					}) else nil
				}),
				Disclaimer = reactModule.createElement(foundationModule.Text, {
					tag = "wrap size-full-0 auto-y text-caption-small text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = var1.AgeEstimationDisclaimer
				})
			})
		})
	})
end